
_main:
	MOV SP+0, #128
;BTH1.c,1 :: 		void main() {
;BTH1.c,4 :: 		P0 = 0xFF;    //Khoi tao cac PORT voi gia tri muc cao
	MOV P0+0, #255
;BTH1.c,5 :: 		P1 = 0xFF;
	MOV P1+0, #255
;BTH1.c,6 :: 		P2 = 0xFF;
	MOV P2+0, #255
;BTH1.c,7 :: 		P3 = 0xFF;
	MOV P3+0, #255
;BTH1.c,9 :: 		while (1) {
L_main0:
;BTH1.c,10 :: 		for (i = 0; i < 9; i++) {       //Tao ra so nhi phân voi bit 1 tai vi trí thu i, các bit khác là 0.
	MOV main_i_L0+0, #0
L_main2:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main3
;BTH1.c,11 :: 		P0 = ~(1 << i);           //Ðao tat ca các bit
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main14
L__main15:
	CLR C
	RLC A
L__main14:
	DJNZ R1, L__main15
	MOV R0, A
	XRL A, #255
	MOV P0+0, A
;BTH1.c,12 :: 		Delay_ms(1000);           //Tao do tre 1s
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BTH1.c,10 :: 		for (i = 0; i < 9; i++) {       //Tao ra so nhi phân voi bit 1 tai vi trí thu i, các bit khác là 0.
	INC main_i_L0+0
;BTH1.c,13 :: 		}
	SJMP L_main2
L_main3:
;BTH1.c,15 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main5:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main6
;BTH1.c,16 :: 		P1 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main16
L__main17:
	CLR C
	RLC A
L__main16:
	DJNZ R1, L__main17
	MOV R0, A
	XRL A, #255
	MOV P1+0, A
;BTH1.c,17 :: 		Delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BTH1.c,15 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BTH1.c,18 :: 		}
	SJMP L_main5
L_main6:
;BTH1.c,20 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main8:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main9
;BTH1.c,21 :: 		P2 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main18
L__main19:
	CLR C
	RLC A
L__main18:
	DJNZ R1, L__main19
	MOV R0, A
	XRL A, #255
	MOV P2+0, A
;BTH1.c,22 :: 		Delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BTH1.c,20 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BTH1.c,23 :: 		}
	SJMP L_main8
L_main9:
;BTH1.c,25 :: 		for (i = 0; i < 9; i++) {
	MOV main_i_L0+0, #0
L_main11:
	CLR C
	MOV A, main_i_L0+0
	SUBB A, #9
	JNC L_main12
;BTH1.c,26 :: 		P3 = ~(1 << i);
	MOV R1, main_i_L0+0
	MOV A, #1
	INC R1
	SJMP L__main20
L__main21:
	CLR C
	RLC A
L__main20:
	DJNZ R1, L__main21
	MOV R0, A
	XRL A, #255
	MOV P3+0, A
;BTH1.c,27 :: 		Delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;BTH1.c,25 :: 		for (i = 0; i < 9; i++) {
	INC main_i_L0+0
;BTH1.c,28 :: 		}
	SJMP L_main11
L_main12:
;BTH1.c,29 :: 		}
	LJMP L_main0
;BTH1.c,30 :: 		}
	SJMP #254
; end of _main
