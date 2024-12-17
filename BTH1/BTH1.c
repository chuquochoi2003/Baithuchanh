void main() {
    unsigned char i;

    P0 = 0xFF;    //Khoi tao cac PORT voi gia tri muc cao
    P1 = 0xFF;
    P2 = 0xFF;
    P3 = 0xFF;

    while (1) {
        for (i = 0; i < 9; i++) {       //Tao ra so nhi phân voi bit 1 tai vi trí thu i, các bit khác là 0.
            P0 = ~(1 << i);           //Ðao tat ca các bit
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