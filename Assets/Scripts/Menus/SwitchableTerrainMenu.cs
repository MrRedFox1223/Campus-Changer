using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SwitchableTerrainMenu : Menu
{
    [Header("References")]
    [SerializeField] private GameObject actionText;
    [SerializeField] private GameObject crosshair;
    [SerializeField] private TextMeshProUGUI firstTerrainText;
    [SerializeField] private TextMeshProUGUI secondTerrainText;
    [SerializeField] private TextMeshProUGUI thirdTerrainText;
    [SerializeField] private Button selectedButton;

    private GameObject switchableObject;

    public bool isActive { get; private set; }

    private void Awake()
    {
        actionText = GameObject.Find("ActionText");
        crosshair = GameObject.Find("Crosshair");
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
        Cursor.visible = true;
        isActive = true;
    }

    public void OnFirstOptionClicked()
    {
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(0);
        DeactivateMenu();
    }

    public void OnSecondOptionClicked()
    {
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(1);
        DeactivateMenu();
    }

    public void OnThirdOptionClicked()
    {
        switchableObject.GetComponent<SwitchableObject>().SwitchVariant(2);
        DeactivateMenu();
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
}
