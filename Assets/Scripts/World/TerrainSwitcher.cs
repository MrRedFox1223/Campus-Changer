using UnityEngine;

public class TerrainSwitcher : MonoBehaviour, IDataPersistance
{
    [SerializeField] private string id;
    [SerializeField] private int state = 0;

    [ContextMenu("Generate guid for id")]
    private void GenerateGuid()
    {
        id = System.Guid.NewGuid().ToString();
    }

    public void LoadData(GameData data)
    {
        data.terrainState.TryGetValue(id, out state);
    }

    public void SaveData(GameData data)
    {
        if (data.terrainState.ContainsKey(id))
            data.terrainState.Remove(id);

        data.terrainState.Add(id, state);
    }
}
