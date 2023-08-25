using UnityEngine;
using UnityEngine.SceneManagement;
using FMOD.Studio;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour, IDataPersistance
{
    [Header("Physics values")]
    [SerializeField] private float playerSpeed = 2.0f;
    [SerializeField] private float gravityValue = -9.81f;

    private CharacterController controller;
    private Vector3 playerVelocity;
    private InputManager inputManager;
    private EventInstance playerFootsteps;

    public Transform cameraTransform;

    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;
        cameraTransform = GameObject.Find("Main camera").transform;
        Cursor.visible = false;
        playerFootsteps = AudioManager.instance.CreateInstance(FMODEvents.instance.playerFootsteps);
    }

    private void Update()
    {
        // Temporary return to Menu implementation
        // TODO: Change to show pause menu and add options to return to menu there
        if (inputManager.GetExitPressed())
        {
            // Save the game anytime before loading a new scene
            DataPersistanceManager.instance.SaveGame();
            // Load the main menu scene
            SceneManager.LoadScene("MainMenu");
        }

        Vector2 movement;

        if (DialogueManager.GetInstance().dialogueIsPlaying)
            movement = new Vector2(0, 0);
        else
            movement = inputManager.GetPlayerMovement();

        Vector3 move = new Vector3(movement.x, 0f, movement.y);
        move = cameraTransform.forward * move.z + cameraTransform.right * move.x;
        move.y = 0f;
        move = move.normalized;

        controller.Move(move * Time.deltaTime * playerSpeed);

        if (move != Vector3.zero)
        {
            gameObject.transform.forward = move;
            PlaySound();
        }
        else
            playerFootsteps.stop(STOP_MODE.ALLOWFADEOUT);

        playerVelocity.y += gravityValue * Time.deltaTime;
        controller.Move(playerVelocity * Time.deltaTime);
    }

    public void LoadData(GameData data)
    {
        this.transform.position = data.playerPos;
    }

    public void SaveData(GameData data)
    {
        data.playerPos = this.transform.position;
    }

    private void PlaySound()
    {
        // Get the playback state
        PLAYBACK_STATE playbackState;
        playerFootsteps.set3DAttributes(FMODUnity.RuntimeUtils.To3DAttributes(gameObject.transform));
        playerFootsteps.getPlaybackState(out playbackState);
        if (playbackState.Equals(PLAYBACK_STATE.STOPPED))
            playerFootsteps.start();
    }
}
