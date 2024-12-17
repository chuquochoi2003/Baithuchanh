#line 1 "D:/Chuquochoi_BTH/BTH5/BTH5.c"

sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;

unsigned int cnt=0;
bit tmp;
char *text="0000" ;
void External_ISR()org 0x0003 ilevel 0 {
 EA_bit = 0;
 tmp= 1;
 EA_bit = 1;
}
void main() {
 unsigned int j=0;
 tmp=0;
 P0 = 0xFF;
 P3 = 0xFF;

 IE = 0x81;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Bo dem: ");

 while(1){

 if(tmp)
 {
 cnt=cnt+1;
 tmp=0;
 }
 P0=cnt;

 text[0] = cnt/1000 + 48;
 text[1] = (cnt/100)%10 + 48;
 text[2] = (cnt/10)%10 + 48;
 text[3] = cnt%10 + 48;
 Lcd_Out(2, 6, text);
 delay_ms(100);
 }
}
