using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class PauseMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private SettingsMenu settingsMenu;
    [SerializeField] private GameObject pauseScreen;

    [Header("References")]
    [SerializeField] private GameObject actionText;

    public bool isActive { get; private set; }
    
    private void Start()
    {
        isActive = false;

        actionText = GameObject.Find("ActionText");

        GameEventsManager.instance.inputEvents.onExitPressed += ExitPressed;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.inputEvents.onExitPressed -= ExitPressed;
    }

    private void ExitPressed()
    {
        if (DialogueManager.GetInstance().dialogueIsPlaying)
        {
            DialogueManager.GetInstance().ExitDialogueMode();
        }
            
        else
            ActivateMenu();
    }

    public void ActivateMenu()
    {
        pauseScreen.SetActive(true);
        Time.timeScale = 0f;
        actionText.SetActive(false);
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
        SceneManager.LoadScene("MainMenu");
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
