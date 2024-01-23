using UnityEngine;

public class QuestToFinishCounter : MonoBehaviour, IDataPersistance
{
    [SerializeField] private int numberOfQuests;
    public int questsCompleted = 0;

    public void AddToCompletedQuests()
    {
        if (questsCompleted + 1 == numberOfQuests)
        {
            PopupManager.instance.ShowCompleteNotification();
            DataPersistanceManager.instance.SaveGame();
        }
        else
        {
            questsCompleted++;
            int questsLeft = numberOfQuests - questsCompleted;
            PopupManager.instance.questsToGoNumber = "<color=#FCFF78>" + questsLeft + "</color>";
            PopupManager.instance.ShowQuestsToGoNotification();
            
        }   
    }

    public void LoadData(GameData data)
    {
        questsCompleted = data.questsCompleted;
    }

    public void SaveData(GameData data)
    {
        data.questsCompleted = questsCompleted;
    }
}
