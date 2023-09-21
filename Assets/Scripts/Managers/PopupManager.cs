using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class PopupManager : MonoBehaviour
{
    [Header("Action text options")]
    [SerializeField] private string npcActionText;
    [SerializeField] private string objectActionText;
    [SerializeField] private string terrainActionText;
    [SerializeField] private string itemActionText;

    [Header("Quest text options")]
    [SerializeField] private string startQuestText;
    [SerializeField] private string finishQuestText;

    [Header("Info text options")]
    [SerializeField] private string switchTerrainText;
    [SerializeField] private string pickUpItemText;
    [SerializeField] private string dropItemText;

    [Header("References")]
    [SerializeField] private TextMeshProUGUI actionText;
    [SerializeField] private TextMeshProUGUI questText;
    [SerializeField] private TextMeshProUGUI infoText;

    public static PopupManager instance { get; private set; }

    private void Awake()
    {
        if (instance != null)
            Debug.LogError("Found more than one Popup Manager in the scene");

        instance = this;

        actionText = GameObject.Find("ActionText").GetComponent<TextMeshProUGUI>();
        questText = GameObject.Find("QuestText").GetComponent<TextMeshProUGUI>();
        infoText = GameObject.Find("InfoText").GetComponent<TextMeshProUGUI>();
    }

    public static PopupManager GetInstance()
    {
        return instance;
    }

    public void SetActionText(string tag)
    {
        switch (tag)
        {
            case Tags.NPC_TAG:
                if (!DialogueManager.GetInstance().dialogueIsPlaying)
                {
                    actionText.text = npcActionText;
                }
                else
                    actionText.text = "";
                break;
            case Tags.OBJECT_TAG:
                actionText.text = objectActionText;
                break;
            case Tags.TERRAIN_TAG:
                actionText.text = terrainActionText;
                break;
            case Tags.ITEM_TAG:
                actionText.text = itemActionText;
                break;
            case null:
                actionText.text = "";
                break;
        }
    }

    private void SetQuestText()
    {

    }

    private void SetInfoText()
    {

    }
}
