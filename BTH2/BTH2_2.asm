
_hexToDec:
;BTH2_2.c,15 :: 		unsigned short hexToDec(char hex)      //chuyen doi mot ki tu Hex thanh so thap phan
;BTH2_2.c,17 :: 		if (hex >= '0' && hex <= '9') {
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #48
	JC L_hexToDec2
	SETB C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #57
	JNC L_hexToDec2
L__hexToDec47:
;BTH2_2.c,18 :: 		return hex - '0';//gia tri 0 tuong duong 48 lay gia tri dec
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #48
	MOV R0, A
	RET
;BTH2_2.c,19 :: 		} else if (hex >= 'A' && hex <= 'F')
L_hexToDec2:
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #65
	JC L_hexToDec6
	SETB C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #70
	JNC L_hexToDec6
L__hexToDec46:
;BTH2_2.c,21 :: 		return hex - 'A' + 10;
	CLR C
	MOV A, FARG_hexToDec_hex+0
	SUBB A, #65
	MOV R1, A
	MOV R0, #10
	MOV A, R1
	ADD A, R0
	MOV R0, A
	RET
;BTH2_2.c,22 :: 		}
L_hexToDec6:
;BTH2_2.c,23 :: 		return 0;// neu Hex khong nam trong hai khoang tren tra ve gia tri 0
	MOV R0, #0
;BTH2_2.c,24 :: 		}
	RET
; end of _hexToDec

_decToHex:
;BTH2_2.c,25 :: 		char decToHex(unsigned short dec)//chuyen doi mot so thap phan thanh ki tu thap luc phan
;BTH2_2.c,27 :: 		if (dec >= 0 && dec <= 9) {
	CLR C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #0
	JC L_decToHex9
	SETB C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #9
	JNC L_decToHex9
L__decToHex49:
;BTH2_2.c,28 :: 		return dec + '0';   //vi du 5+48
	MOV A, FARG_decToHex_dec+0
	ADD A, #48
	MOV R0, A
	RET
;BTH2_2.c,29 :: 		} else if (dec >= 10 && dec <= 15) {
L_decToHex9:
	CLR C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #10
	JC L_decToHex13
	SETB C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #15
	JNC L_decToHex13
L__decToHex48:
;BTH2_2.c,30 :: 		return dec - 10 + 'A';
	CLR C
	MOV A, FARG_decToHex_dec+0
	SUBB A, #10
	MOV R1, A
	MOV R0, #65
	MOV A, R1
	ADD A, R0
	MOV R0, A
	RET
;BTH2_2.c,31 :: 		}
L_decToHex13:
;BTH2_2.c,32 :: 		return '0';
	MOV R0, #48
;BTH2_2.c,33 :: 		}
	RET
; end of _decToHex

_main:
	MOV SP+0, #128
