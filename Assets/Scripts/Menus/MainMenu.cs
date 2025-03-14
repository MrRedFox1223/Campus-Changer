using UnityEngine;
using UnityEngine.UI;

public class MainMenu : Menu, IDataPersistance
{
    [Header("Menu Navigation")]
    [SerializeField] private SaveSlotsMenu saveSlotsMenu;
    [SerializeField] private SettingsMenu settingsMenu;
    [SerializeField] private CreditsMenu creditsMenu;

    [Header("Menu Buttons")]
    [SerializeField] private Button newGameButton;
    [SerializeField] private Button continueGameButton;
    [SerializeField] private Button loadGameButton;
    [SerializeField] private Button settingsButton;
    [SerializeField] private Button creditsButton;
    [SerializeField] private Button quitGameButton;

    private int continueSceneIndex = 0;

    public void Start()
    {
        Cursor.visible = false;
        DisableButtonsDependingOnData();
        newGameButton.GetComponent<ButtonTextColorExtension>().OnMenuChange();
    }

    private void DisableButtonsDependingOnData()
    {
        if (!DataPersistanceManager.instance.HasGameData())
        {
            continueGameButton.interactable = false;
            loadGameButton.interactable = false;
        } 
    }

    public void OnNewGameClicked()
    {
        saveSlotsMenu.ActivateMenu(false);
        this.DeactivateMenu();
    }

    public void OnLoadGameClicked()
    {
        saveSlotsMenu.ActivateMenu(true);
        this.DeactivateMenu();
    }

    public void OnContinueGameClicked()
    {
        DisableMenuButtons();
        // Save game before loading a new scene
        DataPersistanceManager.instance.SaveGame();
        // Load the next scene - load the game becouse of OnSceneLoaded() in the DataPersistanceManager
        GameObject.Find("LevelLoadingManager").GetComponent<LevelLoadingManager>().LoadScene(continueSceneIndex);

        Time.timeScale = 1f;

        this.DeactivateMenu();
    }

    public void OnSettingsClicked()
    {
        settingsMenu.ActivateMenu();
        this.DeactivateMenu();
    }

    public void OnCreditsClicked()
    {
        creditsMenu.ActivateMenu();
        this.DeactivateMenu();
    }

    public void OnQuitGameClicked()
    {
        Application.Quit();
    }

    private void DisableMenuButtons()
    {
        newGameButton.interactable = false;
        continueGameButton.interactable = false;
    }

    public void ActivateMenu()
    {
        this.gameObject.SetActive(true);
        DisableButtonsDependingOnData();
    }

    public void DeactivateMenu()
    {
        this.gameObject.SetActive(false);
    }

    public void LoadData(GameData data)
    {
        continueSceneIndex = data.currentSceneIndex;
    }

    // Nothing to save
    public void SaveData(GameData data)
    {

    }
}
