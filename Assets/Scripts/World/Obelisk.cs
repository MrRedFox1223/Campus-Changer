using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;

public class Obelisk : MonoBehaviour
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

    private void Start()
    {
        if (!useCustomSFX)
            customSFX = FMODEvents.instance.itemIdle;

        emitter = AudioManager.instance.InitializeEventEmitter(customSFX, this.gameObject);
    }

    public void ActivateObelisk()
    {
        emitter.Play();
        active = true;
        this.gameObject.GetComponent<MeshRenderer>().material = activeMaterial;
    }

    public void DeactivateObelisk()
    {
        emitter.Stop();
        active = false;
        this.gameObject.GetComponent<MeshRenderer>().material = deactiveMaterial;
    }

    private void OnDisable()
    {
        emitter.Stop();
    }
}
