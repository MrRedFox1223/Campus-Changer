using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour, IDataPersistance
{
    [SerializeField] private float playerSpeed = 2.0f;
    [SerializeField] private float gravityValue = -9.81f;

    private CharacterController controller;
    private Vector3 playerVelocity;
    private InputManager inputManager;

    public Transform cameraTransform;

    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;
        cameraTransform = GameObject.Find("Main camera").transform;
        Cursor.visible = false;
    }

    private void Update()
    {
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
        }

        playerVelocity.y += gravityValue * Time.deltaTime;
        controller.Move(playerVelocity * Time.deltaTime);

        
    }

    public void LoadData(GameData data)
    {
        this.transform.position = data.playerPos;
    }

    public void SaveData(ref GameData data)
    {
        data.playerPos = this.transform.position;
    }
}
