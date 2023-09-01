using UnityEngine;

[System.Serializable]
public class GameData
{
    // Gameplay data
    public long lastUpdated;
    public Vector3 playerPos;
    public SerializableDictionary<string, int> terrainState;

    // Story data
    public string globalVariablesStoryJson;

    // The values in this constructor will be the default values the game starts with 
    public GameData()
    {
        this.playerPos = new Vector3(0,1,0);
        this.terrainState = new SerializableDictionary<string, int>();

        this.globalVariablesStoryJson = "";
    }
}
