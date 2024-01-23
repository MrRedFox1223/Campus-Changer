INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Strażnik
-> END

== BeginQuest

Good morning, how may I help you? #portrait:Strażnik
    * [Thank you, that's OK. Are you a guard here?]
    - Yes, I am.
    * [I've been told that you'd like a parking lot here.]
    - Yes, I would.
    -> MainArgumentNode
    
== MainArgumentNode
    + [Why should the parking lot be located here?]
        -> Question_01
    + [What will other people gain from it?]
        -> Question_02
    + [A lady living on campus suggests keeping the greenery here.]
        -> Question_03
    + [An exchange student who recently arrived here would like a small food corner here.]
        -> Question_04
    + [According to a young doctor there could be an open-air gallery here.]
        -> Question_05
    + [I have no more questions.]
        -> END
        
== Question_01
Nobody comes here anyway, so it can be here just as well.
    ->MainArgumentNode
    
== Question_02
We could get rid of other parking lots.    
    ->MainArgumentNode
    
== Question_03
Oh, the greenery. It requires so much maintenance, or everything ends up overgrown with weeds, and that would be a sad sight. It is a waste of this location. 
    ->MainArgumentNode
    
== Question_04
There are eateries everywhere around. Do we need more? Let them all explore the city!
    ->MainArgumentNode
    
== Question_05
Rain will fall and ruin everything. There is place for such things, and it is inside, not outdoors.
    ->MainArgumentNode
