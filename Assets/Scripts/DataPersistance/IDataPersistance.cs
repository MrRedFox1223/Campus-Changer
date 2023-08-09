using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IDataPersistance
{
    void LoadData(GameData data);

    // Using ref becouse saving only need to read data
    void SaveData(ref GameData data);

}
