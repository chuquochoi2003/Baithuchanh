void main() {
    unsigned char i;

    P0 = 0xFF;    //Khoi tao cac PORT voi gia tri muc cao
    P1 = 0xFF;
    P2 = 0xFF;
    P3 = 0xFF;

    while (1) {
        for (i = 0; i < 9; i++) {       //Tao ra so nhi ph�n voi bit 1 tai vi tr� thu i, c�c bit kh�c l� 0.
            P0 = ~(1 << i);           //�ao tat ca c�c bit
            Delay_ms(1000);           //Tao do tre 1s
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