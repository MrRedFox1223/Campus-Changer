INCLUDE Globals.ink

{08_bIsDecisionMade == true: -> DecisionRevisit}
{08_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Hulajnoga
-> END

== BeginQuest

W czym mogę pomóc? #portrait:Hulajnoga

    + [Podobno masz mocne zdanie w sprawie parkingu w tym miejscu.]
    
    - Tak! Musimy skończyć z tym szaleństwem! Parking trzeba usunąć! Zamiast samochodów – zieleń i chodniki! Miasto jest dla ludzi, a nie dla samochodów! 
    
    -> MainDiscussionNode
    
== MainDiscussionNode

    + [Czemu sądzisz, że bez parkingu Kampus PW będzie lepszy?]
    -> Question_01
    + [Co ma zrobić ktoś, kto dojeżdża samochodem do pracy?]
    -> Question_02
    + [Co z osobami niepełnosprawnymij?]
    -> Question_03
    + [Nie mam więcej pytań.]
    -> END
    
== Question_01

Mniejszy ruch samochodowy ma wiele zalet. Jest ciszej i bezpieczniej. W powietrzu jest mniej zanieczyszczeń. Ludzie chętniej przebywają na dworze. W miejscach, którymi przechodzą, rodzą się nowe aktywności.
-> MainDiscussionNode
    
== Question_02
Jesteśmy w centrum miasta! Mamy autobusy! Tramwaje! Metro! Można wsiąść na rower albo hulajnogę! 
A im więcej osób korzysta z komunikacji, tym łatwiej przekonać władze miasta, by wprowadziło nowe możliwości.
-> MainDiscussionNode
== Question_03
Nie mam złudzeń, że parkingi znikną z Kampusu całkowicie. Zawsze będą parkingi dla gości! Pod budynkami lub w wyznaczonych strefach można pozostawić miejsca postojowe dla osób niepełnosprawnych. 
-> MainDiscussionNode
