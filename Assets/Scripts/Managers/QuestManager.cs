using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuestManager : MonoBehaviour, IDataPersistance
{
    [Header("Config")]
    [SerializeField] private bool loadQuestState = true;

    private static QuestManager instance;

    private Dictionary<string, Quest> questMap;
    private Dictionary<string, QuestData> allQuestsData;

    public static QuestManager GetInstance()
    {
        return instance;
    }

    private void Awake()
    {
        if (instance != null)
            Debug.LogWarning("Found more than one Quest Manager in the scene");

        instance = this;

        allQuestsData = new Dictionary<string, QuestData>();   
    }

    private void Start()
    {
        questMap = CreateQuestMap();

        foreach (Quest quest in questMap.Values)
        {
            // Initialize any loaded quest steps
            if (quest.state == QuestState.IN_PROGRESS)
                quest.InstantiateCurrentQuestStep(this.transform);

            // Broadcast the initial state of all quests on startup
            GameEventsManager.instance.questEvents.QuestStateChange(quest);
        }
        
    }

    private void OnEnable()
    {
        GameEventsManager.instance.questEvents.onStartQuest += StartQuest;
        GameEventsManager.instance.questEvents.onAdvanceQuest += AdvanceQuest;
        GameEventsManager.instance.questEvents.onFinishQuest += FinishQuest;

        GameEventsManager.instance.questEvents.onQuestStepStateChange += QuestStepStateChange;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.questEvents.onStartQuest -= StartQuest;
        GameEventsManager.instance.questEvents.onAdvanceQuest -= AdvanceQuest;
        GameEventsManager.instance.questEvents.onFinishQuest -= FinishQuest;

        GameEventsManager.instance.questEvents.onQuestStepStateChange -= QuestStepStateChange;
    }

    private void ChangeQuestState(string id, QuestState state)
    {
        Quest quest = GetQuestById(id);
        quest.state = state;
        GameEventsManager.instance.questEvents.QuestStateChange(quest);
    }

    private bool CheckRequirementsMet(Quest quest)
    {
        // Start true and prove to be false
        bool meetsRequiraments = true;

        foreach (QuestInfoSO prerequisiteQuestInfo in quest.info.questPrerequisites)
            if (GetQuestById(prerequisiteQuestInfo.id).state != QuestState.FINISHED)
                meetsRequiraments = false;

        return meetsRequiraments;
    }

    private void Update()
    {
        foreach (Quest quest in questMap.Values)
            // If requirements are met, switch over to the CAN_START state
            if (quest.state == QuestState.REQUIREMENTS_NOT_MET && CheckRequirementsMet(quest))
                ChangeQuestState(quest.info.id, QuestState.CAN_START);
    }

    private void StartQuest(string id)
    {
        Quest quest = GetQuestById(id);
        quest.InstantiateCurrentQuestStep(this.transform);
        ChangeQuestState(quest.info.id, QuestState.IN_PROGRESS);
    }

    private void AdvanceQuest(string id)
    {
        Quest quest = GetQuestById(id);

        // Move on to next step
        quest.MoveToNextStep();

        // If there are more steps, instantiate the next one
        if (quest.CurrentStepExists())
            quest.InstantiateCurrentQuestStep(this.transform);
        else
            ChangeQuestState(quest.info.id, QuestState.CAN_FINISH);
    }

    private void FinishQuest(string id)
    {
        Quest quest = GetQuestById(id);
        ClaimRewards(quest);
        ChangeQuestState(quest.info.id, QuestState.FINISHED);
    }

    private void ClaimRewards(Quest quest)
    {
        Debug.Log("You get the reward!");
        // TODO - Give items when Inventory system will be implmented
    }

    private void QuestStepStateChange(string id, int stepIndex, QuestStepState questStepState)
    {
        Quest quest = GetQuestById(id);
        quest.StoreQuestStepState(questStepState, stepIndex);
        ChangeQuestState(id, quest.state);
    }

    private Dictionary<string, Quest> CreateQuestMap()
    {
        // Loads all QuestInfoSO Scriptable Objects under the Assets/Resources/Quests folder
        QuestInfoSO[] allQuests = Resources.LoadAll<QuestInfoSO>("Quests");  

        // Create the quest map
        Dictionary<string, Quest> idToQuestMap = new Dictionary<string, Quest>();

        Quest quest = null;

        foreach (QuestInfoSO questInfo in allQuests)
        {
            if (idToQuestMap.ContainsKey(questInfo.id))
                Debug.LogWarning("Duplicate ID found when creating quest map: " + questInfo.id);

            if (allQuestsData.ContainsKey(questInfo.id) && loadQuestState)
            {
                QuestData questData = allQuestsData[questInfo.id];
                quest = new Quest(questInfo, questData.state, questData.questStepIndex, questData.questStepStates);
            }
            else
                quest = new Quest(questInfo);

            idToQuestMap.Add(questInfo.id, quest);
        }

        return idToQuestMap;
    }

    // This function exists to throw an error if quest that don't exist is trying to be called
    // Use this function to get into questMap instead of accessing it directly
    public Quest GetQuestById(string id)
    {
        Quest quest = questMap[id];

        if (quest == null)
            Debug.LogError("ID not found in the Quest Map: " + id);

        return quest;
    }

    public void LoadData(GameData data)
    {
        foreach (string id in data.questDataJson.Keys)
        {
            string serializedData = data.questDataJson[id];
            
            QuestData questData = JsonUtility.FromJson<QuestData>(serializedData);
            allQuestsData.Add(id, questData);
        }
    }

    public void SaveData(GameData data)
    {
        foreach (Quest quest in questMap.Values)
        {
            QuestData questData = quest.GetQuestData();
            string serializedData = JsonUtility.ToJson(questData);

            if (data.questDataJson.ContainsKey(quest.info.id))
                data.questDataJson.Remove(quest.info.id);

            data.questDataJson.Add(quest.info.id, serializedData);
        }
    }
}
