;XC

LINK 800
LINK 802
LINK 800
LINK 799
MARK NOOPLOOP
JUMP NOOPLOOP

;XB


LINK 800
LINK 801
LINK 799
MARK NOOPLOOP
JUMP NOOPLOOP


;XA


LINK 800

MARK AGAIN
REPL NUKER
REPL BRIDGE
REPL HIGHWAY
REPL ENEMYBASE
JUMP AGAIN

MARK NUKER
LINK 800
REPL NUKER
;COPY 1 #NUKE

MARK BRIDGE
LINK 802
REPL BACKROAD
JUMP NOOPLOOP
MARK BACKROAD
LINK 800
REPL BACKROAD2
JUMP NOOPLOOP
MARK BACKROAD2
LINK 799
JUMP NOOPLOOP


MARK HIGHWAY
LINK 801
REPL HIGHWAY2
REPL OVERPASS
JUMP NOOPLOOP
MARK HIGHWAY2
LINK 799
JUMP NOOPLOOP
MARK OVERPASS
LINK 800
JUMP NOOPLOOP

MARK ENEMYBASE
LINK 800
LINK 800
JUMP NOOPLOOP


MARK NOOPLOOP
JUMP NOOPLOOP