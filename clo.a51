ORG 0000H
LJMP MAIN

ORG 000BH
LJMP TIMER0_ISR

ORG 0030H

MAIN:
MOV TMOD,#01H        ; Timer0 Mode1
MOV TH0,#3CH
MOV TL0,#0B0H
SETB ET0             ; Enable Timer0 interrupt
SETB EA              ; Enable global interrupt
SETB TR0             ; Start Timer0

MOV R4,#12           ; Hour
MOV R5,#00           ; Minute
MOV R6,#00           ; Second
MOV R7,#00           ; Counter

MAIN_LOOP:
ACALL DISPLAY
SJMP MAIN_LOOP

;-------------------------
DISPLAY:

MOV A,R4
MOV B,#10
DIV AB
MOV DPTR,#SEG_TAB
MOVC A,@A+DPTR
MOV P1,A
MOV P2,#0EH
ACALL DELAY

MOV A,B
MOV DPTR,#SEG_TAB
MOVC A,@A+DPTR
MOV P1,A
MOV P2,#0DH
ACALL DELAY

MOV A,R5
MOV B,#10
DIV AB
MOV DPTR,#SEG_TAB
MOVC A,@A+DPTR
MOV P1,A
MOV P2,#0BH
ACALL DELAY

MOV A,B
MOV DPTR,#SEG_TAB
MOVC A,@A+DPTR
MOV P1,A
MOV P2,#07H
ACALL DELAY

RET

;-------------------------
TIMER0_ISR:

MOV TH0,#3CH
MOV TL0,#0B0H

INC R7
CJNE R7,#20,EXIT_ISR

MOV R7,#00
INC R6

CJNE R6,#60,EXIT_ISR
MOV R6,#00
INC R5

CJNE R5,#60,EXIT_ISR
MOV R5,#00
INC R4

CJNE R4,#24,EXIT_ISR
MOV R4,#00

EXIT_ISR:
RETI

;-------------------------
DELAY:
MOV R1,#200
D1: DJNZ R1,D1
RET

;-------------------------
SEG_TAB:
DB 3FH
DB 06H
DB 5BH
DB 4FH
DB 66H
DB 6DH
DB 7DH
DB 07H
DB 7FH
DB 6FH

END