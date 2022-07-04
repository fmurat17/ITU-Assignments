; Fatih MURAT
; 150170039
; iterative.s

index  EQU   0x6 			; Directive to assign index value as global.

		AREA my_array, DATA, READWRITE
		ALIGN
array	SPACE 4*(index+1)	; Allocating the memory
array_end

		AREA iterative, code, readonly ; Declare new area
		ENTRY				; Declare as entry point
		ALIGN 				; Ensures that __main addresses the following instruction.
__main	FUNCTION			; Enable Debug
		EXPORT __main		; Make __main as global to access from startup file
			
		LDR  r0, =index		; r0 holds the index, and it is paramater as well.
		LDR  r5, =array		; r5 holds the starting address of the array.
		MOVS r1, r5			; Assigning r5 to r1 in order to make r1 parameter.		
		BL fact				; Branching to fact function
stop	B stop				; Branching to stop. While(1)

		ENDFUNC				; End of the main function
		
		ALIGN
fact 	FUNCTION			; Definition of the factorial function.
		EXPORT fact
		
		MOVS r4, #1			; r4 = i = 1, i is iterator of the for loop.				
		MOVS r3, #1			; temp = 1
		STR  r3, [r1, #0]	; arr[0] = 1		
for		CMP	 r4, r0			; If i(r4) is equal to index(r0), it means that for loop ends
		BGE  stop			; Returning to the while(1) in the main		
		SUBS r3, r4, #1		; r3 = i-1		
		LSLS r3, #2			; Multiplying r3 by 4 2 times left shifting it. Because of the space that we allocated is 4*(index+1). 
		LDR  r3, [r1, r3]   ; r3 = arr[i-1]		
		MULS r3, r4, r3		; r3 *= i		
		LSLS r4, #2			; Multiplying r4 by 4 2 times left shifting it. Because of the space that we allocated is 4*(index+1). 
		STR  r3, [r1, r4]	; arr[i] = r3 = i * array[i-1]
		LSRS r4, #2			; Dividing i(r4) by 4 in order not to lose value of i(r4).		
		ADDS r4, #1			; Incrementing i for the next iteration. i++	
		B    for			; Branching to for loop again.
EndFunc BX	 LR				; Branching to where we left after function is finished.
		
		ENDFUNC				; End of the function
		END					; End of the assembly file