;XA

LINK 800

MARK ITER
REPL L
JUMP R
MARK L
LINK 800
JUMP OK
MARK R
LINK 801
JUMP OK
MARK OK
ADDI X 1 X
TEST X > 2
FJMP ITER

KILL
GRAB 276
LINK -1
LINK -1
LINK -1
LINK -1