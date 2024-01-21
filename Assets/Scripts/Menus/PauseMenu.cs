using UnityEngine;
using UnityEngine.UI;

public class PauseMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private SettingsMenu settingsMenu;
    [SerializeField] private GameObject pauseScreen;

    [Header("References")]
    [SerializeField] private GameObject actionText;
    [SerializeField] private GameObject actionFrame;
    [SerializeField] private GameObject crosshair;
    [SerializeField] private Button firstButtonSelected;

    private Color32 actionFrameColor;

    public bool isActive { get; private set; }
    
    private void Start()
    {
        Cursor.visible = false;
        isActive = false;

        actionText = GameObject.Find("ActionText");
        actionFrame = GameObject.Find("ActionFrame");
        crosshair = GameObject.Find("Crosshair");
        actionFrameColor = actionFrame.GetComponent<Image>().color;

        GameEventsManager.instance.inputEvents.onExitPressed += ExitPressed;
    }

    private void OnDestroy()
    {
        GameEventsManager.instance.inputEvents.onExitPressed -= ExitPressed;
    }
    
    private void ExitPressed()
    {
        GameObject switchableTerrain = GameObject.Find("SwitchableTerrainMenu");

        if (DialogueManager.GetInstance().dialogueIsPlaying)
            DialogueManager.GetInstance().ExitDialogueMode();
        else if (switchableTerrain != null && switchableTerrain.GetComponent<SwitchableTerrainMenu>().isActive == true)
            switchableTerrain.GetComponent<SwitchableTerrainMenu>().DeactivateMenu();
        else if (isActive)
        {
            settingsMenu.OnBackClicked();
            OnResumeClicked();
        }
        else
            ActivateMenu();
    }

    public void ActivateMenu()
    {
        pauseScreen.SetActive(true);
        firstButtonSelected.GetComponent<ButtonTextColorExtension>().OnMenuChange();
        Time.timeScale = 0f;
        actionText.SetActive(false);
        actionFrame.GetComponent<Image>().color = new Color32(0, 0, 0, 0);
        crosshair.SetActive(false);
        isActive = true;
    }

    public void OnResumeClicked()
    {
        this.DeactivateMenu();
        Time.timeScale = 1f;
        isActive = false;
        actionText.SetActive(true);
        actionFrame.GetComponent<Image>().color = actionFrameColor;
        crosshair.SetActive(true);
    }

    public void OnSaveGameClicked()
    {
        PopupManager.instance.ShowSaveNotification();   
        DataPersistanceManager.instance.SaveGame();
    }

    public void OnSettingsClicked()
    {
        settingsMenu.ActivateMenu();
        this.DeactivateMenu();
    }

    public void OnMainMenuClicked()
    {
        // Save the game anytime before loading a new scene
        DataPersistanceManager.instance.SaveGame();

        // Load the main menu scene
        GameObject.Find("LevelLoadingManager").GetComponent<LevelLoadingManager>().LoadScene((int)SceneIndexes.MAIN_MENU);

        this.DeactivateMenu();
    }

    public void OnQuitGameClicked()
    {
        Application.Quit();
    }

    public void DeactivateMenu()
    {
        pauseScreen.SetActive(false); 
    }
}
