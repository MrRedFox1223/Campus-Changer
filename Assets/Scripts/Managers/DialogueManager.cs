using UnityEngine;
using TMPro;
using Ink.Runtime;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using System.Collections;
using Unity.Services.CloudSave;
using System;

public class DialogueManager : MonoBehaviour, IDataPersistance
{
    [Header("Params")]
    [SerializeField] private float typingSpeed = 0.02f;
    public float pauseTime = 2f;

    [Header("Globals JSON File")]
    [SerializeField] private TextAsset loadGlobalsJSON;

    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private Animator portraitAnimator;

    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;

    [Header("Interactor UI")]
    [SerializeField] private GameObject crosshair;
    [SerializeField] private TextMeshProUGUI actionText;

    public bool interactPressed = false;
    public bool pauseCalled = false;
    public bool dialogueIsPlaying { get; private set; }

    private Story currentStory;
    private static DialogueManager instance;
    private TextMeshProUGUI[] choicesText;
    private bool canContinueToNextLine = true;
    private Animator layoutAnimator;
    private Coroutine displayLineCoroutnie;
    private DialogueVariables dialogueVariables;
    private InkExternalFunctions inkExternalFunctions;
    
    private const string PORTRAIT_TAG = "portrait";
    private const string LAYOUT_TAG = "layout"; 

    public static DialogueManager GetInstance()
    {
        return instance;
    }

    private void Awake()
    {
        if (instance != null)
            Debug.LogWarning("Found more than one Dialogue Manager in the scene");

        instance = this;

        dialoguePanel = GameObject.Find("DialoguePanel");
        dialogueText = GameObject.Find("DialogueText").GetComponent<TextMeshProUGUI>();
        portraitAnimator = GameObject.Find("PortraitImage").GetComponent<Animator>();
        layoutAnimator = dialoguePanel.GetComponent<Animator>();
        dialogueVariables = new DialogueVariables(loadGlobalsJSON);
        inkExternalFunctions = new InkExternalFunctions();
        crosshair = GameObject.Find("Crosshair");
        actionText = GameObject.Find("ActionText").GetComponent<TextMeshProUGUI>();
    }

    private void OnEnable()
    {
        GameEventsManager.instance.inputEvents.onInteractPressed += InteractPressed;
    }

    private void Start()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        // Get all choices
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach (GameObject choice in choices)
        {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    private void OnDisable()
    {
        GameEventsManager.instance.inputEvents.onInteractPressed -= InteractPressed;
    }

    private void Update()
    {
        if (!dialogueIsPlaying)
            return;

        if (canContinueToNextLine && interactPressed)
        {
            interactPressed = false;
            ContinueStory();
        }
    }

    private void InteractPressed()
    {
        interactPressed = true;
    }

    public void EnterDialogueMode(TextAsset inkJSON, GameObject NPC)
    {
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);
        crosshair.SetActive(false);
        actionText.text = "";

        dialogueVariables.StartListening(currentStory);
        inkExternalFunctions.Bind(currentStory, NPC);

        // Reset tags
        portraitAnimator.Play("default");
        layoutAnimator.Play("right");
    }

    public void ExitDialogueMode()
    {
        dialogueVariables.StopListening(currentStory);
        inkExternalFunctions.Unbind(currentStory);

        crosshair.SetActive(true);

        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
    }

    private void ContinueStory()
    {
        if (currentStory.canContinue)
        {
            // Set text for the current dialogue line
            if (displayLineCoroutnie != null)
                StopCoroutine(displayLineCoroutnie);

            string nextLine = currentStory.Continue();

            // Handle the case when the last line is external function
            if (nextLine.Equals("") && !currentStory.canContinue)
                ExitDialogueMode();
            else
            {
                // Handle tags
                HandleTags(currentStory.currentTags);
                displayLineCoroutnie = StartCoroutine(DisplayLine(nextLine));
            }
        }
        else
            ExitDialogueMode();
    }

    private IEnumerator DisplayLine(string line)
    {
        // Set the text to the full line, but set visible characters to 0
        dialogueText.text = line;
        dialogueText.maxVisibleCharacters = 0;
        canContinueToNextLine = false;

        HideChoices();

        if (pauseCalled)
            yield return new WaitForSeconds(pauseTime);

        foreach (char letter in line.ToCharArray())
        {
            if (interactPressed)
            {
                interactPressed = false;
                dialogueText.maxVisibleCharacters = line.Length;
                break;
            }

            dialogueText.maxVisibleCharacters++;
            yield return new WaitForSecondsRealtime(typingSpeed);
        }

        // Display choices, if any, for this dialogue line
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

        // Defensive check to make sure UI can support the number of choices coming in
        if (currentChoices.Count > choices.Length)
            Debug.LogError("More choices were given than the UI can support. Number of choices given:" + currentChoices.Count);

        int index = 0;
        foreach(Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i <choices.Length; i++)
            choices[i].gameObject.SetActive(false);

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
        try
        {
            currentStory.ChooseChoiceIndex(choiceIndex);
        }
        catch (Exception e)
        {
            Debug.Log(e);
        } 
    }

    public Ink.Runtime.Object GetVariableState(string variableName)
    {
        Ink.Runtime.Object variableValue = null;
        dialogueVariables.variables.TryGetValue(variableName, out variableValue);
        if (variableValue == null)
            Debug.LogWarning("Ink Variable was found to be null");
        return variableValue;
    }

    public void LoadData(GameData data)
    {
        // Safety check to make sure that there is data to load
        if (data.globalVariablesStoryJson.Length > 1)
        {
            dialogueVariables.globalVariablesStoryToUpdate.state.LoadJson(data.globalVariablesStoryJson);
            dialogueVariables.Updater();
        }
    }

    public void SaveData(GameData data)
    {
        data.globalVariablesStoryJson = dialogueVariables.SaveVariables();

        var client = CloudSaveService.Instance.Data;
        var cloudData = new Dictionary<string, object> { { data.saveID + "_DialogueVariables", data.globalVariablesStoryJson } };
        client.ForceSaveAsync(cloudData);
    } 
}
