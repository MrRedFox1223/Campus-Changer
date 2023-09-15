using UnityEngine;
using UnityEngine.UI;

public class VolumeSlider : MonoBehaviour
{
    [Header("Type")]
    [SerializeField] private VolumeType volumeType;

    private enum VolumeType
    {
        MASTER,
        MUSIC,
        AMBIENCE,
        SFX
    }

    private Slider volumeSlider;

    private void Awake()
    {
        volumeSlider = this.GetComponent<Slider>();
    }

    private void Update()
    {
        switch (volumeType)
        {
            case VolumeType.MASTER:
                volumeSlider.value = AudioManager.instance.masterVolume;
                break;
            case VolumeType.MUSIC:
                volumeSlider.value = AudioManager.instance.musicVolume;
                break;
            case VolumeType.AMBIENCE:
                volumeSlider.value = AudioManager.instance.ambienceVolume;
                break;
            case VolumeType.SFX:
                volumeSlider.value = AudioManager.instance.sfxVolume;
                break;
            default:
                Debug.LogWarning("Volume type not supporeted: " + volumeType);
                break;
        }
    }

    public void OnSliderValueChanged()
    {
        switch (volumeType)
        {
            case VolumeType.MASTER:
                AudioManager.instance.masterVolume = volumeSlider.value;
                SaveVolumeSettings();
                break;
            case VolumeType.MUSIC:
                AudioManager.instance.musicVolume = volumeSlider.value;
                SaveVolumeSettings();
                break;
            case VolumeType.AMBIENCE:
                AudioManager.instance.ambienceVolume = volumeSlider.value;
                SaveVolumeSettings();
                break;
            case VolumeType.SFX:
                AudioManager.instance.sfxVolume = volumeSlider.value;
                SaveVolumeSettings();
                break;
            default:
                Debug.LogWarning("Volume type not supporeted: " + volumeType);
                break;
        }
    }

    private void SaveVolumeSettings()
    {
        PlayerPrefs.SetFloat("masterVolume", AudioManager.instance.masterVolume);
        PlayerPrefs.SetFloat("musicVolume", AudioManager.instance.musicVolume);
        PlayerPrefs.SetFloat("ambienceVolume", AudioManager.instance.ambienceVolume);
        PlayerPrefs.SetFloat("sfxVolume", AudioManager.instance.sfxVolume);
    }
}
