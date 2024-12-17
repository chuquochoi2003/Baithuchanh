
_External_ISR:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;BTH5.c,12 :: 		void External_ISR()org 0x0003 ilevel 0 { // Interrupt rutine
;BTH5.c,13 :: 		EA_bit = 0; // Disable Interrupts
	CLR EA_bit+0
;BTH5.c,14 :: 		tmp= 1; // Increment variable cnt
	SETB C
	MOV A, _tmp+0
	MOV #224, C
	MOV _tmp+0, A
;BTH5.c,15 :: 		EA_bit = 1; // Enable Interrupts
	SETB EA_bit+0
;BTH5.c,16 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _External_ISR

_main:
	MOV SP+0, #128
;BTH5.c,17 :: 		void main() { // Main program
;BTH5.c,18 :: 		unsigned int j=0;
;BTH5.c,19 :: 		tmp=0;
	CLR C
	MOV A, _tmp+0
	MOV #224, C
	MOV _tmp+0, A
;BTH5.c,20 :: 		P0 = 0xFF; // Set P0 as output
	MOV P0+0, #255
;BTH5.c,21 :: 		P3 = 0xFF; // Set P3 as input
	MOV P3+0, #255
;BTH5.c,23 :: 		IE = 0x81; // Setting the Interrupts:
	MOV IE+0, #129
;BTH5.c,24 :: 		Lcd_Init(); // Initialize LCD
	LCALL _Lcd_Init+0
;BTH5.c,25 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear LCD
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BTH5.c,26 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BTH5.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BTH5.c,29 :: 		Lcd_Out(1, 1, "Bo dem: ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BTH5+0
	LCALL _LCD_Out+0
;BTH5.c,31 :: 		while(1){
L_main0:
;BTH5.c,33 :: 		if(tmp)
	MOV A, _tmp+0
	JNB 224, L_main2
	NOP
;BTH5.c,35 :: 		cnt=cnt+1;
	MOV A, #1
	ADD A, _cnt+0
	MOV _cnt+0, A
	MOV A, #0
	ADDC A, _cnt+1
	MOV _cnt+1, A
;BTH5.c,36 :: 		tmp=0;
	CLR C
	MOV A, _tmp+0
	MOV #224, C
	MOV _tmp+0, A
;BTH5.c,37 :: 		}
L_main2:
;BTH5.c,38 :: 		P0=cnt;
	MOV P0+0, _cnt+0
;BTH5.c,40 :: 		text[0] = cnt/1000 + 48; // Extract thousands digit
	MOV R0, _text+0
	MOV FLOC__main+0, 0
	MOV R4, #232
	MOV R5, #3
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;BTH5.c,41 :: 		text[1] = (cnt/100)%10 + 48; // Extract hundreds digit
	MOV A, _text+0
	ADD A, #1
	MOV R0, A
	MOV FLOC__main+0, 0
	MOV R4, #100
	MOV R5, #0
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;BTH5.c,42 :: 		text[2] = (cnt/10)%10 + 48; // Extract tens digit
	MOV A, _text+0
	ADD A, #2
	MOV R0, A
	MOV FLOC__main+0, 0
	MOV R4, #10
	MOV R5, #0
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;BTH5.c,43 :: 		text[3] = cnt%10 + 48; // Extract ones digit
	MOV A, _text+0
	ADD A, #3
	MOV R0, A
	MOV FLOC__main+0, 0
	MOV R4, #10
	MOV R5, #0
	MOV R0, _cnt+0
	MOV R1, _cnt+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV A, #48
	ADD A, R0
	MOV R1, A
	MOV R0, FLOC__main+0
	MOV @R0, 1
;BTH5.c,44 :: 		Lcd_Out(2, 6, text);
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #6
	MOV FARG_LCD_Out_text+0, _text+0
	LCALL _LCD_Out+0
;BTH5.c,45 :: 		delay_ms(100); // This is needed for button debounce
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;BTH5.c,46 :: 		}
	LJMP L_main0
;BTH5.c,47 :: 		}
	SJMP #254
; end of _main
