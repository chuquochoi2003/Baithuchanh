
_main:
	MOV SP+0, #128
;BTH2_1.c,14 :: 		void main() {
;BTH2_1.c,15 :: 		Keypad_Init(); // Khoi tao ban phim
	LCALL _Keypad_Init+0
;BTH2_1.c,16 :: 		Lcd_Init(); // khoi tao LCD
	LCALL _Lcd_Init+0
;BTH2_1.c,17 :: 		Lcd_Cmd(_LCD_CLEAR); // xoa man hinh
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BTH2_1.c,18 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //  Tat con tro tren man hinh
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BTH2_1.c,19 :: 		Lcd_Out(1, 1, "Bin : "); // hien thi chu Bin hang 1, cot 1
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_BTH2_1+0
	LCALL _LCD_Out+0
;BTH2_1.c,20 :: 		Lcd_Out(2, 1, "Hex: ");  // hien thi chu Hex len hang 2, cot 1
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BTH2_1+0
	LCALL _LCD_Out+0
;BTH2_1.c,21 :: 		do {
L_main0:
;BTH2_1.c,22 :: 		kp = 0; // Reset key code variable
	MOV _kp+0, #0
;BTH2_1.c,23 :: 		do
L_main3:
;BTH2_1.c,24 :: 		kp = Keypad_Key_Click(); // Doi va doc gia tri phim bam
	LCALL _Keypad_Key_Click+0
	MOV _kp+0, 0
;BTH2_1.c,25 :: 		while (!kp);
	MOV A, R0
	JZ L_main3
;BTH2_1.c,26 :: 		switch (kp) {
	SJMP L_main6
;BTH2_1.c,27 :: 		case 1:
L_main8:
;BTH2_1.c,28 :: 		kp = 49;   //gan kp=49
	MOV _kp+0, #49
;BTH2_1.c,29 :: 		bin[i]=1;       // luu gia tri 1 vao mang bin
	MOV A, #_bin+0
	ADD A, _i+0
	MOV R0, A
	MOV @R0, #1
;BTH2_1.c,30 :: 		i++;          // tang i len 1 don vi
	INC _i+0
;BTH2_1.c,31 :: 		break; //  thoat khoi case nay
	LJMP L_main7
;BTH2_1.c,32 :: 		case 14:
L_main9:
;BTH2_1.c,33 :: 		kp = 48;
	MOV _kp+0, #48
;BTH2_1.c,34 :: 		bin[i]=0;
	MOV A, #_bin+0
	ADD A, _i+0
	MOV R0, A
	MOV @R0, #0
;BTH2_1.c,35 :: 		i++;
	INC _i+0
;BTH2_1.c,36 :: 		break; // 0
	SJMP L_main7
;BTH2_1.c,37 :: 		case 15:
L_main10:
;BTH2_1.c,38 :: 		i=0;  //dat lai gia tri cua i
	MOV _i+0, #0
;BTH2_1.c,39 :: 		cot=8;
	MOV _cot+0, #8
;BTH2_1.c,40 :: 		break; // #
	SJMP L_main7
;BTH2_1.c,41 :: 		case 16:
L_main11:
;BTH2_1.c,42 :: 		Dec=bin[0]*8+bin[1]*4+bin[2]*2+bin[3]*1;// tinh toan chuyen doi nhi phan sang thap phan
	MOV R0, #3
	MOV A, _bin+0
	INC R0
	SJMP L__main31
L__main32:
	CLR C
	RLC A
L__main31:
	DJNZ R0, L__main32
	MOV _Dec+0, A
	MOV R1, #2
	MOV A, _bin+1
	INC R1
	SJMP L__main33
L__main34:
	CLR C
	RLC A
L__main33:
	DJNZ R1, L__main34
	MOV R0, A
	MOV A, _Dec+0
	ADD A, R0
	MOV _Dec+0, A
	MOV R1, #1
	MOV A, _bin+2
	INC R1
	SJMP L__main35
L__main36:
	CLR C
	RLC A
L__main35:
	DJNZ R1, L__main36
	MOV R0, A
	MOV A, _Dec+0
	ADD A, R0
	MOV _Dec+0, A
	MOV R0, _bin+3
	MOV A, _Dec+0
	ADD A, R0
	MOV _Dec+0, A
;BTH2_1.c,43 :: 		flag=1;   // bat co len 1 bao da tinh xong
	MOV _flag+0, #1
;BTH2_1.c,44 :: 		break; // D
	SJMP L_main7
;BTH2_1.c,45 :: 		}
L_main6:
	MOV A, _kp+0
	XRL A, #1
	JZ L_main8
	MOV A, _kp+0
	XRL A, #14
	JZ L_main9
	MOV A, _kp+0
	XRL A, #15
	JZ L_main10
	MOV A, _kp+0
	XRL A, #16
	JZ L_main11
L_main7:
;BTH2_1.c,46 :: 		if(flag==1){
	MOV A, _flag+0
	XRL A, #1
	JZ #3
	LJMP L_main12
;BTH2_1.c,47 :: 		switch (Dec)     // Chuyen doi gia tri Dec sang gia tri thap luc phan
	SJMP L_main13
;BTH2_1.c,49 :: 		case 0:
L_main15:
;BTH2_1.c,50 :: 		Hex = 48;
	MOV _Hex+0, #48
;BTH2_1.c,51 :: 		break; // 0
	LJMP L_main14
;BTH2_1.c,52 :: 		case 1:
L_main16:
;BTH2_1.c,53 :: 		Hex = 49;
	MOV _Hex+0, #49
;BTH2_1.c,54 :: 		break; // 1
	LJMP L_main14
;BTH2_1.c,55 :: 		case 2:
L_main17:
;BTH2_1.c,56 :: 		Hex = 50;
	MOV _Hex+0, #50
;BTH2_1.c,57 :: 		break; // 2
	LJMP L_main14
;BTH2_1.c,58 :: 		case 3:
L_main18:
;BTH2_1.c,59 :: 		Hex = 51;
	MOV _Hex+0, #51
;BTH2_1.c,60 :: 		break; // 3
	LJMP L_main14
;BTH2_1.c,61 :: 		case 4:
L_main19:
;BTH2_1.c,62 :: 		Hex = 52;
	MOV _Hex+0, #52
;BTH2_1.c,63 :: 		break; // 4
	LJMP L_main14
;BTH2_1.c,64 :: 		case 5:
L_main20:
;BTH2_1.c,65 :: 		Hex = 53;
	MOV _Hex+0, #53
;BTH2_1.c,66 :: 		break; // 5
	LJMP L_main14
;BTH2_1.c,67 :: 		case 6:
L_main21:
;BTH2_1.c,68 :: 		Hex = 54;
	MOV _Hex+0, #54
;BTH2_1.c,69 :: 		break; // 6
	LJMP L_main14
;BTH2_1.c,70 :: 		case 7:
L_main22:
;BTH2_1.c,71 :: 		Hex = 55;
	MOV _Hex+0, #55
;BTH2_1.c,72 :: 		break; // 7
	LJMP L_main14
;BTH2_1.c,73 :: 		case 8:
L_main23:
;BTH2_1.c,74 :: 		Hex = 56;
	MOV _Hex+0, #56
;BTH2_1.c,75 :: 		break; // 8
	LJMP L_main14
;BTH2_1.c,76 :: 		case 9:
L_main24:
;BTH2_1.c,77 :: 		Hex = 57;
	MOV _Hex+0, #57
;BTH2_1.c,78 :: 		break; // 9
	LJMP L_main14
;BTH2_1.c,79 :: 		case 10:
L_main25:
;BTH2_1.c,80 :: 		Hex = 65;
	MOV _Hex+0, #65
;BTH2_1.c,81 :: 		break; // A
	LJMP L_main14
;BTH2_1.c,82 :: 		case 11:
L_main26:
;BTH2_1.c,83 :: 		Hex = 66;
	MOV _Hex+0, #66
;BTH2_1.c,84 :: 		break; // B
	LJMP L_main14
;BTH2_1.c,85 :: 		case 12:
L_main27:
;BTH2_1.c,86 :: 		Hex = 67;
	MOV _Hex+0, #67
;BTH2_1.c,87 :: 		break; // C
	LJMP L_main14
;BTH2_1.c,88 :: 		case 13:
L_main28:
;BTH2_1.c,89 :: 		Hex = 68;
	MOV _Hex+0, #68
;BTH2_1.c,90 :: 		break; // D
	LJMP L_main14
;BTH2_1.c,91 :: 		case 14:
L_main29:
;BTH2_1.c,92 :: 		Hex = 69;
	MOV _Hex+0, #69
;BTH2_1.c,93 :: 		break; // E
	LJMP L_main14
;BTH2_1.c,94 :: 		case 15:
L_main30:
;BTH2_1.c,95 :: 		Hex = 70;
	MOV _Hex+0, #70
;BTH2_1.c,96 :: 		break; // F
	LJMP L_main14
;BTH2_1.c,97 :: 		}
L_main13:
	MOV A, _Dec+0
	JZ L_main15
	MOV A, _Dec+0
	XRL A, #1
	JZ L_main16
	MOV A, _Dec+0
	XRL A, #2
	JZ L_main17
	MOV A, _Dec+0
	XRL A, #3
	JZ L_main18
	MOV A, _Dec+0
	XRL A, #4
	JZ L_main19
	MOV A, _Dec+0
	XRL A, #5
	JZ L_main20
	MOV A, _Dec+0
	XRL A, #6
	JZ L_main21
	MOV A, _Dec+0
	XRL A, #7
	JZ L_main22
	MOV A, _Dec+0
	XRL A, #8
	JZ L_main23
	MOV A, _Dec+0
	XRL A, #9
	JNZ #3
	LJMP L_main24
	MOV A, _Dec+0
	XRL A, #10
	JNZ #3
	LJMP L_main25
	MOV A, _Dec+0
	XRL A, #11
	JNZ #3
	LJMP L_main26
	MOV A, _Dec+0
	XRL A, #12
	JNZ #3
	LJMP L_main27
	MOV A, _Dec+0
	XRL A, #13
	JNZ #3
	LJMP L_main28
	MOV A, _Dec+0
	XRL A, #14
	JNZ #3
	LJMP L_main29
	MOV A, _Dec+0
	XRL A, #15
	JNZ #3
	LJMP L_main30
L_main14:
;BTH2_1.c,98 :: 		}
L_main12:
;BTH2_1.c,99 :: 		Lcd_Chr(2, 7, Hex);// Hien thi gia tri tuong duong voi Hex tai dong 2, cot 7
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #7
	MOV FARG_Lcd_Chr_out_char+0, _Hex+0
	LCALL _Lcd_Chr+0
;BTH2_1.c,100 :: 		cot++;
	INC _cot+0
;BTH2_1.c,101 :: 		Lcd_Chr(1, cot, kp);    // Hien thi gia tri cua kp tai dong 1
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, _cot+0
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
;BTH2_1.c,102 :: 		} while (1); // Vong lap vo han cho chuong trinh chay lien tuc
	LJMP L_main0
;BTH2_1.c,103 :: 		}
	SJMP #254
; end of _main
