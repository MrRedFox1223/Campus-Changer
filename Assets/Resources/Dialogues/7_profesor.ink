INCLUDE Globals.ink

{07_bIsDecisionMade == true: -> DecisionRevisit}
{07_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Profesor
-> END

== BeginQuest

Dzień dobry. #portrait:Profesor

    + [Dzień dobry. Ja w sprawie kordegardy.]
    
    - Świetnie się składa, bo ja mam pierwszorzędny pomysł na to miejsce!. Zrobimy tu... living lab!.
    
    + [Co to jest living lab?]
    
    - To w uproszczeniu miejsce współpracy, w którym tworzy się innowacyjne rozwiązania. 
    Diagnozuje i analizuje się potrzeby po to, by dzięki badaniom stosowanym z udziałem użytkowników tworzyć rozwiązania technologiczne i społeczne dla lepszej przyszłości. 
    Dlatego ważne, by był dostępny dla ludzi, których dany problem dotyczy. 
    ->MainDiscussionNode
== MainDiscussionNode

    + [Jakie będą pożytki z takiego miejsca?]
    -> Question_01
    + [Czy nie lepiej byłoby znaleźć większy lokal?]
    -> Question_02
    + [A może po prostu miejsce spotkań, na przykład mała knajpka?]
    -> Question_03
    + [Jest też pomysł, żeby udostępnić to miejsce strażnikom.]
    -> Question_04
    + [Nie mam więcej pytań.]
    -> END

== Question_01
Pozwoli nam wykonywać nowe rodzaje badań. Będzie bardziej innowacyjnie!
-> MainDiscussionNode

== Question_02
Lepiej, żeby w małym lokalu ciągle coś się działo, niż żeby wydać dużo pieniędzy na duży lokal, który będzie stał pusty.
-> MainDiscussionNode

== Question_03
Nie jestem pewien, czy to zgodne z przepisami.
-> MainDiscussionNode

== Question_04
Myślę, że strażnicy czuliby się tutaj tak, jakby ktoś kazał im pilnować bramy.
-> MainDiscussionNode
