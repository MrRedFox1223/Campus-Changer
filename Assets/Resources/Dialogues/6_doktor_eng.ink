INCLUDE Globals.ink

{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Doktor
-> END

== BeginQuest

Let's get down to business. I think there should be a café here. #portrait:Doktor
->MainDiscussionNode

== MainDiscussionNode

    + [Why a café specifically?]
    -> Question_01
    + [Why in this very location?]
    -> Question_04
    + [Would a café be useful to other Campus users?]
    -> Question_02
    + [Wouldn't a cafeteria be better?]
    -> Question_03
    + [I don't have any questions for now.]
    -> END
    
== Question_01

Because there hasn't been anything like that here. It could become a spot where people could meet and talk while enjoying the academic ambiance. 
Good coffee. Good pastries. And to top it off, wireless internet and some co-working space.

-> MainDiscussionNode

== Question_02

Of course it would! Thanks to its incredible location, such a place would surely see a high level of footfall all the time. Besides, a place like that doesn't have to be expensive.

-> MainDiscussionNode


== Question_03

There are already many places around here where you can eat. 
What's missing is a place where you can sit and talk over coffee or do some working, unless you like vending machine coffee and conversations in crowded corridors.

-> MainDiscussionNode


== Question_04

There is open space here and, at the same time, we are right in the center of the University's Campus. It would be close for everyone.
-> MainDiscussionNode
