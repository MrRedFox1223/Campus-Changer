using UnityEngine;
using TMPro;
using System.Threading.Tasks;

public class PopupManager : MonoBehaviour
{
    [Header("Action notification options")]
    [SerializeField] private string npcActionText;
    [SerializeField] private string objectActionText;
    [SerializeField] private string terrainActionText;
    [SerializeField] private string itemActionText;

    [Header("Quest notification options")]
    [SerializeField] private string startQuestText;
    [SerializeField] private string finishQuestText;

    [Header("Info notification options")]
    [SerializeField] private string switchTerrainText;
    [SerializeField] private string pickUpItemText;
    [SerializeField] private string dropItemText;

    [Header("Configuration")]
    [SerializeField] private float duration;
    [SerializeField] private int typingSpeed;
    [SerializeField] private float advancemntFontSizeDifference;

    [Header("References")]
    [SerializeField] private TextMeshProUGUI actionText;
    [SerializeField] private GameObject actionFrame;
    [SerializeField] private TextMeshProUGUI questText;

    public static PopupManager instance { get; private set; }

    private void Awake()
    {
        if (instance != null)
            Debug.LogError("Found more than one Popup Manager in the scene");

        instance = this;

        actionText = GameObject.Find("ActionText").GetComponent<TextMeshProUGUI>();
        actionFrame = GameObject.Find("ActionFrame");
        questText = GameObject.Find("QuestText").GetComponent<TextMeshProUGUI>();
    }

    private void OnEnable()
    {
        GameEventsManager.instance.questEvents.onStartQuest += StartQuestNotification;
        GameEventsManager.instance.questEvents.onAdvanceQuest += AdvanceQuestNotification;
        GameEventsManager.instance.questEvents.onFinishQuest += FinishQuestNotification;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.questEvents.onStartQuest -= StartQuestNotification;
        GameEventsManager.instance.questEvents.onAdvanceQuest -= AdvanceQuestNotification;
        GameEventsManager.instance.questEvents.onFinishQuest -= FinishQuestNotification;
    }

    public static PopupManager GetInstance()
    {
        return instance;
    }

    public void ShowActionText(string tag)
    {
        switch (tag)
        {
            case Tags.NPC_TAG:
                if (!DialogueManager.GetInstance().dialogueIsPlaying)
                {
                    actionText.text = npcActionText;
                    actionFrame.SetActive(true);
                }
                else
                {
                    actionText.text = "";
                    actionFrame.SetActive(false);
                }
                break;
            case Tags.OBJECT_TAG:
                {
                    actionText.text = objectActionText;
                    actionFrame.SetActive(true);
                }
                break;
            case Tags.TERRAIN_TAG:
                {
                    actionText.text = terrainActionText;
                    actionFrame.SetActive(true);
                }
                break;
            case null:
                actionText.text = "";
                actionFrame.SetActive(false);
                break;
        }
    }

    private async void StartQuestNotification(string id)
    {
        Quest quest = QuestManager.GetInstance().GetQuestById(id);
        string line = startQuestText + " " + quest.info.displayName;
        await ShowNotification(line, questText);

        AdvanceQuestNotification(id);
    }

    private async void AdvanceQuestNotification(string id)
    {
        questText.fontSize -= advancemntFontSizeDifference;

        Quest quest = QuestManager.GetInstance().GetQuestById(id);
        QuestData qeustData = quest.GetQuestData();

        string line;

        if (quest.state.Equals(QuestState.CAN_FINISH))
            line = quest.info.questStepDescriptions[quest.info.questStepDescriptions.Length - 1];           
        else
            line = quest.info.questStepDescriptions[qeustData.questStepIndex];

        await ShowNotification(line, questText);

        questText.fontSize += advancemntFontSizeDifference;
    }

    private async void FinishQuestNotification(string id)
    {
        Quest quest = QuestManager.GetInstance().GetQuestById(id);
        string line = finishQuestText + " " + quest.info.displayName;
        await ShowNotification(line, questText);
    }

    private async Task ShowNotification(string line, TextMeshProUGUI TMPtext)
    {
        var end = Time.time + duration;

        // Set the text to the full line, but set visible characters to 0
        TMPtext.text = line;
        TMPtext.maxVisibleCharacters = 0;

        foreach (char letter in line.ToCharArray())
        {
            TMPtext.maxVisibleCharacters++;
            await Task.Delay(typingSpeed);
        }

        while (Time.time < end)
            await Task.Yield();

        await HideNotification(line, TMPtext);
    }

    private async Task HideNotification(string line, TextMeshProUGUI TMPtext)
    {
        foreach (char letter in line.ToCharArray())
        {
            TMPtext.maxVisibleCharacters--;
            await Task.Delay(typingSpeed);
        }
    }
}
