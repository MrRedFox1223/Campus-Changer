using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class PlayerController : MonoBehaviour
{
    [SerializeField] private float playerSpeed = 2.0f;
    [SerializeField] private float gravityValue = -9.81f;

    private CharacterController controller;
    private Vector3 playerVelocity;
    private InputManager inputManager;
    private bool prevInteractPressed = true;

    public Transform cameraTransform;
    public bool interactPressed { get; private set; }

    private void Start()
    {
        controller = GetComponent<CharacterController>();
        inputManager = InputManager.Instance;
        cameraTransform = GameObject.Find("Main camera").transform;
        Cursor.visible = false;
    }

    void Update()
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

        if (inputManager.Interact() && !prevInteractPressed)
        {
            interactPressed = true;
        }
        else
        {
            interactPressed = false;
        }

        prevInteractPressed = inputManager.Interact();
    }
}
