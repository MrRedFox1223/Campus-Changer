INCLUDE Globals.ink

{03_bIsDecisionMade == true: -> DecisionRevisit}
{03_bIsDecisionMade == false: -> BeginQuest}

== DecisionRevisit
Obawiam się, że skończyły mi się kwestie dialogowe. #portrait:PaniNaWózku
-> END

== BeginQuest

Dzień dobry! #portrait:PaniNaWózku

    * [Ja w sprawie bramy.]
    
    - To świetnie. Zależy mi na tym, żeby ją otworzyć.

    * [Dlaczego?]
    
    - Bo jestem na wózku. Przeciskanie się przez furtkę jest bardzo niewygodne.
    ->MainArgumentNode
    
== MainArgumentNode

    + [Czy nie martwisz się, że otwarcie bramy prędzej czy później zamieni podwórko w parking?]
    -> Question_01
    + [Czy taka zmiana przyda się innym osobom?]
    -> Question_02
    + [Czy podobnym problemem nie są drzwi budynków i schody?]
    -> Question_03
    + [Nie mam więcej pytań.]
    -> END
    
== Question_01

Można temu zaradzić, jeśli zamontujemy barierki albo poprostu powiesimy tabliczkę “zakaz parkowania”.  Wiesz, taką barierkę można łatwo postawić lub położyć, zależnie od potrzeb.
-> MainArgumentNode

== Question_02

Tak sądzę. To jest bardzo “głęboka” brama. Gdy jeszcze jest w niej krata, robi się nieprzyjemnie. Jeśli usuniemy kratę, przestrzeń stanie się bardziej przyjazna. Zacznie zapraszać przechodniów do wejścia dalej. 

Możemy dodatkowo na ścianie namalować mural, o ile konserwator zabytków będzie przychylny temu pomysłowi, a wszystko by dodać temu miejscu uroku i nieco nowoczesności. Co Ty na to? 
-> MainArgumentNode

== Question_03

Bardzo często są. Jednak uważam, że trzeba poprawiać dostępność tam, gdzie się da, a nie czekać na święte nigdy, aż wszystko inne będzie poprawione… albo… no coż, nie będzie.
-> MainArgumentNode
