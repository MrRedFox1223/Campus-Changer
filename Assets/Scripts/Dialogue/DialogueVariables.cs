using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class DialogueVariables: IDataPersistance
{
    private Story globalVariablesStory;
    private const string saveVariablesKey = "INK_VARIABLES";

    

    public Dictionary<string, Ink.Runtime.Object> variables { get; private set; }

    public DialogueVariables(TextAsset loadGlobalsJSON)
    {
        // create the story
        globalVariablesStory = new Story(loadGlobalsJSON.text);

        // if we have saved data, load it
        if(PlayerPrefs.HasKey(saveVariablesKey))
        {
            string jsonState = PlayerPrefs.GetString(saveVariablesKey);
            globalVariablesStory.state.LoadJson(jsonState);
        }

        // initialize the dictionary
        variables = new Dictionary<string, Ink.Runtime.Object>();
        
        foreach (string name in globalVariablesStory.variablesState)
        {
            Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
            variables.Add(name, value);
        }
    }

    public void SaveVariables()
    {
        if (globalVariablesStory != null)
        {
            // LOADING HERE
            //Load the current state of all of our variables to the globals story
            VariablesToStory(globalVariablesStory);
            //TODO: Replace it with proper save system
            PlayerPrefs.SetString(saveVariablesKey, globalVariablesStory.state.ToJson());
        }
    }

    public void StartListening(Story story)
    {
        VariablesToStory(story);
        story.variablesState.variableChangedEvent += VariableChanged;
    }

    public void StopListening(Story story)
    {
        story.variablesState.variableChangedEvent -= VariableChanged;
    }

   private void VariableChanged(string name, Ink.Runtime.Object value)
    {
        // only maintain variables that were initialized from the global ink file
        if (variables.ContainsKey(name))
        {
            variables.Remove(name);
            variables.Add(name, value);
        }
    }

    private void VariablesToStory(Story story)
    {
        foreach(KeyValuePair<string, Ink.Runtime.Object> variable in variables)
        {
            story.variablesState.SetGlobal(variable.Key, variable.Value);
        }
    }

    public void LoadData(GameData data)
    {

    }

    public void SaveData(ref GameData data)
    {

    }
}
