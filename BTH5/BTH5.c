
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
// End LCD module connections
unsigned int cnt=0; // Global variable cnt and tmp with starting values
bit tmp;
char *text="0000" ;
void External_ISR()org 0x0003 ilevel 0 { // Interrupt rutine
 EA_bit = 0; // Disable Interrupts
 tmp= 1; // Increment variable cnt
 EA_bit = 1; // Enable Interrupts
}
void main() { // Main program
 unsigned int j=0;
 tmp=0;
 P0 = 0xFF; // Set P0 as output
        P3 = 0xFF; // Set P3 as input
// tmp = 0, cnt = 0;
 IE = 0x81; // Setting the Interrupts:
 Lcd_Init(); // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR); // Clear LCD
 Lcd_Cmd(_LCD_CURSOR_OFF); // Turn cursor off
 // Moving text
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Bo dem: ");
 //Lcd_Out(2, 11, "push");
 while(1){
 // Unending loop
 if(tmp)
 {
 cnt=cnt+1;
 tmp=0;
 }
 P0=cnt;
 //sprintf(buffer, "%10d", cnt); // Format ww and store it to buffer
 text[0] = cnt/1000 + 48; // Extract thousands digit
 text[1] = (cnt/100)%10 + 48; // Extract hundreds digit
 text[2] = (cnt/10)%10 + 48; // Extract tens digit
 text[3] = cnt%10 + 48; // Extract ones digit
 Lcd_Out(2, 6, text);
 delay_ms(100); // This is needed for button debounce
 }
}