using UnityEngine;
using TMPro;

public class InteractionManager : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Transform mainCamera;
    [SerializeField] private float interactRange;
    [SerializeField] private GameObject switchableTerrainMenu;
    
    private GameObject NPC;
    private RaycastHit hitInfo;

    private void Awake()
    {
        mainCamera = GameObject.Find("MainCamera").transform;
    }

    private void OnEnable()
    {
        GameEventsManager.instance.inputEvents.onInteractPressed += InteractPressed;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.inputEvents.onInteractPressed -= InteractPressed;
    }

    private void Update()
    { 
        // Cast ray searching for GameObjects with specific tags
        Ray r = new Ray(mainCamera.position, mainCamera.forward);
        if (Physics.Raycast(r, out hitInfo, interactRange))
        {
            PopupManager.GetInstance().ShowActionText(hitInfo.collider.gameObject.tag);
        }
        else
            PopupManager.GetInstance().ShowActionText(null);
    }

    private void InteractPressed()
    {
        // Prevents from interacting with Game objects when menu is active
        if (MenuActive())
            return;

        if (hitInfo.collider == null)
            return;

        string tag = hitInfo.collider.gameObject.tag;

        switch (tag)
        {
            case Tags.NPC_TAG:
                if (!DialogueManager.GetInstance().dialogueIsPlaying)
                {
                    NPC = hitInfo.collider.gameObject.transform.parent.gameObject;
                    DialogueManager.GetInstance().EnterDialogueMode(NPC.transform.Find("Dialogue").GetComponent<DialogueHolder>().inkJSON, NPC);
                }
                break;
            case Tags.OBJECT_TAG:
                if (!hitInfo.collider.gameObject.GetComponent<IInteractableObject>().CheckState())
                    hitInfo.collider.gameObject.GetComponent<IInteractableObject>().Activate();
                else
                    hitInfo.collider.gameObject.GetComponent<IInteractableObject>().Deactivate();
                break;
            case Tags.TERRAIN_TAG:
                switchableTerrainMenu.SetActive(true);
                switchableTerrainMenu.GetComponent<SwitchableTerrainMenu>().Initialize(hitInfo.collider.gameObject.transform.parent.gameObject);
                break;
        }
    }

    private bool MenuActive()
    {
        if (GameObject.Find("PauseMenu") != null && GameObject.Find("PauseMenu").GetComponent<PauseMenu>().isActive == true)
            return true;
            
        if (GameObject.Find("SwitchableTerrainMenu") != null && GameObject.Find("SwitchableTerrainMenu").GetComponent<SwitchableTerrainMenu>().isActive == true)
            return true;

        return false;
    }
}
