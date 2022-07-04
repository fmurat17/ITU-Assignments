void setup()
{
  asm(
"		JMP start				\n"
"delay: LDI	 r23,  81			\n"	//Delay 1 sec
"w1:	LDI	 r24,  255 			\n"
"w2:	LDI  r25,  255 			\n"
"w3:	DEC  r25  				\n"
"		BRNE w3					\n"
"		DEC  r24				\n"
"		BRNE w2					\n"
"		DEC  r23				\n"
"       BRNE w1					\n"
"		RET						\n"
"f1: 	LDI  r16,  0b00000001	\n" // r16[0] <- 1
"start:							\n" 
"		IN 	 r16,  0x0A ;		\n" // r16 <- DDRD 
"		ORI  r16,  0b11111111	\n"	// r16[0] <- 0b11111111
"		OUT  0x0A, r16			\n" // DDRD <- r16
"		IN   r16,  0x0B ;		\n" // r16 <- PORTD
"		LDI  r16,  0b00000001	\n" // r16[0] <- 1
"		OUT  0x0B, r16			\n" // PORTD <- r16
"		CALL delay				\n"	//Call delay function
  );

}

void loop()
{
  asm(
"LOOP:							\n"
"		IN 	 r16,  0x0B ;		\n" // r16 <- PORTD
"		LSL	 r16	 	   		\n"	// Logical left shift r16[0]
"       CPI  r16, 0b00000000	\n" // Compare r16 with 0
"       BREQ f1					\n" // Call f1 function if r16 is equal to 0
"		OUT  0x0B, r16			\n" // PORTD <- r16
"		CALL delay				\n"	// Call delay function
"		JMP  LOOP				\n"
  );
  
}