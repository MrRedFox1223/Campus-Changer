INCLUDE Globals.ink

{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Strażnik
-> END

== BeginQuest

Ahem, ahem… How can I help? #portrait:Strażnik

    + [I'd like to ask about the food trucks.]
    
    - Ah, that idea. Nothing but trouble.
    -> MainDiscussionNode
    
== MainDiscussionNode

    + [Why is it a bad idea?]
    -> Question_01
    + [Shouldn't we revive this place?]
    -> Question_02
    + [What could be done instead?]
    -> Question_03
    + [Thank you, I have no more questions.]
    -> END

== Question_01
Please, take a look at the other proposals in this game. They want to build eateries everywhere. Is this still a university or is it a shopping center? 
Sometimes things are good just as they are.
-> MainDiscussionNode

== Question_02
This is a parking area and so it should remain. It serves an important function. We can breathe some life into the buildings, but not into their backyards. 
And this space is exactly just that: a backyard!
-> MainDiscussionNode

== Question_03
There's no need to do anything. Right now place is operating as it should.
-> MainDiscussionNode
