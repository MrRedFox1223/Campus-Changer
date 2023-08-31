using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckObeliskQuestStep : QuestStep
{
    public int obelisksToComplete = 3;
    private Dictionary<string, bool> obelisksActivated;

    private void Start()
    {
        obelisksActivated = new Dictionary<string, bool>();
    }

    
}
