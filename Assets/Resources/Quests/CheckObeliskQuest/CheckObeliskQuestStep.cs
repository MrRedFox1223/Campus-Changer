public class CheckObeliskQuestStep : QuestStep
{
    private int obelisksActivated = 0;
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
        // There must be 2 ifs becouse activation of the last obelisk will not trigger FinishQuestStep()
        if (obelisksActivated < obelisksToComplete)
            obelisksActivated++;
        
        if (obelisksActivated >= obelisksToComplete)
            FinishQuestStep();
    }

    private void ObeliskDeactivated()
    {
        if (obelisksActivated > 0)
            obelisksActivated--;
    }
}
