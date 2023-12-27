INCLUDE Globals.ink

Dzień dobry. Proszę nie śmiecić! 

    + Ani mi się śni. Czy mogę zadać kilka pytań o bramę?
    
    - Proszę pytać. A najlepiej proszę ją zamknąć.
    
    + Wygląda na już zamkniętą.
    
    - Błąd! Furtka jest otwarta. Ludzie wchodzą i wychodzą, wychodzą i wchodzą. 
    ->MainArgumentNode
    
== MainArgumentNode

    + Czemu to jest ważne, żeby wszystko pozamykać?
    -> Question_01
    + Co na to powiedzą osoby, które chcą mieć dostęp do podwórza?
    -> Question_02
    + A gdyby tak wszystko otworzyć?
    -> Question_03
    + Nie mam więcej pytań.
    -> END
    
== Question_01
Żeby było mniej sprzątania, oczywiście!
->MainArgumentNode

== Question_02
Mogą wejść na podwórze przez budynek. Osoby spoza wydziału i tak nie powinny się tu kręcić.
->MainArgumentNode

== Question_03
Ja tego nie będę sprzątał, a jak komuś samochód „nasmrodzi” prosto w okno, to proszę nie mieć do mnie pretensji.
->MainArgumentNode
