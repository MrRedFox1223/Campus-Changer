using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

public class DayCycleManager : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Light sun;
    [SerializeField] private Light moon;
    [SerializeField] private Volume skyVolume;

    [Header("How many min in game is one min in RL")]
    [SerializeField] private float timeScale;
    [Range(0, 24)]
    [SerializeField] private float timeOfDay = 9f;

    [Header("Night skybox options")]
    [SerializeField] AnimationCurve starsCurve;
    [SerializeField] private float starsValueMultiplayer;

    private bool isNight;
    private PhysicallyBasedSky sky;

    private void Awake()
    {
        sun = GameObject.Find("Sun").GetComponent<Light>();
        moon = GameObject.Find("Moon").GetComponent<Light>();
        skyVolume = GameObject.Find("SkyAndFogVolume").GetComponent<Volume>();

        skyVolume.profile.TryGet(out sky);
    }

    private void Update()
    {
        timeOfDay += Time.deltaTime * timeScale / 3600;
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

        sky.spaceEmissionMultiplier.value = starsCurve.Evaluate(alpha) * starsValueMultiplayer;

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
