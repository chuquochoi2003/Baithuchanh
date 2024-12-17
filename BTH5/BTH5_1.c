#include <REGX51.H>
//DINH NGHIA CAC CHAN PIN
#define LED1 P2_0
#define LED2 P2_1
#define LED3 P2_2
#define LED4 P2_3
char LED_7_THANH[10] = {0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
int so=0;
int nghin,tram,chuc,dv;
void delay_ms(int x)
{
	int i,j;
	for(i=0;i<x;i++){
		for(j=0;j<125;j++){
	}
}
	}

void hienthi_LED_7_THANH(int x)
{
	nghin = x/1000;
	tram = x%10000/100;
	chuc = x%100/10;
	dv = x%10;
	LED1=0;
	LED2=0;
	LED3=0;
	LED4=0;
	P0 = LED_7_THANH[nghin];LED1=1;delay_ms(2);LED1=0;
	P0 = LED_7_THANH[tram];LED2=2;delay_ms(2);LED2=0;
	P0 = LED_7_THANH[chuc];LED3=3;delay_ms(2);LED3=0;
	P0 = LED_7_THANH[dv];LED4=4;delay_ms(2);LED4=0;
} 
void ham_ngat_ngoai0(void)interrupt 0
{
	so++;
}
void ham_ngat_ngoai1(void)interrupt 2
{
	so--;
}
void main()
{
		EX0=1;
		IT0=1;
		EX1=1;
		IT1=1;
		EA=1;
	while(1)
	{
hienthi_LED_7_THANH(so);
	}
}
