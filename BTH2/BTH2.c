                 unsigned short kp, cnt, oldstate = 0;//Bien luu giá tri phim nhan, bo dem và trang thai phim truoc do
char txt[6]; //hien thi so lan nhan phim
char keypadPort at P0; // P0 cong ket noi voi phim
// khai bao cac chan ket noi LCD
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;

void main() {
 cnt = 0; // dat lai bo dem
 Keypad_Init(); // khoi tao bo dem
 Lcd_Init(); // khoi tao LCD
 Lcd_Cmd(_LCD_CLEAR); // xoa man hinh
 Lcd_Cmd(_LCD_CURSOR_OFF); // tat con tro
 Lcd_Out(1, 1, "Key :"); // hien thi key tren dong 1, cot 1
 Lcd_Out(2, 1, "Times:");// hien thi time tren dong 2, cot 1

 do {
 // Vong lap do cho den khi co phim duoc bam
 kp = 0; // Reset key code variable
 do
 kp = Keypad_Key_Click(); // kiem tra trang thai phim
 while (!kp);   // cho co phim bam tra ve gia tri khac 0

 switch (kp) // anh xa cac ma phim thanh ma ASCII
 {
 case 1: kp = 49; break; // 1
 case 2: kp = 50; break; // 2
 case 3: kp = 51; break; // 3
 case 4: kp = 65; break; // A
 case 5: kp = 52; break; // 4
 case 6: kp = 53; break; // 5
 case 7: kp = 54; break; // 6
 case 8: kp = 66; break; // B
 case 9: kp = 55; break; // 7
 case 10: kp = 56; break; // 8
 case 11: kp = 57; break; // 9
 case 12: kp = 67; break; // C
 case 13: kp = 42; break; // *
 case 14: kp = 48; break; // 0
 case 15: kp = 35; break; // #
 case 16: kp = 68; break; // D
 }
 if (kp != oldstate) { // kiem tra phim hien tai khac phim truoc do khong
 cnt = 1;
 oldstate = kp;}  // luu lai ma phim vua duoc nhan
 else { // nguoc lai neu giong phim truoc do tang len 1 don vi
 cnt++;}
 Lcd_Chr(1, 10, kp); // hien thi ma ASCII cua phim  len hang 1 cot 10
 if (cnt == 255) { // If counter variable overflow
 cnt = 0;
 Lcd_Out(2, 10, " ");}   // xoa hien thi tai dong 2 cot 10
 WordToStr(cnt, txt); // chuyen gia tri so lan nhan phim sang dang chuoi va luu vao bien txt
 Lcd_Out(2, 10, txt); // hien thi len lcd gia tri  bien txt hang 2 cot 10
 } while (1);    // Duy tri vong lap vo han de thuc hien chuong trinh
}