ORG 0000H 
HERE: MOV P0,#0FFH     ; All bits HIGH on Port 0 
MOV P1,#00H     ; All bits LOW on Port 1 
MOV P2,#0AAH    ; 10101010 pattern on Port 2 
MOV P3,#055H    ; 01010101 pattern on Port 3 
ACALL DELAY 
MOV P0,#00H     ; All bits LOW on Port 0 
MOV P1,#0FFH    ; All bits HIGH on Port 1 
MOV P2,#055H    ; 01010101 pattern on Port 2 
MOV P3,#0AAH    ; 10101010 pattern on Port 3 
ACALL DELAY 
SJMP HERE 
DELAY: MOV R7,#255 
D1:    MOV R6,#255 
D2:    DJNZ R6,D2 
DJNZ R7,D1 
RET 
END