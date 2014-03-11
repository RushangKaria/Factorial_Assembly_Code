;This is the code for the external procedure factorial
;It uses global declared variable 'no' and calculates its factorial
;Result is in AX

Data Segment Public
	
	EXTRN no:WORD	;This tells the assembler that variable no is a word found in external segment named Data

Data ends

Public Factorial	;make factorial function public and available to other modules

Procedure Segment Public

	Factorial PROC FAR	;This starts the factorial proc..remaining all lines till ENDP are in factorial

	ASSUME DS:Data,CS:Procedure

	MOV AX,0001H	;Move 1 to AX

	MOV CX,no	;Move the no to CX

	Calculation:
		MUL CX
		DEC CX
		JNZ Calculation		;I could have used loop to do it but that would require defining another label
					;and therefore another jump statement so left it

		;Calculation:
		;MUL CX
		;JZ Ending
		;LOOP Calculation
		
		;Ending: 

	Factorial ENDP 


Procedure ends
end