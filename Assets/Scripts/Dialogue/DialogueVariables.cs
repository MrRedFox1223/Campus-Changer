using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class DialogueVariables
{
    public Story globalVariablesStoryToUpdate;
    private Story globalVariablesStory;

    public Dictionary<string, Ink.Runtime.Object> variables { get; private set; }

    public DialogueVariables(TextAsset loadGlobalsJSON)
    {
        // Create the story and story to load future data to updater
        globalVariablesStory = new Story(loadGlobalsJSON.text);
        globalVariablesStoryToUpdate = new Story(loadGlobalsJSON.text);

        InitializeDictionary();
    }

    public void Updater()
    {
        globalVariablesStory = globalVariablesStoryToUpdate;

        // Reinitialize the dictionary
        InitializeDictionary();
    }

    public string SaveVariables()
    {
        string globalVariablesStoryJSON = "";

        if (globalVariablesStory != null)
        {
            // Load the current state of all of our variables to the globals story
            VariablesToStory(globalVariablesStory);
            // Convert globalVariablesStory to JSON to be able to save it in GameData
            globalVariablesStoryJSON = globalVariablesStory.state.ToJson();
        }

        return globalVariablesStoryJSON;
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

    private void InitializeDictionary()
    {
        variables = new Dictionary<string, Ink.Runtime.Object>();
        foreach (string name in globalVariablesStory.variablesState)
        {
            Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
            variables.Add(name, value);
        }
    }
}
