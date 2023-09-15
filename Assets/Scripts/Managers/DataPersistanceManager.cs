using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.SceneManagement;

public class DataPersistanceManager : MonoBehaviour
{
    [Header("Debugging")]
    [SerializeField] private bool disableDataPersistance = false;
    [SerializeField] private bool initializeDataIfNull = false;
    [SerializeField] private bool overrideSelectedProfileId = false;
    [SerializeField] private string testSelectedProfileId = "test";

    [Header("File Storage Config")]
    [SerializeField] private string fileName;
    [SerializeField] private bool useEncryption;

    [Header("Auto Saving Configuration")]
    [SerializeField] private float autoSaveTimeSeconds = 180f;

    public static DataPersistanceManager instance { get; private set; }

    private GameData gameData;
    private List<IDataPersistance> dataPersistanceObjects;
    private FileDataHandler dataHandler;
    private string selecterProfileId = "";
    private Coroutine autoSaveCoroutine;

    private void Awake()
    {
        if (instance != null)
        {
            Debug.Log("Found more the one Data Persistance Manager in the scene. Destroying the newest one");
            Destroy(this.gameObject);
            return;
        }
            
        instance = this;

        DontDestroyOnLoad(this.gameObject);

        if (disableDataPersistance)
            Debug.LogWarning("Data Persistance is currently disabled");

        this.dataHandler = new FileDataHandler(Application.persistentDataPath, fileName, useEncryption);

        InitializeSelectedProfileId();
    }

    private void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    public void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        dataPersistanceObjects = FindAllDataPersistanceObjects();
        LoadGame();

        if (autoSaveCoroutine != null)
            StopCoroutine(autoSaveCoroutine);
        autoSaveCoroutine = StartCoroutine(AutoSave());
    }

    public void ChangeSelectedProfileId(string newProfileId)
    {
        // Update the profile to use for saving and loading
        this.selecterProfileId = newProfileId;
        // Load the game, which will use that profile, updating our game data accordingly
        LoadGame();
    }

    public void DeleteProfileData(string profileId)
    {
        // Delete the data for this profile id
        dataHandler.Delete(profileId);
        // Initilaize the selected profile id
        InitializeSelectedProfileId();
        // Reload the game so data matches the newly selected profile id
        LoadGame();
    }

    private void InitializeSelectedProfileId()
    {
        this.selecterProfileId = dataHandler.GetMostRecentlyUpdatedProfileId();

        if (overrideSelectedProfileId)
        {
            this.selecterProfileId = testSelectedProfileId;
            Debug.LogWarning("Override selected profile id with test id: " + testSelectedProfileId);
        }
    }

    public void NewGame()
    {
        this.gameData = new GameData();
    }

    public void LoadGame()
    {
        // Return if data persistance is disabled
        if (disableDataPersistance)
            return;

        // Load any saved data from a file using the data handler
        this.gameData = dataHandler.Load(selecterProfileId);

        // Start a new game if the data is null and we're cibfigurated to initialize data for debugging
        if (this.gameData == null && initializeDataIfNull)
            NewGame();

        // If no data can be loaded, don't continue
        if (this.gameData == null)
        {
            Debug.Log("No data was found. A New Game needs to be started before data can be loaded.");
            return;
        }

        // Push the loaded data to all other sripts that need it
        foreach (IDataPersistance dataPersistanceObj in dataPersistanceObjects)
            dataPersistanceObj.LoadData(gameData);
    }

    public void SaveGame()
    {
        // Return if data persistance is disabled
        if (disableDataPersistance)
            return;

        // If no data can be saved, give a warning
        if (this.gameData == null)
        {
            Debug.LogWarning("No data was found. A New Game needs to be started before data can be saved.");
            return;
        }

        // Pass the data to other scripts so they can update itselfs
        foreach (IDataPersistance dataPersistanceObj in dataPersistanceObjects)
            dataPersistanceObj.SaveData(gameData);

        // Timestamp the data so it's known when it was saved
        gameData.lastUpdated = System.DateTime.Now.ToBinary();

        // Save data to a file using the data handler
        dataHandler.Save(gameData, selecterProfileId);

    }

    private List<IDataPersistance> FindAllDataPersistanceObjects()
    {
        IEnumerable<IDataPersistance> dataPersistanceObjects = FindObjectsOfType<MonoBehaviour>(true)
            .OfType<IDataPersistance>();

        return new List<IDataPersistance>(dataPersistanceObjects);
    }

    public bool HasGameData()
    {
        return gameData != null;
    }

    public Dictionary<string, GameData> GetAllProfilesGameData()
    {
        return dataHandler.LoadAllProfiles();
    }

    private IEnumerator AutoSave()
    {
        while(true)
        {
            yield return new WaitForSeconds(autoSaveTimeSeconds);
            SaveGame();
            Debug.Log("Performed Auto Save");
        }
    }
}
