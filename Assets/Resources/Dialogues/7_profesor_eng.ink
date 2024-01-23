INCLUDE Globals.ink

{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Profesor
-> END

== BeginQuest

Good morning. #portrait:Profesor

    + [Good morning. I'm here about the sentry building.]
    
    - Great timing! It just so happens that I have a top-notch idea for that place! Let's make it... a living lab!

    + [What's a living lab?]
    
    - In short, it's a collaborative space where innovative solutions are created! 
    It diagnoses and analyzes needs to improve the well-being of the community by implementing the applied research with user participation and co-creation of solutions for a better future. 
    That's why it's important to enjoy the easy access from the street.

    ->MainDiscussionNode
== MainDiscussionNode

    + [What benefits will such a place bring?]
    -> Question_01
    + [Wouldn't it be better to find a larger location?]
    -> Question_02
    + [Or maybe just a meeting place, like a small pub?]
    -> Question_03
    + [There's also an idea to make this place available for the guards.]
    -> Question_04
    + [I have no more questions.]
    -> END

== Question_01
It will enable us to perform new types of research. It will be more innovative!
-> MainDiscussionNode

== Question_02
It's better to have a small place bustling with life than to spend a lot of money on a large space that will remain empty.
-> MainDiscussionNode

== Question_03
I'm not sure if that complies with the regulations.
-> MainDiscussionNode

== Question_04
I think the guards would feel as if they were here to guard the gate.
-> MainDiscussionNode
