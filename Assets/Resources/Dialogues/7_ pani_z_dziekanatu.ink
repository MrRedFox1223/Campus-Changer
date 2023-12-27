INCLUDE Globals.ink

{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:PaniZAdministracji
-> END

== BeginQuest

Dzień dobry! #portrait:PaniZAdministracji

    + [Dzień dobry. Ja w sprawie kordegardy.]
    
    - Stróżówki.
    
    + [Słucham?]
    
    - Kordegarda to rodzaj stróżówki. Powinna tu być siedziba Straży Akademickiej.
    
    ->MainDiscussionNode
    
    
== MainDiscussionNode

    + [W czym pomoże, że strażnicy będą tu mieć swoje miejsce?]
    -> Question_01
    + [Czy kordegarda pomieści tyle osób? ]
    -> Question_02
    + [A może zamiast tego zrobić dostępną dla wszystkich knajpkę?]
    -> Question_03
    + [Jest też pomysł, żeby zrobić tu living lab.]
    -> Question_04
    + [Nie mam więcej pytań.]
    -> END

== Question_01
Będą mogli szybciej reagować na zdarzenia i zwiększyć swoją obecność w Kampusie Centralnym.
-> MainDiscussionNode

== Question_02
Nie zmieszczą się, ale nie szkodzi, bo mają też inne miejsca dla siebie.
-> MainDiscussionNode

== Question_03
Alkohol na terenie Kampusu? Wykluczone! Poza tym – kto zapłaci strażnikom za nadgodziny? Takie miejsce to same kłopoty.
-> MainDiscussionNode

== Question_04
Wszyscy chcą zawsze jakieś living laby, a potem z nich nie korzystają.-> MainDiscussionNode
