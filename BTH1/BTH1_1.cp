#line 1 "D:/Chuquochoi_BTH/BTH1/BTH1_1.c"




unsigned char letter_H[8] = {
 0xC3,
 0xC3,
 0xC3,
 0xFF,
 0xFF,
 0xC3,
 0xC3,
 0xC3
};


unsigned char letter_O[8] = {
 0x3C,
 0x66,
 0xC3,
 0xC3,
 0xC3,
 0xC3,
 0x66,
 0x3C
};


unsigned char letter_I[8] = {
 0xFF,
 0x18,
 0x18,
 0x18,
 0x18,
 0x18,
 0x18,
 0xFF
};


void delay_short() {
 unsigned int i;
 for (i = 0; i < 200; i++);
}


void display_letter(unsigned char *letter) {
 int row;
 for (row = 0; row < 8; row++) {
  P2  = ~(1 << row);
  P3  = letter[row];
 delay_short();
  P2  = 0xFF;
 }
}


void display_name() {
 int i;
 for (i = 0; i < 50; i++) display_letter(letter_H);
 for (i = 0; i < 50; i++) display_letter(letter_O);
 for (i = 0; i < 50; i++) display_letter(letter_I);
}

void main() {
 while (1) {
 display_name();
 }
}
