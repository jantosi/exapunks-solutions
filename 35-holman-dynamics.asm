;XA

LINK 800
LINK 802
LINK 799
GRAB 199
SEEK 9999
COPY -9999 F
SEEK -9999

MARK NEXTDIGIT
TEST EOF
TJMP FINALTRANSFER

ADDI X 1 X
TEST F > -1
TJMP NEXTDIGIT
;END NUMBER MARKER
TEST X > 16
TJMP TRANSFER
MARK BACKFROMTRANSFER
COPY 0 X
JUMP NEXTDIGIT

MARK SCANDONE
COPY -9 M;SCAN DONE MSG
SEEK 9999
SEEK -1
VOID F
HALT

MARK TRANSFER
MULI X -1 X
SEEK X
MARK COPYCHAR
TEST X < 0
FJMP BACKFROMTRANSFER
COPY F M
ADDI X 1 X
JUMP COPYCHAR

MARK FINALTRANSFER
MULI X -1 X
SEEK X
MARK COPYCHAR2
TEST X < 0
FJMP SCANDONE
COPY F M
ADDI X 1 X
JUMP COPYCHAR2



;XB


MAKE
MARK READ
COPY M X
TEST X = -9
TJMP DIE
COPY X F
JUMP READ

MARK DIE
SEEK -1
VOID F
SEEK -9999

MARK LUHNCHK
COPY 0 X
REPL SUMBOT

MARK AGAIN
MULI 2 F X
TEST X > 9
FJMP AFTERSUB1
SUBI X 9 X
MARK AFTERSUB1
COPY X M
VOID M
MULI 1 F T
COPY T M
TEST M = 0
FJMP AGAIN


COPY M X
TEST X < 0
TJMP REJECT
MODI X 10 T
FJMP FOUND
MARK REJECT
SEEK -15;FWD 1
JUMP LUHNCHK

HALT

MARK FOUND
SEEK -16
REPL FILEMAKER
@REP 16
COPY F M
@END
HALT

MARK FILEMAKER
MAKE
COPY 16 X
MARK WRITEFOUNDLOOP
COPY M F
SUBI X 1 X
TEST X = 0
FJMP WRITEFOUNDLOOP
;@REP 16
;@END
HALT

MARK SUMBOT
COPY 0 X
COPY 16 T
MARK LOOPSUMBOT
ADDI M X X
SUBI T 1 T
DIVI T 2 M;SEND BACK I
TJMP LOOPSUMBOT
COPY X M
