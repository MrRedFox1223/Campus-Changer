INCLUDE Globals.ink

{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Strażnik
-> END

== BeginQuest

Ehem, Ehem… W czym mogę pomóc? #portrait:Strażnik

    + [Chcę zapytać o food trucki.]
    
    - Ach, ten pomysł. Same kłopoty.
    -> MainDiscussionNode
    
== MainDiscussionNode

    + [Czemu to jest zły pomysł?]
    -> Question_01
    + [Czy nie warto byłoby ożywić to miejsce?]
    -> Question_02
    + [Co można zrobić zamiast?]
    -> Question_03
    + [Dziękuję, nie mam więcej pytań.]
    -> END

== Question_01
Proszę spojrzeć na inne propozycje w tej grze. Wszędzie chcą budować gastronomię. Czy to jest uczelnia, czy centrum handlowe? Czasami rzeczy są dobrymi takimi, jakimi są.
-> MainDiscussionNode

== Question_02
Tutaj jest parking i powinien być parking. To ważna funkcja. Możemy ożywiać budynki, a nie ich zaplecza. A ta przestrzeń właśnie jest takim zapleczem! 
-> MainDiscussionNode

== Question_03
Nie trzeba nic robić. To miejsce teraz robi wszystko, co powinno.
-> MainDiscussionNode
