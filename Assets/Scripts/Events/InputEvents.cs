using System;
using UnityEngine;

public class InputEvents
{
    public event Action<Vector2> onMovePressed;
    public event Action<Vector2> onMouseMoved;
    public event Action onInteractPressed;
    public event Action onExitPressed;

    public void MovePressed(Vector2 moveDir)
    {
        onMovePressed?.Invoke(moveDir);
    }

    public void MouseMoved(Vector2 moveDir)
    {
        onMouseMoved?.Invoke(moveDir);
    }

    public void InteractPressed()
    {
        onInteractPressed?.Invoke();
    }

    public void ExitPressed()
    {
        onExitPressed?.Invoke();
    }
}
