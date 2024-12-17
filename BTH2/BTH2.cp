#line 1 "D:/Chuquochoi_BTH/BTH2/BTH2.c"
 unsigned short kp, cnt, oldstate = 0;
char txt[6];
char keypadPort at P0;

sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;

void main() {
 cnt = 0;
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Key :");
 Lcd_Out(2, 1, "Times:");

 do {

 kp = 0;
 do
 kp = Keypad_Key_Click();
 while (!kp);

 switch (kp)
 {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;
 }
 if (kp != oldstate) {
 cnt = 1;
 oldstate = kp;}
 else {
 cnt++;}
 Lcd_Chr(1, 10, kp);
 if (cnt == 255) {
 cnt = 0;
 Lcd_Out(2, 10, " ");}
 WordToStr(cnt, txt);
 Lcd_Out(2, 10, txt);
 } while (1);
}
