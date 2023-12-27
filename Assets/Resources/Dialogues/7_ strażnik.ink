INCLUDE Globals.ink

{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Strażnik
-> END

== BeginQuest

Dzień dobry. #portrait:Strażnik
    + [Dzień dobry. Ja w sprawie kordegardy.]

    - Jeśli chodzi o ten mały, zaniedbany budynek, to ja bym tu widział małą knajpkę.
    
    ->MainDiscussionNode
    
    
== MainDiscussionNode

    + [Jakie będą pożytki z takiego miejsca?]
    -> Question_01
    + [Czy to nie doda pracy strażnikom?]
    -> Question_02
    + [Jest też propozycja, żeby tu powstał living lab.]
    -> Question_03
    + [A może wolałby Pan tutaj miejsce dla Straży Akademickiej?]
    -> Question_04
    + [Nie mam więcej pytań.]
    -> END

== Question_01
Dużo ludzi chce, żeby powstało takie miejsce. Wolę, żeby powstało tutaj, gdzie łatwo nad nim zapanować, bo jest blisko bramy.
-> MainDiscussionNode

== Question_02
Przeciwnie, mamy tu łatwy dostęp.
-> MainDiscussionNode

== Question_03
Jestem wielkim zwolennikiem nauki, ale wydaje mi się, że laboratoria trzeba urządzać na terenie wydziałów, żeby naukowcom było bliżej.
-> MainDiscussionNode

== Question_04
Zawsze miło coś dostać, ale przecież wtedy moja praca byłaby wszędzie, tylko nie tutaj.
-> MainDiscussionNode
