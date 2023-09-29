using UnityEngine;
using UnityEngine.InputSystem;

[RequireComponent(typeof(PlayerInput))]
public class InputManager : MonoBehaviour
{
    private PlayerControls playerControls;
    private static InputManager _instance;

    public static InputManager instance
    {
        get
        {
            return _instance;
        }
    }

    private void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(this.gameObject);
        }
        else
        {
            _instance = this;
        }

        playerControls = new PlayerControls();
    }

    private void OnEnable()
    {
        playerControls.Enable();
    }

    private void OnDisable()
    {
        playerControls.Disable();
    }

    public void PlayerMovePressed(InputAction.CallbackContext context)
    {
        if (context.performed || context.canceled)
        {
            GameEventsManager.instance.inputEvents.MovePressed(context.ReadValue<Vector2>());
        }
    }

    /*public Vector2 GetMouseDelta()
    {
        return playerControls.Player.Look.ReadValue<Vector2>();
    }*/

    public void MouseMoved(InputAction.CallbackContext context)
    {
        if (context.performed || context.canceled)
        {
            GameEventsManager.instance.inputEvents.MouseMoved(context.ReadValue<Vector2>());
        }
    }

    public void InteractPressed(InputAction.CallbackContext context)
    {
        if (context.started)
        {
            GameEventsManager.instance.inputEvents.InteractPressed();
        }
    }

    public void ExitPressed(InputAction.CallbackContext context)
    {
        if (context.started)
        {
            GameEventsManager.instance.inputEvents.ExitPressed();
        }
    }
}
