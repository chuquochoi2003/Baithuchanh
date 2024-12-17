#include <REGX52.H>
sbit mode = P1^0;
sbit Set = P1^1;
sbit Up = P1^2;
sbit Down = P1^3 ;
sbit DQ = P3^7 ;
sbit l1 = P2^0;
sbit l2 = P2^1 ;
sbit l3 = P2^2;
sbit l4 = P2^3; 
bit sel, set2, upl,up2, downl, down2;
unsigned char sol[10]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
int nhiet_thuc,k,d,i;

unsigned char Data, Display, tome, index, set, bat_nhay, read_time;
char sec, hour, min, day, date, month, year, year_20,tt;
void delay(unsigned int i)
{
while(i--);
}

void delay_18B20 (unsigned int i)

{
while (i--);
}

void Init_DS18B20 (void)
{
unsigned char x=0;
DQ = 1;
delay_18B20(8);
DQ = 0;
delay_18B20(80);
DQ = 1;
delay_18B20(14);
x=DQ;
delay_18B20(20);
}

unsigned char ReadOneChar(void)
{
	unsigned char i =0;
	unsigned char dat = 0;
	for (i=8;i>0;i--)
	{
		DQ = 0;
		dat>>=1;
		DQ = 1;
		if(DQ)
		dat|=0x80;
		delay_18B20(4);
	}
return(dat);
 }
void WriteOneChar (unsigned char dat)
{
unsigned char i = 0;
for ( i = 8; i > 0 ;i--)
{
DQ = 0;
DQ = dat&0x01;
delay_18B20 (5);
DQ = 1;
dat>>=1;
}
}

void ReadTemp (void)
{
unsigned char a = 0 ;
unsigned char b = 0 ;
unsigned char c = 0;
Init_DS18B20();
WriteOneChar(0xCC); 
WriteOneChar(0x44);
delay_18B20 (100);

Init_DS18B20(); 
WriteOneChar(0xCC); 
WriteOneChar (0xBE);
delay_18B20(100);
a=ReadOneChar();
b=ReadOneChar();
nhiet_thuc=b<<4;
nhiet_thuc+=(a&0xf0)>>4;
// nhiet_thuc=(int) (nhiet_thuc);
}
void nutnhan(void)
{
	if(!mode)
	{i++;
		Display=1;
		set=0;
		if(i==2) {i=0;Display=0;}
	}
		if(mode==0) {delay(1000); while(mode==0); delay(1000);}
		if(Display==0)
		{
			if(Set==0)
			{
				set++;
				delay(1000);while(Set==0);delay(1000);
				if(set==2) {set=0;}
			}
			if(set==1)
			{ if(nhiet_thuc<99)
				if(!Up) {nhiet_thuc=nhiet_thuc+1; delay(9000); }
				if(!Down) {nhiet_thuc=nhiet_thuc-1;delay(9000);}
			}
		}
	}
void hien_thi()
{if(nhiet_thuc>99)
	nhiet_thuc=99;
	if(nhiet_thuc<1)
	nhiet_thuc=0;
	for (k=0;k<100;k++)
	{P0=0xff;
		l4=0;
		P0=sol[nhiet_thuc/10];
		delay(90);
		l4=1; 
		P0=0xff;
		
		l3=0;
		P0=sol[nhiet_thuc%10];
		delay(90);
		l3=1;
		P0=0xff;  
		
		l2=0;
		P0=0x9c;
		delay(90);
		l2=1;
		P0=0xff;
		//
		l1=0;
	P0=0xc6;
	delay(90);
		l1=1;
	P0=0xff;
	}
}
void main()
{ P1=0xff;
	d=0;
	Init_DS18B20();
	while(1)
	{P1=0xff;
	nutnhan(); 
		if(set!=1)
	ReadTemp();
		if(set==1)
			delay(10000000);
		hien_thi();
	}
}

		
	
		
		
		
				
		
	