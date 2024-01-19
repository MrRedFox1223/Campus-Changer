using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using TMPro;

public class ButtonTextColorExtension : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    [SerializeField] private TextMeshProUGUI text;
    [SerializeField] private TextMeshProUGUI optionalText;
    [SerializeField] private Image image;
    [SerializeField] private ColorBlock newColor;

    private void Awake()
    {
        GameEventsManager.instance.inputEvents.onExitPressed += ExitPressed;
    }

    private void OnDestroy()
    {
        GameEventsManager.instance.inputEvents.onExitPressed -= ExitPressed;
    }

    private void ExitPressed()
    {
        if (GameObject.Find("PauseMenu") != null && !GameObject.Find("PauseMenu").GetComponent<PauseMenu>().isActive)
            ChangeColor(newColor.normalColor);
    }

    void ISelectHandler.OnSelect(BaseEventData eventData)
    {
        ChangeColor(newColor.selectedColor);
    }

    public void OnDeselect(BaseEventData eventData)
    {
        ChangeColor(newColor.normalColor);
    }

    public void OnMenuChange()
    {
        ChangeColor(newColor.selectedColor);
    }

    private void ChangeColor(Color color)
    {
        text.color = color;

        if (optionalText != null)
            optionalText.color = color;

        if (image != null)
            image.color = color;
    }
}
