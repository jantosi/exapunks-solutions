;XA

MARK LOOP
REPL SPAWN
@REP 6
NOOP
@END
JUMP LOOP


MARK SPAWN
LINK 800
LINK 800
COPY #FILE X
GRAB X
LINK -1
LINK -1
DROP




;XB

LINK 800
LINK 802
LINK 799

KILL
KILL
KILL
KILL