.MODEL SMALL 
.STACK 100H

D_MESSAGE MACRO M 
 	MOV AH,09H
 	LEA DX,M
	INT 21H
ENDM
GET_STRING MACRO S
	MOV AH,0AH
 	LEA DX,S
 	INT 21H
ENDM

.DATA 
	M1 DB 10,13, "Enter a string (max length 30) : $"
	M2 DB 10,13, "The reverse string is : $"
	M3 DB 10,13, "Its a palindrome$"
	M4 DB 10,13, "Its not a palindrome$"
	M5 DB 10,13, "Length of string : $"
	STR1 DB 30,0,30 DUP('$')
	STR2 DB 30 DUP('$')
	LEN DW 0000H
.CODE

	MAIN PROC
			MOV AX, @DATA
 			MOV DS, AX
 			MOV ES, AX

			D_MESSAGE M1 
 			GET_STRING STR1 
 			MOV BX, 0000H 
 			MOV BL, STR1+1 
 			MOV LEN, BX
 			LEA SI, STR1 
 			INC SI 
 			ADD SI, BX 
			
			D_MESSAGE M2 
	               AGAIN: MOV DL, [SI]
 			MOV AH, 02H
 			INT 21H
 			DEC SI
 			DEC BL
 			JNZ AGAIN 
 			LEA SI, STR1+1
 			ADD SI, LEN 
 			LEA DI, STR2 
		
			MOV CX, LEN 
		        L1: MOV BL, [SI]
 			MOV [DI], BL 
 			DEC SI 
			INC DI 
 			DEC CX 
 			JNZ L1 

 			LEA SI, STR1+2 
 			LEA DI, STR2 
 			MOV CX, LEN 
 			CLD 
 			REPE CMPSB 
 			JNE NPALIN 
 			D_MESSAGE M3 
 			JMP NEXT
     	    NPALIN: D_MESSAGE M4 

		    NEXT: MOV AL, 00 
   		          MOV CX, LEN
		    L2: ADD AL, 01H 
 			DAA 
 			DEC CX 
 			JNZ L2 
 		
			D_MESSAGE M5 
 			MOV DL, AL 
 			MOV BL, AL 
 			ROR DL, 04H
 			AND DL, 0FH
 			ADD DL, 30H
 			MOV AH, 02
 			INT 21H 
 			MOV DL, BL
 			AND DL, 0FH
 			ADD DL, 30H
 			MOV AH, 02
 			INT 21H 

 			MOV AH, 4CH
 			INT 21H
 	MAIN ENDP
END MAIN
