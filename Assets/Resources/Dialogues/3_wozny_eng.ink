INCLUDE Globals.ink

{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:Kierowca
-> END

== BeginQuest

Good morning. No littering, please! #portrait:Kierowca

    + [Didn't even cross my mind. May I ask a few questions about the gate?]
    
    - Sure, go ahead. It's best to close it, though. 
    
    + [It looks like it's already closed.]
    
    - Wrong! The gate is open. People keep on coming in and going out, coming in and going out.
    ->MainArgumentNode
    
== MainArgumentNode

    + [Why is it important to have everything closed?]
    -> Question_01
    + [What will people who want to have access to the courtyard say about that?]
    -> Question_02
    + [What if everything was just left open?]
    -> Question_03
    + [I have no more questions.]
    -> END
    
== Question_01
To reduce the amount of cleaning, of course!
->MainArgumentNode

== Question_02
They could enter the courtyard through the building. People from outside the department shouldn't be loitering about here anyway. 
->MainArgumentNode

== Question_03
I won't be cleaning that up. If some car's exhaust fumes stink up right into somebody's window, don't come around here blaming me. 
->MainArgumentNode
