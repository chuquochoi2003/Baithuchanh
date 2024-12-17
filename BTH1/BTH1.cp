#line 1 "D:/Chuquochoi_BTH/BTH1/BTH1.c"
void main() {
 unsigned char i;

 P0 = 0xFF;
 P1 = 0xFF;
 P2 = 0xFF;
 P3 = 0xFF;

 while (1) {
 for (i = 0; i < 9; i++) {
 P0 = ~(1 << i);
 Delay_ms(1000);
 }

 for (i = 0; i < 9; i++) {
 P1 = ~(1 << i);
 Delay_ms(1000);
 }

 for (i = 0; i < 9; i++) {
 P2 = ~(1 << i);
 Delay_ms(1000);
 }

 for (i = 0; i < 9; i++) {
 P3 = ~(1 << i);
 Delay_ms(1000);
 }
 }
}
