INCLUDE Globals.ink

{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:PaniNaWózku
-> END

== BeginQuest

Good morning! #portrait:PaniNaWózku

    * [I'm here about the gate.]
    
    - That's great. It's important to me to have it opened. 

    * [Why?]
    
    - Because I'm using a wheelchair. Squeezing through the gate is very uncomfortable.
    ->MainArgumentNode
    
== MainArgumentNode

    + [Aren't you worried that opening the gate will sooner or later turn this courtyard into a parking lot?]
    -> Question_01
    + [Will this change be useful to others?]
    -> Question_02
    + [Don't doors and stairs in the building pose a similar problem?]
    -> Question_03
    + [I have no more questions.]
    -> END
    
== Question_01

This could be remedied by installing barriers or just hanging a "no parking" sign. You know, a barrier can be easily installed or placed, depending on the needs.
-> MainArgumentNode

== Question_02
I think so, yes. It's a very "deep" gate. With a grate inside it, it gets really unpleasant. 
If we remove the grate, the space would seem more friendly and inviting, so that passersby might want to come further inside. 
If the conservator-restorer would be so inclined, we could also paint a mural on the wall to make this place more charming and modern. What do you think?
-> MainArgumentNode

== Question_03

They very often do. However, I believe that accessibility should be improved wherever and whenever possible. We shouldn't wait until everything else is fixed, or, well, not fixed at all.  
-> MainArgumentNode
