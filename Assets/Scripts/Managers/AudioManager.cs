using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using FMODUnity;
using FMOD.Studio;
using UnityEngine.SceneManagement;

public class AudioManager : MonoBehaviour
{
    private List<EventInstance> eventInstances;
    private List<StudioEventEmitter> eventEmitters;

    private Bus masterBus;
    private Bus musicBus;
    private Bus ambienceBus;
    private Bus sfxBus;

    [Header("Ambience Parameters")]
    public List<string> defaultAmbienceParametersNames;
    public List<float> defaultAmbienceParametersValues;

    [Header("Music Parameters")]
    public MusicArea defaultMusic;

    [Header("Volume")]
    [Range(0, 1)] public float masterVolume = 1;
    [Range(0, 1)] public float musicVolume = 1;
    [Range(0, 1)] public float ambienceVolume = 1;
    [Range(0, 1)] public float sfxVolume = 1;

    public static AudioManager instance { get; private set; }
    public EventInstance ambienceEventInstance;
    public EventInstance musicEventInstance;

    private void Awake()
    {
        if (instance != null)
            Debug.LogError("Found more than one Audio Manager in the scene");

        instance = this;

        eventInstances = new List<EventInstance>();
        eventEmitters = new List<StudioEventEmitter>();

        if (defaultAmbienceParametersNames.Count == 0)
        {
            defaultAmbienceParametersNames = new List<string>();
            defaultAmbienceParametersValues = new List<float>();
            Debug.LogWarning("There is no default parameters for ambience. Creating empty parametes lists.");
        }

        masterBus = RuntimeManager.GetBus("bus:/");
        musicBus = RuntimeManager.GetBus("bus:/Music");
        ambienceBus = RuntimeManager.GetBus("bus:/Ambience");
        sfxBus = RuntimeManager.GetBus("bus:/SFX");

        masterVolume = PlayerPrefs.GetFloat("masterVolume");
        musicVolume = PlayerPrefs.GetFloat("musicVolume");
        ambienceVolume = PlayerPrefs.GetFloat("ambienceVolume");
        sfxVolume = PlayerPrefs.GetFloat("sfxVolume");
    }

    private void Start()
    {
        InitializeAmbience(FMODEvents.instance.ambience);
        InitializeMusic(FMODEvents.instance.music);

        SetEventInstanceParameters(ambienceEventInstance, defaultAmbienceParametersNames, 
            defaultAmbienceParametersValues);
    }

    private void Update()
    {
        // In the MainMenuScene Player doesn't exist and set3DAttributes() must be set to a diferent object in range of sound
        if (SceneManager.GetActiveScene().name != "MainMenu")
        {
            // There is need to update player position to the sound source every frame
            ambienceEventInstance.set3DAttributes(RuntimeUtils.To3DAttributes(GameObject.Find("Player").transform));
            musicEventInstance.set3DAttributes(RuntimeUtils.To3DAttributes(GameObject.Find("Player").transform));
        }
        else
        {
            ambienceEventInstance.set3DAttributes(RuntimeUtils.To3DAttributes(GameObject.Find("AudioManager").transform));
            musicEventInstance.set3DAttributes(RuntimeUtils.To3DAttributes(GameObject.Find("AudioManager").transform));
        }

        // Set volume accordingly to the sliders in the inspector
        masterBus.setVolume(masterVolume);
        musicBus.setVolume(musicVolume);
        ambienceBus.setVolume(ambienceVolume);
        sfxBus.setVolume(sfxVolume);
    }

    public StudioEventEmitter InitializeEventEmitter(EventReference eventReference, GameObject emitterGameObject)
    {
        StudioEventEmitter emitter = emitterGameObject.GetComponent<StudioEventEmitter>();
        emitter.EventReference = eventReference;
        eventEmitters.Add(emitter);
        return emitter;
    }

    private void InitializeAmbience(EventReference ambienceEventReference)
    {
        ambienceEventInstance = AudioManager.instance.CreateInstance(ambienceEventReference);
        ambienceEventInstance.start();
    }

    private void InitializeMusic(EventReference musicEventReference)
    {
        musicEventInstance = AudioManager.instance.CreateInstance(musicEventReference);
        musicEventInstance.start();
    }

    public void SetEventInstanceParameters(EventInstance eventInstance, List<string> namesList, List<float> valuesList)
    {
        for (int i = 0; i < namesList.Count; i++)
            eventInstance.setParameterByName(namesList[i], valuesList[i]);
    }

    public void SetMusicArea(MusicArea area)
    {
        musicEventInstance.setParameterByName("area", (float) area);
    }

    public void PlayOneShot(EventReference sound, Vector3 worldPos)
    {
        RuntimeManager.PlayOneShot(sound, worldPos);
    }

    public EventInstance CreateInstance(EventReference eventReference)
    {
        EventInstance eventInstance = RuntimeManager.CreateInstance(eventReference);
        eventInstances.Add(eventInstance);
        return eventInstance;
    }

    private void CleanUp()
    {
        // Stop and release any created instances
        foreach (EventInstance eventInstance in eventInstances)
        {
            eventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
            eventInstance.release();
        }

        // Stop all of the event emitters, because if we don't they may hang around in other scenes
        foreach (StudioEventEmitter emitter in eventEmitters)
        {
            emitter.Stop();
        }
    }

    private void OnDestroy()
    {
        CleanUp();
        ambienceEventInstance.stop(FMOD.Studio.STOP_MODE.IMMEDIATE);
    }
}
