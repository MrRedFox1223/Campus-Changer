using UnityEngine;

public class ActivateGeniusLoci : MonoBehaviour, IDataPersistance
{
    [SerializeField] GameObject geniusLoci;
    private bool activated = false;

    public void Activate()
    {
        geniusLoci.SetActive(true);
        activated = true;
    }

    public void LoadData(GameData data)
    {
        activated = data.tutorialGeniusLoci;
        if (activated)
            Activate();
    }

    public void SaveData(GameData data)
    {
        data.tutorialGeniusLoci = activated;
    }
}
