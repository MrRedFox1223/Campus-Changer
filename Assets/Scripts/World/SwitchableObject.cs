using System;
using System.Collections.Generic;
using Unity.Services.CloudSave;
using UnityEngine;

public class SwitchableObject : MonoBehaviour, ISwitchableTerrain, IDataPersistance
{
    [SerializeField] private string id;
    [SerializeField] private int activeVariantId;
    [SerializeField] private List<GameObject> variants;

    [ContextMenu("Generate guid for id")]
    private void GenerateGuid()
    {
        id = System.Guid.NewGuid().ToString();
    }

    private void Awake()
    {
        variants = new List<GameObject>();

        Initialize();
    }

    public void Initialize()
    {
        int numberOfChilds = transform.childCount;
        for (int i = 0; i < numberOfChilds; i++)
            variants.Add(transform.GetChild(i).gameObject);

        SwitchVariant(activeVariantId);
    }

    public void SwitchVariant(int id)
    {
        foreach (GameObject variant in variants)
            variant.SetActive(false);

        variants[id].SetActive(true);
        activeVariantId = id;
    }

    public void LoadData(GameData data)
    {
        try
        {
            activeVariantId = data.swichableTerrainsVaraints[id];
        }
        catch (Exception e)
        {
            Debug.Log(e);
        }

        SwitchVariant(activeVariantId);
    }

    public void SaveData(GameData data)
    {
        if (data.swichableTerrainsVaraints.ContainsKey(id))
            data.swichableTerrainsVaraints.Remove(id);

        data.swichableTerrainsVaraints.Add(id, activeVariantId);
    }
}
