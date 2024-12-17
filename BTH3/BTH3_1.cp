#line 1 "D:/Chuquochoi_BTH/BTH3/BTH3_1.c"
 unsigned short shifter, digits_array_index;
unsigned int digit, count = 0, giay = 55, phut = 40, gio = 21;
unsigned short digits_array[4];
unsigned int mask[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

void Timer0InterruptHandler() org IVT_ADDR_ET0
{
 TR0_bit = 0;
 TH0 = 0xFC;
 TL0 = 0x18;
 TR0_bit = 1;
 count++;

 if (count % 2 == 0)
 {
 P0 = 0xFF;
 P1 &= 0xF0;
 P0 = digits_array[digits_array_index];
 P1 |= shifter;

 shifter <<= 1;
 if (shifter > 8u)
 shifter = 1;
 digits_array_index++;
 if (digits_array_index > 3u)
 digits_array_index = 0;
 }

 if (count == 5)
 {
 count = 0;
 giay++;
 if (giay == 60) {
 phut++;
 giay = 0;
 if (phut == 60) {
 gio++;
 phut = 0;
 if (gio == 24) {
 gio = 0;
 }
 }
 }
 digit = gio / 10;
 digits_array[3] = mask[digit];
 digit = gio % 10;
 digits_array[2] = mask[digit];
 digit = phut / 10;
 digits_array[1] = mask[digit];
 digit = phut % 10;
 digits_array[0] = mask[digit];
 }
}
void main() {
 TMOD = 0x01;
 TH0 = 0xFC;
 TL0 = 0x18;
 IE = 0x82;
 TR0_bit = 1;
 P0 = 0xFF;
 P1 &= 0xF0;
 digits_array_index = 0;
 shifter = 1;
 digit = gio / 10;
 digits_array[3] = mask[digit];
 digit = gio % 10;
 digits_array[2] = mask[digit];
 digit = phut / 10;
 digits_array[1] = mask[digit];
 digit = phut % 10;
 digits_array[0] = mask[digit];
 while (1) {
 }
}
