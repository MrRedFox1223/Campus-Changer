using UnityEngine;
using TMPro;
using UnityEngine.UI;
using System.Threading.Tasks;

public class SwitchableTerrainMenu : Menu
{
    [Header("Fade options")]
    [Range(0, 0.1f)]
    [SerializeField] private float fadeFactor = 0.05f;
    [Range(0, 1)]
    [SerializeField] private float fadePauseTime = 0.5f;

    [Header("References")]
    [SerializeField] private GameObject actionText;
    [SerializeField] private GameObject crosshair;
    [SerializeField] private GameObject background;
    [SerializeField] private GameObject buttons;
    [SerializeField] private TextMeshProUGUI firstTerrainText;
    [SerializeField] private TextMeshProUGUI secondTerrainText;
    [SerializeField] private TextMeshProUGUI thirdTerrainText;
    [SerializeField] private Button selectedButton;
    [SerializeField] private CanvasGroup fadeCanvasGroup;

    private GameObject switchableObject;

    public bool isActive { get; private set; }

    private void Awake()
    {
        actionText = GameObject.Find("ActionText");
        crosshair = GameObject.Find("Crosshair");
        background = GameObject.Find("Background");
        buttons = GameObject.Find("Buttons");
        fadeCanvasGroup = GameObject.Find("Fade").GetComponent<CanvasGroup>();
    }

    public void Initialize(GameObject parent)
    {
        switchableObject = parent;

        firstTerrainText.text = switchableObject.transform.GetChild(0).gameObject.name;
        secondTerrainText.text = switchableObject.transform.GetChild(1).gameObject.name;
        thirdTerrainText.text = switchableObject.transform.GetChild(2).gameObject.name;

        ActivateMenu();
    }

    public void ActivateMenu()
    {
        Time.timeScale = 0f;
        actionText.SetActive(false);
        crosshair.SetActive(false);
        background.SetActive(true);
        buttons.SetActive(true);
        Cursor.visible = true;
        isActive = true;
    }

    public async void OnFirstOptionClicked()
    {
        await FadeOut();
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(0);
        await FadePause();
        await FadeIn();
    }

    public async void OnSecondOptionClicked()
    {
        await FadeOut();
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(1);
        await FadePause();
        await FadeIn();
    }

    public async void OnThirdOptionClicked()
    {
        await FadeOut();
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(2);
        await FadePause();
        await FadeIn();
    }

    public void OnCancelClicked()
    {
        DeactivateMenu();
    }

    public void OnFakeClicked()
    {
        selectedButton.Select();
    }

    public void DeactivateMenu()
    {
        Cursor.visible = false;
        Time.timeScale = 1f;
        isActive = false;
        actionText.SetActive(true);
        crosshair.SetActive(true);
        selectedButton.Select();
        this.gameObject.SetActive(false);
    }

    private async Task FadeOut()
    {
        buttons.SetActive(false);
        while (fadeCanvasGroup.alpha < 1)
        {
            fadeCanvasGroup.alpha += fadeFactor;
            await Task.Yield();
        }
    }

    private async Task FadePause()
    {
        background.SetActive(false);

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

        DeactivateMenu();
    }
}
