                  unsigned short kp, cot = 5, i, Dec, flag; // Bien luu gia tri phim bam ,vi tri hien thi lcd, dem so luong bit nhi phan da nhap,
//gia tri thap phan tinh tu bien nhi phan,co bao hieu chuyen tu bit nhi phan sang thap luc phan


char bin[4]; // mang luu 4 bit nhi phan
char Hex; // bien luu gia tri thap luc phan tuong duong gia tri DEC
char keypadPort at P0;   // khoi tao cac cong P0 giao tiep voi ban phim
//  Khoi tao cac cong P2 de giao tiep voi LCD
sbit LCD_RS at P2_0_bit;
sbit LCD_EN at P2_1_bit;
sbit LCD_D4 at P2_2_bit;
sbit LCD_D5 at P2_3_bit;
sbit LCD_D6 at P2_4_bit;
sbit LCD_D7 at P2_5_bit;
unsigned short hexToDec(char hex)      //chuyen doi mot ki tu Hex thanh so thap phan
{
    if (hex >= '0' && hex <= '9') {
        return hex - '0';//gia tri 0 tuong duong 48 lay gia tri dec
    } else if (hex >= 'A' && hex <= 'F')
    {
        return hex - 'A' + 10;
    }
    return 0;// neu Hex khong nam trong hai khoang tren tra ve gia tri 0
}
char decToHex(unsigned short dec)//chuyen doi mot so thap phan thanh ki tu thap luc phan
{
    if (dec >= 0 && dec <= 9) {
        return dec + '0';   //vi du 5+48
    } else if (dec >= 10 && dec <= 15) {
        return dec - 10 + 'A';
    }
    return '0';
}
void main() {
    unsigned short firstNumber = 0, secondNumber = 0, sum, product; // khai bao bien firstnumber va secondnumber va gan chung bang 0 luu gia tri cua 2 so
                                                                    // sum luu gia tri tong,product luu gia tri tich
    unsigned short inputCount = 0;      //khai bao bien inputcount va gan gia tri bang 0 bien luu so lan nguoi dung nhap gia tri
    Keypad_Init(); // Khoi tao ban phim
    Lcd_Init(); // khoi tao man hinh lcd
    Lcd_Cmd(_LCD_CLEAR); // xoa man hinh lcd
    Lcd_Cmd(_LCD_CURSOR_OFF); // tat con tro tren man hinh
    Lcd_Out(1, 1, "So1: "); // hien thi so1 len hang 1, cot 1
    Lcd_Out(2, 1, "So2: "); // hien thi so 2 len hang 2, cot 1
    do {
        kp = 0; // gan bien kp =0
        do
            kp = Keypad_Key_Click(); // doi khi co phim bam
        while (!kp);
        switch (kp) {
            case 1:
                kp = '1';
                break; // 1
            case 2:
                kp = '2';
                break; // 2
            case 3:
                kp = '3';
                break; // 3
            case 4:
                kp = 'A';
                break; // A
            case 5:
                kp = '4';
                break; // 4
            case 6:
                kp = '5';
                break; // 5
            case 7:
                kp = '6';
                break; // 6
            case 8:
                kp = 'B';
                break; // B
            case 9:
                kp = '7';
                break; // 7
            case 10:
                kp = '8';
                break; // 8
            case 11:
                kp = '9';
                break; // 9
            case 12:
                kp = 'C';
                break; // C
            case 13:
                kp = '*';
                break; // *
            case 14:
                kp = '0';
                break; // 0
            case 15:
                kp = '#';
                break; // #
            case 16:
                kp = 'D';
                break; // D
        }
        if (kp == '#') {
            inputCount++;
            cot = inputCount == 1 ? cot + 1 : cot;  // khi input count ==1 chuyen con tro nhap so thu 2
        } else if (inputCount == 0) {  //nguoi dùng dang nhaap so dau tiên.
            firstNumber *=16;   //firstNumber = 0 * 16 => firstNumber = 0
            firstNumber += hexToDec(kp);      //FirstNumber = 0 + 10 (giá tri cua 'A' trong he thap luc phân 10 ) => firstNumber = 10
            Lcd_Chr(1, cot++, kp);    //Hien thi 'A' lên LCD  dòng 1 và cot cot
        } else if (inputCount ==1) {
            secondNumber *=16;
            secondNumber += hexToDec(kp);
            Lcd_Chr(2, cot++, kp);
        }
        if (inputCount ==2) // Khi nguoi dung da nhap xong 2 so
         {
            sum = firstNumber + secondNumber;
            product = firstNumber * secondNumber;
            Lcd_Cmd(_LCD_CLEAR);  //xoa man hinh
            Lcd_Out(1,1,"tong: ");// in ra tong hang 1,cot 1
            Lcd_Chr(1,6,decToHex(sum/16));   // chia lay nguyen hien thi cot 6
            Lcd_Chr(1,7,decToHex(sum%16));  // chia lay du hien thi cot 7
            Lcd_Out(2,1,"tich: ");  //in ra tich o hang 2 , cot 1
            Lcd_Chr(2,11,decToHex(product/16));// chia lay nguyen hien hi cot 11
            Lcd_Chr(2,12,decToHex(product%16)); // chia lay du hien thi cot 12
        }
    } while (1);     // vong lap vo han de cho chuong trinh chay
}