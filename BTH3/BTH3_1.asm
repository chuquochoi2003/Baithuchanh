
_Timer0InterruptHandler:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;BTH3_1.c,6 :: 		void Timer0InterruptHandler() org IVT_ADDR_ET0 // xu ly ngat timer 0 ;ET0 dia chi ngat danh cho timer 0 0x000B
;BTH3_1.c,8 :: 		TR0_bit = 0;     // Dung Timer 0 tam thoi
	CLR TR0_bit+0
;BTH3_1.c,9 :: 		TH0 = 0xFC;     // luu tru 8 bit cao cua gia tri timer 0
	MOV TH0+0, #252
;BTH3_1.c,10 :: 		TL0 = 0x18;      // luu tru 8 bit thap cua gia tri timer 0
	MOV TL0+0, #24
;BTH3_1.c,11 :: 		TR0_bit = 1;  // kich hoat timer cho timer bat dau dem
	SETB TR0_bit+0
;BTH3_1.c,12 :: 		count++;         // moi lan timer ngat bien count sex tang len 1 don vi
	MOV A, #1
	ADD A, _count+0
	MOV _count+0, A
	MOV A, #0
	ADDC A, _count+1
	MOV _count+1, A
;BTH3_1.c,14 :: 		if (count % 2 == 0) // neu count chia het cho 2( la so chan) thuc thi cac lenh ben trong
	MOV A, #1
	ANL A, _count+0
	MOV R1, A
	MOV A, #0
	ANL A, _count+1
	MOV R2, A
	MOV A, R1
	ORL A, R2
	JNZ L_Timer0InterruptHandler0
;BTH3_1.c,16 :: 		P0 = 0xFF;   // xuat gia tri 0 xFF ra cong P0
	MOV P0+0, #255
;BTH3_1.c,17 :: 		P1 &= 0xF0;  // xuat gia tri 0xF0 ra cong P1 va giu nguyen 4 bit cao va dat 4 bit thap bang 0
	ANL P1+0, #240
;BTH3_1.c,18 :: 		P0 = digits_array[digits_array_index];      // ghi gia tri ma hoa  cua chu so hien tai len cong P0
	MOV A, #_digits_array+0
	ADD A, _digits_array_index+0
	MOV R0, A
	MOV P0+0, @R0
;BTH3_1.c,19 :: 		P1 |= shifter; // giu nguyen bit hien tai tren P1 bat cac bit duoc chi dinh trong shifter
	MOV A, _shifter+0
	ORL P1+0, A
;BTH3_1.c,21 :: 		shifter <<= 1;  // Dich gia tri cua shifter sang trai 1 bit
	MOV R0, #1
	MOV A, _shifter+0
	INC R0
	SJMP L__Timer0InterruptHandler9
L__Timer0InterruptHandler10:
	CLR C
	RLC A
L__Timer0InterruptHandler9:
	DJNZ R0, L__Timer0InterruptHandler10
	MOV R1, A
	MOV _shifter+0, 1
;BTH3_1.c,22 :: 		if (shifter > 8u)    // neu shifter dich lon hon 8 dat shifter ve bang 1
	SETB C
	MOV A, R1
	SUBB A, #8
	JC L_Timer0InterruptHandler1
;BTH3_1.c,23 :: 		shifter = 1;
	MOV _shifter+0, #1
L_Timer0InterruptHandler1:
;BTH3_1.c,24 :: 		digits_array_index++;  //tang chu so hien tai len 1, chuyen sang so ke tiep trong mang
	INC _digits_array_index+0
;BTH3_1.c,25 :: 		if (digits_array_index > 3u)    // kiem tra neu vuot qua 3 gia tri dat lai ve 0
	SETB C
	MOV A, _digits_array_index+0
	SUBB A, #3
	JC L_Timer0InterruptHandler2
;BTH3_1.c,26 :: 		digits_array_index = 0;
	MOV _digits_array_index+0, #0
L_Timer0InterruptHandler2:
;BTH3_1.c,27 :: 		}
L_Timer0InterruptHandler0:
;BTH3_1.c,29 :: 		if (count == 5)
	MOV A, #5
	XRL A, _count+0
	JNZ L__Timer0InterruptHandler11
	MOV A, #0
	XRL A, _count+1
L__Timer0InterruptHandler11:
	JZ #3
	LJMP L_Timer0InterruptHandler3
