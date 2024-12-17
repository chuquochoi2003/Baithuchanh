#include <REGX51.H>

// Khai b�o c�c ch�n LED
sbit led1 = P1^0;
sbit led2 = P1^1;
sbit led3 = P1^2;
sbit led4 = P1^3;

// Ch? d? t?n s? nh?p nh�y cho c�c LED (theo ms)
#define LED1_DELAY 1000
#define LED2_DELAY 600
#define LED3_DELAY 400
#define LED4_DELAY 150

// H�m delay d? t?o d? tr? theo mili gi�y
void delay(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 123; j++);  // Kho?ng 1 ms t?i t?n s? 12MHz
    }
}

// H�m ch�nh
void main(void) {
    while (1) {
        // �i?u khi?n LED1
        led1 = 1;  // B?t LED1
        delay(LED1_DELAY);
        led1 = 0;  // T?t LED1
        delay(LED1_DELAY);

        // �i?u khi?n LED2
        led2 = 1;  // B?t LED2
        delay(LED2_DELAY);
        led2 = 0;  // T?t LED2
        delay(LED2_DELAY);

        // �i?u khi?n LED3
        led3 = 1;  // B?t LED3
        delay(LED3_DELAY);
        led3 = 0;  // T?t LED3
        delay(LED3_DELAY);

        // �i?u khi?n LED4
        led4 = 1;  // B?t LED4
        delay(LED4_DELAY);
        led4 = 0;  // T?t LED4
        delay(LED4_DELAY);
    }
}
