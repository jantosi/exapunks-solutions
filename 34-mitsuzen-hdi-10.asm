;XA



LINK 800
LINK 1
LINK 3
;WE'RE IN V-CTX
MARK NERVREADY
COPY 0 X
LINK -3
LINK -1
;CLONE YOURSELF
REPL ROWS
LINK 1
REPL ROWS
LINK 1
REPL ROWS
LINK -1
LINK 3
;WE'RE IN V-CTX

;UNROLLED LOOP HERE
;READ EACH OF 9 VALS
COPY M T
TEST T > -55
FJMP NEXT
ADDI X 1 X
MARK NEXT
COPY M T
TEST T > -55
FJMP NEXT2
ADDI X 1 X
MARK NEXT2
COPY M T
TEST T > -55
FJMP NEXT3
ADDI X 1 X
MARK NEXT3
COPY M T
TEST T > -55
FJMP NEXT4
ADDI X 1 X
MARK NEXT4
COPY M T
TEST T > -55
FJMP NEXT5
ADDI X 1 X
MARK NEXT5
COPY M T
TEST T > -55
FJMP NEXT6
ADDI X 1 X
MARK NEXT6
COPY M T
TEST T > -55
FJMP NEXT7
ADDI X 1 X
MARK NEXT7
COPY M T
TEST T > -55
FJMP NEXT8
ADDI X 1 X
MARK NEXT8
COPY M T
TEST T > -55
FJMP NEXT9
ADDI X 1 X
MARK NEXT9
;DO CALCS
MULI X 5 X
SUBI X 75 #NERV
JUMP NERVREADY

MARK ROWS
REPL STAY
LINK -3
REPL STAY
LINK -3
REPL STAY
HALT

MARK STAY
COPY #NERV M
