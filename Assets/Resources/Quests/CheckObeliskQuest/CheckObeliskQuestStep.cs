using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckObeliskQuestStep : QuestStep
{
    private bool obeliskInteracted = false;

    private void ObeliskInspected()
    {
        if (obeliskInteracted)
            FinishQuestStep();
    }
}
