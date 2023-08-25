using System.Collections.Generic;
using UnityEngine;

public class AmbienceChangeTrigger : MonoBehaviour
{
    [Header("Parameters Change")]
    [SerializeField] private List<string> parametersNames;
    [SerializeField] private List<float> parametersValues;

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag.Equals("Player"))
            AudioManager.instance.SetEventInstanceParameters(AudioManager.instance.ambienceEventInstance,
                parametersNames, parametersValues);
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.tag.Equals("Player"))
            AudioManager.instance.SetEventInstanceParameters(AudioManager.instance.ambienceEventInstance,
                AudioManager.instance.defaultAmbienceParametersNames, 
                AudioManager.instance.defaultAmbienceParametersValues);
    }
}
