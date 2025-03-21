using UnityEngine;

public class GameEventsManager : MonoBehaviour
{
    public static GameEventsManager instance { get; private set; }

    public InputEvents inputEvents;
    public MiscEvents miscEvents;
    public QuestEvents questEvents;

    private void Awake()
    {
        if (instance != null)
            Debug.LogError("Found more than one Game Events Manager in the scene.");

        instance = this;

        // Initialize all events
        inputEvents = new InputEvents();
        miscEvents = new MiscEvents();
        questEvents = new QuestEvents();
    }
}