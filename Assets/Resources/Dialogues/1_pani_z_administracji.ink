INCLUDE Globals.ink

{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== BeginQuest
Dzień dobry. Od razu uprzedzam, że mam w tej sprawie wyrobione zdanie. #portrait:PaniZAdministracji

    * [W jakiej sprawie?]
    W sprawie samochodów oczywiście. Uważam, że powinny mieć priorytet.
    -> MainArgumentNode
    * [Jakie zdanie?]
    Uważam, że powinna tu zostać jezdnia.
    -> MainArgumentNode
    
== MainArgumentNode

    + [Dlaczego potrzebujesz jezdni właśnie tutaj?]
        -> Question_01
    + [Co będą mieć z tego inni użytkownicy kampusu?]
        -> Question_02
    + [Co z ludźmi, którzy chcą tu posiedzieć?]
        -> Question_03
    + [Dlaczego nie chcesz, żeby tu był chodnik?]
        -> Question_04
    + [Nie mam więcej pytań.]
        -> END
        
== Question_01

Dojeżdżam do pracy autem i parkuję niedaleko. Ta jezdnia zapewnia mi wygodny dostęp do miejsca parkingowego. Nie muszę bez sensu kluczyć i tracić czasu na objeżdżanie.
-> MainArgumentNode

== Question_02

Wszyscy kierowcy mogą skorzystać z tej jezdni, nie tylko ja.
-> MainArgumentNode

== Question_03

Zaraz obok jest skwerek z fontanną. Tam też można posiedzieć.
-> MainArgumentNode

== Question_04

Tu już jest chodnik. Jest jaki jest, ale przejść można bez wchodzenia pod koła samochodów.
-> MainArgumentNode

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:PaniZAdministracji
-> END