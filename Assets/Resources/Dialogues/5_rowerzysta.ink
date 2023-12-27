INCLUDE Globals.ink

{05_bIsDecisionMade == true: -> DecisionRevisit}
{05_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Rowerzysta
-> END

== BeginQuest

Dzień dobry. Jestem pomocnikiem Ducha i planuję wybudowanie tutaj sceny. Sceny plenerowej naturalnie! #portrait:Rowerzysta
-> MainDiscussionNode

== MainDiscussionNode

    + [Do czego miałaby posłużyć ta scena?]
    -> Question_01
    + [Czy to nie będzie powodowało zbyt dużego hałasu?]
    -> Question_02
    + [Dlaczego akurat tutaj?]
    -> Question_03
    + [Na razie nie mam więcej pytań.]
    -> END
    
== Question_01

Do najróżniejszych wystąpień. Można urządzić tu na przykład mały koncert, wystąpienie publiczne, stand’up albo hmm… konkurs. Tak na prawdę jest mnóstwo sposobności do wykorzystania sceny, która aż się prosi, aby tu powstała. 
->MainDiscussionNode

== Question_02

To prawda, że takie wydarzenia bywają głośne, ale otaczają nas budynki użytkowe. Wiadomo, że i tak wszystko będzie się działo poza godzinami pracy, bo inaczej studenci i pracownicy nie będą mogliby tu przyjść.
->MainDiscussionNode

== Question_03

To miejsce ma idealne wymiary, w sam raz na wydarzenie z udziałem kilkudziesięciu lub kilkuset osób. Nie chcemy robić konkurencji dla Stadionu Narodowego. Nie chcemy też wycinać drzew. 
->MainDiscussionNode

    -> END
