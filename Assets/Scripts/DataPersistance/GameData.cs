[System.Serializable]
public class GameData
{
    // Save data
    public string saveID;

    // Player data
    public long lastUpdated;
    public int questsCompleted;

    // World data
    public int currentSceneIndex;
    public string locationName;
    public SerializableDictionary<string, int> swichableTerrainsVaraints;
    public SerializableDictionary<string, bool> interactableObjectsState;
    public bool tutorialGeniusLoci;
    
    // Story data
    public string globalVariablesStoryJson;

    // Quest data
    public SerializableDictionary<string, string> questDataJson;

    // The values in this constructor will be the default values the game starts with 
    public GameData()
    {
        this.questsCompleted = 0;

        this.currentSceneIndex = 1;
        this.locationName = "";
        this.swichableTerrainsVaraints = new SerializableDictionary<string, int>();
        this.interactableObjectsState = new SerializableDictionary<string, bool>();
        this.tutorialGeniusLoci = false;

        this.globalVariablesStoryJson = "";

        this.questDataJson = new SerializableDictionary<string, string>();
    }
}
