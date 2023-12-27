INCLUDE Globals.ink

{09_bIsDecisionMade == true: -> DecisionRevisit}
{09_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:DzieckoBoy
-> END

== BeginQuest

Dzień dobry! Też chcę coś powiedzieć! #portrait:DzieckoBoy
    + [Dzień dobry! Słucham… ]
    - Myślę, że food trucki to superancki pomysł! Wreszcie trochę zamieszania! Mieszkam w samym środku miasta, ale w okolicy nie ma targów śniadaniowych, a tu byłoby w czym wybierać zwłaszcza, gdyby jedzenie nie byłoby drogie.
    ->END
 
