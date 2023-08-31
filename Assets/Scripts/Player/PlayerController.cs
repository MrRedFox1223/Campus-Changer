using UnityEngine;
using UnityEngine.SceneManagement;
using FMOD.Studio;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour, IDataPersistance
{
    [Header("Physics values")]
    [SerializeField] private float playerSpeed = 2.0f;

    public Transform cameraTransform;

    private CharacterController controller;
    private Vector3 playerVelocity;
    private EventInstance playerFootsteps;
    private bool movementDisabled = false;

    private void Start()
    {
        controller = GetComponent<CharacterController>();
        cameraTransform = GameObject.Find("MainCamera").transform;
        Cursor.visible = false;
        playerFootsteps = AudioManager.instance.CreateInstance(FMODEvents.instance.playerFootsteps);

        GameEventsManager.instance.inputEvents.onMovePressed += MovePressed;
        GameEventsManager.instance.playerEvents.onDisablePlayerMovement += DisablePlayerMovement;
        GameEventsManager.instance.playerEvents.onEnablePlayerMovement += EnablePlayerMovement;
    }

    private void OnDestroy()
    {
        GameEventsManager.instance.inputEvents.onMovePressed -= MovePressed;
        GameEventsManager.instance.playerEvents.onDisablePlayerMovement -= DisablePlayerMovement;
        GameEventsManager.instance.playerEvents.onEnablePlayerMovement -= EnablePlayerMovement;
    }

    private void Update()
    {
        if (DialogueManager.GetInstance().dialogueIsPlaying)
            DisablePlayerMovement();
        else
            EnablePlayerMovement();

        Vector3 move = new Vector3(playerVelocity.x, 0f, playerVelocity.y);
        move = cameraTransform.forward * move.z + cameraTransform.right * move.x;
        move.y = 0f;
        move = move.normalized;

        controller.Move(move * Time.deltaTime * playerSpeed);

        if (move != Vector3.zero)
        {
            gameObject.transform.forward = move;
            if (Time.timeScale != 0)
                PlaySound();
        }
        else
            playerFootsteps.stop(STOP_MODE.ALLOWFADEOUT);

        //TODO: Add gravity force
    }

    private void MovePressed(Vector2 moveDir)
    {
        playerVelocity = moveDir;

        if (movementDisabled)
        {
            playerVelocity = Vector2.zero;
        }
    }

    private void EnablePlayerMovement()
    {
        movementDisabled = false;
    }

    private void DisablePlayerMovement()
    {
        movementDisabled = true;
        playerVelocity = new Vector3(0f,0f,0f);
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
