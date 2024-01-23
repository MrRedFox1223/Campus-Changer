INCLUDE Globals.ink

{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest
Good morning. I must be upfront and say that I have made up my mind on this matter. #portrait:PaniZAdministracji

    * [Which matter?]
    On the matter of cars, obviously. I think they should be given priority.
    -> MainArgumentNode
    * [What perspective?]
    I believe the road should stay.
    -> MainArgumentNode
    
== MainArgumentNode

    + [Why do you need a road right here?]
        -> Question_01
    + [What will other campus users gain from that?]
        -> Question_02
    + [What about people who want to sit here?]
        -> Question_03
    + [Why don't you want a sidewalk here?]
        -> Question_04
    + [I have no more questions.]
        -> END
        
== Question_01

I get to work by car and I park nearby. This road provides me with convenient access to my parking spot. I don't have to zigzag unnecessarily and waste my time driving around.
-> MainArgumentNode

== Question_02

All drivers can use this road, not just me.
-> MainArgumentNode

== Question_03

There is a small park with a fountain next to the road. Someone can sit there too.
-> MainArgumentNode

== Question_04

There is already a sidewalk here. It is what it is, but it's possible to walk without getting run over by cars.
-> MainArgumentNode

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:PaniZAdministracji
-> END