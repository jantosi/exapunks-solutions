;XA


;GO TO FILE 200, DRIVE 1
;INDEX FILE
GRAB 300
COPY F X;SRC ID
DROP

LINK 800
LINK 801
GRAB 200
;FIND SRC ID
MARK SEEKSRC
TEST X = F
FJMP SEEKSRC

COPY 10 T
MARK COPYSRCFILEIDS
COPY F M
SUBI T 1 T
FJMP GRABDEST
JUMP COPYSRCFILEIDS

MARK GRABDEST
DROP
LINK -1
LINK -1
GRAB 300
SEEK 1
COPY F X;DEST ID
DROP
LINK 800
LINK 801
GRAB 200

;FIND DEST ID
MARK SEEKDEST
TEST X = F
FJMP SEEKDEST

COPY 10 T
MARK COPYDESTFILEIDS
COPY F M
SUBI T 1 T
FJMP DONEINDEXING
JUMP COPYDESTFILEIDS

MARK DONEINDEXING
;WE HAVE 10 SRC AND 10
;DEST IDS NOW IN FILE
;400 IN BASE.
;HAND OVER TO XB.



;XB




MAKE
@REP 20
COPY M F
@END

SEEK -9999
;COPY 10 T

MARK NEXTPAIR
;SUBI T 1 T
;FJMP DONE

;TODO - THE CASE WHEN
;THEYRE IN SAME FILE

COPY F X
SEEK 9
SUBI F X X
SEEK -11
MULI X X X
TEST X < 100
FJMP SRCNOTDEST
;X<100 MEANS DIFFERENCE
;BETWEEN OFFSETS WAS <10
;- IT IS THE SAME FILE
;CAN'T USE TWO AGENTS

COPY F X
REPL READER
SEEK 9
COPY F X
REPL PROXYTOWER
SEEK -10

COPY 50 T
JUMP AWAITCOPY

;ELSE DEPLOY TWO AGENTS
;ONE TO SRC ONE TO DEST
MARK SRCNOTDEST

COPY F X
REPL READER
SEEK 9
COPY F X
REPL WRITER
SEEK -10

COPY 40 T

MARK AWAITCOPY
SUBI T 1 T
TJMP AWAITCOPY


JUMP NEXTPAIR


MARK READER

LINK 800

SWIZ X 0003 T
ADDI 800 T T
LINK T;DRIVE

SWIZ X 0002 T
ADDI 200 T T
GRAB T;FILE

SWIZ X 0001 T
MULI T 10 T
SEEK T

@REP 10
COPY F M
@END

JUMP DONE

;AND WE'RE HERE!


MARK WRITER

LINK 800

SWIZ X 0003 T
ADDI 800 T T
LINK T;DRIVE

SWIZ X 0002 T
ADDI 200 T T
GRAB T;FILE

SWIZ X 0001 T
MULI T 10 T
SEEK T

@REP 10
COPY M F
@END

JUMP DONE
;AND WE'RE HERE!

MARK PROXYTOWER
MAKE

COPY 10 T
MARK PROXYSTORE
COPY M F
SUBI T 1 T
TJMP PROXYSTORE

SEEK -9999
REPL WRITER

COPY 10 T
MARK PROXYREAD
COPY F M
SUBI T 1 T
TJMP PROXYREAD

WIPE

JUMP DONE

MARK DONE
HALT

