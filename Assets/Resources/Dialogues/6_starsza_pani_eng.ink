INCLUDE Globals.ink

{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:StarszaPani
-> END

== BeginQuest
Good morning. I've heard you want to talk about this whole café issue. #portrait:StarszaPani

    + [That's true.]
    
I don't like the idea. But what I would like is for someone to finally clean up around here properly!
-> MainDiscussionNode

== MainDiscussionNode

    + [What's wrong with a café or a cafeteria?]
    -> Question_01
    + [What do you mean by cleaning up?]
    -> Question_02
    + [Isn't the current solution beneficial for the university?]
    -> Question_03
    + [I don't have any more questions.]
    -> END
    
== Question_01
The thing is, I live here. That building next to us is a residential building. I would like to have some peace and quiet in the afternoon, and places like that are always noisy.

->MainDiscussionNode

== Question_02
Please, just take a look at these waste containers. They are just lying out in the open, and it's always messy around them. A neat garbage enclosure that could accommodate all this mess would be useful.
 
->MainDiscussionNode

== Question_03
The university is just fine, and the Campus residents have their needs too. We need to find a compromise.

->MainDiscussionNode 
