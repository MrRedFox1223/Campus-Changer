using UnityEngine;
using FMODUnity;

[RequireComponent(typeof(StudioEventEmitter))]
public class IdleSFXEmmiter : MonoBehaviour
{
    [SerializeField] private bool useCustomSFX;
    [SerializeField] private EventReference customSFX;

    private StudioEventEmitter emitter;

    private void Start()
    {
        if (!useCustomSFX)
            customSFX = FMODEvents.instance.itemIdle;

        emitter = AudioManager.instance.InitializeEventEmitter(customSFX, this.gameObject);
        emitter.Play();
    }

    private void OnDisable()
    {
        emitter.Stop();
    }
}
