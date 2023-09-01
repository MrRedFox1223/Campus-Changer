using UnityEngine;

public abstract class QuestStep : MonoBehaviour
{
    private bool isFinished = false;

    protected void FinishQuestStep()
    {
        if (!isFinished)
        {
            isFinished = true;
            Debug.Log("Finished");

            //TODO - Advence the quest forward when the step is finished

            Destroy(this.gameObject);
        }
    }
}
