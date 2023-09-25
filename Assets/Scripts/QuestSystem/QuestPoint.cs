using UnityEngine;

public class QuestPoint : MonoBehaviour
{
    [Header("Quest")]
    [SerializeField] private QuestInfoSO questInfoForPoint;

    [Header("Config")]
    [SerializeField] private bool startPoint = true;
    [SerializeField] private bool finishPoint = true;

    private string questId;
    private QuestState currentQuestState;

    private void Awake()
    {
        questId = questInfoForPoint.id;
    }

    private void OnEnable()
    {
        GameEventsManager.instance.questEvents.onQuestStateChange += QuestStateChange;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.questEvents.onQuestStateChange -= QuestStateChange;
    }

    public void GetQuest()
    {
        if (currentQuestState.Equals(QuestState.CAN_START) && startPoint)
            GameEventsManager.instance.questEvents.StartQuest(questId);
    }

    public void CompleteQuest()
    {
        if (currentQuestState.Equals(QuestState.CAN_FINISH) && finishPoint)
            GameEventsManager.instance.questEvents.FinishQuest(questId);
    }

    public QuestState CheckQuestState()
    {
        return currentQuestState;
    }    

    private void QuestStateChange(Quest quest)
    {
        // Only update the quest if this point has corresponding quest
        if (quest.info.id.Equals(questId))
            currentQuestState = quest.state;

    }
}
