INCLUDE Globals.ink

{02_bIsDecisionMade == true: -> DecisionRevisit}
{02_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Doktor
-> END

== BeginQuest

Czy możemy porozmawiać chwilę o przyszłości tego dziedzińca? #portrait:Doktor

    + [Ja właśnie w tej sprawie.]
    
    - Proszę sobie wyobrazić! Interaktywna ekspozycja na świeżym powietrzu. Każdy może podejść i zobaczyć na własne oczy czym się tu zajmujemy! Wszystko podane w przystępnej formie, bez żargonu.
    
    -> MainArgumentNode
    
== MainArgumentNode

    + [Dlaczego galeria powinna być właśnie tutaj?]
        -> Question_01
    + [Co będą z tego mieć inni użytkownicy kampusu?]
        -> Question_02
    + [Jest pomysł, żeby zamiast galerii zrobić tu parking.]
        -> Question_03
    + [Powstała propozycja, żeby urządzić tu kącik gastronomiczny.]
        -> Question_04
    + [Można też zostawić zieleń.]
        -> Question_05
    + [Nie mam więcej pytań.]
        -> END
    
== Question_01
To miejsce jest doskonale położone! Z jednej strony zaciszne, a z drugiej prawie w samym środku intensywnie wykorzystywanej przestrzeni kampusu, która na co dzień tętni życiem.
    ->MainArgumentNode

    
== Question_02
W galerii mogłyby się znaleźć prace ludzi z różnych wydziałów popularyzujące ich badania i udział w projektach. 
Galeria plenerowa byłaby stałym elementem przestrzeni kampusu PW i może z czasem stałaby się popularnym miejscem. Każdy przechodząc tędy mógłby na nie rzucić okiem.
    ->MainArgumentNode

== Question_03
Powinniśmy odejść od ruchu samochodowego na terenie kampusu. Jeśli parkingi, to na jego obrzeżach.
    ->MainArgumentNode

== Question_04
Takie miejsce powinno znajdować się bliżej centrum kampusu, w bezpośrednim sąsiedztwie ciągów pieszych. Tu jesteśmy na uboczu.
    ->MainArgumentNode

== Question_05
Na zieleń jest miejsce również w innych częściach kampusu. Zaraz za nami jest duży skwer! Zieleń jest dobra, ale nie może wypierać innych funkcji, jakie kampus uczelni musi pełnić.
    ->MainArgumentNode
