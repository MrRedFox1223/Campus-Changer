using UnityEngine;

[System.Serializable]
public class GameData
{
    // Gameplay data
    public long lastUpdated;
    public int currentSceneIndex;
    public Vector3 playerPos;
    public Vector3 cameraRotation;

    // World data
    public SerializableDictionary<string, int> swichableTerrainsVaraints;
    public SerializableDictionary<string, bool> interactableObjectsState;

    // Story data
    public string globalVariablesStoryJson;

    // Quest data
    public SerializableDictionary<string, string> questDataJson;

    // The values in this constructor will be the default values the game starts with 
    public GameData()
    {
        this.currentSceneIndex = 1;
        this.playerPos = new Vector3(0,1,0);

        this.swichableTerrainsVaraints = new SerializableDictionary<string, int>();
        this.interactableObjectsState = new SerializableDictionary<string, bool>();

        this.globalVariablesStoryJson = "";

        this.questDataJson = new SerializableDictionary<string, string>();
    }
}
