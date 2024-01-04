using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LevelLoadingManager : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private GameObject loadingScreen;
    [SerializeField] private Image progressBar;

    public static LevelLoadingManager instance;
    private float target;

    private void Awake()
    {
        if (instance != null)
        {
            Debug.Log("Found more the one Level Loading Manager in the scene. Destroying the newest one");
            Destroy(this.gameObject);
            return;
        }

        instance = this;

        DontDestroyOnLoad(this.gameObject);
    }

    public async void LoadScene(int sceneIndex)
    {
        progressBar.fillAmount = 0;
        target = 0;

        var scene = SceneManager.LoadSceneAsync(sceneIndex);
        scene.allowSceneActivation = false;

        loadingScreen.SetActive(true);
        Debug.Log("Fire");

        do
            target = scene.progress;
        while (scene.progress < 0.9f);

        scene.allowSceneActivation = true;

        await Task.Delay(1000);

        loadingScreen.SetActive(false);
    }

    private void Update()
    {
        progressBar.fillAmount = Mathf.MoveTowards(progressBar.fillAmount, target, 3 * Time.deltaTime);
    }
}
