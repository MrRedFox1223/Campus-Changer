using UnityEngine;
using FMOD.Studio;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour, IDataPersistance
{
    [Header("Physics values")]
    [SerializeField] private float playerSpeed = 2.0f;
    [SerializeField] private float gravity = -9.81f;

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
    }

    private void OnEnable()
    {
        GameEventsManager.instance.inputEvents.onMovePressed += MovePressed;
        GameEventsManager.instance.playerEvents.onDisablePlayerMovement += DisablePlayerMovement;
        GameEventsManager.instance.playerEvents.onEnablePlayerMovement += EnablePlayerMovement;
    }

    private void OnDisable()
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

        if (controller.isGrounded)
            move.y = 0f;
        else
            move.y = gravity;

        move = move.normalized;

        float moveFactor = Time.deltaTime * playerSpeed;

        controller.Move(new Vector3(move.x * moveFactor, move.y * Time.deltaTime, move.z * moveFactor));

        if (move.x != 0 || move.z != 0)
        {
            gameObject.transform.forward = move;
            if (Time.timeScale != 0)
                PlaySound();
        }
        else
            playerFootsteps.stop(STOP_MODE.ALLOWFADEOUT);

        // Locks  players x axis rotation to prevent cameras shaking
        Vector3 eulerAngles = transform.eulerAngles;
        transform.eulerAngles = new Vector3(0, eulerAngles.y, eulerAngles.z);
    }

    private void MovePressed(Vector2 moveDir)
    {
        playerVelocity = moveDir;

        if (movementDisabled)
            playerVelocity = Vector2.zero;
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
