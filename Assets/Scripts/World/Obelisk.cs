using UnityEngine;
using FMODUnity;
using System;

public class Obelisk : MonoBehaviour, IInteractableObject, IDataPersistance
{
    [Header("Gameplay")]
    public string id;
    public bool active = false;

    [Header("SFX")]
    [SerializeField] private bool useCustomSFX;
    [SerializeField] private EventReference customSFX;
    private StudioEventEmitter emitter;

    [Header("VFX")]
    [SerializeField] private Material activeMaterial;
    [SerializeField] private Material deactiveMaterial;

    [ContextMenu("Generate guid for id")]
    private void GenerateGuid()
    {
        id = System.Guid.NewGuid().ToString();
    }

    private void Awake()
    {
        if (!useCustomSFX)
            customSFX = FMODEvents.instance.itemIdle;

        emitter = AudioManager.instance.InitializeEventEmitter(customSFX, this.gameObject);
    }

    public void Activate()
    {
        emitter.Play();
        active = true;
        this.gameObject.GetComponent<MeshRenderer>().material = activeMaterial;
        GameEventsManager.instance.miscEvents.ObeliskActivated();
    }

    public void Deactivate()
    {
        emitter.Stop();
        active = false;
        this.gameObject.GetComponent<MeshRenderer>().material = deactiveMaterial;
        GameEventsManager.instance.miscEvents.ObeliskDeactivated();
    }

    public bool CheckState()
    {
        if (active)
            return true;

        return false;
    }

    private void OnDisable()
    {
        emitter.Stop();
    }

    public void LoadData(GameData data)
    {
        try
        {
            active = data.interactableObjectsState[id];
        }
        catch (Exception e)
        {
            Debug.Log(e);
        }

        if (active)
            Activate();
        else
            Deactivate();
    }

    public void SaveData(GameData data)
    {
        if (data.interactableObjectsState.ContainsKey(id))
            data.interactableObjectsState.Remove(id);

        data.interactableObjectsState.Add(id, active);
    }
}
