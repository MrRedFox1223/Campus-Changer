using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SaveSlot : MonoBehaviour
{
    [Header("Profile")]
    [SerializeField] private string profileId = "";

    [Header("Content")]
    [SerializeField] private GameObject noDataContent;
    [SerializeField] private GameObject hasDataContent;
    [SerializeField] private TextMeshProUGUI currentLocationText;

    [Header("Clear Data Button")]
    [SerializeField] private Button clearButton;

    private Button saveSlotButton;

    public bool hasData { get; private set; } = false;

    public void Awake()
    {
        noDataContent = transform.Find("NoDataContent").gameObject;
        hasDataContent = transform.Find("HasDataContent").gameObject;
        saveSlotButton = this.GetComponent<Button>();
    }

    public void SetData(GameData data)
    {
        // There's no data for this profileID
        if (data == null)
        {
            hasData = false;
            noDataContent.SetActive(true);
            hasDataContent.SetActive(false);
            clearButton.gameObject.SetActive(false);
        }
        // There is data for this profileID
        else
        {
            hasData = true;
            noDataContent.SetActive(false);
            hasDataContent.SetActive(true);
            clearButton.gameObject.SetActive(true);
            // TODO: Set current location names when they will be ready to test
            currentLocationText.text = "LABORATORY";
        }
    }

    public string GetProfileId()
    {
        return this.profileId;
    }

    public void SetInteractable(bool interactable)
    {
        saveSlotButton.interactable = interactable;
        clearButton.interactable = interactable;
    }
}