;BTH2_2.c,34 :: 		void main() {
;BTH2_2.c,35 :: 		unsigned short firstNumber = 0, secondNumber = 0, sum, product; // khai bao bien firstnumber va secondnumber va gan chung bang 0 luu gia tri cua 2 so
	MOV main_firstNumber_L0+0, #0
	MOV main_secondNumber_L0+0, #0
	MOV main_inputCount_L0+0, #0
;BTH2_2.c,37 :: 		unsigned short inputCount = 0;      //khai bao bien inputcount va gan gia tri bang 0 bien luu so lan nguoi dung nhap gia tri
;BTH2_2.c,38 :: 		Keypad_Init(); // Khoi tao ban phim
	LCALL _Keypad_Init+0
;BTH2_2.c,39 :: 		Lcd_Init(); // khoi tao man hinh lcd
	LCALL _Lcd_Init+0
;BTH2_2.c,40 :: 		Lcd_Cmd(_LCD_CLEAR); // xoa man hinh lcd
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BTH2_2.c,41 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // tat con tro tren man hinh
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;BTH2_2.c,42 :: 		Lcd_Out(1, 1, "So1: "); // hien thi so1 len hang 1, cot 1
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_BTH2_2+0
	LCALL _LCD_Out+0
;BTH2_2.c,43 :: 		Lcd_Out(2, 1, "So2: "); // hien thi so 2 len hang 2, cot 1
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_BTH2_2+0
	LCALL _LCD_Out+0
;BTH2_2.c,44 :: 		do {
L_main14:
;BTH2_2.c,45 :: 		kp = 0; // gan bien kp =0
	MOV _kp+0, #0
;BTH2_2.c,46 :: 		do
L_main17:
;BTH2_2.c,47 :: 		kp = Keypad_Key_Click(); // doi khi co phim bam
	LCALL _Keypad_Key_Click+0
	MOV _kp+0, 0
;BTH2_2.c,48 :: 		while (!kp);
	MOV A, R0
	JZ L_main17
;BTH2_2.c,49 :: 		switch (kp) {
	SJMP L_main20
;BTH2_2.c,50 :: 		case 1:
L_main22:
;BTH2_2.c,51 :: 		kp = '1';
	MOV _kp+0, #49
;BTH2_2.c,52 :: 		break; // 1
	LJMP L_main21
;BTH2_2.c,53 :: 		case 2:
L_main23:
;BTH2_2.c,54 :: 		kp = '2';
	MOV _kp+0, #50
;BTH2_2.c,55 :: 		break; // 2
	LJMP L_main21
;BTH2_2.c,56 :: 		case 3:
L_main24:
;BTH2_2.c,57 :: 		kp = '3';
	MOV _kp+0, #51
;BTH2_2.c,58 :: 		break; // 3
	LJMP L_main21
;BTH2_2.c,59 :: 		case 4:
L_main25:
;BTH2_2.c,60 :: 		kp = 'A';
	MOV _kp+0, #65
;BTH2_2.c,61 :: 		break; // A
	LJMP L_main21
;BTH2_2.c,62 :: 		case 5:
L_main26:
;BTH2_2.c,63 :: 		kp = '4';
	MOV _kp+0, #52
;BTH2_2.c,64 :: 		break; // 4
	LJMP L_main21
;BTH2_2.c,65 :: 		case 6:
L_main27:
;BTH2_2.c,66 :: 		kp = '5';
	MOV _kp+0, #53
;BTH2_2.c,67 :: 		break; // 5
	LJMP L_main21
;BTH2_2.c,68 :: 		case 7:
L_main28:
;BTH2_2.c,69 :: 		kp = '6';
	MOV _kp+0, #54
;BTH2_2.c,70 :: 		break; // 6
	LJMP L_main21
;BTH2_2.c,71 :: 		case 8:
L_main29:
;BTH2_2.c,72 :: 		kp = 'B';
	MOV _kp+0, #66
;BTH2_2.c,73 :: 		break; // B
	LJMP L_main21
;BTH2_2.c,74 :: 		case 9:
L_main30:
;BTH2_2.c,75 :: 		kp = '7';
	MOV _kp+0, #55
;BTH2_2.c,76 :: 		break; // 7
	LJMP L_main21
;BTH2_2.c,77 :: 		case 10:
L_main31:
;BTH2_2.c,78 :: 		kp = '8';
	MOV _kp+0, #56
;BTH2_2.c,79 :: 		break; // 8
	LJMP L_main21
;BTH2_2.c,80 :: 		case 11:
L_main32:
;BTH2_2.c,81 :: 		kp = '9';
	MOV _kp+0, #57
;BTH2_2.c,82 :: 		break; // 9
	LJMP L_main21
;BTH2_2.c,83 :: 		case 12:
L_main33:
;BTH2_2.c,84 :: 		kp = 'C';
	MOV _kp+0, #67
;BTH2_2.c,85 :: 		break; // C
	LJMP L_main21
;BTH2_2.c,86 :: 		case 13:
L_main34:
;BTH2_2.c,87 :: 		kp = '*';
	MOV _kp+0, #42
;BTH2_2.c,88 :: 		break; // *
	LJMP L_main21
;BTH2_2.c,89 :: 		case 14:
L_main35:
;BTH2_2.c,90 :: 		kp = '0';
	MOV _kp+0, #48
;BTH2_2.c,91 :: 		break; // 0
	LJMP L_main21
;BTH2_2.c,92 :: 		case 15:
L_main36:
;BTH2_2.c,93 :: 		kp = '#';
	MOV _kp+0, #35
;BTH2_2.c,94 :: 		break; // #
	LJMP L_main21
;BTH2_2.c,95 :: 		case 16:
L_main37:
;BTH2_2.c,96 :: 		kp = 'D';
	MOV _kp+0, #68
;BTH2_2.c,97 :: 		break; // D
	LJMP L_main21
;BTH2_2.c,98 :: 		}
L_main20:
	MOV A, _kp+0
	XRL A, #1
	JZ L_main22
	MOV A, _kp+0
	XRL A, #2
	JZ L_main23
	MOV A, _kp+0
	XRL A, #3
	JZ L_main24
	MOV A, _kp+0
	XRL A, #4
	JZ L_main25
	MOV A, _kp+0
	XRL A, #5
	JZ L_main26
	MOV A, _kp+0
	XRL A, #6
	JZ L_main27
	MOV A, _kp+0
	XRL A, #7
	JZ L_main28
	MOV A, _kp+0
	XRL A, #8
	JZ L_main29
	MOV A, _kp+0
	XRL A, #9
	JZ L_main30
	MOV A, _kp+0
	XRL A, #10
	JNZ #3
	LJMP L_main31
	MOV A, _kp+0
	XRL A, #11
	JNZ #3
	LJMP L_main32
	MOV A, _kp+0
	XRL A, #12
	JNZ #3
	LJMP L_main33
	MOV A, _kp+0
	XRL A, #13
	JNZ #3
	LJMP L_main34
	MOV A, _kp+0
	XRL A, #14
	JNZ #3
	LJMP L_main35
	MOV A, _kp+0
	XRL A, #15
	JNZ #3
	LJMP L_main36
	MOV A, _kp+0
	XRL A, #16
	JNZ #3
	LJMP L_main37
L_main21:
;BTH2_2.c,99 :: 		if (kp == '#') {
	MOV A, _kp+0
	XRL A, #35
	JNZ L_main38
;BTH2_2.c,100 :: 		inputCount++;
	INC main_inputCount_L0+0
;BTH2_2.c,101 :: 		cot = inputCount == 1 ? cot + 1 : cot;  // khi input count ==1 chuyen con tro nhap so thu 2
	MOV A, main_inputCount_L0+0
	XRL A, #1
	JNZ L_main39
	MOV A, _cot+0
	ADD A, #1
	MOV R0, A
	CLR A
	MOV R1, A
	SJMP L_main40
L_main39:
	MOV R0, _cot+0
	CLR A
	MOV R1, A
L_main40:
	MOV _cot+0, 0
;BTH2_2.c,102 :: 		} else if (inputCount == 0) {  //nguoi dùng dang nhaap so dau tiên.
	SJMP L_main41
L_main38:
	MOV A, main_inputCount_L0+0
	JNZ L_main42
;BTH2_2.c,103 :: 		firstNumber *=16;   //firstNumber = 0 * 16 => firstNumber = 0
	MOV R0, #4
	MOV A, main_firstNumber_L0+0
	INC R0
	SJMP L__main50
L__main51:
	CLR C
	RLC A
L__main50:
	DJNZ R0, L__main51
	MOV main_firstNumber_L0+0, A
;BTH2_2.c,104 :: 		firstNumber += hexToDec(kp);      //FirstNumber = 0 + 10 (giá tri cua 'A' trong he thap luc phân 10 ) => firstNumber = 10
	MOV FARG_hexToDec_hex+0, _kp+0
	LCALL _hexToDec+0
	MOV A, main_firstNumber_L0+0
	ADD A, R0
	MOV main_firstNumber_L0+0, A
;BTH2_2.c,105 :: 		Lcd_Chr(1, cot++, kp);    //Hien thi 'A' lên LCD  dòng 1 và cot cot
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, _cot+0
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
	INC _cot+0
;BTH2_2.c,106 :: 		} else if (inputCount ==1) {
	SJMP L_main43
L_main42:
	MOV A, main_inputCount_L0+0
	XRL A, #1
	JNZ L_main44
;BTH2_2.c,107 :: 		secondNumber *=16;
	MOV R0, #4
	MOV A, main_secondNumber_L0+0
	INC R0
	SJMP L__main52
L__main53:
	CLR C
	RLC A
L__main52:
	DJNZ R0, L__main53
	MOV main_secondNumber_L0+0, A
;BTH2_2.c,108 :: 		secondNumber += hexToDec(kp);
	MOV FARG_hexToDec_hex+0, _kp+0
	LCALL _hexToDec+0
	MOV A, main_secondNumber_L0+0
	ADD A, R0
	MOV main_secondNumber_L0+0, A
;BTH2_2.c,109 :: 		Lcd_Chr(2, cot++, kp);
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, _cot+0
	MOV FARG_Lcd_Chr_out_char+0, _kp+0
	LCALL _Lcd_Chr+0
	INC _cot+0
;BTH2_2.c,110 :: 		}
L_main44:
L_main43:
L_main41:
;BTH2_2.c,111 :: 		if (inputCount ==2) // Khi nguoi dung da nhap xong 2 so
	MOV A, main_inputCount_L0+0
	XRL A, #2
	JZ #3
	LJMP L_main45
;BTH2_2.c,113 :: 		sum = firstNumber + secondNumber;
	MOV A, main_firstNumber_L0+0
	ADD A, main_secondNumber_L0+0
	MOV main_sum_L0+0, A
;BTH2_2.c,114 :: 		product = firstNumber * secondNumber;
	MOV B+0, main_secondNumber_L0+0
	MOV A, main_firstNumber_L0+0
	MUL AB
	MOV R0, A
	MOV main_product_L0+0, 0
;BTH2_2.c,115 :: 		Lcd_Cmd(_LCD_CLEAR);  //xoa man hinh
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;BTH2_2.c,116 :: 		Lcd_Out(1,1,"tong: ");// in ra tong hang 1,cot 1
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr3_BTH2_2+0
	LCALL _LCD_Out+0
;BTH2_2.c,117 :: 		Lcd_Chr(1,6,decToHex(sum/16));   // chia lay nguyen hien thi cot 6
	MOV R0, #4
	MOV A, main_sum_L0+0
	INC R0
	SJMP L__main54
L__main55:
	CLR C
	RRC A
L__main54:
	DJNZ R0, L__main55
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, #6
	LCALL _Lcd_Chr+0
;BTH2_2.c,118 :: 		Lcd_Chr(1,7,decToHex(sum%16));  // chia lay du hien thi cot 7
	MOV A, main_sum_L0+0
	ANL A, #15
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #1
	MOV FARG_Lcd_Chr_column+0, #7
	LCALL _Lcd_Chr+0
;BTH2_2.c,119 :: 		Lcd_Out(2,1,"tich: ");  //in ra tich o hang 2 , cot 1
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr4_BTH2_2+0
	LCALL _LCD_Out+0
;BTH2_2.c,120 :: 		Lcd_Chr(2,11,decToHex(product/16));// chia lay nguyen hien hi cot 11
	MOV R0, #4
	MOV A, main_product_L0+0
	INC R0
	SJMP L__main56
L__main57:
	CLR C
	RRC A
L__main56:
	DJNZ R0, L__main57
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #11
	LCALL _Lcd_Chr+0
;BTH2_2.c,121 :: 		Lcd_Chr(2,12,decToHex(product%16)); // chia lay du hien thi cot 12
	MOV A, main_product_L0+0
	ANL A, #15
	MOV FARG_decToHex_dec+0, A
	LCALL _decToHex+0
	MOV FARG_Lcd_Chr_out_char+0, 0
	MOV FARG_Lcd_Chr_row+0, #2
	MOV FARG_Lcd_Chr_column+0, #12
	LCALL _Lcd_Chr+0
;BTH2_2.c,122 :: 		}
L_main45:
;BTH2_2.c,123 :: 		} while (1);     // vong lap vo han de cho chuong trinh chay
	LJMP L_main14
;BTH2_2.c,124 :: 		}
	SJMP #254
; end of _main
