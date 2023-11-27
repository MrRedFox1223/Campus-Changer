using UnityEngine;
using System.Collections;

public class CarColor : MonoBehaviour {
//----------------------------------------------------------------
//
//  This script allows the user to change the main color of each 
//  instance of all cars without adding new materials.
//
//----------------------------------------------------------------
    public Color car_color;
    public int matIndex = 0;
    //----------------------------

//----------------------------------------------------------------
void Start () 
{
    Renderer carRenderer = gameObject.GetComponent<Renderer>();           
    carRenderer.transform.GetComponent<Renderer>().materials[matIndex].color = car_color;
}
//----------------------------------------------------------------
}
