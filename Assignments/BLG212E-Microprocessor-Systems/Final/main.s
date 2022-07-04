;*******************************************************************************
;@file				 Main.s
;@project		     Microprocessor Systems Term Project
;@31.01.2021
;
;@PROJECT GROUP
;@ G18
;@ Sirri Batuhan COKSAK	- 150170087
;@ Fatih MURAT	- 150170039
;@ Furkan Yusuf GURAY - 150170069
;@ Matthew Oguzhan DIRLIK - 150160123
;@ Ekin Zuhat YASAR - 150160142
;*******************************************************************************
;*******************************************************************************
;@section 		INPUT_DATASET
;*******************************************************************************

;@brief 	This data will be used for insertion and deletion operation.
;@note		The input dataset will be changed at the grading. 
;			Therefore, you shouldn't use the constant number size for this dataset in your code. 
				AREA     IN_DATA_AREA, DATA, READONLY
IN_DATA			DCD		0x10, 0x20, 0x15, 0x65, 0x25, 0x01, 0x01, 0x12, 0x65, 0x25, 0x85, 0x46, 0x10, 0x00
END_IN_DATA

;@brief 	This data contains operation flags of input dataset. 
;@note		0 -> Deletion operation, 1 -> Insertion 
				AREA     IN_DATA_FLAG_AREA, DATA, READONLY
IN_DATA_FLAG	DCD		0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x02
END_IN_DATA_FLAG


;*******************************************************************************
;@endsection 	INPUT_DATASET
;*******************************************************************************

;*******************************************************************************
;@section 		DATA_DECLARATION
;*******************************************************************************

;@brief 	This part will be used for constant numbers definition.
NUMBER_OF_AT	EQU		20									; Number of Allocation Table
AT_SIZE			EQU		NUMBER_OF_AT*4						; Allocation Table Size
DATA_AREA_SIZE	EQU		AT_SIZE*32*2						; Allocable data area
															; Each allocation table has 32 Cell
															; Each Cell Has 2 word (Value + Address)
															; Each word has 4 byte
ARRAY_SIZE		EQU		AT_SIZE*32							; Allocable data area
															; Each allocation table has 32 Cell
															; Each Cell Has 1 word (Value)
															; Each word has 4 byte
LOG_ARRAY_SIZE	EQU     AT_SIZE*32*3						; Log Array Size
															; Each log contains 3 word
															; 16 bit for index
															; 8 bit for error_code
															; 8 bit for operation
															; 32 bit for data
															; 32 bit for timestamp in us
;//-------- <<< USER CODE BEGIN Constant Numbers Definitions >>> ----------------------	

;//-------- <<< USER CODE END Constant Numbers Definitions >>> ------------------------	

;*******************************************************************************
;@brief 	This area will be used for global variables.
				AREA     GLOBAL_VARIABLES, DATA, READWRITE		
				ALIGN	
TICK_COUNT		SPACE	 4									; Allocate #4 byte area to store tick count of the system tick timer.
FIRST_ELEMENT  	SPACE    4									; Allocate #4 byte area to store the first element pointer of the linked list.
INDEX_INPUT_DS  SPACE    4									; Allocate #4 byte area to store the index of input dataset.
INDEX_ERROR_LOG SPACE	 4									; Allocate #4 byte aret to store the index of the error log array.
PROGRAM_STATUS  SPACE    4									; Allocate #4 byte to store program status.
															; 0-> Program started, 1->Timer started, 2-> All data operation finished
;//-------- <<< USER CODE BEGIN Global Variables >>> ----------------------															
							
POTSTTI			EQU		602									; Period Of the System Tick Timer Interrupt, it is 602 us
	
;//-------- <<< USER CODE END Global Variables >>> ------------------------															

;*******************************************************************************

;@brief 	This area will be used for the allocation table
				AREA     ALLOCATION_TABLE, DATA, READWRITE		
				ALIGN	
__AT_Start
AT_MEM       	SPACE    AT_SIZE							; Allocate #AT_SIZE byte area from memory.
__AT_END

;@brief 	This area will be used for the linked list.
				AREA     DATA_AREA, DATA, READWRITE		
				ALIGN	
__DATA_Start
DATA_MEM        SPACE    DATA_AREA_SIZE						; Allocate #DATA_AREA_SIZE byte area from memory.
__DATA_END

;@brief 	This area will be used for the array. 
;			Array will be used at the end of the program to transform linked list to array.
				AREA     ARRAY_AREA, DATA, READWRITE		
				ALIGN	
__ARRAY_Start
ARRAY_MEM       SPACE    ARRAY_SIZE						; Allocate #ARRAY_SIZE byte area from memory.
__ARRAY_END

;@brief 	This area will be used for the error log array. 
				AREA     ARRAY_AREA, DATA, READWRITE		
				ALIGN	
