using System;
using Unity.Services.Core;
using Unity.Services.Authentication;
using UnityEngine;

public class CloudSaveManager : MonoBehaviour
{
    // Initialize Unity services
    async void Awake()
    {
        try
        {
            await UnityServices.InitializeAsync();
            await AuthenticationService.Instance.SignInAnonymouslyAsync();
            Debug.Log("Initialization done");
        }
        catch (Exception e)
        {
            Debug.Log(e);
        }
    }
}