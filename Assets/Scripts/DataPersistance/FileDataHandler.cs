using System.Collections.Generic;
using UnityEngine;
using System;
using System.IO;

public class FileDataHandler
{
    private string dataDirPath = "";
    private string dataFileName = "";
    private bool useEncryption = false;
    private readonly string encryptionCodeWord = "politechnika";
    private readonly string backupExtension = ".bak";

    public FileDataHandler(string dataDirPath, string dataFileName, bool useEncryption)
    {
        this.dataDirPath = dataDirPath;
        this.dataFileName = dataFileName;
        this.useEncryption = useEncryption;
    }

    public GameData Load(string profileId, bool allowRestoreFromBackup = true)
    {
        // Base case - if the profileId is null, return
        if (profileId == null)
            return null;

        // Use Path.Combine to account for different OS's having different path separators
        string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);

        GameData loadedData = null;

        if(File.Exists(fullPath))
        {
            try
            {
                // Load the serialized data from file
                string dataToLoad = "";
                using (FileStream stream = new FileStream(fullPath, FileMode.Open))
                {
                    using (StreamReader reader = new StreamReader(stream))
                        dataToLoad = reader.ReadToEnd();
                }

                // Optionally dencrypt the data
                if (useEncryption)
                    dataToLoad = EncryptDecrypt(dataToLoad);

                // Deserialize the data from JSON back into C# object
                loadedData = JsonUtility.FromJson<GameData>(dataToLoad);
            }
            catch (Exception e)
            {
                if (allowRestoreFromBackup)
                {
                    Debug.LogWarning("Failed to load data file. Attempting to load back up. \n" + e);
                    bool rollbackSuccess = AttemptRollback(fullPath);
                    if (rollbackSuccess)
                    {
                        // Try to load again recursively; false to not allow to get into infinite loop of errors if one occurs
                        loadedData = Load(profileId, false);
                    }
                }
                // If program gets here, there is posibility that backup file is also corrupted
                else
                    Debug.LogError("Error occured when trying to load file at path: " + fullPath + 
                        "and backup did not work\n" + e);
            }
        }

        return loadedData;
    }

    public void Save(GameData data, string profileId)
    {
        // Base case - if the profileId is null, return
        if (profileId == null)
            return;

        // Use Path.Combine to account for different OS's having different path separators
        string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);
        string backupFilePath = fullPath + backupExtension;

        try
        {
            // Create the directory the file will be written to if it doesm't already exist
            Directory.CreateDirectory(Path.GetDirectoryName(fullPath));

            // Serialize the C# game data object into JSON
            string dataToStore = JsonUtility.ToJson(data, true);

            // Optionally encrypt the data
            if (useEncryption)
                dataToStore = EncryptDecrypt(dataToStore);

            // Write the serialized data to the file
            using (FileStream stream = new FileStream(fullPath, FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(stream))
                    writer.Write(dataToStore);
            }

            // Verify the newly saved file 
            GameData verifiedGameData = Load(profileId);
            // If the data can be verified, create backup
            if (verifiedGameData != null)
                File.Copy(fullPath, backupFilePath, true);
            // Otherwise, something went wrong
            else
                throw new Exception("Save file could not be verified and backup could not be created");

        }
        catch (Exception e)
        {
            Debug.LogError("Error occured when trying to save data to file: " + fullPath + "\n" + e);
        }
    }

    public void Delete(string profileId)
    {
        // Base case - if the profileId is null, return
        if (profileId == null)
            return;

        string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);

        try
        {
            // Ensure the data file exists at this path
            if (File.Exists(fullPath))
            {
                // Delete the profile folder
                Directory.Delete(Path.GetDirectoryName(fullPath), true);
            }
            else
                Debug.LogWarning("Tried to delete profile data, but data was not found at path: " + fullPath);
        }
        catch (Exception e)
        {
            Debug.LogError("Failed to delete profile data for profileId: " + profileId + " at path: " + fullPath
                + "\n" + e);
        }
    }

    public Dictionary<string, GameData> LoadAllProfiles()
    {
         Dictionary<string, GameData > profileDictionary = new Dictionary<string, GameData>();

        IEnumerable<DirectoryInfo> dirInfos = new DirectoryInfo(dataDirPath).EnumerateDirectories();
        foreach (DirectoryInfo dirInfo in dirInfos)
        {
            string profileId = dirInfo.Name;

            // Check if the data file exist or skip whole folder
            string fullPath = Path.Combine(dataDirPath, profileId, dataFileName);
            if (!File.Exists(fullPath))
            {
                Debug.LogWarning("Skipping directory when loading all profiles, becouse it doesn't containt data: " + profileId);
                continue;
            }

            // Load the game data for this profile and put it in the dictionary
            GameData profileData = Load(profileId);
            // Ensure the profile data isn't null
            if (profileData != null)
                profileDictionary.Add(profileId, profileData);
            else
                Debug.LogError("Tried to load profile but it's null. ProfileId: " + profileId);
        }

        return profileDictionary;
    }

    public string GetMostRecentlyUpdatedProfileId()
    {
        string mostRecentProfileId = null;

        Dictionary<string, GameData> profilesGameData = LoadAllProfiles();
        foreach (KeyValuePair<string, GameData> pair in profilesGameData)
        {
            string profileId = pair.Key;
            GameData gameData = pair.Value;

            // Skip this entry if gamedata is null
            if (gameData == null)
                continue;

            // If this is the first data that came across, it's the most recent so far
            if (mostRecentProfileId == null)
                mostRecentProfileId = profileId;
            // Compare to see which date is most recent
            else
            {
                DateTime mostRecentDateTime = DateTime.FromBinary(profilesGameData[mostRecentProfileId].lastUpdated);
                DateTime newDateTime = DateTime.FromBinary(gameData.lastUpdated);

                if (newDateTime > mostRecentDateTime)
                    mostRecentProfileId = profileId;
            }
        }

        return mostRecentProfileId;
    }

    // XOR encryption implementation
    private string EncryptDecrypt(string data)
    {
        string modifiedData = "";

        for (int i = 0; i < data.Length; i++)
            modifiedData += (char)(data[i] ^ encryptionCodeWord[i % encryptionCodeWord.Length]);

        return modifiedData;
    }

    private bool AttemptRollback(string fullPath)
    {
        bool success = false;
        string backupFilePath = fullPath + backupExtension;

        try
        {
            // If the file exists, attempt to roll back to it by overwriting the original file
            if (File.Exists(backupFilePath))
            {
                File.Copy(backupFilePath, fullPath, true);
                success = true;
                Debug.LogWarning("Had to roll back to backup file at: " + backupFilePath);
            }
            // Backup file doesn't exist - nothing to roll back
            else
            {
                throw new Exception("Tried to roll back, but no backup file exists to roll back to");
            }
        }
        catch (Exception e)
        {
            Debug.LogError("Error occured when trying to roll back to backup file at: " + backupFilePath + "\n" + e);
        }

        return success;
    }
}