;BTH3_1.c,31 :: 		count = 0;
	MOV _count+0, #0
	MOV _count+1, #0
;BTH3_1.c,32 :: 		giay++;
	MOV A, #1
	ADD A, _giay+0
	MOV _giay+0, A
	MOV A, #0
	ADDC A, _giay+1
	MOV _giay+1, A
;BTH3_1.c,33 :: 		if (giay == 60) {
	MOV A, #60
	XRL A, _giay+0
	JNZ L__Timer0InterruptHandler12
	MOV A, #0
	XRL A, _giay+1
L__Timer0InterruptHandler12:
	JNZ L_Timer0InterruptHandler4
;BTH3_1.c,34 :: 		phut++;
	MOV A, #1
	ADD A, _phut+0
	MOV _phut+0, A
	MOV A, #0
	ADDC A, _phut+1
	MOV _phut+1, A
;BTH3_1.c,35 :: 		giay = 0;
	MOV _giay+0, #0
	MOV _giay+1, #0
;BTH3_1.c,36 :: 		if (phut == 60) {
	MOV A, #60
	XRL A, _phut+0
	JNZ L__Timer0InterruptHandler13
	MOV A, #0
	XRL A, _phut+1
L__Timer0InterruptHandler13:
	JNZ L_Timer0InterruptHandler5
;BTH3_1.c,37 :: 		gio++;
	MOV A, #1
	ADD A, _gio+0
	MOV _gio+0, A
	MOV A, #0
	ADDC A, _gio+1
	MOV _gio+1, A
;BTH3_1.c,38 :: 		phut = 0;
	MOV _phut+0, #0
	MOV _phut+1, #0
;BTH3_1.c,39 :: 		if (gio == 24) {
	MOV A, #24
	XRL A, _gio+0
	JNZ L__Timer0InterruptHandler14
	MOV A, #0
	XRL A, _gio+1
L__Timer0InterruptHandler14:
	JNZ L_Timer0InterruptHandler6
;BTH3_1.c,40 :: 		gio = 0;
	MOV _gio+0, #0
	MOV _gio+1, #0
;BTH3_1.c,41 :: 		}
L_Timer0InterruptHandler6:
;BTH3_1.c,42 :: 		}
L_Timer0InterruptHandler5:
;BTH3_1.c,43 :: 		}
L_Timer0InterruptHandler4:
;BTH3_1.c,44 :: 		digit = gio / 10; // chia gio cho 10 de lay chu so hang chuc
	MOV R4, #10
	MOV R5, #0
	MOV R0, _gio+0
	MOV R1, _gio+1
	LCALL _Div_16x16_U+0
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,45 :: 		digits_array[3] = mask[digit];    // luu chu so hang chuc cua gio vao phan tu thu 3 cua mang
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__Timer0InterruptHandler15
L__Timer0InterruptHandler16:
	CLR C
	RLC A
L__Timer0InterruptHandler15:
	DJNZ R3, L__Timer0InterruptHandler16
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+3, @R0
;BTH3_1.c,46 :: 		digit = gio % 10; //   chia lay du cho 10 de lay chu so hang don vi
	MOV R4, #10
	MOV R5, #0
	MOV R0, _gio+0
	MOV R1, _gio+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,47 :: 		digits_array[2] = mask[digit];   // luu chu so hang don vi vao phan tu thu 2 cua mang
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__Timer0InterruptHandler17
L__Timer0InterruptHandler18:
	CLR C
	RLC A
L__Timer0InterruptHandler17:
	DJNZ R3, L__Timer0InterruptHandler18
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+2, @R0
;BTH3_1.c,48 :: 		digit = phut / 10;          //    chia phut cho 10 de lay chu so hang chuc
	MOV R4, #10
	MOV R5, #0
	MOV R0, _phut+0
	MOV R1, _phut+1
	LCALL _Div_16x16_U+0
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,49 :: 		digits_array[1] = mask[digit];    //luu chu so hang chuc cua phut vao phan tu thu 1 cua mang
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__Timer0InterruptHandler19
L__Timer0InterruptHandler20:
	CLR C
	RLC A
L__Timer0InterruptHandler19:
	DJNZ R3, L__Timer0InterruptHandler20
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+1, @R0
;BTH3_1.c,50 :: 		digit = phut % 10; //   chia lay du cho 10 de lay chu so hang don vi phut
	MOV R4, #10
	MOV R5, #0
	MOV R0, _phut+0
	MOV R1, _phut+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,51 :: 		digits_array[0] = mask[digit];    //  luu chu so hang don vi vao phan tu thu 0 cua mang
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__Timer0InterruptHandler21
L__Timer0InterruptHandler22:
	CLR C
	RLC A
