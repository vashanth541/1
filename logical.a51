ORG 0000H 
MOV A,#0F0H      ; Load 0F0H into accumulator 
MOV R0,#0F0H     ; Load 0F0H into R0 
ANL A,R0         ; AND operation 
MOV R1,A         ; Store result in R1 
MOV A,#0F0H 
ORL A,R0         ; OR operation 
MOV R2,A         ; Store result in R2 
MOV A,#0F0H 
XRL A,R0         ; XOR operation 
MOV R3,A         ; Store result in R3 
MOV A,#0F0H 
CPL A            ; Complement accumulator 
MOV R4,A         ; Store result in R4 
END