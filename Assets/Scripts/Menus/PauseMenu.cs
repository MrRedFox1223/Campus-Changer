using UnityEngine;
using UnityEngine.SceneManagement;

public class PauseMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private SettingsMenu settingsMenu;
    [SerializeField] private GameObject pauseScreen;

    private void Update()
    {
        // Listening for activation input
        if (InputManager.instance.GetExitPressed())
            ActivateMenu();
    }

    public void ActivateMenu()
    {
        pauseScreen.SetActive(true);
        Time.timeScale = 0f;
        Cursor.visible = true;
    }

    public void OnResumeClicked()
    {
        this.DeactivateMenu();
        Time.timeScale = 1f;
        Cursor.visible = false;
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