__LOG_Start
LOG_MEM       	SPACE    LOG_ARRAY_SIZE						; Allocate #DATA_AREA_SIZE byte area from memory.
__LOG_END

;//-------- <<< USER CODE BEGIN Data Allocation >>> ----------------------															

;//-------- <<< USER CODE END Data Allocation >>> ------------------------															

;*******************************************************************************
;@endsection 	DATA_DECLARATION
;*******************************************************************************

;*******************************************************************************
;@section 		MAIN_FUNCTION
;*******************************************************************************

			
;@brief 	This area contains project codes. 
;@note		You shouldn't change the main function. 				
				AREA MAINFUNCTION, CODE, READONLY
				ENTRY
				THUMB
				ALIGN 
__main			FUNCTION
				EXPORT __main
				BL	Clear_Alloc					; Call Clear Allocation Function.
				BL  Clear_ErrorLogs				; Call Clear ErrorLogs Function.
				BL	Init_GlobVars				; Call Initiate Global Variable Function.
				BL	SysTick_Init				; Call Initialize System Tick Timer Function.
				LDR R0, =PROGRAM_STATUS			; Load Program Status Variable Addresses.
LOOP			LDR R1, [R0]					; Load Program Status Variable.
				CMP	R1, #2						; Check If Program finished.
				BNE LOOP						; Go to loop If program do not finish.
STOP			B	STOP						; Infinite loop.
				ENDFUNC
			
;*******************************************************************************
;@endsection 		MAIN_FUNCTION
;*******************************************************************************				

;*******************************************************************************
;@section 			USER_FUNCTIONS
;*******************************************************************************

