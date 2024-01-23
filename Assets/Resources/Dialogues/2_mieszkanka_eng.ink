INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Mieszkanka
-> END

== BeginQuest

Good morning, how may I help you? #portrait:Mieszkanka

    * [Is it true that you live here on Campus?]
    
    - Yes, and I work here too. Oh, in this building over here. My room's window overlooks this courtyard. That's why I care about having greenery here.

    
    -> MainArgumentNode
    
    
== MainArgumentNode
    
    + [Why would you prefer to keep the greenery?]
        -> Question_01
    + [What will other people using this space gain from it?]
        -> Question_02
    + [What do you think about creating a parking lot here?]
        -> Question_03
    + [What do you think about a food corner?]
        -> Question_04
    + [Do you like the idea of setting up a gallery here?]
        -> Question_05
    + [I have no more questions.]
        -> END
    
== Question_01

Please, just look at these buildings… They're gray, and the greenery makes it at least a bit cozier here. Additionally, in the summer, the greenery helps muffle the noise.

-> MainArgumentNode

== Question_02

I like that everyone can come here and sit in a secluded place. It could use more benches, more trees, and some shrubbery.

-> MainArgumentNode

== Question_03

Oh, please don't do that! It will be hot and noisy! And the exhaust fumes from the parked cars will come straight through the window into my room.
 
-> MainArgumentNode

== Question_04

I understand that everyone would like to grab a quick bite on their break. But, please, think about all the odours! I'll never be able to air out my room again.

-> MainArgumentNode

== Question_05

If we keep the greenery, we can set up an open-air gallery among the trees. However, for now I don't have an idea on how to make such a place more lively.

-> MainArgumentNode
