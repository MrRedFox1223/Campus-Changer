using UnityEngine;
using System.Threading.Tasks;

public class SwitchTerrainPower : MonoBehaviour
{
    [Header("Fade options")]
    [Range(0, 0.1f)]
    [SerializeField] private float fadeFactor = 0.05f;
    [Range(0, 1)]
    [SerializeField] private float fadePauseTime = 0.5f;

    [Header("References")]
    [SerializeField] private CanvasGroup fadeCanvasGroup;
    [SerializeField] private GameObject switchableObject;
    [SerializeField] private DialogueManager dialogueManager;

    private void Awake()
    {
        fadeCanvasGroup = GameObject.Find("DialogueFade").GetComponent<CanvasGroup>();
        dialogueManager = GameObject.Find("DialogueManager").GetComponent<DialogueManager>();
    }

    public async void SwitchTerrain(int marker)
    {
        await FadeOut();
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(marker);
        await FadePause();
        await FadeIn();
    }

    private async Task FadeOut()
    {
        dialogueManager.pauseCalled = true;

        while (fadeCanvasGroup.alpha < 1)
        {
            fadeCanvasGroup.alpha += fadeFactor;
            await Task.Yield();
        }
    }

    private async Task FadePause()
    {
        float t = 0;
        while (t < fadePauseTime)
        {
            t += fadeFactor;
            await Task.Yield();
        }
    }

    private async Task FadeIn()
    {
        while (fadeCanvasGroup.alpha > 0)
        {
            fadeCanvasGroup.alpha -= fadeFactor;
            await Task.Yield();
        }

        dialogueManager.pauseCalled = false;
    }
}
