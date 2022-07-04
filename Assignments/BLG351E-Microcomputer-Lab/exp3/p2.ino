void setup()
{
  asm(
"		JMP start				\n"
"delay: LDI	 r23,  20			\n"	//Delay 1 sec
"w1:	LDI	 r24,  255 			\n"
"w2:	LDI  r25,  255 			\n"
"w3:	DEC  r25  				\n"
"		BRNE w3					\n"
"		DEC  r24				\n"
"		BRNE w2					\n"
"		DEC  r23				\n"
"       BRNE w1					\n"
"		RET						\n"
"increment:						\n"
"		INC  r17				\n"	//Increment r17 value by 1
"		JMP  done				\n"	//Go to done block
"decrement:						\n"
"		CPI  r17,  0b00000001	\n"	//If(r17 == 1)
"		BREQ one				\n"	//Go to one block
"		CPI  r17,  0b00000000	\n"	//If(r17 == 0)	
"		BREQ if2				\n"	//Go to zero block
"		DEC  r17				\n"	//else { decrement r17 value by 1
"		JMP  out				\n"	//go to done2 }
"one:							\n"
"		DEC  r17				\n"	//Decrement r17 value by 1
"		JMP  out				\n"	//Go to out block
"if:							\n"
" 	    INC  r19				\n"	//Increment r19 value by 1
" 	    LDI  r17,  0b00000000	\n"	//Set the r17 to 0(reset).
"		JMP  out				\n"	//Go to out block
"if2:							\n"
" 	    DEC  r19				\n"	//Decrement r19 value by 1
" 	    LDI  r17,  0b00001001	\n"	//Set the r17 to 0(reset).
"		JMP  out				\n" //Go to out block  
"start:							\n" //Setting start values
"		IN 	 r17,  0x04 ;		\n"   
"		ORI  r17,  0b11001111	\n"	//  DDRB 0b11001111
"		OUT  0x04, r17			\n" //  DDRB <- r17
"		IN 	 r18,  0x07 ;		\n"   
"		ORI  r18,  0b11111111	\n"	//  DDRC 0b11111111
"		OUT  0x07, r18			\n" //  DDRB <- r18
"		LDI  r17,  0b00000000	\n"	// PORTB initial 000000000
"		LDI  r19,  0b00000000	\n"	// PORTC initial 000000000
"		LDI  r20,  0b00000000	\n"	// PINB initial 000000000
"		CALL delay				\n"	//Call delay function
  );

}

void loop()
{
  asm(
"LOOP:							\n"
"		IN   r20,  0x03			\n"	//r20 <- PINB
"		IN 	 r17,  0x05 ;		\n" //r17 <- PORTB
"		IN 	 r19,  0x08 ;		\n" //r19 <- PORTC
"		CPI  r20,  0b00100000   \n"	//If(PINB >= 00100000(32))
"		BRGE decrement			\n"	//Go to decrement block
"		CPI  r20,  0b00010000	\n"	//If(PINB >= 00010000(16))
"		BRGE increment			\n"	//Go to increment block
"		JMP out					\n"	//else go to out block
"done:							\n"
"		CPI  r17,  0b00001010   \n"	//If(PORTB == 0001010(10))
"		BREQ if					\n"	//Go to if block
"out:							\n"
"		OUT  0x05, r17			\n"	//Display r17 value on the firts seven-segment display
"		OUT  0x08, r19			\n"	//Display r19 value on the second seven-segment display
"		CALL delay				\n"	//Call delay function
"		JMP  LOOP				\n"
  );
  
}