using UnityEngine;
using TMPro;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private PlayerController playerController;
    [SerializeField] private DialogueTrigger dialogueTrigger;

    private Story currentStory;
    private bool interactPressed;
    private static DialogueManager instance;

    public bool dialogueIsPlaying { get; private set; }

    private void Awake()
    {
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene");
        }
        instance = this;
        playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        dialoguePanel = GameObject.Find("DialoguePanel");
        dialogueText = GameObject.Find("DialogueText").GetComponent<TextMeshProUGUI>();
        dialogueTrigger = GameObject.Find("Player").gameObject.transform.Find("Trigger").GetComponent<DialogueTrigger>();
    }

    public static DialogueManager GetInstance()
    {
        return instance;
    }

    private void Start()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
    }

    public void EnterDialogueMode(TextAsset inkJSON)
    {
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);
        dialogueTrigger.NPCInRange = false;
    }

    private void Update()
    {
        interactPressed = playerController.interactPressed;

        if (!dialogueIsPlaying)
        {
            return;
        }
        if (interactPressed)
        {
            ContinueStory();
        }
    }

    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialogueTrigger.NPCInRange = true;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            Debug.Log("Continue");
            dialogueText.text = currentStory.Continue();
        }
        else
        {
            Debug.Log("Exit");
            ExitDialogueMode();
        }
    }
}
