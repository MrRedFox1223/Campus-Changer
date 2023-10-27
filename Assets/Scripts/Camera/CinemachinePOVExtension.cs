using UnityEngine;
using Cinemachine;

public class CinemachinePOVExtension : CinemachineExtension
{
    [SerializeField] private float horizontalSens = 80f;
    [SerializeField] private float verticalSens = 80f;
    [SerializeField] private float clampAngleUp = 90f;
    [SerializeField] private float clampAngleDown = -90f;

    private Vector3 startingRotation;
    private Vector2 deltaInput;

    protected override void Awake()
    {
        base.Awake();
    }

    new private void OnEnable()
    {
        GameEventsManager.instance.inputEvents.onMouseMoved += MouseMoved;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.inputEvents.onMouseMoved -= MouseMoved;
    }

    private void MouseMoved(Vector2 moveDir)
    {
        deltaInput = moveDir;
    }

    protected override void PostPipelineStageCallback(CinemachineVirtualCameraBase vcam, CinemachineCore.Stage stage, ref CameraState state, float deltaTime)
    {
        if (vcam.Follow)
        {
            if (stage == CinemachineCore.Stage.Aim)
            {
                if (startingRotation == null)
                    startingRotation = transform.localRotation.eulerAngles;
                else
                    Debug.Log("Fire");

                startingRotation.x += deltaInput.x * Time.deltaTime * verticalSens;
                startingRotation.y += deltaInput.y * Time.deltaTime * horizontalSens;
                startingRotation.y = Mathf.Clamp(startingRotation.y, clampAngleDown, clampAngleUp);
                state.RawOrientation = Quaternion.Euler(-startingRotation.y, startingRotation.x, 0f);
            }
        }
    }
}
