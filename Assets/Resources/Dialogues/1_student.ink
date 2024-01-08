INCLUDE Globals.ink

{01_bIsDecisionMade == true: -> DecisionRevisit}
{01_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Student
-> END

== BeginQuest

Cześć! Jesteś graczem, prawda? #portrait:Student

    + [Skąd wiesz?]
        ->FirstEncounter
    + [Ależ skąd, jestem studentem, jak ty.]
        ->FirstEncounter
    
== Explanation
    + [Duch miejsca powiedział, że chcesz w tym miejscu zrobić chodnik.]
	
Tak. Bardzo mi na tym zależy.
Co tydzień przychodzę tu, gdy mam okienko. Brakuje mi miejsca, żeby usiąść. Pomyślałem, że dobrym rozwiązaniem jest chodnik.
Taki z niskimi krawężnikami, żeby mogły bez problemu wjechać na niego osoby, które poruszają się na wózkach i nie powybijany, bo nie raz zdarzyło mi się potknąć. 

Aaaa!! I oczywiście ławki by się przydały, żeby można było odpocząć. 

-> MainArgumentNode

== FirstEncounter
Nie ma czego się wstydzić. Ja też jestem graczem w innej grze.
    ->Explanation

== MainArgumentNode

    + [Dlaczego chcesz siedzieć właśnie tutaj?]
        -> Question_01
    + [Co będą mieć z tego inni?]
        -> Question_02
    + [Co z ludźmi, którzy chcą dojechać do swoich miejsc postojowych?]
        -> Question_03
    + [Dlaczego nie chcesz, żeby była tu jezdnia?]
        -> Question_04
    + [Nie mam więcej pytań.]
        -> END
        
== Question_01

Tu mam wszędzie blisko! Poza tym, łatwo się z kimś umówię pod kominem, bo widać go z daleka. Idealny punkt orientacyjny. Mówisz, “widzimy się pod kominem” i już wszyscy wiedzą o co chodzi! 
-> MainArgumentNode

== Question_02

Tędy przechodzi mnóstwo ludzi. Dobrze by było, żeby nawierzchnia chodnika była nie powybijana, a krawężniki nie stanowiły przeszkody dla osób z niepełnosprawnością albo dla osób starszych.
Każdy może się tu z kimś umówić. Można by tu zorganizować jakieś fajne wydarzenie albo po prostu posiedzieć na słońcu, zamiast w cieniu drzew.

-> MainArgumentNode

== Question_03

Na oba parkingi pod płotem można dojechać od strony ulicy. Nie trzeba jechać przez kampus.
-> MainArgumentNode

== Question_04

Chciałbym, żeby tu było cicho i spokojnie, i żeby można było porozmawiać siedząc na jednej z licznych ławek. 
-> MainArgumentNode