L__Timer0InterruptHandler21:
	DJNZ R3, L__Timer0InterruptHandler22
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+0, @R0
;BTH3_1.c,52 :: 		}
L_Timer0InterruptHandler3:
;BTH3_1.c,53 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _Timer0InterruptHandler

_main:
	MOV SP+0, #128
;BTH3_1.c,54 :: 		void main() {
;BTH3_1.c,55 :: 		TMOD = 0x01;    // Timer 0 duoc thiet lap o che do 16 bit
	MOV TMOD+0, #1
;BTH3_1.c,56 :: 		TH0 = 0xFC;   //luu tru 8 bit cao cua timer 0
	MOV TH0+0, #252
;BTH3_1.c,57 :: 		TL0 = 0x18;   // luu tru 8 bit thap cua timer 0
	MOV TL0+0, #24
;BTH3_1.c,58 :: 		IE = 0x82;    // thiet lap cac bit trong thanh ghi IE de kich hoat timer 0
	MOV IE+0, #130
;BTH3_1.c,59 :: 		TR0_bit = 1; // cho phep timer 0 bat dau dem
	SETB TR0_bit+0
;BTH3_1.c,60 :: 		P0 = 0xFF;   // xuat gia tri 0 xFF ra cong P0
	MOV P0+0, #255
;BTH3_1.c,61 :: 		P1 &= 0xF0;   // xuat gia tri 0xF0 ra cong P1 va giu nguyen 4 bit cao va dat 4 bit thap bang 0
	ANL P1+0, #240
;BTH3_1.c,62 :: 		digits_array_index = 0;   // thiet lap mang gia tri ban dau la 0
	MOV _digits_array_index+0, #0
;BTH3_1.c,63 :: 		shifter = 1;     // bat dau tu chu so dau tien
	MOV _shifter+0, #1
;BTH3_1.c,64 :: 		digit = gio / 10;  //   chia gio cho 10 de lay chu so hang chuc
	MOV R4, #10
	MOV R5, #0
	MOV R0, _gio+0
	MOV R1, _gio+1
	LCALL _Div_16x16_U+0
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,65 :: 		digits_array[3] = mask[digit];     // luu chu so hang chuc cua gio vao phan tu thu 3 cua mang
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__main23
L__main24:
	CLR C
	RLC A
L__main23:
	DJNZ R3, L__main24
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+3, @R0
;BTH3_1.c,66 :: 		digit = gio % 10;        //chia lay du cho 10 de lay chu so hang don vi
	MOV R4, #10
	MOV R5, #0
	MOV R0, _gio+0
	MOV R1, _gio+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,67 :: 		digits_array[2] = mask[digit];
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__main25
L__main26:
	CLR C
	RLC A
L__main25:
	DJNZ R3, L__main26
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+2, @R0
;BTH3_1.c,68 :: 		digit = phut / 10;
	MOV R4, #10
	MOV R5, #0
	MOV R0, _phut+0
	MOV R1, _phut+1
	LCALL _Div_16x16_U+0
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,69 :: 		digits_array[1] = mask[digit];
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__main27
L__main28:
	CLR C
	RLC A
L__main27:
	DJNZ R3, L__main28
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+1, @R0
;BTH3_1.c,70 :: 		digit = phut % 10;
	MOV R4, #10
	MOV R5, #0
	MOV R0, _phut+0
	MOV R1, _phut+1
	LCALL _Div_16x16_U+0
	MOV R0, 4
	MOV R1, 5
	MOV _digit+0, 0
	MOV _digit+1, 1
;BTH3_1.c,71 :: 		digits_array[0] = mask[digit];
	MOV R3, #1
	MOV A, R0
	INC R3
	SJMP L__main29
L__main30:
	CLR C
	RLC A
L__main29:
	DJNZ R3, L__main30
	MOV R2, A
	MOV A, #_mask+0
	ADD A, R2
	MOV R0, A
	MOV _digits_array+0, @R0
;BTH3_1.c,72 :: 		while (1) {
L_main7:
;BTH3_1.c,73 :: 		}
	SJMP L_main7
;BTH3_1.c,74 :: 		}
	SJMP #254
; end of _main
