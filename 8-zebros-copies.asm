;XA

GRAB 300
LINK 800
COPY F X
DROP

REPL FIXLOG

GRAB 200

MARK FILEBROWSE
TEST F = X
SEEK 2
FJMP FILEBROWSE
SEEK -2

;ROW FOUND
MODE
COPY F M
COPY F M
SEEK -2
COPY 0 F
COPY 0 F

DROP
GRAB 300
WIPE
HALT


MARK FIXLOG
GRAB 201

SEEK 9999
COPY M F ;DATE
COPY X F ;CUSTID
MODE
COPY M F ;DOLLARS
COPY M F ;CENTS


