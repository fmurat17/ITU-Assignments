; Fatih MURAT
; 150170039
; recursive.s

index  EQU   0x6   			; Directive to assign index value as global.

		AREA my_array, DATA, READWRITE
		ALIGN
array	SPACE 4*(index+1)	; Allocating the memory
array_end

		AREA recursive, code, readonly ; Declare new area
		ENTRY				; Declare as entry point
		ALIGN 				; Ensures that __main addresses the following instruction.
__main	FUNCTION			; Enable Debug
		EXPORT __main		; Make __main as global to access from startup file
			
		LDR	 r0, =index		; r0 keeps the index
		LDR  r5, =array		; r5 keeps the starting address of array		
		MOVS r3, #0			; r3 = i = 0, i is iterator of the for loop		
loop	CMP  r3, r0			; If i(r3) is equal to index(r0), it means that for loop ends
		BGE  stop			; Returning to the while(1) in the main		
		MOVS r2, #1			; Just in case, initializing the return value by 1. Since it is going to be multiplied later.		
		MOVS r1, r3			; Assigning i(r3) value as parameter to r1 -> fact(r1)
		BL   fact			; Branching to fact function.		
		LSLS r3, #2			; Multiplying i by 4 2 times left shifting it. Because of the space that we allocated is 4*(index+1). 
		STR  r2, [r5, r3]	; array[i] = fact(i)
		LSRS r3, #2			; Dividing i by 4 in order not to lose value of i.		
		ADDS r3, r3, #1		; i++. Incrementing i by 1.
		B    loop			; Branching to loop. again.
stop	B    stop			; Branching to stop.
		ENDFUNC				; End of the function.

		ALIGN	
fact 	FUNCTION			; Definition of the factorial function.
		EXPORT fact
					
		CMP  r1, #2			; r1 is the parameter. Comparing parameter with 2.
		BLT  ret			; If parameter is less than 2, branch to ret.		
		PUSH {LR}			; Pushing LR to stack.
		PUSH {r1}			; Pushing paramater to stack. We do these push operations in order not to lose data, and use less register.		
		SUBS r1, r1, #1		; Decerment parameter by 1. (fact(n-1))
		BL   fact			; Recursive branch to fact function.		
		POP  {r1}			; Once a recursive function is done, we pop r1 to use it.	
		MULS r2, r1, r2		; r2 is return value. This calculates that n*fact(n-1).
		POP  {PC}			; After popping r1 value, LR is popped to PC in order to continue from where it left.		
ret		MOVS r2, #1			; If parameter is less than 2, then 1 is returned via r2.
EndFunc BX	 LR				; Branching to where we left after function is finished.

		ENDFUNC				; End of the function
		END					; End of the code