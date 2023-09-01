using System;

public class MiscEvents
{
    public event Action onObeliskActivated;
    public event Action onObeliskDeactivated;

    public void ObeliskActivated()
    {
        onObeliskActivated?.Invoke();
    }

    public void ObeliskDeactivated()
    {
        onObeliskDeactivated?.Invoke();
    }
}
