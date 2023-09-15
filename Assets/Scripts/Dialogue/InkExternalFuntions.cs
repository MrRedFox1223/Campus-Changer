using UnityEngine;
using Ink.Runtime;

public class InkExternalFuntions
{
    public void Bind(Story story, GameObject NPC)
    {
        story.BindExternalFunction("StartQuest", (string marker) => {
            NPC.GetComponent<QuestPoint>().GetQuest();
            story.variablesState[marker] = (int)QuestState.IN_PROGRESS;
        });

        story.BindExternalFunction("FinishQuest", (string marker) => {
            NPC.GetComponent<QuestPoint>().CompleteQuest();
            story.variablesState[marker] = (int)QuestState.FINISHED;
        });

        story.BindExternalFunction("IsQuestFinished", (string marker) => {
            if (NPC.GetComponent<QuestPoint>().CheckQuestState().Equals(QuestState.CAN_FINISH))
                story.variablesState[marker] = (int)QuestState.CAN_FINISH;
        });
    }

    public void Unbind(Story story)
    {
        story.UnbindExternalFunction("StartQuest");
        story.UnbindExternalFunction("FinishQuest");
        story.UnbindExternalFunction("IsQuestFinished");
    }
}
