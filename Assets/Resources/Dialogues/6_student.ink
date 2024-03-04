INCLUDE Globals.ink

{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Student
-> END

== BeginQuest

Proszę nie słuchać pana doktora, stołówka będzie zdecydowanie lepsza! #portrait:Student
->MainDiscussionNode

== MainDiscussionNode

    + [Czemu właśnie stołówka?]
    -> Question_01
    + [Co jest nie tak z kawiarnią?]
    -> Question_02
    + [Czy nie można zrobić stołówki w innym miejscu?]
    -> Question_03
    + [Są też pomysły na food trucki, ogródki i takie tam.]
    -> Question_04
    + [Na razie nie mam pytań.]
    -> END

== Question_01

Jedzenie w biegu szybko się nudzi. Chciałoby się tak po prostu usiąść i zjeść coś porządnego, a nie fast food.
->MainDiscussionNode

== Question_02

Jesteśmy w śródmieściu. Jest mnóstwo kawiarni. Jeśli będę chciał kogoś zaprosić na kawę, to przecież nie zaproszę go na uczelnię!
->MainDiscussionNode

== Question_03

Tak, po prostu idealna opcja! Zwłaszcza zimą.
->MainDiscussionNode


== Question_04

Ech! To są fanaberie! Ja bym chciał zjeść zdrowo, kulturalnie i w niskiej cenie.
->MainDiscussionNode


