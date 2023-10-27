using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DayCycleManager : MonoBehaviour
{
    [Range (0, 24)]
    [SerializeField] private float timeOfDay = 9f;
    [SerializeField] private float timeScale = 1.0f;
    [SerializeField] private Light sun;
    [SerializeField] private Light moon;
    [SerializeField] private bool isNight;

    private void Awake()
    {
        sun = GameObject.Find("Sun").GetComponent<Light>();
        moon = GameObject.Find("Moon").GetComponent<Light>();
    }

    private void Update()
    {
        timeOfDay += Time.deltaTime * timeScale;
        if (timeOfDay > 24)
            timeOfDay = 0;

        UpdateTime();
    }

    private void UpdateTime()
    {
        float alpha = timeOfDay / 24f;

        float sunRotation = Mathf.Lerp(-90, 270, alpha);
        float moonRotation = sunRotation - 180;

        sun.transform.rotation = Quaternion.Euler(sunRotation, -30f, 0);
        moon.transform.rotation = Quaternion.Euler(moonRotation, -30f, 0);

        CheckNightDayTransition();
    }

    private void CheckNightDayTransition()
    {
        if (isNight)
        {
            if (moon.transform.rotation.eulerAngles.x > 180)
                StartDay();
        }
        else
            if (sun.transform.rotation.eulerAngles.x > 180)
                StartNight();
    }

    private void StartDay()
    {
        isNight = false;
        sun.shadows = LightShadows.Soft;
        moon.shadows = LightShadows.None;
    }

    private void StartNight()
    {
        isNight = true;
        sun.shadows = LightShadows.None;
        moon.shadows = LightShadows.Soft;
    }
}
