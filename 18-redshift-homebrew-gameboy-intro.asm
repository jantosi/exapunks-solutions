;XA

DATA 307 301 313 305
DATA 302 315 325

COPY 20 X
COPY 30 T
MARK NEWCHAR
COPY F GP
COPY X GX
COPY T GY
ADDI 10 X X
REPL DISPLAY
COPY 300 GP
JUMP NEWCHAR

MARK DISPLAY
COPY 10 T
MARK CHARLIFE
SUBI T 1 T
TJMP CHARLIFE
COPY 3 T
MARK DECAY
@REP 25
RAND 000 099 GP
@END
SUBI T 1 T
TJMP DECAY



;XB

DATA 307 301 313 305
DATA 302 315 325

COPY 20 X
COPY 31 T
MARK NEWCHAR
COPY F GP
COPY X GX
COPY T GY
ADDI 10 X X
REPL DISPLAY
COPY 300 GP
JUMP NEWCHAR

MARK DISPLAY
COPY 10 T
MARK CHARLIFE
SUBI T 1 T
TJMP CHARLIFE
COPY 3 T
MARK DECAY
@REP 25
RAND 000 099 GP
@END
SUBI T 1 T
TJMP DECAY



;$

LINK 801
COPY 84 #SQR0
WAIT
WAIT
COPY 96 #SQR1
WAIT
COPY 0 #SQR0
WAIT
WAIT
WAIT
WAIT
WAIT
WAIT
WAIT
WAIT
WAIT
COPY 0 #SQR1