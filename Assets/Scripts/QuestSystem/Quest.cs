using UnityEngine;

public class Quest
{
    // Static info
    public QuestInfoSO info;

    // State info
    public QuestState state;

    private int currentQuestStepIndex;

    public Quest(QuestInfoSO questInfo)
    {
        this.info = questInfo;
        this.state = QuestState.REQUIREMENTS_NOT_MET;
        this.currentQuestStepIndex = 0;
    }

    public void MoveToNextStep()
    {
        currentQuestStepIndex++;
    }

    public bool CurrentStepExists()
    {
        return (currentQuestStepIndex < info.questStepPrefabs.Length);
    }

    public void InstantiateCurrentQuestStep(Transform parentTransform)
    {
        GameObject questStepPrefab = GetCurrentQuestStepPrefab();
        if (questStepPrefab != null)
            Object.Instantiate<GameObject>(questStepPrefab, parentTransform);
    }

    private GameObject GetCurrentQuestStepPrefab()
    {
        GameObject questStepPrefab = null;

        if (CurrentStepExists())
            questStepPrefab = info.questStepPrefabs[currentQuestStepIndex];
        else
            Debug.LogWarning("Tried to get quest step prefab, but stepIndex was out of range indicating that there's no current step:" +
                "QuestId = " + info.id + ", stepIndex = " + currentQuestStepIndex);

        return questStepPrefab;
    }
}
