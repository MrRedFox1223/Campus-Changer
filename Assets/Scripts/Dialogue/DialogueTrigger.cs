using UnityEngine;

public class DialogueTrigger : MonoBehaviour
{
    [SerializeField] PlayerController playerController;

    private GameObject NPC;

    public bool NPCInRange;

    private void Awake()
    {
        NPCInRange = false;
        playerController = GameObject.Find("Player").GetComponent<PlayerController>();
    }

    private void Update()
    {
        if (NPCInRange && !DialogueManager.GetInstance().dialogueIsPlaying)
        {
            if (InputManager.Instance.GetInteractPressed())
            {
                DialogueManager.GetInstance().EnterDialogueMode(NPC.transform.Find("Dialogue").GetComponent<DialogueHolder>().inkJSON);
            }
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "DialogueNPC")
        {
            NPCInRange = true;
            NPC = other.gameObject.transform.parent.gameObject;
            NPC.transform.Find("VisualCue").gameObject.SetActive(true);

        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "DialogueNPC")
        {
            NPCInRange = false;
            NPC = other.gameObject.transform.parent.gameObject;
            NPC.transform.Find("VisualCue").gameObject.SetActive(false);
        }
    }
}
