#define ROWS P2       // Su dung P2 de dieu khien các hàng
#define COLUMNS P3    // Su dung P3 de dieu khien các cot

// Mang mã hóa cho "H" trên ma tren LED 8x8
unsigned char letter_H[8] = {
    0xC3, // 1100 0011               //khai bao mang letter_H
    0xC3, // 1100 0011
    0xC3, // 1100 0011
    0xFF, // 1111 1111
    0xFF, // 1111 1111
    0xC3, // 1100 0011
    0xC3, // 1100 0011
    0xC3  // 1100 0011
};


unsigned char letter_O[8] = {
    0x3C, // 0011 1100
    0x66, // 0110 0110
    0xC3, // 1100 0011
    0xC3, // 1100 0011
    0xC3, // 1100 0011
    0xC3, // 1100 0011
    0x66, // 0110 0110
    0x3C  // 0011 1100
};

//Tao mot mang co ten letter voi 8 phan tu
unsigned char letter_I[8] = {
    0xFF, // 1111 1111
    0x18, // 0001 1000
    0x18, // 0001 1000
    0x18, // 0001 1000
    0x18, // 0001 1000
    0x18, // 0001 1000
    0x18, // 0001 1000
    0xFF  // 1111 1111
};


void delay_short() {
    unsigned int i;
    for (i = 0; i < 200; i++); // Ðieu chinh giá tri i
}

// Hàm hien thi
void display_letter(unsigned char *letter) {       //Con tro den mang chua du lieu cua chu cái can hien thi.
    int row; //khai bao bien row theo kieu so nguyen
    for (row = 0; row < 8; row++) {
        ROWS = ~(1 << row);
        COLUMNS = letter[row];   //gui du lieu cac hang hien tai den cac cot
        delay_short();
        ROWS = 0xFF;      //dat cac hang o muc cao sau khi chuyen sang mang khac
    }
}


void display_name() {        //khoi tao ham display_name va lay du lieu bang cach goi ham display_letter
    int i;
    for (i = 0; i < 50; i++) display_letter(letter_H);   //vong lap goi ham display_letter hien thi 50 lan
    for (i = 0; i < 50; i++) display_letter(letter_O);
    for (i = 0; i < 50; i++) display_letter(letter_I);
}

void main() {
    while (1) {
        display_name();
    }
}