using UnityEngine;
using TMPro;

public class InteractionManager : MonoBehaviour
{
    [SerializeField] private Transform mainCamera;
    [SerializeField] private TextMeshProUGUI actionText;
    [SerializeField] private float interactRange;
    
    private GameObject NPC;
    private RaycastHit hitInfo;

    private const string NPC_TAG = "DialogueNPC";
    private const string OBJECT_TAG = "InteractableObject";
    private const string TERRAIN_TAG = "SwitchableTerrain";
    private const string ITEM_TAG = "Item";

    private void Awake()
    {
        mainCamera = GameObject.Find("MainCamera").transform;
        actionText = GameObject.Find("ActionText").GetComponent<TextMeshProUGUI>();
    }

    private void Start()
    {
        GameEventsManager.instance.inputEvents.onInteractPressed += InteractPressed;
    }

    private void OnDestroy()
    {
        GameEventsManager.instance.inputEvents.onInteractPressed -= InteractPressed;
    }

    private void Update()
    { 
        // Cast ray searching for GameObjects with specific tags
        Ray r = new Ray(mainCamera.position, mainCamera.forward);
        if (Physics.Raycast(r, out hitInfo, interactRange))
        {
            SetActionText();
        }
        else
            actionText.text = "";
    }

    private void SetActionText()
    {
        string tag = hitInfo.collider.gameObject.tag;

        switch (tag)
        {
            case NPC_TAG:
                if (!DialogueManager.GetInstance().dialogueIsPlaying)
                {
                    actionText.text = "<color=#FFFFFF> E </color>  Rozmawiaj";
                }
                else
                    actionText.text = "";
                break;
            case OBJECT_TAG:
                actionText.text = "<color=#FFFFFF> E </color>  U¿yj";
                break;
            case TERRAIN_TAG:
                actionText.text = "<color=#FFFFFF> E </color>  Zmieñ";
                break;
            case ITEM_TAG:
                actionText.text = "<color=#FFFFFF> E </color>  Podnieœ";
                break;
        }
    }

    private void InteractPressed()
    {
        // Prevents from interacting with Game objects when exiting from the pause menu
        if (GameObject.Find("PauseMenu") != null && GameObject.Find("PauseMenu").GetComponent<PauseMenu>().isActive == true)
            return;

        if (hitInfo.collider == null)
            return;

        string tag = hitInfo.collider.gameObject.tag;

        switch (tag)
        {
            case NPC_TAG:
                if (!DialogueManager.GetInstance().dialogueIsPlaying)
                {
                    NPC = hitInfo.collider.gameObject.transform.parent.gameObject;
                    DialogueManager.GetInstance().EnterDialogueMode(NPC.transform.Find("Dialogue").GetComponent<DialogueHolder>().inkJSON);
                }
                break;
            case OBJECT_TAG:
                // Temporary functions to implement Quest System
                // TODO: Create abstract Interactable Object and call its functions here
                if (!hitInfo.collider.gameObject.GetComponent<Obelisk>().active)
                    hitInfo.collider.gameObject.GetComponent<Obelisk>().ActivateObelisk();
                else
                    hitInfo.collider.gameObject.GetComponent<Obelisk>().DeactivateObelisk();
                break;
            case TERRAIN_TAG:
                // TODO - Pass information to abstract SwitchableTerrain
                break;
            case ITEM_TAG:
                // TODO - Pass information to abstract Item
                break;
        }
    }
}
