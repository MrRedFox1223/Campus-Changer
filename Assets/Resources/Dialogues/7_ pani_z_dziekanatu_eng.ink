INCLUDE Globals.ink

{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:PaniZAdministracji
-> END

== BeginQuest

Good morning! #portrait:PaniZAdministracji

    + [Good morning. I'm here about the sentry building.]
    
    - The guardhouse.
    
    + [Excuse me?]
    
    - A sentry building is a type of guardhouse. It should serve as the campus security's headquarters.
    
    ->MainDiscussionNode
    
    
== MainDiscussionNode

    + [How will it help to have a place for the guards here?]
    -> Question_01
    + [Will the sentry building accommodate that many people? ]
    -> Question_02
    + [Or maybe instead create a pub that's accessible to everyone?]
    -> Question_03
    + [There's also an idea to have a living lab here.]
    -> Question_04
    + [I have no more questions.]
    -> END

== Question_01
They will be able to increase their presence in the Central Campus and to respond to incidents more quickly.
-> MainDiscussionNode

== Question_02
It will not accomodate all of them, but it's not a problem, as they have other places for themselves.
-> MainDiscussionNode

== Question_03
Alcohol on Campus? Out of the question! Besides, who will pay the guards for overtime? Such a place would only bring them trouble.
-> MainDiscussionNode

== Question_04
Everyone always wants these living labs, and then they never use them.-> MainDiscussionNode
