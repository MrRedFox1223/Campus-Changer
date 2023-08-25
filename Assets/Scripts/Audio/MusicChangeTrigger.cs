using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MusicChangeTrigger : MonoBehaviour
{
    [Header("Area")]
    [SerializeField] private MusicArea area;

    [Header("Parameters Change")]
    [SerializeField] private List<string> parametersNames;
    [SerializeField] private List<float> parametersValues;

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag.Equals("Player"))
            AudioManager.instance.SetMusicArea(area);
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.tag.Equals("Player"))
            AudioManager.instance.SetMusicArea(AudioManager.instance.defaultMusic);
    }
}
