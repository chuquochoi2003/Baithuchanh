
_mask:
;BTH3.c,6 :: 		unsigned short mask(unsigned short num) {
;BTH3.c,7 :: 		switch (num) {
	SJMP L_mask0
;BTH3.c,8 :: 		case 0 : return 0xC0;
L_mask2:
	MOV R0, #192
	RET
;BTH3.c,9 :: 		case 1 : return 0xF9;
L_mask3:
	MOV R0, #249
	RET
;BTH3.c,10 :: 		case 2 : return 0xA4;
L_mask4:
	MOV R0, #164
	RET
;BTH3.c,11 :: 		case 3 : return 0xB0;
L_mask5:
	MOV R0, #176
	RET
;BTH3.c,12 :: 		case 4 : return 0x99;
L_mask6:
	MOV R0, #153
	RET
;BTH3.c,13 :: 		case 5 : return 0x92;
L_mask7:
	MOV R0, #146
	RET
;BTH3.c,14 :: 		case 6 : return 0x82;
L_mask8:
	MOV R0, #130
	RET
;BTH3.c,15 :: 		case 7 : return 0xF8;
L_mask9:
	MOV R0, #248
	RET
;BTH3.c,16 :: 		case 8 : return 0x80;
L_mask10:
	MOV R0, #128
	RET
;BTH3.c,17 :: 		case 9 : return 0x90;
L_mask11:
	MOV R0, #144
	RET
;BTH3.c,18 :: 		} //case end
L_mask0:
	MOV A, FARG_mask_num+0
	JZ L_mask2
	MOV A, FARG_mask_num+0
	XRL A, #1
	JZ L_mask3
	MOV A, FARG_mask_num+0
	XRL A, #2
	JZ L_mask4
	MOV A, FARG_mask_num+0
	XRL A, #3
	JZ L_mask5
	MOV A, FARG_mask_num+0
	XRL A, #4
	JZ L_mask6
	MOV A, FARG_mask_num+0
	XRL A, #5
	JZ L_mask7
	MOV A, FARG_mask_num+0
	XRL A, #6
	JZ L_mask8
	MOV A, FARG_mask_num+0
	XRL A, #7
	JZ L_mask9
	MOV A, FARG_mask_num+0
	XRL A, #8
	JZ L_mask10
	MOV A, FARG_mask_num+0
	XRL A, #9
	JZ L_mask11
;BTH3.c,19 :: 		}
	RET
; end of _mask

_main:
	MOV SP+0, #128
;BTH3.c,21 :: 		void main() {
;BTH3.c,22 :: 		int n=0;
	MOV main_n_L0+0, #0
	MOV main_n_L0+1, #0
;BTH3.c,23 :: 		digit = 0; // initialize variables
	MOV _digit+0, #0
	MOV _digit+1, #0
;BTH3.c,24 :: 		i = 0;
	MOV _i+0, #0
;BTH3.c,25 :: 		digits_array_index = 0;
	MOV _digits_array_index+0, #0
;BTH3.c,26 :: 		shifter = 2;
	MOV _shifter+0, #2
;BTH3.c,27 :: 		P0 = 0; // Initialize PORT0
	MOV P0+0, #0
;BTH3.c,28 :: 		number = 6789; // some initial value
	MOV _number+0, #133
	MOV _number+1, #26
;BTH3.c,29 :: 		do {
L_main12:
;BTH3.c,30 :: 		for(n=0;n<250;n++)
	MOV main_n_L0+0, #0
	MOV main_n_L0+1, #0
L_main15:
	CLR C
	MOV A, main_n_L0+0
	SUBB A, #250
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, main_n_L0+1
	XRL A, #128
	SUBB A, R0
	JC #3
	LJMP L_main16
;BTH3.c,32 :: 		digit = number / 1000u ; // extract thousands digit
	MOV R4, #232
	MOV R5, #3
	MOV R0, _number+0
	MOV R1, _number+1
	LCALL _Div_16x16_U+0
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3.c,33 :: 		digits_array[3] = mask(digit); // and store it to digits array
	MOV FARG_mask_num+0, 0
	LCALL _mask+0
	MOV _digits_array+3, 0
;BTH3.c,34 :: 		digit = (number / 100u) % 10u; // extract hundreds digit
	MOV R4, #100
	MOV R5, #0
	MOV R0, _number+0
	MOV R1, _number+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3.c,35 :: 		digits_array[2] = mask(digit); // and store it to digits array
	MOV FARG_mask_num+0, 0
	LCALL _mask+0
	MOV _digits_array+2, 0
;BTH3.c,36 :: 		digit = (number / 10u) % 10u; // extract tens digit
	MOV R4, #10
	MOV R5, #0
	MOV R0, _number+0
	MOV R1, _number+1
	LCALL _Div_16x16_U+0
	MOV R4, #10
	MOV R5, #0
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3.c,37 :: 		digits_array[1] = mask(digit); // and store it to digits array
	MOV FARG_mask_num+0, 0
	LCALL _mask+0
	MOV _digits_array+1, 0
;BTH3.c,38 :: 		digit = number % 10u; // extract ones digit
	MOV R4, #10
	MOV R5, #0
	MOV R0, _number+0
	MOV R1, _number+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3.c,39 :: 		digits_array[0] = mask(digit); // and store it to digits array
	MOV FARG_mask_num+0, 0
	LCALL _mask+0
	MOV _digits_array+0, 0
;BTH3.c,41 :: 		P0 = digits_array[0]; P1_0_bit=1; Delay_ms(1);P1_0_bit=0;
	MOV P0+0, 0
	SETB P1_0_bit+0
	MOV R6, 2
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	NOP
	CLR P1_0_bit+0
;BTH3.c,42 :: 		P0 = digits_array[1]; P1_1_bit=1; Delay_ms(1);P1_1_bit=0;
	MOV P0+0, _digits_array+1
	SETB P1_1_bit+0
	MOV R6, 2
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	NOP
	CLR P1_1_bit+0
;BTH3.c,43 :: 		P0 = digits_array[2]; P1_2_bit=1; Delay_ms(1);P1_2_bit=0;
	MOV P0+0, _digits_array+2
	SETB P1_2_bit+0
	MOV R6, 2
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	NOP
	CLR P1_2_bit+0
;BTH3.c,44 :: 		P0 = digits_array[3]; P1_3_bit=1; Delay_ms(1);P1_3_bit=0;
	MOV P0+0, _digits_array+3
	SETB P1_3_bit+0
	MOV R6, 2
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	NOP
	CLR P1_3_bit+0
;BTH3.c,30 :: 		for(n=0;n<250;n++)
	MOV A, #1
	ADD A, main_n_L0+0
	MOV main_n_L0+0, A
	MOV A, #0
	ADDC A, main_n_L0+1
	MOV main_n_L0+1, A
;BTH3.c,45 :: 		}
	LJMP L_main15
L_main16:
;BTH3.c,46 :: 		number=number-1;
	CLR C
	MOV A, _number+0
	SUBB A, #1
	MOV _number+0, A
	MOV A, _number+1
	SUBB A, #0
	MOV _number+1, A
;BTH3.c,47 :: 		} while(1);
	LJMP L_main12
;BTH3.c,48 :: 		}
	SJMP #254
; end of _main
