using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuestManager : MonoBehaviour
{
    // Shoud be static?
    //public static QuestManager instance { get; private set; }

    private Dictionary<string, Quest> questMap;

    private void Awake()
    {
        questMap = CreateQuestMap();

        Quest quest = GetQuestById("CheckObeliskQuest");
        Debug.Log(quest.info.displayName);
        Debug.Log(quest.state);
        Debug.Log(quest.CurrentStepExists());
    }

    private Dictionary<string, Quest> CreateQuestMap()
    {
        // Loads all QuestInfoSO Scriptable Objects under the Assets/Resources/Quests folder
        QuestInfoSO[] allQuests = Resources.LoadAll<QuestInfoSO>("Quests");

        // Create the quest map
        Dictionary<string, Quest> idToQuestMap = new Dictionary<string, Quest>();

        foreach (QuestInfoSO questInfo in allQuests)
        {
            if (idToQuestMap.ContainsKey(questInfo.id))
                Debug.LogWarning("Duplicate ID found when creating quest map: " + questInfo.id);
            idToQuestMap.Add(questInfo.id, new Quest(questInfo));
        }

        return idToQuestMap;
    }

    // This function exists to throw an error if quest that don't exist is trying to be called
    // Use this function to get into questMap instead of accessing it directly
    private Quest GetQuestById(string id)
    {
        Quest quest = questMap[id];

        if (quest == null)
            Debug.LogError("ID not found in the Quest Map: " + id);

        return quest;
    }
}
