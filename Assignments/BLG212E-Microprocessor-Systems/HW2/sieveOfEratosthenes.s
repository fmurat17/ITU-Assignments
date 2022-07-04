; Fatih MURAT
; 150170039
; sieveOfEratosthenes.s

LIMIT  EQU  0x78 ; Directive to assign index value as global. 0x78 = 120

				AREA array1, DATA, READWRITE
				ALIGN
primeNumbers	SPACE 4*(LIMIT+1) ; Allocating the memory for primeNumbers array
primeNumbers_end

				AREA array2, DATA, READWRITE
				ALIGN				; Allocating the memory for isPrimeNumber array.
isPrimeNumber	SPACE (LIMIT+1)  	; Since it stores only 1s and 0s, did not multiplied by 4 to prevent exstra memory allocation.
isPrimeNumber_end

			AREA sieveOfEratosthenes, code, readonly ; Declare new area
			ENTRY					   ; Declare as entry poin
			ALIGN 					   ; Ensures that __main addresses the following instruction.
__main		FUNCTION				   ; Enable Debug
			EXPORT __main			   ; Make __main as global to access from startup file
				
			LDR  r5, =primeNumbers	; r5 holds the starting address of the primeNumbers array.
			LDR  r6, =isPrimeNumber ; r6 holds the starting address of the isPrimeNumber array.			
			LDR  r0, =LIMIT		; r0 holds the LIMIT value, and it is parameter.	
			BL prime			; Branching to prime function

stop		B stop				; Branching to stop. While(1)
			ENDFUNC				; End of the main function

		ALIGN
prime 	FUNCTION			    ; Definition of the factorial function.
		EXPORT prime
			
			MOVS r1, #0			; r1 holds the i as iterator for the for1 loop. i = 0
			
for1		CMP r1, r0			; If i(r1) is equal to limit(r0), it means that for1 loop ends
			BGE for1_end		; Returning to the for1_end, if r1 is greater or equal to r0.			
			LSLS r1, #2			; Multiplying r1 by 4 2 times left shifting it. Because of the space that we allocated is 4*(LIMIT+1). i *= 4
			MOVS r2, #0			; 0 is assigned to r2.
			STR  r2, [r5, r1]	; primeNumbers[i] = 0
			LSRS r1, #2			; Dividing i(r1) by 4 in order not to lose value of i(r1).				
			MOVS r2, #1			; 1 is assigned to r2.
			STRB  r2, [r6, r1]	; isPrimeNumber[i] = 1 -> In my case, 1 is true and 0 is false.				
			ADDS r1, #1			; Incrementing i for the next iteration. i++.	
			B for1;				; Branching to for1 loop again.
		
for1_end 	MOVS r1, #2			; r1 holds the i as iterator for the for2 loop. r1 = i = 2		
		
for2		MOVS r2, r1			; Assigning r1 ro r2. r2 is j as iterator for for2 loop
			MULS r2, r2, r2		; r2 *= r2 -> r2 holds i^2
			CMP r2, r0			; Comparing r2 and r0
			BGT for2_end		; If r2 is greater than r0, branch to for2_end
			LDRB r2, [r6, r1]	; r2 = isPrimeNumber[0]
			CMP r2, #1			; Comparing r2 with 1. 
			BNE inter1			; If r2 is not equal to 1, branch to inter1.		
			MOVS r2, r1			; Assigning r1 ro r2.
			MULS r2, r2, r2		; r2 = r2 * r2 -> r2 holds the i^2 value

nested_loop CMP r2, r0			; Comparing r2 and r0.
			BGE inter1			; If (i^2)r2 is equal or greater than r0(LIMIT), branch to inter1			
			MOVS r3, #0			; r3 = 0
			STRB r3, [r6, r2]	; isPrimeNumber[j] = 0			
			ADDS r2, r1, r2		; j += i			
			B nested_loop		; Branching to nested_loop loop again.

inter1 		ADDS r1, #1			; i++;
			B for2				; Branching to for2 loop again.
				
for2_end 	MOVS r1, #0			; We are done with r1 for for2 loop, we can r1 for different purposes now. r1 = index = 0 
			MOVS r2, #2			; We are done with r2 for nested_loop loop, we can r2 for different purposes now. r2 = i = 0
for3	 	CMP r2, r0			; Comparing r2 with r0(LIMIT)
			BGE EndFunc			; If r2 is equal or greater than the r0(LIMIT), branch to EndFunc
			LDRB r3, [r6, r2]	; r3 = isPrimeNumber[i]			
			CMP r3, #1			; Comparing r3 with 1.
			BNE inter2			; If r3 is not equal to 1, branch to inter2.			
			LSLS r1, #2			; Multiplying r1 by 4 2 times left shifting it. Because of the space that we allocated is 4*(LIMIT+1).
			STR r2, [r5, r1]	; primeNumbers[index] = i
			LSRS r1, #2			; Dividing index(r1) by 4 in order not to lose value of i(r4).
			ADDS r1, #1			; index++
		 
inter2   	ADDS r2, r2, #1		; i++
			B for3				; Branching to for3 loop again.

EndFunc 	BX LR				; Branching to where we left after function is finished.

			ENDFUNC				; End of the function
			END					; End of the assembly file