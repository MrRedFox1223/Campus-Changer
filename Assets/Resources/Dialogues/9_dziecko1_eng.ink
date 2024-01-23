INCLUDE Globals.ink

{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:DzieckoGirl
-> END

== BeginQuest

Good morning! #portrait:DzieckoGirl
    + [Good morning! May I ask you a few questions about the food trucks?]
    - Sure! Go ahead!
    ->MainDiscussionNode
    
== MainDiscussionNode

    + [Why do you like the idea so much?]
    -> Question_01
    + [sn't it a shame to lose parking spots?]
    -> Question_02
    + [Should we revive little corners like these?]
    -> Question_03
    + [No more questions.]
    -> END
    
== Question_01

Imagine this: every day, different food from a food truck. It would be like a mini-gathering. That's the advantage over a cafeteria or a cafe. One day it's burgers, another day ramen, ice cream, or pizza. Lots of people. It could also open up the campus to local residents.

->MainDiscussionNode

== Question_02

Jeez! A question you could ask almost anywhere on this campus. There are parking lots everywhere. Loads of cars. During the day, you have to be very careful. 
And here, to be honest, nothing really happens – it's just empty. So why can't we have this super food hub here?


->MainDiscussionNode

== Question_03
Of course! Yes, it's quiet here, but it's also gloomy. Just painfully boring! Everyone will benefit if something finally starts happening here.
->MainDiscussionNode
