using UnityEngine;
using TMPro;
using Ink.Runtime;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using System.Collections;

public class DialogueManager : MonoBehaviour
{
    [Header("Params")]
    [SerializeField] private float typingSpeed = 0.02f;

    [Header("References")]
    [SerializeField] private PlayerController playerController;
    [SerializeField] private DialogueTrigger dialogueTrigger;

    [Header("Globals JSON File")]
    [SerializeField] private TextAsset loadGlobalsJSON;

    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private TextMeshProUGUI displayNameText;
    [SerializeField] private Animator portraitAnimator;

    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;
    [SerializeField] private GameObject continueIcon;
    
    private InputManager inputManager;
    private Story currentStory;
    private static DialogueManager instance;
    private TextMeshProUGUI[] choicesText;
    private Animator layoutAnimator;
    private bool canContinueToNextLine = true;
    private Coroutine displayLineCoroutnie;
    private DialogueVariables dialogueVariables;

    private const string SPEAKER_TAG = "speaker";
    private const string PORTRAIT_TAG = "portrait";
    private const string LAYOUT_TAG = "layout";

    public bool dialogueIsPlaying { get; private set; }

    public static DialogueManager GetInstance()
    {
        return instance;
    }

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
        continueIcon = GameObject.Find("ContinueIcon");
        displayNameText = GameObject.Find("DisplayNameText").GetComponent<TextMeshProUGUI>();
        portraitAnimator = GameObject.Find("PortraitImage").GetComponent<Animator>();
        layoutAnimator = dialoguePanel.GetComponent<Animator>();
        dialogueVariables = new DialogueVariables(loadGlobalsJSON);
    }

    private void Start()
    {
        inputManager = inputManager = InputManager.Instance;

        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        //get all choices

        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    private void Update()
    {
        if (!dialogueIsPlaying)
        {
            return;
        }
        if (canContinueToNextLine && inputManager.GetInteractPressed())
        {
            ContinueStory();
        }
    }

    public void EnterDialogueMode(TextAsset inkJSON)
    {
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);
        dialogueTrigger.NPCInRange = false;

        dialogueVariables.StartListening(currentStory);

        //reset tags
        displayNameText.text = "???";
        portraitAnimator.Play("default");
        layoutAnimator.Play("right");

        ContinueStory();
    }

    private void ExitDialogueMode()
    {
        dialogueVariables.StopListening(currentStory);

        dialogueIsPlaying = false;
        dialogueTrigger.NPCInRange = true;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            continueIcon.SetActive(true);
            //set text for the current dialogue line
            if (displayLineCoroutnie != null)
                StopCoroutine(displayLineCoroutnie);
            displayLineCoroutnie = StartCoroutine(DisplayLine(currentStory.Continue()));
            //handle tags
            HandleTags(currentStory.currentTags);
        }
        else
        {
            ExitDialogueMode();
        }
    }

    private IEnumerator DisplayLine(string line)
    {
        //set the text to the full line, but set visible characters to 0
        dialogueText.text = line;
        dialogueText.maxVisibleCharacters = 0;

        continueIcon.SetActive(false);
        canContinueToNextLine = false;

        HideChoices();

        foreach(char letter in line.ToCharArray())
        {
            if (inputManager.GetInteractPressed())
            {
                dialogueText.maxVisibleCharacters = line.Length;
                break;
            }

            dialogueText.maxVisibleCharacters++;
            yield return new WaitForSeconds(typingSpeed);
        }

        continueIcon.SetActive(true);

        //display chices, if any, for this dialogue line
        DisplayChoices();

        canContinueToNextLine = true;
    }

    private void HandleTags(List<string> currnetTags)
    {
        foreach (string tag in currnetTags)
        {
            string[] splitTag = tag.Split(':');
            if (splitTag.Length != 2)
                Debug.LogError("Tag could not be appropriately parsed: " + tag);
            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();

            switch (tagKey)
            {
                case SPEAKER_TAG:
                    displayNameText.text = tagValue;
                    break;
                case PORTRAIT_TAG:
                    portraitAnimator.Play(tagValue);
                    break;
                case LAYOUT_TAG:
                    layoutAnimator.Play(tagValue);
                    break;
                default:
                    Debug.LogWarning("Tag came in but is not currently being handled: " + tag);
                    break;
            }
        }
    }

    private void DisplayChoices()
    {
        List<Choice> currentChoices = currentStory.currentChoices;

        //defensive check to make sure UI can support the number of choices coming in
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI can support. Number of choices given:" + currentChoices.Count);
        }

        int index = 0;
        foreach(Choice choice in currentChoices)
        {
            continueIcon.SetActive(false);
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i <choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }

        StartCoroutine(SelectFirstChoice());
    }

    private void HideChoices()
    {
        foreach (GameObject choiceButton in choices)
            choiceButton.SetActive(false);
    }

    private IEnumerator SelectFirstChoice()
    {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }

    public void MakeChoice (int choiceIndex)
    {
        currentStory.ChooseChoiceIndex(choiceIndex);
    }

    public Ink.Runtime.Object GetVariableState(string variableName)
    {
        Ink.Runtime.Object variableValue = null;
        dialogueVariables.variables.TryGetValue(variableName, out variableValue);
        if (variableValue == null)
            Debug.LogWarning("Ink Variable was found to be null");
        return variableValue;
    }

    //TODO: Replace it with proper saving mechanism 
    public void OnApplicationQuit()
    {
        if (dialogueVariables != null)
            dialogueVariables.SaveVariables();
        else
            Debug.LogWarning("Dialogues variables object doesn't exist yet");
    }
}
