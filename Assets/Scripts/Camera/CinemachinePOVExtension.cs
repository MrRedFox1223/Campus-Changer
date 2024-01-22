using UnityEngine;
using Cinemachine;

public class CinemachinePOVExtension : CinemachineExtension
{
    [SerializeField] private float horizontalSens = 0.6f;
    [SerializeField] private float verticalSens = 0.6f;
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

    private void Continue()
    {
        return;
    }

    private bool MenuActive()
    {
        if (GameObject.Find("PauseMenu") != null && GameObject.Find("PauseMenu").GetComponent<PauseMenu>().isActive == true)
            return true;

        if (GameObject.Find("SwitchableTerrainMenu") != null && GameObject.Find("SwitchableTerrainMenu").GetComponent<SwitchableTerrainMenu>().isActive == true)
            return true;

        return false;
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
                    // Prevents calling blank errors to console in edit mode 
                    Continue();

                // Prevents camera movement when menu is active
                if (MenuActive())
                    deltaInput = new Vector2(0f, 0f);

                startingRotation.x += deltaInput.x * verticalSens;
                startingRotation.y += deltaInput.y * horizontalSens;
                startingRotation.y = Mathf.Clamp(startingRotation.y, clampAngleDown, clampAngleUp);
                state.RawOrientation = Quaternion.Euler(-startingRotation.y, startingRotation.x, 0f);
            }
        }
    }
}