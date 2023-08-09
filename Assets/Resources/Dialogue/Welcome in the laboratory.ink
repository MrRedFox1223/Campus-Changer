INCLUDE Globals.ink

{ playerRole == "": -> Greating | -> RoleChosen}

== Greating == 
Hello, there! Glad to meet you! #speaker:??? #portrait: Capsule_happy #layout: left
Welcome to this project laboratory!
My name is CAPSULE. #speaker:CAPSULE
People affectionately refer to me as the NPC.
This world...
... is inhabitetd far and wide by creatures called BUGS.
For some people, BUGS are issues. Others use them for entertainment.
As for myself...
...they are my only companions here. #portrait: Capsule_neutral
...
But first, tell me a little about yourself. #portrait: Capsule_happy
Now tell me. 

-> DevOrTester

==DevOrTester==
Are you a DEV? Or are you a TESTER?
    +[DEV]
        -> ChosenDev("DEV")
    +[TESTER]
        -> ChosenTester("TESTER")

== ChosenDev(role) ==
~ playerRole = role
Right... So you're {role}, good luck with repairing BUGS! 
-> Psst

== ChosenTester(role) ==
~ playerRole = role
Right... So you're {role}, good luck with hunting BUGS!
-> Psst

== Psst ==
Psst... #speaker:??? #portrait:default #layout: right
Hey, You...
On your right...
Come here...
-> END

== RoleChosen ==
Hello again! Do you encountered any BUGS? #speaker:CAPSULE #portrait: Capsule_happy #layout: left
-> END