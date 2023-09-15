using System;

public class QuestEvents
{
    public event Action<string> onStartQuest;
    public event Action<string> onAdvanceQuest;
    public event Action<string> onFinishQuest;
    public event Action<Quest> onQuestStateChange;
    public event Action<string, int, QuestStepState> onQuestStepStateChange;

    public void StartQuest(string id)
    {
        onStartQuest?.Invoke(id);
    }

    public void AdvanceQuest(string id)
    {
        onAdvanceQuest?.Invoke(id);
    }

    public void FinishQuest(string id)
    {
        onFinishQuest?.Invoke(id);
    }

    public void QuestStateChange(Quest quest)
    {
        onQuestStateChange?.Invoke(quest);
    }

    public void QuestStepStateChange(string id, int stepIndex, QuestStepState questStepState)
    {
        onQuestStepStateChange?.Invoke(id, stepIndex, questStepState);
    }
}
