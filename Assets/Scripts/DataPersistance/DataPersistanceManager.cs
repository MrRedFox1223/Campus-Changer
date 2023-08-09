using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class DataPersistanceManager : MonoBehaviour
{
    [Header("File Storage Config")]
    [SerializeField] private string fileName;
    [SerializeField] private bool useEncryption;

    private GameData gameData;
    private List<IDataPersistance> dataPersistanceObjects;
    private FileDataHandler dataHandler;

    public static DataPersistanceManager instance { get; private set; }

    private void Awake()
    {
        if (instance != null)
            Debug.LogError("Found more the one Data Persistance Manager in the scene");

        instance = this;
    }


    // TODO: Wymieniæ na wczytywanie z poziomu menu

    private void Start()
    {
        this.dataHandler = new FileDataHandler(Application.persistentDataPath, fileName, useEncryption);
        this.dataPersistanceObjects = FindAllDataPersistanceObjects();
        LoadGame();
    }

    public void NewGame()
    {
        this.gameData = new GameData();
    }

    public void LoadGame()
    {
        // Load any saved data from a file using the data handler
        this.gameData = dataHandler.Load();

        // If no data can be loaded, initialize to a new game
        if (this.gameData == null)
        {
            Debug.Log("No data was found. Initializing data to defaults.");
            NewGame();
        }

        // Push the loaded data to all other sripts that need it
        foreach (IDataPersistance dataPersistanceObj in dataPersistanceObjects)
            dataPersistanceObj.LoadData(gameData);
    }

    public void SaveGame()
    {
        // Pass the data to other scripts so they can update itselfs
        foreach (IDataPersistance dataPersistanceObj in dataPersistanceObjects)
            dataPersistanceObj.SaveData(ref gameData);

        // Save data to a file using the data handler
        dataHandler.Save(gameData);

    }

    // TODO: Wymieniæ na zapisywanie z poziomu menu i przy autosave

    private void OnApplicationQuit()
    {
        SaveGame();
    }

    private List<IDataPersistance> FindAllDataPersistanceObjects()
    {
        IEnumerable<IDataPersistance> dataPersistanceObjects = FindObjectsOfType<MonoBehaviour>().OfType<IDataPersistance>();

        return new List<IDataPersistance>(dataPersistanceObjects);
    }
}
