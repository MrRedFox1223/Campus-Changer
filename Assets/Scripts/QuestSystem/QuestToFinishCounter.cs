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
            questsCompleted++;
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
