#include <pic.h>
#define _XTAL_FREQ 4000000

unsigned char b[10];
unsigned char attempts = 0, admin_flag = 0;
unsigned int n = 0;

#define RS RD0
#define RW RD1
#define EN RD2

#define R1 RB4
#define R2 RB5
#define R3 RB6
#define R4 RB7
#define C1 RB3
#define C2 RB2
#define C3 RB1

#define BUZZER RC0


void lcd_cmd(unsigned char com)
{
	PORTD=(com & 0xf0);
	RS=0;
	RW=0;
	EN=1;
	__delay_ms(2);
	EN=0;
	
	PORTD=((com<<4) & 0xf0);
	RS=0;
	RW=0;
	EN=1;
	__delay_ms(2);
	EN=0;
}

void lcd_data(unsigned char data)
{
	PORTD=(data & 0xf0);
	RS=1;
	RW=0;
	EN=1;
	__delay_ms(2);
	EN=0;
	
	PORTD=((data<<4) & 0xf0);
	RS=1;
	RW=0;
	EN=1;
	__delay_ms(2);
	EN=0;
}

void lcd_init()
{
	lcd_cmd(0x02);
	lcd_cmd(0x28);
	lcd_cmd(0x0C);
	lcd_cmd(0x06);
	lcd_cmd(0x01);
}

void lcd_print(const unsigned char *msg)
{
	while(*msg) lcd_data(*msg++);
}


void EEPROM_Write(unsigned char addr, unsigned char value)
{
	while(WR);
	EEADR = addr;
	EEDATA = value;
	WREN = 1;

	GIE = 0;
	EECON2 = 0x55;
	EECON2 = 0xAA;
	WR = 1;
	GIE = 1;

	WREN = 0;
}

unsigned char EEPROM_Read(unsigned char addr)
{
	EEADR = addr;
	RD = 1;
	return EEDATA;
}


void keypad()
{
	n=0;
	while(n<4)
	{
		C1=1; C2=0; C3=0;
		if(R1) {while(R1); lcd_data('*'); b[n]='1'; n++; __delay_ms(200);}
		if(R2) {while(R2); lcd_data('*'); b[n]='4'; n++; __delay_ms(200);}
		if(R3) {while(R3); lcd_data('*'); b[n]='7'; n++; __delay_ms(200);}
		if(R4) {while(R4); lcd_data('*'); b[n]='*'; n++; __delay_ms(200);}
		
		C1=0; C2=1; C3=0;
		if(R1) {while(R1); lcd_data('*'); b[n]='2'; n++; __delay_ms(200);}
		if(R2) {while(R2); lcd_data('*'); b[n]='5'; n++; __delay_ms(200);}
		if(R3) {while(R3); lcd_data('*'); b[n]='8'; n++; __delay_ms(200);}
		if(R4) {while(R4); lcd_data('*'); b[n]='0'; n++; __delay_ms(200);}
		
		C1=0; C2=0; C3=1;
		if(R1) {while(R1); lcd_data('*'); b[n]='3'; n++; __delay_ms(200);}
		if(R2) {while(R2); lcd_data('*'); b[n]='6'; n++; __delay_ms(200);}
		if(R3) {while(R3); lcd_data('*'); b[n]='9'; n++; __delay_ms(200);}
		if(R4) {while(R4); lcd_data('*'); b[n]='#'; n++; __delay_ms(200);}
	}
}


void __interrupt() ISR(void)
{
	if(INTF)
	{
		__delay_ms(30);
		if(!RB0) admin_flag = 1;
		INTF = 0;
	}
}


void main()
{
	TRISD = 0x00;
	TRISB = 0xF1;  // RB7-4 input, RB3-1 output, RB0 interrupt input
	TRISC0 = 0;
	PORTB = 0xFF;
	PORTD = 0x00;
	BUZZER = 0;

	ADCON1 = 0x06;
	OPTION_REG &= 0b01111111;

	lcd_init();
	
	if(EEPROM_Read(10) != 0xAA)
	{
		EEPROM_Write(0,'1');
		EEPROM_Write(1,'2');
		EEPROM_Write(2,'3');
		EEPROM_Write(3,'4');
		EEPROM_Write(10,0xAA);
	}

	
	GIE=1; 
	INTE=1;
 	INTEDG=0;
	INTF=0;

	while(1)
	{
		
		if(admin_flag)
		{
			lcd_cmd(0x01);
			lcd_print("ADMIN MODE");
			__delay_ms(1500);

			lcd_cmd(0x01);
			lcd_print("New Password:");
			lcd_cmd(0xC0);

			keypad();
			int i;
			for(i=0;i<4;i++) 
				EEPROM_Write(i,b[i]);

			lcd_cmd(0x01);
			lcd_print("Saved!");
			__delay_ms(1500);

			admin_flag=0;
			attempts=0;
		}

		lcd_cmd(0x01);
		lcd_print("Enter Password:");
		lcd_cmd(0xC0);

		keypad();

		if(b[0]==EEPROM_Read(0) && b[1]==EEPROM_Read(1) &&
		   b[2]==EEPROM_Read(2) && b[3]==EEPROM_Read(3))
		{
			lcd_cmd(0x01);
			lcd_print("Access Granted");
			attempts=0;
			BUZZER=0;
			__delay_ms(2000);
		}
		else
		{
			attempts++;
			lcd_cmd(0x01);
			lcd_print("Wrong Password");
			__delay_ms(1500);

		while(attempts>=3)
			{
				BUZZER=1;
				__delay_ms(200);
				BUZZER=0;
				__delay_ms(200);

				if(admin_flag)
				{
					admin_flag=0;
					attempts=0;
					break;
				}
			}
		}
	}
}
