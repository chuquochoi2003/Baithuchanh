   unsigned short shifter, digits_array_index; // khai bao cac bien shifter dich cac gia tri, array_index xac dinh chu so hien thi
unsigned int digit, count = 0, giay = 55, phut = 40, gio = 21;  // khai bao bien digit luu gia tri mot chu so khi tach gia tri tu gio,phut ,giay; count bo dem thoi gian
unsigned short digits_array[4];  // chua 4 phan tu tach ra tu gio,phut, giay
unsigned int mask[10] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};

void Timer0InterruptHandler() org IVT_ADDR_ET0 // xu ly ngat timer 0 ;ET0 dia chi ngat danh cho timer 0 0x000B
{
    TR0_bit = 0;     // Dung Timer 0 tam thoi
    TH0 = 0xFC;     // luu tru 8 bit cao cua gia tri timer 0
    TL0 = 0x18;      // luu tru 8 bit thap cua gia tri timer 0
    TR0_bit = 1;  // kich hoat timer cho timer bat dau dem
    count++;         // moi lan timer ngat bien count sex tang len 1 don vi

    if (count % 2 == 0) // neu count chia het cho 2( la so chan) thuc thi cac lenh ben trong
    {
        P0 = 0xFF;   // xuat gia tri 0 xFF ra cong P0
        P1 &= 0xF0;  // xuat gia tri 0xF0 ra cong P1 va giu nguyen 4 bit cao va dat 4 bit thap bang 0
        P0 = digits_array[digits_array_index];      // ghi gia tri ma hoa  cua chu so hien tai len cong P0
        P1 |= shifter; // giu nguyen bit hien tai tren P1 bat cac bit duoc chi dinh trong shifter

        shifter <<= 1;  // Dich gia tri cua shifter sang trai 1 bit
        if (shifter > 8u)    // neu shifter dich lon hon 8 dat shifter ve bang 1
            shifter = 1;
        digits_array_index++;  //tang chu so hien tai len 1, chuyen sang so ke tiep trong mang
        if (digits_array_index > 3u)    // kiem tra neu vuot qua 3 gia tri dat lai ve 0
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
        digit = gio / 10; // chia gio cho 10 de lay chu so hang chuc
        digits_array[3] = mask[digit];    // luu chu so hang chuc cua gio vao phan tu thu 3 cua mang
        digit = gio % 10; //   chia lay du cho 10 de lay chu so hang don vi
        digits_array[2] = mask[digit];   // luu chu so hang don vi vao phan tu thu 2 cua mang
        digit = phut / 10;          //    chia phut cho 10 de lay chu so hang chuc
        digits_array[1] = mask[digit];    //luu chu so hang chuc cua phut vao phan tu thu 1 cua mang
        digit = phut % 10; //   chia lay du cho 10 de lay chu so hang don vi phut
        digits_array[0] = mask[digit];    //  luu chu so hang don vi vao phan tu thu 0 cua mang
    }
}
void main() {
    TMOD = 0x01;    // Timer 0 duoc thiet lap o che do 16 bit
    TH0 = 0xFC;   //luu tru 8 bit cao cua timer 0
    TL0 = 0x18;   // luu tru 8 bit thap cua timer 0
    IE = 0x82;    // thiet lap cac bit trong thanh ghi IE de kich hoat timer 0
    TR0_bit = 1; // cho phep timer 0 bat dau dem
    P0 = 0xFF;   // xuat gia tri 0 xFF ra cong P0
    P1 &= 0xF0;   // xuat gia tri 0xF0 ra cong P1 va giu nguyen 4 bit cao va dat 4 bit thap bang 0
    digits_array_index = 0;   // thiet lap mang gia tri ban dau la 0
    shifter = 1;     // bat dau tu chu so dau tien
    digit = gio / 10;  //   chia gio cho 10 de lay chu so hang chuc
    digits_array[3] = mask[digit];     // luu chu so hang chuc cua gio vao phan tu thu 3 cua mang
    digit = gio % 10;        //chia lay du cho 10 de lay chu so hang don vi
    digits_array[2] = mask[digit];
    digit = phut / 10;
    digits_array[1] = mask[digit];
    digit = phut % 10;
    digits_array[0] = mask[digit];
    while (1) {
    }
}