;@brief 	This function will be used for System Tick Handler
SysTick_Handler	FUNCTION			
;//-------- <<< USER CODE BEGIN System Tick Handler >>> ----------------------	

				EXPORT SysTick_Handler
				PUSH {LR, R0, R1}				; Since in the main r0 and r1 is constantly used push them here 
				; Block that increments tick count	
				LDR R1, =TICK_COUNT				; Get the tick count address
				LDR R0, [R1]					; Load the tick count value
				ADDS R0, R0, #1					; Increment tick count value
				STR R0, [R1,#0]					; Store the incremented value to its address
				LDR R7, =INDEX_INPUT_DS			; Get the INDEX_INPUT_DS's address
				LDR R0, [R7,#0]					; Get the value in the INDEX_INPUT_DS
				LDR R6, =IN_DATA				; Get the data IN_DATA address
				LDR R3, [R6,R0]					; Get the value in IN_DATA using index
				LDR R6, =IN_DATA_FLAG			; Get the IN_DATA_FLAG's address 
				LDR R2, [R6,R0]					; Get the value in IN_DATA_FLAG using index
				CMP R2, #2						; Check if in_data_flag is 2 
				BEQ OP2 						; If so go to OP2 label
				CMP R2, #1						; Check if in_data_flag is 1 
				BEQ OP1 						; If so go to OP1 label
				CMP R2, #0						; Check if in_data_flag is 0 
				BEQ OP0 						; If so go to OP0 label
				MOVS R1, #6						; Operation is not found code saved to R1
				B Endf							; Branch to Endf label
OP2				PUSH {R0}						; Push R0 register first just in case
				PUSH {R1-R7}					; Push registers
				BL LinkedList2Arr				; Call corresponding function
				POP {R1-R7}						; Pop registers ( r0 is the return register)
				MOVS R1, R0						; Move the error code to R1
				POP {R0}						; R0's value back
				B Endf							; Branch to Endf label
OP1				PUSH {R0}						; Push R0 register first just in case
				PUSH {R1-R7}					; Push registers
				MOVS R0, R3						; Move the data to R0 since it is the parameter to insert function	
				BL Insert						; Call Insert Function
				POP {R1-R7}						; Pop registers ( r0 is the return register)
				MOVS R1, R0						; Move the error code to R1
				POP {R0}						; R0's value back
				B Endf							; Branch to Endf label		
OP0				PUSH {R0}						; Push R0 register first just in case
				PUSH {R1-R7}					; Push registers
				MOVS R0, R3						; Move the data to R0 since it is the parameter to insert function	
				BL Remove						; Call Insert Function
				POP {R1-R7}						; Pop registers ( r0 is the return register)
				MOVS R1, R0						; Move the error code to R1
				POP {R0}						; R0's value back
				B Endf							; Branch to Endf label
Endf			PUSH {R0-R7}					; Push registers
				BL WriteErrorLog				; Call WriteErrorLog
				POP {R0-R7}						; Pop registers	
				ADDS R0, #4						; Increment Index of the input dataset 
				STR R0, [R7]					; Update the INDEX_INPUT_DS value
				CMP R2, #2						; If operation was LinkedList2Arr then go to Stop_ label 
				BEQ Stop_						; Branch if equal to Stop_ label 
scont1			POP	{R0,R1}						; Pop the mains r0 and r1 values
				POP {PC}						; Pop LR to PC
Stop_			BL SysTick_Stop					; Call SysTick_Stop
				B scont1						; Back to scont1 label
		
;//-------- <<< USER CODE END System Tick Handler >>> ------------------------				
				ENDFUNC

;*******************************************************************************				

;@brief 	This function will be used to initiate System Tick Handler
SysTick_Init	FUNCTION			
;//-------- <<< USER CODE BEGIN System Tick Timer Initialize >>> ----------------------

				LDR R0, =0xE000E010;			; Load the address of SYST_CSR
				LDR R1, = 19263					; RV+1 = 602*10^-6 *  32* 10^6 , hence reload value is 19263
				STR R1, [R0, #4]				; Store reload value to SYST_RVR
				MOVS R1, #0						; Move 0 to r1
				STR R1, [R0, #8]				; Clear the value in SYST_CVR
				MOVS R1, #7						; Move 7 to r1
				STR R1 , [R0]					; Set ENABLE, CLOCK And TICKINT to 1 in SYST_CSR
				MOVS R0, #1;					; Move 1 to r1
				LDR R1, =PROGRAM_STATUS			; Get the address of program status
				STR R0, [R1,#0]					; Store 1 to that address
				BX LR							; Branch with link register
				
;//-------- <<< USER CODE END System Tick Timer Initialize >>> ------------------------				
				ENDFUNC

;*******************************************************************************				

;@brief 	This function will be used to stop the System Tick Timer
SysTick_Stop	FUNCTION			
;//-------- <<< USER CODE BEGIN System Tick Timer Stop >>> ----------------------

				LDR R3, =0xE000E010;			; Load the address of SYST_CSR
				MOVS R4, #0						; Move 0 to r4	
				STR R4 , [R3,#0]				; Set ENABLE, CLOCK And TICKINT to 0 in SYST_CSR		
				MOVS R4, #2						; Move 2 to r4
				LDR R3, =PROGRAM_STATUS			; Get the address of program status
				STR R4, [R3,#0]					; Store 2 to that address
				BX LR							; Branch with link register
				
;//-------- <<< USER CODE END System Tick Timer Stop >>> ------------------------				
				ENDFUNC

;*******************************************************************************				

;@brief 	This function will be used to clear allocation table
Clear_Alloc		FUNCTION			
;//-------- <<< USER CODE BEGIN Clear Allocation Table Function >>> ----------------------

				LDR R3, =AT_MEM					; Adress of the Allocation table start
				LDR R4, =AT_SIZE				; Size of the Allocation table
				MOVS R5, #0						; r5 will be used as an index 
				MOVS R6, #0						; r6 is the constant 0 value
LOOP1			CMP R5, R4						; Compare index with size if
				BEQ CONT1						; If they are equal go to CONT1 label
				STR R6, [R3, R5]				; Store the constant value to AT_MEM with r5 offset
				ADDS R5 , R5, #4				; Increase the index
				B LOOP1							; Go back to LOOP1 label
CONT1			BX LR							; Branch with link register
			
;//-------- <<< USER CODE END Clear Allocation Table Function >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************		

;@brief 	This function will be used to clear error log array
Clear_ErrorLogs	FUNCTION			
;//-------- <<< USER CODE BEGIN Clear Error Logs Function >>> ----------------------															
				
				LDR R3, =LOG_MEM				; Adress of the error log memory start
				LDR R4, =LOG_ARRAY_SIZE			; Size of the error log memory table
				MOVS R5, #0						; r5 will be used as an index 
				MOVS R6, #0						; r6 is the constant 0 value
LOOP2			CMP R5, R4						; Compare index with size if
				BEQ CONT2						; If they are equal go to CONT2 label
				STR R6, [R3, R5]				; Store the constant value to AT_MEM with r5 offset
				ADDS R5 , R5, #4				; Increase the index
				B LOOP2							; Go back to LOOP2 label
CONT2			BX LR							; Branch with link register

;//-------- <<< USER CODE END Clear Error Logs Function >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************

;@brief 	This function will be used to initialize global variables
Init_GlobVars	FUNCTION			
;//-------- <<< USER CODE BEGIN Initialize Global Variables >>> ----------------------	

				MOVS R0, #0;					; Move constant 0 to r0
				LDR R1, =TICK_COUNT				; Get the address of tick_count
				STR R0, [R1,#0]					; Store 0 to tick_count
				LDR R1, =FIRST_ELEMENT			; Get the address of FIRST_ELEMENT
				STR R0, [R1,#0]					; Store 0 to FIRST_ELEMENT
				LDR R1, =INDEX_INPUT_DS			; Get the address of INDEX_INPUT_DS
				STR R0, [R1,#0]					; Store 0 to INDEX_INPUT_DS
				LDR R1, =INDEX_ERROR_LOG		; Get the address of INDEX_ERROR_LOG	
				STR R0, [R1,#0]					; Store 0 to INDEX_ERROR_LOG
				LDR R1, =PROGRAM_STATUS			; Get the address of PROGRAM_STATUS
				STR R0, [R1,#0]					; Store 0 to PROGRAM_STATUS
				BX LR							; Branch with link register
				
;//-------- <<< USER CODE END Initialize Global Variables >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************	

;@brief 	This function will be used to allocate the new cell 
;			from the memory using the allocation table.
;@return 	R0 <- The allocated area address
Malloc			FUNCTION			
;//-------- <<< USER CODE BEGIN System Tick Handler >>> ----------------------

				LDR R0, =DATA_MEM				; Get the address of DATA_MEM
				LDR R1, =NUMBER_OF_AT			; Get the global value NUMBER_OF_AT
				MOVS R2, #0						; r2 is an index starting from 0
				MOVS R3, #0						; r3 is a constant 0
				LDR R4, =AT_MEM					; Get the address of Allocation table start
MALLOCL1		CMP R2, R1						; Compare index with the NUMBER_OF_AT which is the size for this loop
				BEQ MALLOCE						; If they are equal go to MALLOCE label
				LDR R5, [R4]					; Load the number in r4 to r5
				MOVS R6, #1						; R6 is a number which will shift
MALLOCL2		CMP R6, R3						; Compare R6 with R3, r6 will be shifted in the loop when it is shifted 32. time it will be zero
				BEQ MALLOCC1					; If r6 becomes 0 go to MALLOCC1 label
				MOVS R7, R5						; MOVE R5 to r7
				ANDS R7, R7, R6					; And r7 with r6 and save it to r7
				CMP R7 , R3						; Compare the result with 0 
				BEQ	ENDM						; If result is 0 than there is a space at that position
				ADDS R0, #8						; Else increment data mem pointer by 8 since it has 2 integer values for each node
				LSLS R6, R6,#1	; 				; Shift the shifting number to left by 1 
				B MALLOCL2						; Branch to MALLOCL2 label
MALLOCC1		ADDS R2, #1						; Increment the index
				ADDS R4, #4						; Increment to address pointer
				B	MALLOCL1					; Go to MALLOCL1 label
MALLOCE			MOVS R0, #0						; Move 0 to r0 if no space is found
ENDM			ORRS R5,R5,R6					; Or the values in shifting number and current word
				STR R5, [R4]					; Store it to current word location on allocation table
				BX LR							; Branch with link register
				
;//-------- <<< USER CODE END System Tick Handler >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************				

;@brief 	This function will be used for deallocate the existing area
;@param		R0 <- Address to deallocate
Free			FUNCTION			
;//-------- <<< USER CODE BEGIN Free Function >>> ----------------------
				LDR R1, =DATA_MEM				; Get the address of DATA_MEM
				MOVS R2 ,#1						; Move 1 to r2, it will be shifted
				MOVS R3 ,#0						; CONSTANT 0 to r3
				MOVS R4 ,#0						; Line index
FREEL1			CMP R1, R0;						; Compare r1's address with the input
				BEQ FREEC2						; If they are equal go to FREEC2 label
				ADDS R1 ,#8						; Increment r1's value by 8 since it holds 2 ints in 1 node
				LSLS R2 , R2 ,#1				; Shift the shifting number
				CMP R2,R3						; Compare the shifted number with 0
				BEQ FREEF1						; If they are equal go to FREEF1 label, basicly line increase
FREEC1			B FREEL1						; Branch to FREEL1 label
FREEF1			ADDS R4,#4 						; Increment line index
				MOVS R2 ,#1						; Move 1 to shifting number since it overflowed
				B FREEL1						; Branch to FREEL1 label
FREEC2			LDR R5, =AT_MEM					; Get the adress of the Allocation table start
				LDR R6, [R5,R4]					; Load the value in the AT_MEM+r4 to r6
				MVNS R2, R2						; Invert R2 the shifting number
				ANDS R6,R6,R2					; And R6 with R2's inverted form which will only change 1 bit 
				STR R6, [R5,R4]					; Store r6 to its original space
				BX LR							; Branch with link register
				

;//-------- <<< USER CODE END Free Function >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************				

;@brief 	This function will be used to insert data to the linked list
;@param		R0 <- The data to insert
;@return    R0 <- Error Code
Insert			FUNCTION			
;//-------- <<< USER CODE BEGIN Insert Function >>> ----------------------															

				LDR R2, =FIRST_ELEMENT			; GET THE ADDRESS OF FIRST ELEMENT GLOBAL VAR
				LDR R4, [R2,#0]					; GET THE ADDRESS OF THE FIRST ELEMENT IN LS
				CMP R4 , #0						; CHECK IF THE LIST IS EMPTY
				BEQ INSERT_TO_START				; IF SO ADD TO START		
				MOV R2, R4						; MOVE THE ADDRESS OF THE FIRST ELEMENT IN LS
				LDR R4, [R2,#0]					; LOAD THE VALUE IN FIRST ELEMENT IN THE LINKED LIST TO R4
				CMP R0 , R4						; CHECK IF THE VALUE IS EQUAL TO THE FIRST VALUE IN THE LS
				BEQ INSERT_EQ_ERROR				; IF SO GO TO INSERT_EQ_ERROR LABEL
				CMP R0 , R4						; CHECK IF THE VALUE IS LOWER THAN THE FIRST VALUE IN THE LS
				BLO INSERT_TO_HEAD				; IF SO NEW VALUE WILL BE THE HEAD SO GO TO INSERT_TO_HEAD LABEL
INSERTL1		MOV R3, R2						; ITER TAIL
				LDR R2, [R2,#4]					; MOVE THE ITER
				CMP R2 , #0						; CHECK IF THE LINK LIST END HAS BEEN REACHED
				BEQ INSERT_TO_END				; IF SO GO TO INSERT_TO_END LABEL
				LDR R4, [R2,#0]					; GET THE VALUE IN THE ITER AND SAVE IT TO R4
				CMP R0, R4 						; CHECK IF THE ITER'S VALUE IS EQUAL TO THE TO BE INSERTED VALUE
				BEQ INSERT_EQ_ERROR				; IF SO GO TO INSERT_EQ_ERROR LABEL
				CMP R0, R4 						; CHECK IF THE ITER'S VALUE IS GREATER THAN THE TO BE INSERTED VALUE
				BLO INSERT_F;					; IF SO GO TO INSERT_F LABEL
				B INSERTL1						; ELSE GO TO INSERTL1
INSERT_TO_START MOVS R1, R0;					; MOVE TO BE INSERTED VAL TO R1
				PUSH {LR,R1};					; PUSH R1 AND LR 
				BL Malloc						; CALL MALLOC
				CMP R0, #0						; CHECK IF MALLOC GAVE AND ERROR	IT SHOULDNT
				BEQ	INSERT_SPACE_ERROR			; IF SO BRANCH TO INSERT_SPACE_ERROR
				POP {R1}						; POP R1										
				LDR R2, =FIRST_ELEMENT			; GET THE HEAD
				STR R0, [R2,#0]					; STORE THE ADDRESS TO HEAD
				STR R1, [R0]					; WRITE THE VALUE TO THE ADDRESS
				MOVS R0, #0						; MOVE 0 TO R0 AS A SUCCESFULL TASK CODE
				POP {PC}						; POP LR to pc	
INSERT_TO_HEAD	MOVS R1, R0;					; MOVE TO BE INSERTED VAL TO R1
				PUSH {LR,R1,R2}					; PUSH R1, R2 AND LR 
				BL Malloc						; CALL MALLOC
				POP {R1,R2};					; POP R1, R2
				CMP R0, #0						; CHECK IF MALLOC GAVE AND ERROR
				BEQ	INSERT_SPACE_ERROR			; IF SO BRANCH TO INSERT_SPACE_ERROR
				LDR R7, =FIRST_ELEMENT			; GET THE HEAD
				STR R0, [R7,#0]					; STORE THE ADDRESS TO HEAD
				STR R1, [R0]					; WRITE THE VALUE TO THE ADDRESS
				STR R2, [R0,#4]					; UPDATE THE ADDRESS TO PREVIOUS HEAD VALUE				
				MOVS R0, #0						; MOVE 0 TO R0 AS A SUCCESFULL TASK CODE
				POP {PC}						; POP LR to pc
INSERT_TO_END	MOVS R1, R0;					; MOVE TO BE INSERTED VAL TO R1
				PUSH {LR, R1,R3};				; PUSH R1, R3 AND LR 
				BL Malloc						; CALL MALLOC
				POP {R1,R3};					; POP R1, R3
				CMP R0, #0						; CHECK IF MALLOC GAVE AND ERROR
				BEQ	INSERT_SPACE_ERROR			; IF SO BRANCH TO INSERT_SPACE_ERROR
				STR R0, [R3,#4]					; STORE THE ADDRESS TO PREVIOUS VALUES ADDRESS PART
				STR R1, [R0]					; WRITE THE VALUE TO THE ADDRESS
				MOVS R0, #0						; MOVE 0 TO R0 AS A SUCCESFULL TASK CODE
				POP {PC};						; POP LR to pc
INSERT_F		MOVS R1, R0;					; MOVE TO BE INSERTED VAL TO R1
				PUSH {LR,R1,R2,R3}				; PUSH R1, R2, R3 AND LR 
				BL Malloc						; CALL MALLOC
				POP {R1,R2,R3};					; POP R1, R2, R3
				CMP R0, #0						; CHECK IF MALLOC GAVE AND ERROR
				BEQ	INSERT_SPACE_ERROR			; IF SO BRANCH TO INSERT_SPACE_ERROR
				STR R0, [R3,#4]					; STORE THE ADDRESS TO PREVIOUS VALUES ADDRESS PART
				STR R1, [R0]					; WRITE THE VALUE TO THE ADDRESS
				STR R2, [R0,#4]					; UPDATE THE ADDRESS TO PREVIOUS HEAD VALUE			
				MOVS R0, #0						; MOVE 0 TO R0 AS A SUCCESFULL TASK CODE
				POP {PC}						; POP LR to pc
INSERT_SPACE_ERROR	MOVS R0, #1					; Move 1 ti r0 as a There is no allocable area error code	
					BX LR						; Branch with LR ( Theres no additional function call hence LR is still at same position)
INSERT_EQ_ERROR	 	MOVS R0, #2					; Move 2 to r0 as a Same data is in the array error code	
					BX LR						; Branch with LR ( Theres no additional function call hence LR is still at same position)

;//-------- <<< USER CODE END Insert Function >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************				

;@brief 	This function will be used to remove data from the linked list
;@param		R0 <- the data to delete
;@return    R0 <- Error Code
Remove			FUNCTION			
;//-------- <<< USER CODE BEGIN Remove Function >>> ----------------------		

				LDR R2, =FIRST_ELEMENT			; GET THE ADDRESS OF FIRST ELEMENT GLOBAL VAR
				LDR R4, [R2,#0]					; GET THE ADDRESS OF THE FIRST ELEMENT IN LS
				CMP R4 , #0						; CHECK IF THE LIST IS EMPTY
				BEQ REMOVE_EMPTY_ERR			; IF SO BRANCH TO ERROR PART
				MOV R2, R4						; MOVE THE ADDRESS OF THE FIRST ELEMENT IN LS
				LDR R4, [R2,#0]					; LOAD THE VALUE IN FIRST ELEMENT IN THE LINKED LIST TO R4
				CMP R0 , R4						; CHECK IF THE VALUE IS EQUAL TO THE FIRST VALUE IN THE LS
				BEQ REMOVE_HEAD					; IF SO GO TO REMOVE_HEAD LABEL
				CMP R0 , R4						; CHECK IF THE VALUE IS LOWER THAN THE FIRST VALUE IN THE LS
				BLO REMOVE_NOT_FOUND			; IF SO GO TO REMOVE_NOT_FOUND LABEL	
REMOVEL1		MOV R3, R2						; ITER TAIL
				LDR R2, [R2,#4]					; MOVE THE ITER
				CMP R2 , #0						; CHECK IF THE LINK LIST END HAS BEEN REACHED
				BEQ REMOVE_NOT_FOUND			; IF SO GO TO INSERT_TO_END LABEL
				LDR R4, [R2,#0]					; GET THE VALUE IN THE ITER AND SAVE IT TO R4
				CMP R0, R4 						; CHECK IF THE ITER'S VALUE IS EQUAL TO THE TO BE REMOVED VALUE
				BEQ REMOVE_F					; IF SO GO TO REMOVE_F LABEL
				CMP R0, R4 						; CHECK IF THE ITER'S VALUE IS GREATER THAN THE TO BE REMOVED VALUE
				BLO REMOVE_NOT_FOUND			; IF SO GO TO REMOVE_NOT_FOUND LABEL
				B REMOVEL1						; ELSE GO TO REMOVEL1
REMOVE_HEAD		MOVS R1,R0						; MOVE R0'S VALUE TO R1	JUST IN CASE
				MOVS R0,R2						; MOVE ADDRESS TO R0
				PUSH {LR,R1,R2}					; Push Lr, r1 and r2 to stack
				BL Free							; Call Free function
				POP {R1,R2}						; Pop the r1 and r2 but not the Lr yet
				LDR R3, =FIRST_ELEMENT			; LOAD THE FIRST ELEMENT GLOBAL VARIABLES ADDRESS TO R3
				LDR R4, [R3]					; LOAD THE R3 VALUE TO R4 SO THAT IT POINTS TO FIRST ELEMENT
				LDR R4, [R4,#4]					; LOAD THE ADDRESS IN THE FIRST ELEMENT TO R4 SINCE IT WILL BE THE NEXT HEAD
				STR R4, [R3,#0]					; STORE THE ADDRESS TO R3
				MOVS R3, #0						; MOVE 0 TO R3, R3'S PREVIOUS JOB IS FINISHED
				STR R3, [R2,#0]					; SET THE VALUE IN THE ADDRESS TO 0
				STR R3, [R2,#4]					; SET THE ADDRESS IN THE ADDRESS TO 0
				MOVS R0, #0						; MOVE 0 TO R0 AS A SUCCESFULL TASK CODE
				POP {PC}						; POP LR to pc 
REMOVE_F		MOVS R1,R0						; Move r0's value to r1	just in case
				MOVS R0,R2						; Move address to r0
				PUSH {LR,R1,R2,R3}				; Push lr, r1, r2 and r3 to stack
				BL Free							; Call free function
				POP {R1,R2,R3}					; Pop the r1, r2 and r3 but not the Lr yet
				LDR R4, [R2,#4]					; GET THE ADDRESS OF THE TO BE DELETED NODE AND SAVE IT TO R4
				STR R4, [R3,#4]					; UPDATE THE ADDRESS PART IN THE TAIL TO NEXT NODE
				MOVS R3, #0						; MOVE 0 TO R3, R3'S PREVIOUS JOB IS FINISHED
				STR R3, [R2,#0]					; SET THE VALUE IN THE ADDRESS TO 0
				STR R3, [R2,#4]					; SET THE ADDRESS IN THE ADDRESS TO 0
				MOVS R0, #0						; MOVE 0 TO R0 AS A SUCCESFULL TASK CODE
				POP {PC}						; POP LR to pc 
REMOVE_EMPTY_ERR	MOVS R0, #3					; Move 3 ti r0 as a The linked list is empty error code	
					BX LR						; Branch with LR ( Theres no additional function call hence LR is still at same position)
REMOVE_NOT_FOUND	MOVS R0, #4					; Move 4 ti r0 as a The element is not found error code	
					BX LR						; Branch with LR ( Theres no additional function call hence LR is still at same position)

;//-------- <<< USER CODE END Remove Function >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************				

;@brief 	This function will be used to clear the array and copy the linked list to the array
;@return	R0 <- Error Code
LinkedList2Arr	FUNCTION			
;//-------- <<< USER CODE BEGIN Linked List To Array >>> ----------------------	

				LDR R3, =ARRAY_MEM				; Adress of the Array mem start
				LDR R4, =ARRAY_SIZE				; Size of the Array mem
				MOVS R5, #0						; r5 will be used as an index 
				MOVS R6, #0						; r6 is the constant 0 value
LOOP3			CMP R5, R4						; Compare index with size
				BEQ CONT3						; If they are equal go to CONT3
				STR R6, [R3, R5]				; Store the constant zero value to ARRAY_MEM with index offset
				ADDS R5 , R5, #4				; Increment index by int size
				B LOOP3							; Branch to LOOP3 label
CONT3			MOVS R5, #0						; r5 will be used as an index 
				LDR R0, =FIRST_ELEMENT			; GET THE ADDRESS OF FIRST ELEMENT GLOBAL VAR
				LDR R1, [R0,#0]					; GET THE ADDRESS OF THE FIRST ELEMENT IN LS
				CMP R1 , #0						; CHECK IF THE LIST IS EMPTY
				BEQ LL2A_EMPTY_ERR				; IF SO BRANCH TO ERROR PART
				MOV R0, R1						; MOVE THE ADDRESS OF THE FIRST ELEMENT IN LS
				LDR R1, [R0,#0]					; LOAD THE VALUE IN FIRST ELEMENT IN THE LINKED LIST TO R1
LL2A_LOOP		CMP R0, #0						; CHECK IF THE END OF THE HAS BEEN REACHED				
				BEQ LL2A_END					; Branch to LL2A_END label
				LDR R1, [R0,#0]					; LOAD THE VALUE IN OF THE CURRENT ELEMENT TO R1
				STR R1, [R3, R5]				; SAVE THE VALUE TO ARRAY MEM
				ADDS R5 , R5, #4				; INCREMENT ARRAY MEM INDEX
				LDR R0, [R0,#4]					; MOVE THE ITER
				B LL2A_LOOP						; Branch to LL2A_LOOP label
LL2A_END		MOVS R0, #0						; GAVE THE ERROR CODE 0 FOR SUCCESFUL OPERATION
				BX LR							; Branch with link register
LL2A_EMPTY_ERR	MOVS R0, #5						; GAVE THE CORRESPONDING ERROR CODE
				BX LR							; Branch with link register
				
;//-------- <<< USER CODE END Linked List To Array >>> ------------------------				
				ENDFUNC
				
;*******************************************************************************				

;@brief 	This function will be used to write errors to the error log array.
;@param		R0 -> Index of Input Dataset Array
;@param     R1 -> Error Code 
;@param     R2 -> Operation (Insertion / Deletion / LinkedList2Array)
;@param     R3 -> Data
WriteErrorLog	FUNCTION			
;//-------- <<< USER CODE BEGIN Write Error Log >>> ----------------------															
			
				LSLS R0,R0, #14					; SHIFT R0 TO LEFT FOR 14 BIT	( 16 for operation and -2 for word size )
				LSLS R1,R1, #24					; SHIFT ERROR CODE TO LEFT FOR 24 BIT SO THAT IT CLEARS FIRST 24 BIT
				LSRS R1,R1, #16					; SHIFT ERROR CODE TO RIGHT FOR 16 BIT SO THAT IT GETS TO ITS PLACE
				LSLS R2,R2, #24					; SHIFT OPCODE TO LEFT FOR 24 BIT SO THAT IT CLEARS FIRST 24 BIT
				LSRS R2,R2, #24					; SHIFT OPCODE TO RIGHT FOR 24 BIT SO THAT IT GETS TO ITS PLACE
				ORRS R0,R0, R1					; COMBINE INDEX DS AND ERROR CODE
				ORRS R0,R0, R2					; JOIN OPCODE TO THEM	
				LDR R1, =INDEX_ERROR_LOG		; GET THE INDEX_ERROR_LOG ADDRESS
				LDR R2, [R1]					; GET THE VALUE IN INDEX ERROR LOG
				PUSH {LR,R0,R1,R2,R3}			; PUSH THE USED REGISTERS TO SAVE THEM
				BL GetNow 						; CALL THE GETNOW FUNCTION, IT WILL RETURN CURRENT TIME IN R0
				MOVS R4, R0;					; GET THE CURRENT TIME VALUE AND SAVE IT TO R4
				POP {R0,R1,R2,R3}				; POP THE USED REGISTERS BACK	
				LDR R5, =LOG_MEM				; GET THE LOG_MEM'S STARTING ADDRESS
				STR R0, [R5,R2]					; STORE THE COMBINED INDEX DS, ERRORCODE AND OPCODE TO LOG_MEM
				ADDS R2,R2,#4					; INCREMENT INDEX_ERROR_LOGS VALUE BY 4 BYTE SO THAT IT POINT TO NEXT POSITION
				STR R3, [R5,R2]					; STORE THE DATA TO LOG_MEM
				ADDS R2,R2,#4					; INCREMENT INDEX_ERROR_LOGS VALUE BY 4 BYTE SO THAT IT POINT TO NEXT POSITION
				STR R4, [R5,R2]					; STORE THE TIME STAMP TO LOG_MEM
				ADDS R2,R2,#4					; INCREMENT INDEX_ERROR_LOGS VALUE BY 4 BYTE SO THAT IT POINT TO NEXT POSITION
				STR R2, [R1]					; STORE THE INDEX ERROR LOG VALUE TO ITS POSITION IN MEMORY
				POP {PC}						; POP THE VALUE LR WHICH WAS SAVED IN STACK TO PC SO THAT PROGRAM RETURNS TO FUNCTION CALL
				
;//-------- <<< USER CODE END Write Error Log >>> ------------------------				
				ENDFUNC
				
;@brief 	This function will be used to get working time of the System Tick timer
;@return	R0 <- Working time of the System Tick Timer (in us).			
GetNow			FUNCTION			
;//-------- <<< USER CODE BEGIN Get Now >>> ----------------------															
				LDR R3, =POTSTTI				; GET THE 602 MS VALUE
				LDR R4, =TICK_COUNT				; GET THE TICK COUNT
				LDR R4, [R4]					; Get the value in TICK COUNT
				ADDS R4,R4, #1					; INCREASE TICK COUNT VALUE BY 1
				MULS R3, R4, R3					; MULTIPLY TICK COUNT+1 WITH 602 MS
				LDR R4, =0xE000E018				; GET THE address of reload register
				LDR R4, [R4]					; Get the value in reload register
				LSRS R4, R4, #5					; DIVIDE IT TO 32 THIS VALUE IS THE THE AMOUNT OF MS TO NEXT TICK
				SUBS R3, R3, R4					; SUBTRACT AMOUNT OF NEXT MS FROM THE TICK COUNT+1 * 602	
				MOVS R0,R3						; MOVE R3 TO R0 SINCE R0 IS THE RETURN VALUE
				BX LR							; Branch with link register		
;//-------- <<< USER CODE END Get Now >>> ------------------------
				ENDFUNC
				
;*******************************************************************************	

;//-------- <<< USER CODE BEGIN Functions >>> ----------------------															


;//-------- <<< USER CODE END Functions >>> ------------------------

;*******************************************************************************
;@endsection 		USER_FUNCTIONS
;*******************************************************************************
				ALIGN
				END		; Finish the assembly file
				
;*******************************************************************************
;@endfile 			main.s
;*******************************************************************************				

