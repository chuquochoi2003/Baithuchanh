
_delay_short:
;BTH1_1.c,41 :: 		void delay_short() {
;BTH1_1.c,43 :: 		for (i = 0; i < 200; i++); // Ðieu chinh giá tri i
	MOV delay_short_i_L0+0, #0
	MOV delay_short_i_L0+1, #0
L_delay_short0:
	CLR C
	MOV A, delay_short_i_L0+0
	SUBB A, #200
	MOV A, delay_short_i_L0+1
	SUBB A, #0
	JNC L_delay_short1
	MOV A, #1
	ADD A, delay_short_i_L0+0
	MOV delay_short_i_L0+0, A
	MOV A, #0
	ADDC A, delay_short_i_L0+1
	MOV delay_short_i_L0+1, A
	SJMP L_delay_short0
L_delay_short1:
;BTH1_1.c,44 :: 		}
	RET
; end of _delay_short

_display_letter:
;BTH1_1.c,47 :: 		void display_letter(unsigned char *letter) {       //Con tro den mang chua du lieu cua chu cái can hien thi.
;BTH1_1.c,49 :: 		for (row = 0; row < 8; row++) {
	MOV display_letter_row_L0+0, #0
	MOV display_letter_row_L0+1, #0
L_display_letter3:
	CLR C
	MOV A, display_letter_row_L0+0
	SUBB A, #8
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, display_letter_row_L0+1
	XRL A, #128
	SUBB A, R0
	JNC L_display_letter4
;BTH1_1.c,50 :: 		ROWS = ~(1 << row);
	MOV R1, display_letter_row_L0+0
	MOV A, #1
	INC R1
	SJMP L__display_letter17
L__display_letter18:
	CLR C
	RLC A
L__display_letter17:
	DJNZ R1, L__display_letter18
	MOV R0, A
	XRL A, #255
	MOV P2+0, A
;BTH1_1.c,51 :: 		COLUMNS = letter[row];   //gui du lieu cac hang hien tai den cac cot
	MOV A, FARG_display_letter_letter+0
	ADD A, display_letter_row_L0+0
	MOV R0, A
	MOV P3+0, @R0
;BTH1_1.c,52 :: 		delay_short();
	LCALL _delay_short+0
;BTH1_1.c,53 :: 		ROWS = 0xFF;      //dat cac hang o muc cao sau khi chuyen sang mang khac
	MOV P2+0, #255
;BTH1_1.c,49 :: 		for (row = 0; row < 8; row++) {
	MOV A, #1
	ADD A, display_letter_row_L0+0
	MOV display_letter_row_L0+0, A
	MOV A, #0
	ADDC A, display_letter_row_L0+1
	MOV display_letter_row_L0+1, A
;BTH1_1.c,54 :: 		}
	SJMP L_display_letter3
L_display_letter4:
;BTH1_1.c,55 :: 		}
	RET
; end of _display_letter

_display_name:
;BTH1_1.c,58 :: 		void display_name() {        //khoi tao ham display_name va lay du lieu bang cach goi ham display_letter
;BTH1_1.c,60 :: 		for (i = 0; i < 50; i++) display_letter(letter_H);   //vong lap goi ham display_letter hien thi 50 lan
	MOV display_name_i_L0+0, #0
	MOV display_name_i_L0+1, #0
L_display_name6:
	CLR C
	MOV A, display_name_i_L0+0
	SUBB A, #50
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, display_name_i_L0+1
	XRL A, #128
	SUBB A, R0
	JNC L_display_name7
	MOV FARG_display_letter_letter+0, #_letter_H+0
	LCALL _display_letter+0
	MOV A, #1
	ADD A, display_name_i_L0+0
	MOV display_name_i_L0+0, A
	MOV A, #0
	ADDC A, display_name_i_L0+1
	MOV display_name_i_L0+1, A
	SJMP L_display_name6
L_display_name7:
;BTH1_1.c,61 :: 		for (i = 0; i < 50; i++) display_letter(letter_O);
	MOV display_name_i_L0+0, #0
	MOV display_name_i_L0+1, #0
L_display_name9:
	CLR C
	MOV A, display_name_i_L0+0
	SUBB A, #50
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, display_name_i_L0+1
	XRL A, #128
	SUBB A, R0
	JNC L_display_name10
	MOV FARG_display_letter_letter+0, #_letter_O+0
	LCALL _display_letter+0
	MOV A, #1
	ADD A, display_name_i_L0+0
	MOV display_name_i_L0+0, A
	MOV A, #0
	ADDC A, display_name_i_L0+1
	MOV display_name_i_L0+1, A
	SJMP L_display_name9
L_display_name10:
;BTH1_1.c,62 :: 		for (i = 0; i < 50; i++) display_letter(letter_I);
	MOV display_name_i_L0+0, #0
	MOV display_name_i_L0+1, #0
L_display_name12:
	CLR C
	MOV A, display_name_i_L0+0
	SUBB A, #50
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, display_name_i_L0+1
	XRL A, #128
	SUBB A, R0
	JNC L_display_name13
	MOV FARG_display_letter_letter+0, #_letter_I+0
	LCALL _display_letter+0
	MOV A, #1
	ADD A, display_name_i_L0+0
	MOV display_name_i_L0+0, A
	MOV A, #0
	ADDC A, display_name_i_L0+1
	MOV display_name_i_L0+1, A
	SJMP L_display_name12
L_display_name13:
;BTH1_1.c,63 :: 		}
	RET
; end of _display_name

_main:
	MOV SP+0, #128
;BTH1_1.c,65 :: 		void main() {
;BTH1_1.c,66 :: 		while (1) {
L_main15:
;BTH1_1.c,67 :: 		display_name();
	LCALL _display_name+0
;BTH1_1.c,68 :: 		}
	SJMP L_main15
;BTH1_1.c,69 :: 		}
	SJMP #254
; end of _main
