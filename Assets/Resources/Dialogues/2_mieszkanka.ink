INCLUDE Globals.ink

Dzień dobry, w czym mogę pomóc?

    * Czy to prawda, że mieszka pani tutaj na terenie kampusu?
    
    - Tak, i do tego pracuję tutaj. O..! W tym budynku. Okno mojego pokoju wychodzi na ten dziedziniec. Dlatego zależy mi na tym, żeby była tu zieleń.
    
    -> MainArgumentNode
    
    
== MainArgumentNode
    
    + Dlaczego wolałaby pani zachować zieleń?
        -> Question_01
    + Co będą z tego mieć inni użytkownicy tej przestrzeni?
        -> Question_02
    + Jakie jest pani zdanie o urządzeniu tu parkingu?
        -> Question_03
    + Co sądzi pani o pomyśle kącika gastronomicznego?
        -> Question_04
    + Czy podoba się pani pomysł urządzenia tu galerii prac?
        -> Question_05
    + Nie mam więcej pytań.
        -> END
    
== Question_01

Proszę spojrzeć na te budynki… Są szare. Zieleń sprawia, że jest tu chociaż trochę przytulniej. W dodatku latem zieleń tłumi hałas.
-> MainArgumentNode

== Question_02

Podoba mi się, że każdy może tu przyjść i usiąść w zacisznym miejscu. Przydałoby się może więcej ławek, więcej drzew i krzewów.
-> MainArgumentNode

== Question_03

Ojej, proszę tego nie robić! Będzie gorąco i głośno! A do tego spaliny parkowanych samochodów wpadać będą przez okno wprost do mojego pokoju. 
-> MainArgumentNode

== Question_04

Rozumiem, że każdy chciałby coś zjeść na szybko w trakcie przerwy. Proszę jednak pomyśleć o zapachach! Już nigdy nie wywietrzę swojego pokoju.
-> MainArgumentNode

== Question_05

Jeżeli zachowamy zieleń, to można pomiędzy drzewami ustawić galerię plenerową. Nie mam jednak na razie pomysłu, jak sprawić, żeby takie miejsce żyło.
-> MainArgumentNode
