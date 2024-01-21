using UnityEngine;
using TMPro;
using System.Threading.Tasks;
using System;

public class PopupManager : MonoBehaviour
{
    [Header("Action notification options")]
    [SerializeField] private string npcActionText;
    [SerializeField] private string objectActionText;
    [SerializeField] private string terrainActionText;
    [SerializeField] private string itemActionText;

    [Header("Save notification options")]
    [SerializeField] private string savePopupText;
    [Range(0, 0.1f)]
    [SerializeField] private float saveFadeFactor = 0.05f;
    [Range(0, 1)]
    [SerializeField] private float saveFadePauseTime = 0.5f;

    [Header("Complete notification options")]
    [SerializeField] private string completePopupText;
    [Range(0, 0.1f)]
    [SerializeField] private float completeFadeFactor = 0.05f;
    [Range(0, 8)]
    [SerializeField] private float completeFadePauseTime = 5f;

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
    [SerializeField] private CanvasGroup saveCanvasGroup;
    [SerializeField] private TextMeshProUGUI saveText;
    [SerializeField] private CanvasGroup completeCanvasGroup;
    [SerializeField] private TextMeshProUGUI completeText;
    [SerializeField] private TextMeshProUGUI questText;

    public static PopupManager instance { get; private set; }

    private void Awake()
    {
        if (instance != null)
            Debug.LogError("Found more than one Popup Manager in the scene");

        instance = this;

        actionText = GameObject.Find("ActionText").GetComponent<TextMeshProUGUI>();
        actionFrame = GameObject.Find("ActionFrame");
        saveCanvasGroup = GameObject.Find("SavePopup").GetComponent<CanvasGroup>();
        saveText = GameObject.Find("SaveText").GetComponent<TextMeshProUGUI>();
        completeCanvasGroup = GameObject.Find("CompletePopup").GetComponent<CanvasGroup>();
        completeText = GameObject.Find("CompleteText").GetComponent<TextMeshProUGUI>();
        questText = GameObject.Find("QuestText").GetComponent<TextMeshProUGUI>();

        saveText.text = savePopupText;
        completeText.text = completePopupText;
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

    public async void ShowSaveNotification()
    {
        if (saveCanvasGroup != null)
            await FadeInNotification(saveCanvasGroup, saveFadeFactor);
        await PauseNotification(saveFadePauseTime, saveFadeFactor);
        if (saveCanvasGroup != null)
            await FadeOutNotification(saveCanvasGroup, saveFadeFactor);
    }

    public async void ShowCompleteNotification()
    {
        if (completeCanvasGroup != null)
            await FadeInNotification(completeCanvasGroup, completeFadeFactor);
        await PauseNotification(completeFadePauseTime + 2, completeFadeFactor);
        if (completeCanvasGroup != null)
            await FadeOutNotification(completeCanvasGroup, completeFadeFactor);
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

    private async Task FadeInNotification(CanvasGroup canvasGroup, float fadeFactor)
    {
        try
        {
            while (canvasGroup.alpha < 1)
            {
                if (canvasGroup != null)
                {
                    canvasGroup.alpha += fadeFactor;
                    await Task.Yield();
                }
                else
                    break;
            }
        }
        catch(Exception e)
        {
            Debug.Log(e);
        }
    }

    private async Task PauseNotification(float fadePauseTime, float fadeFactor)
    {
        float t = 0;
        while (t < fadePauseTime)
        {
            t += fadeFactor;
            await Task.Yield();
        }
    }

    private async Task FadeOutNotification(CanvasGroup canvasGroup, float fadeFactor)
    {
        try
        {
            while (canvasGroup.alpha > 0)
            {
                if (canvasGroup != null)
                {
                    canvasGroup.alpha -= fadeFactor;
                    await Task.Yield();
                }
                else
                    break;
            }
        }
        catch(Exception e)
        {
            Debug.Log(e);
        }
        
    } 
}
