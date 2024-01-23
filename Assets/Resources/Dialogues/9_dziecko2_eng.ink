INCLUDE Globals.ink

{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:DzieckoBoy
-> END

== BeginQuest

Good morning! I, too, have something to say! #portrait:DzieckoBoy
    + [Good morning! I'm listening… ]
    - I think food trucks are an awesome idea! Finally, a bit of excitement! I live right in the middle of the city, but there are no breakfast spots around, and here we'd have plenty to choose from, especially if the food was affordable.

    ->END
 
