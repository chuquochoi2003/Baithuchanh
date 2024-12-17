#include <REGX51.H>
// Khai b�o ch�n giao ti?p LCD16x2 4bit
#define LCD_RS P2_0
#define LCD_RW P2_1
#define LCD_EN P2_2
#define LCD_D4 P2_4
#define LCD_D5 P2_5
#define LCD_D6 P2_6
#define LCD_D7 P2_7
// Khai b�o ch�n giao ti?p DS18B20
#define DQ P0_0
unsigned char temp; // Bi?n luu gi� tr? nhi?t d?
void delay_us(unsigned int t) {
    unsigned int i;
    for (i = 0; i < t; i++) ;
}    
// H�m delay mili gi�y
void delay_ms(unsigned int t) {
    unsigned int i, j;
    for (i = 0; i < t; i++)
    for (j = 0; j < 125; j++); // T�y thu?c v�o t?n s? CPU
}

// H�m delay chuy�n bi?t cho DS18B20
void delay_18B20(unsigned int ti) {
	while(ti--);
}

// Kh?i t?o DS18B20
void Init_18B20(void) {
    DQ = 1;
    delay_18B20(8); // T?o xung reset
    DQ = 0;
    delay_18B20(65);
		DQ = 1;
		delay_18B20(20); // T?o xung reset
}


unsigned char ReadOneChar(void) {
    unsigned char i=0;
		unsigned char dat = 0;
    for (i = 8; i>0; i--) {
        DQ = 0;
        dat >>= 1;
        DQ = 1;
        if (DQ) {
        dat |= 0x80;
        }
        delay_18B20(4);
    }
    return dat;
}
void WriteOneChar(unsigned char dat) {
    unsigned char i=0;
    for (i = 8; i >0; i--) {
        DQ = 0;
        DQ = dat & 0x01;
        delay_18B20(5);
        DQ = 1;
        dat >>= 1;
    }
}

// �?c nhi?t d? t? DS18B20
void ReadTemperature(void) {
    unsigned char a = 0;
		unsigned char b = 0;	
    Init_18B20();
    WriteOneChar(0xCC); // Skip ROM
    WriteOneChar(0x44); // Convert T
    delay_18B20(10);      // Ch? chuy?n d?i
    Init_18B20();
    WriteOneChar(0xCC); // Skip ROM
    WriteOneChar(0xBE); // Read Scratchpad
		delay_18B20(10);
    a = ReadOneChar(); // �?c gi� tr? low
    b = ReadOneChar(); // �?c gi� tr? high
    temp = ((b*256+a) >> 4);
		EA=1; 												// X? l� gi� tr? nhi?t d?
}

// K�ch LCD_EN d? LCD nh?n l?nh
void LCD_Enable(void) {
    LCD_EN = 1;
    delay_us(3);
    LCD_EN = 0;
    delay_us(50);
}

// G?i 4 bit d? li?u ra LCD
void LCD_Send4Bit(unsigned char Data) {
    LCD_D4 = Data & 0x01;
    LCD_D5 = (Data >> 1) & 1;
    LCD_D6 = (Data >> 2) & 1;
    LCD_D7 = (Data >> 3) & 1;
}

// G?i 1 l?nh t?i LCD
void LCD_SendCommand(unsigned char command) {
    LCD_Send4Bit(command >> 4); // G?i 4 bit cao
    LCD_Enable();
    LCD_Send4Bit(command);     // G?i 4 bit th?p
    LCD_Enable();
}

// X�a m�n h�nh LCD
void LCD_Clear() {
    LCD_SendCommand(0x01);
    delay_us(10);
}

// Kh?i t?o LCD
void LCD_Init() {
    LCD_Send4Bit(0x00);
    delay_ms(20);
    LCD_RS = 0;
    LCD_RW = 0;

    LCD_Send4Bit(0x03);
    LCD_Enable();
    delay_ms(5);
		LCD_Enable();
		delay_us(100);
		LCD_Enable();
    LCD_Send4Bit(0x02);
    LCD_Enable();
    LCD_SendCommand(0x28); // Ch? d? 4 bit, 2 d�ng, font 5x8
    LCD_SendCommand(0x0C); // B?t m�n h�nh, t?t con tr?
    LCD_SendCommand(0x06);
		LCD_SendCommand(0x01);// Tang con tr?, kh�ng d?ch m�n h�nh
}

// �?t con tr? LCD
void LCD_Gotoxy(unsigned char x, unsigned char y) {
	unsigned char address;
    if (!y) address = (0x80 + x);
    else address = (0xC0 + x);
		delay_us(1000);
    LCD_SendCommand(address);
    delay_us(50);
}

// Hi?n th? 1 k� t? l�n LCD
void LCD_PutChar(unsigned char Data) {
    LCD_RS = 1;
		LCD_SendCommand(Data);
		LCD_RS=0;
}

// Hi?n th? chu?i k� t? l�n LCD
void LCD_Puts(char *s) {
    while (*s) {
        LCD_PutChar(*s);
        s++;
    }
}

// Hi?n th? gi� tr? nhi?t d? l�n LCD
void TempShow(unsigned char z) {
    LCD_Puts("Nhiet do: ");
    
    if (z >= 100) { 
        // N?u s? c� h�ng tram
        LCD_PutChar((z / 100) + 48);  // Hi?n th? s? h�ng tram
    }

    if (z >= 10) {
        // N?u s? c� h�ng ch?c
        LCD_PutChar((z % 100 / 10) + 48); // Hi?n th? s? h�ng ch?c
    } else if (z < 100) {
        // N?u s? nh? hon 10 v� kh�ng c� h�ng tram, th�m '0'
        LCD_PutChar('0');
    }

    LCD_PutChar((z % 10) + 48);  // Hi?n th? s? h�ng don v?
		LCD_PutChar(0xDF); // Hi?n th? k� hi?u d? �
    LCD_Puts("F");
}

// Chuong tr�nh ch�nh
unsigned char temp; 
void main() {
    LCD_Init();       // Kh?i t?o LCD
    delay_ms(200);    // Ch? ?n d?nh
    LCD_Puts("Do nhiet do...");
    delay_ms(500);
    LCD_Clear();
		LCD_Gotoxy(0,1);
    while (1) {
        LCD_Gotoxy(0,0);
        ReadTemperature(); // �?c nhi?t d?
        TempShow(temp*9/5+32); 
				// Hi?n th? nhi?t d?
        delay_ms(500);     // 0.5 gi�y d?c m?t l?n
    }
}