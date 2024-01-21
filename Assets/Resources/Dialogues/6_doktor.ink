INCLUDE Globals.ink

{06_bIsDecisionMade == true: -> DecisionRevisit}
{06_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:Doktor
-> END

== BeginQuest

Przejdźmy do rzeczy. Uważam, że tu powinna stanąć kawiarnia. #portrait:Doktor
->MainDiscussionNode

== MainDiscussionNode

    + [Czemu właśnie kawiarnia?]
    -> Question_01
    + [Czemu właśnie w tym miejscu?]
    -> Question_04
    + [Czy kawiarnia przyda się innym użytkownikom Kampusu?]
    -> Question_02
    + [A może lepiej stołówka?]
    -> Question_03
    + [Na razie nie mam pytań.]
    -> END
    
== Question_01

Bo takiego miejsca jeszcze tu nie ma. Mogłoby powstać miejsce, gdzie można się spotkać i porozmawiać w „akademickim” klimacie. 
Dobra kawa. Dobre ciastko... I do tego bezprzewodowy internat i nieco miejsca do co-workingu.

-> MainDiscussionNode

== Question_02

Oczywiście! Na pewno będzie tu duży ruch przez cały czas, bo to świetna lokalizacja. Poza tym takie miejsce wcale nie musi być drogie.
-> MainDiscussionNode


== Question_03

W okolicy jest już dużo miejsc, gdzie można coś zjeść. Brakuje miejsca, gdzie można usiąść i porozmawiać przy kawie albo popracować, chyba że ktoś lubi kawę z automatu i rozmowę w zatłoczonym korytarzu.
-> MainDiscussionNode


== Question_04

Tu jest wolna przestrzeń, a jednocześnie jesteśmy w samym centrum kampusu PW. Każdemu byłoby blisko.
-> MainDiscussionNode
