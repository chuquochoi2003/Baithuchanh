
_main:
	MOV SP+0, #128
;BTH2.c,12 :: 		void main() {
;BTH2.c,13 :: 		cnt = 0; // dat lai bo dem
	MOV _cnt+0, #0
;BTH2.c,14 :: 		Keypad_Init(); // khoi tao bo dem
	LCALL _Keypad_Init+0
;BTH2.c,15 :: 		Lcd_Init(); // khoi tao LCD
	LCALL _Lcd_Init+0
;BTH2.c,16 :: 		Lcd_Cmd(_LCD_CLEAR); // xoa man hinh
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BTH2.c,17 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // tat con tro
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BTH2.c,18 :: 		Lcd_Out(1, 1, "Key :"); // hien thi key tren dong 1, cot 1
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_BTH2+0
	LCALL _LCD_Out+0
;BTH2.c,19 :: 		Lcd_Out(2, 1, "Times:");// hien thi time tren dong 2, cot 1
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BTH2+0
	LCALL _LCD_Out+0
;BTH2.c,21 :: 		do {
L_main0:
;BTH2.c,23 :: 		kp = 0; // Reset key code variable
	MOV _kp+0, #0
;BTH2.c,24 :: 		do
L_main3:
;BTH2.c,25 :: 		kp = Keypad_Key_Click(); // kiem tra trang thai phim
	LCALL _Keypad_Key_Click+0
	MOV _kp+0, 0
;BTH2.c,26 :: 		while (!kp);   // cho co phim bam tra ve gia tri khac 0
	MOV A, R0
	JZ L_main3
;BTH2.c,28 :: 		switch (kp) // anh xa cac ma phim thanh ma ASCII
	SJMP L_main6
;BTH2.c,30 :: 		case 1: kp = 49; break; // 1
L_main8:
	MOV _kp+0, #49
	LJMP L_main7
;BTH2.c,31 :: 		case 2: kp = 50; break; // 2
L_main9:
	MOV _kp+0, #50
	LJMP L_main7
;BTH2.c,32 :: 		case 3: kp = 51; break; // 3
L_main10:
	MOV _kp+0, #51
	LJMP L_main7
;BTH2.c,33 :: 		case 4: kp = 65; break; // A
L_main11:
	MOV _kp+0, #65
	LJMP L_main7
;BTH2.c,34 :: 		case 5: kp = 52; break; // 4
L_main12:
	MOV _kp+0, #52
	LJMP L_main7
;BTH2.c,35 :: 		case 6: kp = 53; break; // 5
L_main13:
	MOV _kp+0, #53
	LJMP L_main7
;BTH2.c,36 :: 		case 7: kp = 54; break; // 6
L_main14:
	MOV _kp+0, #54
	LJMP L_main7
;BTH2.c,37 :: 		case 8: kp = 66; break; // B
L_main15:
	MOV _kp+0, #66
	LJMP L_main7
;BTH2.c,38 :: 		case 9: kp = 55; break; // 7
L_main16:
	MOV _kp+0, #55
	LJMP L_main7
;BTH2.c,39 :: 		case 10: kp = 56; break; // 8
L_main17:
	MOV _kp+0, #56
	LJMP L_main7
;BTH2.c,40 :: 		case 11: kp = 57; break; // 9
L_main18:
	MOV _kp+0, #57
	LJMP L_main7
;BTH2.c,41 :: 		case 12: kp = 67; break; // C
L_main19:
	MOV _kp+0, #67
	LJMP L_main7
;BTH2.c,42 :: 		case 13: kp = 42; break; // *
L_main20:
	MOV _kp+0, #42
	LJMP L_main7
;BTH2.c,43 :: 		case 14: kp = 48; break; // 0
L_main21:
	MOV _kp+0, #48
	LJMP L_main7
;BTH2.c,44 :: 		case 15: kp = 35; break; // #
L_main22:
	MOV _kp+0, #35
	LJMP L_main7
;BTH2.c,45 :: 		case 16: kp = 68; break; // D
L_main23:
	MOV _kp+0, #68
	LJMP L_main7
;BTH2.c,46 :: 		}
L_main6:
	MOV A, _kp+0
	XRL A, #1
	JZ L_main8
	MOV A, _kp+0
	XRL A, #2
	JZ L_main9
	MOV A, _kp+0
	XRL A, #3
	JZ L_main10
	MOV A, _kp+0
	XRL A, #4
	JZ L_main11
	MOV A, _kp+0
	XRL A, #5
	JZ L_main12
	MOV A, _kp+0
	XRL A, #6
	JZ L_main13
	MOV A, _kp+0
	XRL A, #7
	JZ L_main14
	MOV A, _kp+0
	XRL A, #8
	JZ L_main15
	MOV A, _kp+0
	XRL A, #9
	JZ L_main16
	MOV A, _kp+0
	XRL A, #10
	JNZ #3
	LJMP L_main17
	MOV A, _kp+0
	XRL A, #11
	JNZ #3
	LJMP L_main18
	MOV A, _kp+0
	XRL A, #12
	JNZ #3
	LJMP L_main19
	MOV A, _kp+0
	XRL A, #13
	JNZ #3
	LJMP L_main20
	MOV A, _kp+0
	XRL A, #14
	JNZ #3
	LJMP L_main21
	MOV A, _kp+0
	XRL A, #15
	JNZ #3
	LJMP L_main22
	MOV A, _kp+0
	XRL A, #16
	JNZ #3
	LJMP L_main23
L_main7:
;BTH2.c,47 :: 		if (kp != oldstate) { // kiem tra phim hien tai khac phim truoc do khong
	MOV A, _kp+0
	XRL A, _oldstate+0
	JZ L_main24
;BTH2.c,48 :: 		cnt = 1;
	MOV _cnt+0, #1
;BTH2.c,49 :: 		oldstate = kp;}  // luu lai ma phim vua duoc nhan
	MOV _oldstate+0, _kp+0
	SJMP L_main25
L_main24:
;BTH2.c,51 :: 		cnt++;}
	INC _cnt+0
L_main25:
;BTH2.c,52 :: 		Lcd_Chr(1, 10, kp); // hien thi ma ASCII cua phim  len hang 1 cot 10
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, #10
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
;BTH2.c,53 :: 		if (cnt == 255) { // If counter variable overflow
	MOV A, _cnt+0
	XRL A, #255
	JNZ L_main26
;BTH2.c,54 :: 		cnt = 0;
	MOV _cnt+0, #0
;BTH2.c,55 :: 		Lcd_Out(2, 10, " ");}   // xoa hien thi tai dong 2 cot 10
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #10
	MOV FARG_LCD_Out_text+0, #?lstr3_BTH2+0
	LCALL _LCD_Out+0
L_main26:
;BTH2.c,56 :: 		WordToStr(cnt, txt); // chuyen gia tri so lan nhan phim sang dang chuoi va luu vao bien txt
	MOV FARG_WordToStr_input+0, _cnt+0
	CLR A
	MOV FARG_WordToStr_input+1, A
	MOV FARG_WordToStr_output+0, #_txt+0
	LCALL _WordToStr+0
;BTH2.c,57 :: 		Lcd_Out(2, 10, txt); // hien thi len lcd gia tri  bien txt hang 2 cot 10
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #10
	MOV FARG_LCD_Out_text+0, #_txt+0
	LCALL _LCD_Out+0
;BTH2.c,58 :: 		} while (1);    // Duy tri vong lap vo han de thuc hien chuong trinh
	LJMP L_main0
;BTH2.c,59 :: 		}
	SJMP #254
; end of _main
