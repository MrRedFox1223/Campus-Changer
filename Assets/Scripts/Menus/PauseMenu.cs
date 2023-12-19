using UnityEngine;
using UnityEngine.UI;

public class PauseMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private SettingsMenu settingsMenu;
    [SerializeField] private GameObject pauseScreen;

    [Header("References")]
    [SerializeField] private GameObject actionText;
    [SerializeField] private GameObject crosshair;
    [SerializeField] private Button firstButtonSelected;
    

    public bool isActive { get; private set; }
    
    private void Start()
    {
        isActive = false;

        actionText = GameObject.Find("ActionText");
        crosshair = GameObject.Find("Crosshair");

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
        crosshair.SetActive(false);
        Cursor.visible = true;
        isActive = true;
    }

    public void OnResumeClicked()
    {
        this.DeactivateMenu();
        Cursor.visible = false;
        Time.timeScale = 1f;
        isActive = false;
        actionText.SetActive(true);
        crosshair.SetActive(true);
    }

    public void OnSaveGameClicked()
    {
        Debug.Log("Game Saved");
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
