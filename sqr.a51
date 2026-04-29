ORG 0000H 
HERE: SETB P1.0        ; Set P1.0 HIGH 
ACALL DELAY     ; Call delay 
CLR  P1.0       ; Clear P1.0 (LOW) 
ACALL DELAY     ; Call delay 
SJMP HERE       ; Repeat continuously
DELAY: MOV R7,#255 
D1:    MOV R6,#255 
D2:    DJNZ R6,D2 
DJNZ R7,D1 
RET 
END