;XA

;INSTALLER
GRAB 300
LINK 800
LINK 800
DROP
GRAB 199
MARK COUNT
TEST EOF
TJMP COUNTEND
SEEK 1
ADDI X 1 X
JUMP COUNT
MARK COUNTEND
COPY X M; SEND NUM OF
        ; ACCTS

;EDITOR
DROP
GRAB 300
COPY F T;USERNAME
DROP
GRAB 199
MARK LOOP
COPY F X
REPL EDITF
JUMP LOOP

MARK EDITF
GRAB X
SEEK 9999
COPY T F;USERHANDLE
COPY M F;PLCHLD CRDT
COPY 1 F
COPY 0 F;1 DOLLAR 0C'
DROP



;XC


;KEYWORD SERVER
GRAB 301
SEEK 1
COPY F X;DEBIT
DROP
COPY M T;COUNTER
MARK SERVEDEBITKWLOOP
COPY X M
SUBI T 1 T
FJMP OUT
JUMP SERVEDEBITKWLOOP

MARK OUT
REPL CLEANER

GRAB 301
COPY F X;CREDIT
DROP
COPY X M
JUMP DIE

MARK CLEANER
LINK 800
LINK 800
GRAB 199
MODE;LOCAL M
REPL ACCTNOGRABBER
MARK FOREACHACCT
TEST EOF
TJMP FIXDEBITKWS
COPY F M
JUMP FOREACHACCT


MARK FIXDEBITKWS
COPY 0 M;DIE,ACTGRBR
COPY 300 F
DROP
MODE;GLOBAL M
COPY M X
GRAB 300
SEEK 1;OPTYPE COLUMN
MARK DEBITKWLOOP
TEST F = -9999;PLCHLDR
FJMP GO
SEEK -1
COPY X F
MARK GO
SEEK 3
JUMP DEBITKWLOOP



MARK ACCTNOGRABBER
COPY M T
FJMP DIE
GRAB T
COPY F X
DROP
GRAB 300
SEEK 9999
COPY X F;ACCT
COPY -9999 F;CRD PLCHLDR
COPY 1 F
COPY 0 F
DROP
JUMP ACCTNOGRABBER

MARK DIE