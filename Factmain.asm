;This program calls far procedure factorial to calculate the factorial of a number 'no'
;The other program uses the global variable 'no'  
;The o/p is stored in AX

Data Segment word public

no DW 4H

Data ends

Result Segment

answer DW ?

Result ends

the_Stack Segment Stack

DW 50 DUP(0)
topOfStack label word	;this has to be word since stack is always used as word!!!

the_Stack ends

public no	;declare as public so that it is visible to other modules too

Procedure segment public

	EXTRN Factorial : Far

Procedure ends

Code segment word public
	
	Start:ASSUME DS:Data,CS:Code,SS:the_Stack

	MOV AX,Data
	MOV DS,AX

	MOV AX,the_Stack
	MOV AX,the_Stack
	MOV SS,AX
	MOV SP,OFFSET topOfStack

	CALL Factorial	;call the procedure

		JNO Store	;if not overflow 

	Store:Push DS
	Assume DS:Result
	
	MOV BX,Result
	MOV DS,BX

	MOV answer,AX

	INT 3

Code ends
end start