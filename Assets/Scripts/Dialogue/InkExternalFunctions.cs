using UnityEngine;
using Ink.Runtime;

public class InkExternalFunctions
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

        story.BindExternalFunction("SwitchTerrain", (int marker) => {
            if (NPC.GetComponent<SwitchTerrainPower>() != null)
                NPC.GetComponent<SwitchTerrainPower>().SwitchTerrain(marker);
        });

        story.BindExternalFunction("ActivateGeniusLoci", () => {
            if (NPC.GetComponent<ActivateGeniusLoci>() != null)
                NPC.GetComponent<ActivateGeniusLoci>().Activate();
        });

        story.BindExternalFunction("SwitchScene", () => {
            GameObject.Find("Popups").SetActive(false);
            GameObject.Find("LevelLoadingManager").GetComponent<LevelLoadingManager>().LoadScene((int)SceneIndexes.CAMPUS);
        });

        story.BindExternalFunction("AddToCompletedQuests", () => {
            GameObject.Find("Player").GetComponent<QuestToFinishCounter>().AddToCompletedQuests();
        });
    }

    public void Unbind(Story story)
    {
        story.UnbindExternalFunction("StartQuest");
        story.UnbindExternalFunction("FinishQuest");
        story.UnbindExternalFunction("IsQuestFinished");
        story.UnbindExternalFunction("SwitchTerrain");
        story.UnbindExternalFunction("ActivateGeniusLoci");
        story.UnbindExternalFunction("SwitchScene");
        story.UnbindExternalFunction("AddToCompletedQuests");
    }
}
