unsigned short shifter,i, digits_array_index;
unsigned int digit, number;
unsigned short digits_array[4];

//-------------- Returns mask for common cathode Display_utils.h
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
} //case end
}

void main() {
int n=0;
digit = 0; // initialize variables
i = 0;
digits_array_index = 0;
shifter = 2;
P0 = 0; // Initialize PORT0
number = 6789; // some initial value
do {
for(n=0;n<250;n++)
{
digit = number / 1000u ; // extract thousands digit
digits_array[3] = mask(digit); // and store it to digits array
digit = (number / 100u) % 10u; // extract hundreds digit
digits_array[2] = mask(digit); // and store it to digits array
digit = (number / 10u) % 10u; // extract tens digit
digits_array[1] = mask(digit); // and store it to digits array
digit = number % 10u; // extract ones digit
digits_array[0] = mask(digit); // and store it to digits array
// Turn off all 7seg displays
P0 = digits_array[0]; P1_0_bit=1; Delay_ms(1);P1_0_bit=0;
P0 = digits_array[1]; P1_1_bit=1; Delay_ms(1);P1_1_bit=0;
P0 = digits_array[2]; P1_2_bit=1; Delay_ms(1);P1_2_bit=0;
P0 = digits_array[3]; P1_3_bit=1; Delay_ms(1);P1_3_bit=0;
}
number=number-1;
} while(1);
}