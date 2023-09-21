using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FaceThePlayer : MonoBehaviour
{
    [SerializeField] private Transform playerTransform;

    private void Awake()
    {
        playerTransform = GameObject.Find("Player").GetComponent<Transform>();
    }

    private void Update()
    {
        transform.LookAt(new Vector3(playerTransform.position.x, transform.position.y, playerTransform.position.z));
    }
}
