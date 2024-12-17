#line 1 "D:/Chuquochoi_BTH/BTH3/BTH3.c"
unsigned short shifter,i, digits_array_index;
unsigned int digit, number;
unsigned short digits_array[4];


unsigned short mask(unsigned short num) {
switch (num) {
case 0 : return 0xC0;
case 1 : return 0xF9;
case 2 : return 0xA4;
case 3 : return 0xB0;
case 4 : return 0x99;
case 5 : return 0x92;
case 6 : return 0x82;
case 7 : return 0xF8;
case 8 : return 0x80;
case 9 : return 0x90;
}
}

void main() {
int n=0;
digit = 0;
i = 0;
digits_array_index = 0;
shifter = 2;
P0 = 0;
number = 6789;
do {
for(n=0;n<250;n++)
{
digit = number / 1000u ;
digits_array[3] = mask(digit);
digit = (number / 100u) % 10u;
digits_array[2] = mask(digit);
digit = (number / 10u) % 10u;
digits_array[1] = mask(digit);
digit = number % 10u;
digits_array[0] = mask(digit);

P0 = digits_array[0]; P1_0_bit=1; Delay_ms(1);P1_0_bit=0;
P0 = digits_array[1]; P1_1_bit=1; Delay_ms(1);P1_1_bit=0;
P0 = digits_array[2]; P1_2_bit=1; Delay_ms(1);P1_2_bit=0;
P0 = digits_array[3]; P1_3_bit=1; Delay_ms(1);P1_3_bit=0;
}
number=number-1;
} while(1);
}
