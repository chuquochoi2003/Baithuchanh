#line 1 "D:/Chuquochoi_BTH/BTH2/BTH2_1.c"
 unsigned short kp, cot=5, i,Dec,flag;


char bin[4];
char Hex;
char keypadPort at P0;

sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
void main() {
Keypad_Init();
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "Bin : ");
Lcd_Out(2, 1, "Hex: ");
do {
kp = 0;
do
kp = Keypad_Key_Click();
while (!kp);
switch (kp) {
 case 1:
 kp = 49;
 bin[i]=1;
 i++;
 break;
 case 14:
 kp = 48;
 bin[i]=0;
 i++;
 break;
 case 15:
 i=0;
 cot=8;
 break;
 case 16:
 Dec=bin[0]*8+bin[1]*4+bin[2]*2+bin[3]*1;
 flag=1;
 break;
 }
if(flag==1){
 switch (Dec)
 {
 case 0:
 Hex = 48;
 break;
 case 1:
 Hex = 49;
 break;
 case 2:
 Hex = 50;
 break;
 case 3:
 Hex = 51;
 break;
 case 4:
 Hex = 52;
 break;
 case 5:
 Hex = 53;
 break;
 case 6:
 Hex = 54;
 break;
 case 7:
 Hex = 55;
 break;
 case 8:
 Hex = 56;
 break;
 case 9:
 Hex = 57;
 break;
 case 10:
 Hex = 65;
 break;
 case 11:
 Hex = 66;
 break;
 case 12:
 Hex = 67;
 break;
 case 13:
 Hex = 68;
 break;
 case 14:
 Hex = 69;
 break;
 case 15:
 Hex = 70;
 break;
 }
 }
Lcd_Chr(2, 7, Hex);
cot++;
Lcd_Chr(1, cot, kp);
} while (1);
}
