using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SettingsMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private MainMenu mainMenu;
    [SerializeField] private PauseMenu pauseMenu;

    public void OnBackClicked()
    {
        if (SceneManager.GetActiveScene().name == "MainMenu")
            mainMenu.ActivateMenu();
        else
        {
            pauseMenu.ActivateMenu();
        }

        this.DeactivateMenu();
    }

    public void ActivateMenu()
    {
        this.gameObject.SetActive(true);
    }

    public void DeactivateMenu()
    {
        this.gameObject.SetActive(false);
    }
}
