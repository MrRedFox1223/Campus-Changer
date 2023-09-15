public class CheckObeliskQuestStep2 : QuestStep
{
    private int obelisksDeactivated = 0;
    private int obelisksToComplete = 3;

    private void OnEnable()
    {
        GameEventsManager.instance.miscEvents.onObeliskActivated += ObeliskActivated;
        GameEventsManager.instance.miscEvents.onObeliskDeactivated += ObeliskDeactivated;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.miscEvents.onObeliskActivated -= ObeliskActivated;
        GameEventsManager.instance.miscEvents.onObeliskDeactivated -= ObeliskDeactivated;
    }

    private void ObeliskActivated()
    {
        if (obelisksDeactivated > 0)
        {
            obelisksDeactivated--;
            UpdateStep();
        }
            
    }

    private void ObeliskDeactivated()
    {
        // There must be 2 ifs becouse activation of the last obelisk will not trigger FinishQuestStep()
        if (obelisksDeactivated < obelisksToComplete)
        {
            obelisksDeactivated++;
            UpdateStep();
        }
            

        if (obelisksDeactivated >= obelisksToComplete)
            FinishQuestStep();
    }

    private void UpdateStep()
    {
        string state = obelisksDeactivated.ToString();
        ChangeState(state);
    }

    protected override void SetQuestStepState(string state)
    {
        this.obelisksDeactivated = System.Int32.Parse(state);
        UpdateStep();
    }
}
