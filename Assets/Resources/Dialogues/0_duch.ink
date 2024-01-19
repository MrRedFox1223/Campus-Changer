INCLUDE Globals.ink

{00_PostTutorial == false: -> welcome}
{00_PostTutorial == true: -> ready_to_go}

== welcome
Cześć! #portrait:GeniusLoci

Cieszę się, że mogę być Twoim przewodnikiem po Kampusie.

    + [Aaaaa! Kim jesteś!] -> scared
    + [Yyyy... dzień dobry?] -> uncertain
    + [No cześć, możemy już iść?] -> intro_eager

== scared
Jestem duchem tego miejsca. Wybacz zaskoczenie. Zły nawyk pojawiania się bez zapowiedzi.
-> intro_puzzled

== uncertain
Wybacz, nie zdążyłam się przedstawić. Jestem duchem tego miejsca.
-> intro_puzzled

== intro_puzzled
    + [Duchem? Jak w bajce?]
-Nie, jestem bardziej metaforą. W rzeczywistości nie ma osób, które wiedzą wszystko, więc musieliśmy ją stworzyć.

    + [Ach, no tak. W porządku.] -> main_tutorial
    + [To miało być poważne badanie. Poproszę kwestionariusz. ] -> questionaire

== intro_eager
Zanim pójdziemy, muszę się upewnić: czy wiesz, jak się poruszać w trójwymiarowym świecie?

    + [Na drugie imię mam WSAD.]
    -> no_tutorial
    + [Tak, zdarzyło mi się grać w podobne gry. ]
    -> no_tutorial
    + [Nie, poproszę krótkie objaśnienie. ]
    -> main_tutorial

== questionaire
To jest badanie eksperymentalne. Zamiast kwestionariusza przejdziemy się po wirtualnym kampusie Politechniki i porozmawiamy z fikcyjnymi reprezentacjami problemów Kampusu, czyli postaciami, które napotkasz na swojej drodze.

    + [Ach, no tak. W Porządku! ]
    -> main_tutorial
    + [No trudno.]
    -> main_tutorial

== no_tutorial
Świetnie! Możemy od razu przejść do rzeczy. Gdy zakończymy tę rozmowę, przeniosę Cię na teren kampusu.
~ SwitchScene()
    -> END


== main_tutorial
Kiedy skończymy rozmawiać, obróć się w dowolną stronę i naciśnij klawisz „W”. Zaczniesz iść przed siebie. Klawisze "A", "S" i "D" też pozwolą Ci się poruszać tylko w innych kierunkach!

~ 00_PostTutorial = true

Gdy przejdziesz kilka kroków, powróć do mnie, a przeniosę Cię na teren kampusu.

    -> END

== ready_to_go 
Jesteś gotowy udać się na kampus? #portrait:GeniusLoci

    + [Tak, jestem gotowy!]
    A zatem ruszajmy.
    ~ SwitchScene()
    -> END
    
    + [Potrzebuje jeszcze chwili.]
    Oczywiście, wróć do mnie gdy będziesz gotowy.
    -> END
    



