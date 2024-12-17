                          unsigned short kp, cot=5, i,Dec,flag; // Bien luu gia tri phim bam, vi tri hien thi lcd, dem so luong bit nhi phan da nhap,
//gia tri thap phan tinh tu bien nhi phan,co bao hieu chuyen tu bit nhi phan sang thap luc phan

char bin[4];    // mang luu 4 bit nhi phan
char Hex;         // bien luu gia tri thap luc phan tuong duong gia tri DEC
char keypadPort at P0;      // khoi tao cong P0 de giao tiep voi phim
 //khoi tao cac chan ket noi voi LCD
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
void main() {
Keypad_Init(); // Khoi tao ban phim
Lcd_Init(); // khoi tao LCD
Lcd_Cmd(_LCD_CLEAR); // xoa man hinh
Lcd_Cmd(_LCD_CURSOR_OFF); //  Tat con tro tren man hinh
Lcd_Out(1, 1, "Bin : "); // hien thi chu Bin hang 1, cot 1
Lcd_Out(2, 1, "Hex: ");  // hien thi chu Hex len hang 2, cot 1
do {
kp = 0; // Reset key code variable
do
kp = Keypad_Key_Click(); // Doi va doc gia tri phim bam
while (!kp);
switch (kp) {
       case 1:
            kp = 49;   //gan kp=49
            bin[i]=1;       // luu gia tri 1 vao mang bin
            i++;          // tang i len 1 don vi
            break; //  thoat khoi case nay
       case 14:
            kp = 48;
            bin[i]=0;
            i++;
            break; // 0
       case 15:
            i=0;  //dat lai gia tri cua i
            cot=8;
            break; // #
       case 16:
            Dec=bin[0]*8+bin[1]*4+bin[2]*2+bin[3]*1;// tinh toan chuyen doi nhi phan sang thap phan
            flag=1;   // bat co len 1 bao da tinh xong
            break; // D
       }
if(flag==1){
            switch (Dec)     // Chuyen doi gia tri Dec sang gia tri thap luc phan
            {
                   case 0:
                        Hex = 48;
                        break; // 0
                   case 1:
                        Hex = 49;
                        break; // 1
                   case 2:
                        Hex = 50;
                        break; // 2
                   case 3:
                        Hex = 51;
                        break; // 3
                   case 4:
                        Hex = 52;
                        break; // 4
                   case 5:
                        Hex = 53;
                        break; // 5
                   case 6:
                        Hex = 54;
                        break; // 6
                   case 7:
                        Hex = 55;
                        break; // 7
                   case 8:
                        Hex = 56;
                        break; // 8
                   case 9:
                        Hex = 57;
                        break; // 9
                   case 10:
                        Hex = 65;
                        break; // A
                   case 11:
                        Hex = 66;
                        break; // B
                   case 12:
                        Hex = 67;
                        break; // C
                   case 13:
                        Hex = 68;
                        break; // D
                   case 14:
                        Hex = 69;
                        break; // E
                   case 15:
                        Hex = 70;
                        break; // F
                   }
            }
Lcd_Chr(2, 7, Hex);// Hien thi gia tri tuong duong voi Hex tai dong 2, cot 7
cot++;
Lcd_Chr(1, cot, kp);    // Hien thi gia tri cua kp tai dong 1
} while (1); // Vong lap vo han cho chuong trinh chay lien tuc
}