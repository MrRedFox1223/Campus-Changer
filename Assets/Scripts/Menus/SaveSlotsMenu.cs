using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SaveSlotsMenu : Menu
{
    [Header("Menu Navigation")]
    [SerializeField] private MainMenu mainMenu;

    [Header("Menu Buttons")]
    [SerializeField] private Button backButton;

    [Header("Confirmation Popup Menu")]
    [SerializeField] private ConfirmationPopupMenu confirmationPopupMenu;

    private SaveSlot[] saveSlots;

    private bool isLoadingGame = false;

    private void Awake()
    {
        saveSlots = this.GetComponentsInChildren<SaveSlot>();
        backButton = transform.Find("BackButton").gameObject.GetComponent<Button>();
    }

    public void OnSaveSlotClicked(SaveSlot saveSlot)
    {
        // Disable all buttons
        DisableMenuButtons();

        // Case - loading game
        if (isLoadingGame)
        {
            DataPersistanceManager.instance.ChangeSelectedProfileId(saveSlot.GetProfileId());
            SaveGameAndLoadScene();
        }
        // Case - new game, but the save slot has data
        else if (saveSlot.hasData)
        {
            confirmationPopupMenu.ActivateMenu(
                "Starting a New Game with this slot will ovverride the currently saved data. Are you sure?",
                () =>
                {
                    DataPersistanceManager.instance.ChangeSelectedProfileId(saveSlot.GetProfileId());
                    DataPersistanceManager.instance.NewGame();
                    SaveGameAndLoadScene();
                },
                () =>
                {
                    this.ActivateMenu(isLoadingGame);
                });
        }
        // Case = new game and the save slot has no data
        else
        {
            DataPersistanceManager.instance.ChangeSelectedProfileId(saveSlot.GetProfileId());
            DataPersistanceManager.instance.NewGame();
            SaveGameAndLoadScene();
        }
    }

    private void SaveGameAndLoadScene()
    {
        // Save game before loading a new scene
        DataPersistanceManager.instance.SaveGame();

        // Load the scene - save the game becouse of onSceneUnloaded() in DataPersistanceManager
        SceneManager.LoadScene("Laboratory");

        Time.timeScale = 1f;
        Cursor.visible = false;
    }

    public void OnClearClicked(SaveSlot saveSlot)
    {
        DisableMenuButtons();

        confirmationPopupMenu.ActivateMenu(
                "Are you sure you want to delete this saved data?",
                () =>
                {
                    DataPersistanceManager.instance.DeleteProfileData(saveSlot.GetProfileId());
                    ActivateMenu(isLoadingGame);
                },
                () =>
                {
                    ActivateMenu(isLoadingGame);
                });
    }

    public void OnBackClicked()
    {
        mainMenu.ActivateMenu();
        this.DeactivateMenu();
    }

    public void ActivateMenu(bool isLoadingGame)
    {
        this.gameObject.SetActive(true);

        // Set mode
        this.isLoadingGame = isLoadingGame;

        // Load all profiles that exist
        Dictionary<string, GameData> profilesGameData = DataPersistanceManager.instance.GetAllProfilesGameData();

        // Ensure the back button is enabled when we activate the menu
        backButton.interactable = true;

        GameObject firstSelected = backButton.gameObject;
        foreach (SaveSlot saveSlot in saveSlots)
        {
            GameData profileData = null;
            profilesGameData.TryGetValue(saveSlot.GetProfileId(), out profileData);
            saveSlot.SetData(profileData);
            if (profileData == null && isLoadingGame)
                saveSlot.SetInteractable(false);
            else
            {
                saveSlot.SetInteractable(true);
                if (firstSelected.Equals(backButton.gameObject))
                    firstSelected = saveSlot.gameObject;
            }
        }

        // Set the first selected button
        Button firstSelectedButton = firstSelected.GetComponent<Button>();
        this.SetFirstSelected(firstSelectedButton);
    }

    public void DeactivateMenu()
    {
        this.gameObject.SetActive(false);
    }

    private void DisableMenuButtons()
    {
        foreach (SaveSlot saveSlot in saveSlots)
            saveSlot.SetInteractable(false);
        backButton.interactable = false;
    }
}
