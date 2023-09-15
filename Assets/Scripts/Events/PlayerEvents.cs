using System;

public class PlayerEvents
{
    public event Action onDisablePlayerMovement;
    public event Action onEnablePlayerMovement;

    public void DisablePlayerMovement()
    {
        onDisablePlayerMovement?.Invoke();
    }

    public void EnablePlayerMovement()
    {
        onEnablePlayerMovement?.Invoke();
    }
}
