#line 1 "D:/Chuquochoi_BTH/BTH2/BTH2_2.c"
 unsigned short kp, cot = 5, i, Dec, flag;



char bin[4];
char Hex;
char keypadPort at P0;

sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
unsigned short hexToDec(char hex)
{
 if (hex >= '0' && hex <= '9') {
 return hex - '0';
 } else if (hex >= 'A' && hex <= 'F')
 {
 return hex - 'A' + 10;
 }
 return 0;
}
char decToHex(unsigned short dec)
{
 if (dec >= 0 && dec <= 9) {
 return dec + '0';
 } else if (dec >= 10 && dec <= 15) {
 return dec - 10 + 'A';
 }
 return '0';
}
void main() {
 unsigned short firstNumber = 0, secondNumber = 0, sum, product;

 unsigned short inputCount = 0;
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "So1: ");
 Lcd_Out(2, 1, "So2: ");
 do {
 kp = 0;
 do
 kp = Keypad_Key_Click();
 while (!kp);
 switch (kp) {
 case 1:
 kp = '1';
 break;
 case 2:
 kp = '2';
 break;
 case 3:
 kp = '3';
 break;
 case 4:
 kp = 'A';
 break;
 case 5:
 kp = '4';
 break;
 case 6:
 kp = '5';
 break;
 case 7:
 kp = '6';
 break;
 case 8:
 kp = 'B';
 break;
 case 9:
 kp = '7';
 break;
 case 10:
 kp = '8';
 break;
 case 11:
 kp = '9';
 break;
 case 12:
 kp = 'C';
 break;
 case 13:
 kp = '*';
 break;
 case 14:
 kp = '0';
 break;
 case 15:
 kp = '#';
 break;
 case 16:
 kp = 'D';
 break;
 }
 if (kp == '#') {
 inputCount++;
 cot = inputCount == 1 ? cot + 1 : cot;
 } else if (inputCount == 0) {
 firstNumber *=16;
 firstNumber += hexToDec(kp);
 Lcd_Chr(1, cot++, kp);
 } else if (inputCount ==1) {
 secondNumber *=16;
 secondNumber += hexToDec(kp);
 Lcd_Chr(2, cot++, kp);
 }
 if (inputCount ==2)
 {
 sum = firstNumber + secondNumber;
 product = firstNumber * secondNumber;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"tong: ");
 Lcd_Chr(1,6,decToHex(sum/16));
 Lcd_Chr(1,7,decToHex(sum%16));
 Lcd_Out(2,1,"tich: ");
 Lcd_Chr(2,11,decToHex(product/16));
 Lcd_Chr(2,12,decToHex(product%16));
 }
 } while (1);
}
