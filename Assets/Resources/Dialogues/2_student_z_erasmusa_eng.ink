INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
I'm afraid I've run out of dialogue. #portrait:StudentZErasmusa
-> END

== BeginQuest

Hello, what's up? #portrait:StudentZErasmusa

    * [Well, a lot! I've heard you want a food corner here.]
    
    - Exactly right. It would be great to grab something between lectures, and I still don't know the area too well. You know, some inexpensive, tasty, and attractively served food.
    -> MainArgumentNode
    
== MainArgumentNode

    + [Why do you want to eat exactly at this location?]
        -> Question_01
    + [What will other people using this space gain from it?]
        -> Question_02
    + [How about a parking lot?]
        -> Question_03
    + [Or maybe just leave the greenery as is?]
        -> Question_04
    + [There has been talk of creating an open-air gallery here.]
        -> Question_05
    + [I have no more questions.]
        -> END
    
    == Question_01
    Because it's so cozy here! And then it would be a quick hop back to my department.
    -> MainArgumentNode
    
    == Question_02
    It would be a quick hop back for them as well. There are a few other departments nearby. Maybe people would drop in more often.
    -> MainArgumentNode
    
    == Question_03
    It would accommodate only a few cars. And, also, it would be difficult to get in and out. I don't think it's worth it.
    -> MainArgumentNode
    
    == Question_04
I don't mind the greenery, but there should be more space to lay down on a blanket or set up some deckchairs. The trees can stay, we could plant more things or make flower beds.
    -> MainArgumentNode
    
    == Question_05
You know, a gallery like that would require maintenance and publicity. Otherwise, it would probably get covered in a thick layer of "dust". 
    -> MainArgumentNode
    
    
    -> END