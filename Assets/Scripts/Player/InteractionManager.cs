using UnityEngine;
using TMPro;

public class InteractionManager : MonoBehaviour
{
    [SerializeField] private Transform mainCamera;
    [SerializeField] private GameObject interactPopup;
    [SerializeField] private TextMeshProUGUI actionText;
    [SerializeField] private float interactRange;
    

    private GameObject NPC;

    private void Awake()
    {
        mainCamera = GameObject.Find("MainCamera").transform;
    }

    private void Update()
    {
        if (!DialogueManager.GetInstance().dialogueIsPlaying)
        {
            // Cast ray searching for GameObjects with specific tags
            Ray r = new Ray(mainCamera.position, mainCamera.forward);
            if (Physics.Raycast(r, out RaycastHit hitInfo, interactRange))
            {
                InteractWithDialogueNPC(hitInfo);
                InteractWithSwitchableTerrain(hitInfo);
                InteractWithInteractableObject(hitInfo);
                InteractWithItem(hitInfo);
            }
            else
                interactPopup.SetActive(false);
        }    
    }

    private void InteractWithDialogueNPC(RaycastHit hitInfo)
    {
        if (hitInfo.collider.gameObject.tag == "DialogueNPC")
        {
            interactPopup.SetActive(true);
            actionText.text = "Rozmawiaj";
            if (InputManager.instance.GetInteractPressed())
            {
                NPC = hitInfo.collider.gameObject.transform.parent.gameObject;
                DialogueManager.GetInstance().EnterDialogueMode(NPC.transform.Find("Dialogue").GetComponent<DialogueHolder>().inkJSON);
            }
        }
    }

    private void InteractWithInteractableObject(RaycastHit hitInfo)
    {
        if (hitInfo.collider.gameObject.tag == "InteractableObject")
        {
            interactPopup.SetActive(true);
            actionText.text = "U¿yj";
            if (InputManager.instance.GetInteractPressed())
            {
                // TODO - Pass information to InteractableObject
            }
        }
    }

    private void InteractWithSwitchableTerrain(RaycastHit hitInfo)
    {
        if (hitInfo.collider.gameObject.tag == "SwitchableTerrain")
        {
            interactPopup.SetActive(true);
            actionText.text = "Zmieñ";
            if (InputManager.instance.GetInteractPressed())
            {
                // TODO - Pass information to SwitchableTerrain
            }
        }
    }

    private void InteractWithItem(RaycastHit hitInfo)
    {
        if (hitInfo.collider.gameObject.tag == "Item")
        {
            interactPopup.SetActive(true);
            actionText.text = "Podnieœ";
            if (InputManager.instance.GetInteractPressed())
            {
                // TODO - Pass information to Item
            
            }
        }
    }
}
