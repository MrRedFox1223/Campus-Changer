using UnityEngine;
using Cinemachine;

public class CinemachinePOVExtension : CinemachineExtension
{
    [SerializeField] private float horizontalSens = 70f;
    [SerializeField] private float verticalSens = 100f;
    [SerializeField] private float clampAngleUp = 90f;
    [SerializeField] private float clampAngleDown = -90f;

    private InputManager inputManager;
    private Vector3 startingRotation;

    protected override void Awake()
    {
        inputManager = InputManager.Instance;
        base.Awake();
    }

    protected override void PostPipelineStageCallback(CinemachineVirtualCameraBase vcam, CinemachineCore.Stage stage, ref CameraState state, float deltaTime)
    {
        if (vcam.Follow)
        {
            if (stage == CinemachineCore.Stage.Aim)
            {
                if (startingRotation == null) startingRotation = transform.localRotation.eulerAngles;
                Vector2 deltaInput = inputManager.GetMouseDelta();
                startingRotation.x += deltaInput.x * Time.deltaTime * verticalSens;
                startingRotation.y += deltaInput.y * Time.deltaTime * horizontalSens;
                startingRotation.y = Mathf.Clamp(startingRotation.y, clampAngleDown, clampAngleUp);
                state.RawOrientation = Quaternion.Euler(-startingRotation.y, startingRotation.x, 0f);
            }
        }
    }
}
