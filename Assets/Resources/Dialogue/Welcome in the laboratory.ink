INCLUDE Globals.ink

{ playerRole == "": -> Greating | -> RoleChosen}

== Greating == 
Hello, there! Glad to meet you! #portrait:Student
Welcome to this project laboratory!
My name is CAPSULE.
People affectionately refer to me as the NPC.
This world...
... is inhabitetd far and wide by creatures called BUGS.
For some people, BUGS are issues. Others use them for entertainment.
As for myself...
...they are my only companions here.
...
But first, tell me a little about yourself.
Now tell me. 

-> DevOrTester

== DevOrTester ==
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
Psst...
Hey, You...
On your right...
Come here...
-> END

== RoleChosen ==
Hello again! Do you encountered any BUGS?
-> END