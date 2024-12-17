#include <REGX51.H>
#define dendo P0_0
#define denvang P0_1
#define denxanh P0_2
#define LED1 P2_0
#define LED2 P2_1
#define LED P3

char code so[]={0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};
int b,dem,chuc,dv,i;

void delay_ms()
{
	TMOD = 0x01;
	TH0 = 0xfc;
	TL0 = 0x18;
	TR0 = 1;
	while (!TF0);
	TF0 = 0;
	TR0 = 0;
}
void hienthi()
{
	chuc = dem/10;
	dv = dem%10;
}
void led()
{
 	LED = so[chuc];
	LED1=1;
	delay_ms();
	LED1=0;
	LED=so[dv];
	LED2=1;
	delay_ms();
	LED2=0;
}
void main()
{
	while(1){
		dendo=0;
		denvang=1;
		denxanh=1;
		for (dem=10;dem>=0;dem--)
		{
			for(i=0;i<500;i++)
			{
			led();
			} 
			hienthi();
		}
		
		dendo=1;
		denvang=0;
		denxanh=1;
		for (dem=5;dem>=0;dem--)
		{
			for(i=0;i<500;i++)
			{
			led();
			}
			hienthi();
		}
		dendo=1;
		denvang=1;
		denxanh=0;
		for (dem=10;dem>=0;dem--)
		{
			for(i=0;i<500;i++)
			{
			led();
			}
			hienthi();
		}
	}
}			 