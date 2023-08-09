using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TerrainSwitcher : MonoBehaviour, IDataPersistance
{
    [SerializeField] private string id;

    [ContextMenu("Generate guid for id")]
    private void GenerateGuid()
    {
        id = System.Guid.NewGuid().ToString();
    }

    private int state = 0;

    public void LoadData(GameData data)
    {
        data.terrainState.TryGetValue(id, out state);
    }

    public void SaveData(ref GameData data)
    {
        if (data.terrainState.ContainsKey(id))
            data.terrainState.Remove(id);

        data.terrainState.Add(id, state);
    }
}
