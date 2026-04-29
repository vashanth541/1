ORG 0000H
MOV TMOD,#20H        ; Timer1 Mode 2 (Auto reload)
MOV TH1,#0FDH        ; 9600 baud rate
MOV SCON,#50H        ; Serial Mode1, REN enabled
SETB TR1             ; Start Timer1
MOV DPTR,#MSG        ; Point to message
SEND:
CLR A
MOVC A,@A+DPTR       ; Read character from code memory
JZ AGAIN             ; Stop at NULL
MOV SBUF,A           ; Send character
WAIT:
JNB TI,WAIT
CLR TI
INC DPTR
SJMP SEND
AGAIN:
SJMP $
MSG: DB 'Welcome to Embedded Lab',00H
END