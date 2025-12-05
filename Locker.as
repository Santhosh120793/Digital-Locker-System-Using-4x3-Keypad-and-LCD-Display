opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_lcd_init
	FNCALL	_main,_EEPROM_Read
	FNCALL	_main,_EEPROM_Write
	FNCALL	_main,_lcd_cmd
	FNCALL	_main,_lcd_print
	FNCALL	_main,_keypad
	FNCALL	_keypad,_lcd_data
	FNCALL	_lcd_print,_lcd_data
	FNCALL	_lcd_init,_lcd_cmd
	FNROOT	_main
	global	_b
	global	main@_OPTION_REG
	global	_attempts
	global	_n
	global	_admin_flag
	global	_PORTB
psect	text206,local,class=CODE,delta=2
global __ptext206
__ptext206:
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RD0
_RD0	set	64
	global	_RD1
_RD1	set	65
	global	_RD2
_RD2	set	66
	global	_ADCON1
_ADCON1	set	159
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_INTEDG
_INTEDG	set	1038
	global	_TRISC0
_TRISC0	set	1080
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_4:	
	retlw	69	;'E'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	119	;'w'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	100	;'d'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_5:	
	retlw	65	;'A'
	retlw	99	;'c'
	retlw	99	;'c'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	71	;'G'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_6:	
	retlw	87	;'W'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	119	;'w'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_2:	
	retlw	78	;'N'
	retlw	101	;'e'
	retlw	119	;'w'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	97	;'a'
	retlw	115	;'s'
	retlw	115	;'s'
	retlw	119	;'w'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	100	;'d'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_1:	
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	77	;'M'
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	32	;' '
	retlw	77	;'M'
	retlw	79	;'O'
	retlw	68	;'D'
	retlw	69	;'E'
	retlw	0
psect	strings
	
STR_3:	
	retlw	83	;'S'
	retlw	97	;'a'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	33	;'!'
	retlw	0
psect	strings
	file	"Locker.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_n:
       ds      2

_admin_flag:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_b:
       ds      10

main@_OPTION_REG:
       ds      2

_attempts:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
	clrf	((__pbssBANK0)+12)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_cmd
?_lcd_cmd:	; 0 bytes @ 0x0
	global	??_lcd_cmd
??_lcd_cmd:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_print
?_lcd_print:	; 0 bytes @ 0x0
	global	?_EEPROM_Write
?_EEPROM_Write:	; 0 bytes @ 0x0
	global	??_EEPROM_Read
??_EEPROM_Read:	; 0 bytes @ 0x0
	global	?_keypad
?_keypad:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_EEPROM_Read
?_EEPROM_Read:	; 1 bytes @ 0x0
	global	EEPROM_Write@value
EEPROM_Write@value:	; 1 bytes @ 0x0
	global	EEPROM_Read@addr
EEPROM_Read@addr:	; 1 bytes @ 0x0
	ds	1
	global	??_EEPROM_Write
??_EEPROM_Write:	; 0 bytes @ 0x1
	global	EEPROM_Write@addr
EEPROM_Write@addr:	; 1 bytes @ 0x1
	ds	1
	global	lcd_cmd@com
lcd_cmd@com:	; 1 bytes @ 0x2
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_lcd_print
??_lcd_print:	; 0 bytes @ 0x3
	global	??_keypad
??_keypad:	; 0 bytes @ 0x3
	ds	1
	global	lcd_print@msg
lcd_print@msg:	; 1 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
	ds	3
	global	main@i
main@i:	; 2 bytes @ 0x9
	ds	2
;;Data sizes: Strings 78, constant 0, data 0, bss 16, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80      0      13
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_print@msg	PTR const unsigned char  size(1) Largest target is 16
;;		 -> STR_6(CODE[15]), STR_5(CODE[15]), STR_4(CODE[16]), STR_3(CODE[7]), 
;;		 -> STR_2(CODE[14]), STR_1(CODE[11]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_keypad
;;   _keypad->_lcd_data
;;   _lcd_print->_lcd_data
;;   _lcd_init->_lcd_cmd
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0     377
;;                                              6 COMMON     5     5      0
;;                           _lcd_init
;;                        _EEPROM_Read
;;                       _EEPROM_Write
;;                            _lcd_cmd
;;                          _lcd_print
;;                             _keypad
;; ---------------------------------------------------------------------------------
;; (1) _keypad                                               3     3      0      44
;;                                              3 COMMON     3     3      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_print                                            2     2      0      89
;;                                              3 COMMON     2     2      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      44
;;                            _lcd_cmd
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _lcd_cmd                                              3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_Read                                          1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_Write                                         2     1      1      44
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _lcd_cmd
;;   _EEPROM_Read
;;   _EEPROM_Write
;;   _lcd_cmd
;;   _lcd_print
;;     _lcd_data
;;   _keypad
;;     _lcd_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      1B       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       D       5       16.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      1D      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 134 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    9[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_lcd_init
;;		_EEPROM_Read
;;		_EEPROM_Write
;;		_lcd_cmd
;;		_lcd_print
;;		_keypad
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\project folder\security system\Locker.c"
	line	134
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+0+pclath+cstack]
	line	135
	
l2411:	
;Locker.c: 135: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	136
	
l2413:	
;Locker.c: 136: TRISB = 0xF1;
	movlw	(0F1h)
	movwf	(134)^080h	;volatile
	line	137
	
l2415:	
;Locker.c: 137: TRISC0 = 0;
	bcf	(1080/8)^080h,(1080)&7
	line	138
	
l2417:	
;Locker.c: 138: PORTB = 0xFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	139
;Locker.c: 139: PORTD = 0x00;
	clrf	(8)	;volatile
	line	140
	
l2419:	
;Locker.c: 140: RC0 = 0;
	bcf	(56/8),(56)&7
	line	142
	
l2421:	
;Locker.c: 142: ADCON1 = 0x06;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	143
	
l2423:	
;Locker.c: 143: OPTION_REG &= 0b01111111;
	movlw	low(07Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(main@_OPTION_REG),f
	movlw	high(07Fh)
	andwf	(main@_OPTION_REG+1),f
	line	145
	
l2425:	
;Locker.c: 145: lcd_init();
	fcall	_lcd_init
	line	147
	
l2427:	
;Locker.c: 147: if(EEPROM_Read(10) != 0xAA)
	movlw	(0Ah)
	fcall	_EEPROM_Read
	xorlw	0AAh
	skipnz
	goto	u2831
	goto	u2830
u2831:
	goto	l653
u2830:
	line	149
	
l2429:	
;Locker.c: 148: {
;Locker.c: 149: EEPROM_Write(0,'1');
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEPROM_Write)
	movlw	(0)
	fcall	_EEPROM_Write
	line	150
;Locker.c: 150: EEPROM_Write(1,'2');
	movlw	(032h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEPROM_Write)
	movlw	(01h)
	fcall	_EEPROM_Write
	line	151
;Locker.c: 151: EEPROM_Write(2,'3');
	movlw	(033h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEPROM_Write)
	movlw	(02h)
	fcall	_EEPROM_Write
	line	152
;Locker.c: 152: EEPROM_Write(3,'4');
	movlw	(034h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEPROM_Write)
	movlw	(03h)
	fcall	_EEPROM_Write
	line	153
;Locker.c: 153: EEPROM_Write(10,0xAA);
	movlw	(0AAh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEPROM_Write)
	movlw	(0Ah)
	fcall	_EEPROM_Write
	line	154
	
l653:	
	line	157
	
l2431:	
;Locker.c: 154: }
;Locker.c: 157: GIE=1;
	bsf	(95/8),(95)&7
	line	158
	
l2433:	
;Locker.c: 158: INTE=1;
	bsf	(92/8),(92)&7
	line	159
	
l2435:	
;Locker.c: 159: INTEDG=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	160
	
l2437:	
;Locker.c: 160: INTF=0;
	bcf	(89/8),(89)&7
	line	162
;Locker.c: 162: while(1)
	
l654:	
	line	165
	
l2439:	
;Locker.c: 163: {
;Locker.c: 165: if(admin_flag)
	movf	(_admin_flag),w
	skipz
	goto	u2840
	goto	l655
u2840:
	line	167
	
l2441:	
;Locker.c: 166: {
;Locker.c: 167: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	168
	
l2443:	
;Locker.c: 168: lcd_print("ADMIN MODE");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_print
	line	169
	
l2445:	
;Locker.c: 169: _delay((unsigned long)((1500)*(4000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_main+0)+0+2),f
movlw	150
movwf	((??_main+0)+0+1),f
	movlw	9
movwf	((??_main+0)+0),f
u2937:
	decfsz	((??_main+0)+0),f
	goto	u2937
	decfsz	((??_main+0)+0+1),f
	goto	u2937
	decfsz	((??_main+0)+0+2),f
	goto	u2937
	clrwdt
opt asmopt_on

	line	171
	
l2447:	
;Locker.c: 171: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	172
	
l2449:	
;Locker.c: 172: lcd_print("New Password:");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_print
	line	173
	
l2451:	
;Locker.c: 173: lcd_cmd(0xC0);
	movlw	(0C0h)
	fcall	_lcd_cmd
	line	175
	
l2453:	
;Locker.c: 175: keypad();
	fcall	_keypad
	line	177
	
l2455:	
;Locker.c: 176: int i;
;Locker.c: 177: for(i=0;i<4;i++)
	movlw	low(0)
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l2457:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(04h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2855
	movlw	low(04h)
	subwf	(main@i),w
u2855:

	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l656
u2850:
	
l2459:	
	goto	l657
	line	178
	
l656:	
	
l2461:	
;Locker.c: 178: EEPROM_Write(i,b[i]);
	movf	(main@i),w
	addlw	_b&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_EEPROM_Write)
	movf	(main@i),w
	fcall	_EEPROM_Write
	line	177
	
l2463:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2465:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+0
	movlw	(high(04h))^80h
	subwf	btemp+0,w
	skipz
	goto	u2865
	movlw	low(04h)
	subwf	(main@i),w
u2865:

	skipc
	goto	u2861
	goto	u2860
u2861:
	goto	l656
u2860:
	
l657:	
	line	180
	
l2467:	
;Locker.c: 180: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	181
	
l2469:	
;Locker.c: 181: lcd_print("Saved!");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_lcd_print
	line	182
	
l2471:	
;Locker.c: 182: _delay((unsigned long)((1500)*(4000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_main+0)+0+2),f
movlw	150
movwf	((??_main+0)+0+1),f
	movlw	9
movwf	((??_main+0)+0),f
u2947:
	decfsz	((??_main+0)+0),f
	goto	u2947
	decfsz	((??_main+0)+0+1),f
	goto	u2947
	decfsz	((??_main+0)+0+2),f
	goto	u2947
	clrwdt
opt asmopt_on

	line	184
	
l2473:	
;Locker.c: 184: admin_flag=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_admin_flag)
	line	185
	
l2475:	
;Locker.c: 185: attempts=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_attempts)
	line	186
	
l655:	
	line	188
	
l2477:	
;Locker.c: 186: }
;Locker.c: 188: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	189
	
l2479:	
;Locker.c: 189: lcd_print("Enter Password:");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_lcd_print
	line	190
	
l2481:	
;Locker.c: 190: lcd_cmd(0xC0);
	movlw	(0C0h)
	fcall	_lcd_cmd
	line	192
	
l2483:	
;Locker.c: 192: keypad();
	fcall	_keypad
	line	195
	
l2485:	
;Locker.c: 194: if(b[0]==EEPROM_Read(0) && b[1]==EEPROM_Read(1) &&
;Locker.c: 195: b[2]==EEPROM_Read(2) && b[3]==EEPROM_Read(3))
	movlw	(0)
	fcall	_EEPROM_Read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_b),w
	skipz
	goto	u2871
	goto	u2870
u2871:
	goto	l658
u2870:
	
l2487:	
	movlw	(01h)
	fcall	_EEPROM_Read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	0+(_b)+01h,w
	skipz
	goto	u2881
	goto	u2880
u2881:
	goto	l658
u2880:
	
l2489:	
	movlw	(02h)
	fcall	_EEPROM_Read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	0+(_b)+02h,w
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l658
u2890:
	
l2491:	
	movlw	(03h)
	fcall	_EEPROM_Read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	0+(_b)+03h,w
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l658
u2900:
	line	197
	
l2493:	
;Locker.c: 196: {
;Locker.c: 197: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	198
	
l2495:	
;Locker.c: 198: lcd_print("Access Granted");
	movlw	((STR_5-__stringbase))&0ffh
	fcall	_lcd_print
	line	199
	
l2497:	
;Locker.c: 199: attempts=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_attempts)
	line	200
	
l2499:	
;Locker.c: 200: RC0=0;
	bcf	(56/8),(56)&7
	line	201
	
l2501:	
;Locker.c: 201: _delay((unsigned long)((2000)*(4000000/4000.0)));
	opt asmopt_off
movlw  11
movwf	((??_main+0)+0+2),f
movlw	28
movwf	((??_main+0)+0+1),f
	movlw	99
movwf	((??_main+0)+0),f
u2957:
	decfsz	((??_main+0)+0),f
	goto	u2957
	decfsz	((??_main+0)+0+1),f
	goto	u2957
	decfsz	((??_main+0)+0+2),f
	goto	u2957
	clrwdt
opt asmopt_on

	line	202
;Locker.c: 202: }
	goto	l659
	line	203
	
l658:	
	line	205
	
l2503:	
;Locker.c: 203: else
;Locker.c: 204: {
;Locker.c: 205: attempts++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_attempts),f
	line	206
	
l2505:	
;Locker.c: 206: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	207
	
l2507:	
;Locker.c: 207: lcd_print("Wrong Password");
	movlw	((STR_6-__stringbase))&0ffh
	fcall	_lcd_print
	line	208
	
l2509:	
;Locker.c: 208: _delay((unsigned long)((1500)*(4000000/4000.0)));
	opt asmopt_off
movlw  8
movwf	((??_main+0)+0+2),f
movlw	150
movwf	((??_main+0)+0+1),f
	movlw	9
movwf	((??_main+0)+0),f
u2967:
	decfsz	((??_main+0)+0),f
	goto	u2967
	decfsz	((??_main+0)+0+1),f
	goto	u2967
	decfsz	((??_main+0)+0+2),f
	goto	u2967
	clrwdt
opt asmopt_on

	line	210
;Locker.c: 210: while(attempts>=3)
	goto	l660
	
l661:	
	line	212
;Locker.c: 211: {
;Locker.c: 212: RC0=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	213
	
l2511:	
;Locker.c: 213: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2977:
	decfsz	((??_main+0)+0),f
	goto	u2977
	decfsz	((??_main+0)+0+1),f
	goto	u2977
	decfsz	((??_main+0)+0+2),f
	goto	u2977
opt asmopt_on

	line	214
	
l2513:	
;Locker.c: 214: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	line	215
;Locker.c: 215: _delay((unsigned long)((200)*(4000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	3
movwf	((??_main+0)+0+1),f
	movlw	186
movwf	((??_main+0)+0),f
u2987:
	decfsz	((??_main+0)+0),f
	goto	u2987
	decfsz	((??_main+0)+0+1),f
	goto	u2987
	decfsz	((??_main+0)+0+2),f
	goto	u2987
opt asmopt_on

	line	217
;Locker.c: 217: if(admin_flag)
	movf	(_admin_flag),w
	skipz
	goto	u2910
	goto	l662
u2910:
	line	219
	
l2515:	
;Locker.c: 218: {
;Locker.c: 219: admin_flag=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_admin_flag)
	line	220
;Locker.c: 220: attempts=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_attempts)
	line	221
;Locker.c: 221: break;
	goto	l663
	line	222
	
l662:	
	line	223
	
l660:	
	line	210
	
l2517:	
	movlw	(03h)
	subwf	(_attempts),w
	skipnc
	goto	u2921
	goto	u2920
u2921:
	goto	l661
u2920:
	
l663:	
	line	224
	
l659:	
	line	225
	
l664:	
	line	162
	goto	l654
	
l665:	
	line	226
	
l666:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_keypad
psect	text207,local,class=CODE,delta=2
global __ptext207
__ptext207:

;; *************** function _keypad *****************
;; Defined at:
;;		line 97 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text207
	file	"E:\project folder\security system\Locker.c"
	line	97
	global	__size_of_keypad
	__size_of_keypad	equ	__end_of_keypad-_keypad
	
_keypad:	
	opt	stack 7
; Regs used in _keypad: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	98
	
l2253:	
;Locker.c: 98: n=0;
	movlw	low(0)
	movwf	(_n)
	movlw	high(0)
	movwf	((_n))+1
	line	99
;Locker.c: 99: while(n<4)
	goto	l593
	
l594:	
	line	101
;Locker.c: 100: {
;Locker.c: 101: RB3=1; RB2=0; RB1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	bcf	(50/8),(50)&7
	bcf	(49/8),(49)&7
	line	102
;Locker.c: 102: if(RB4) {while(RB4); lcd_data('*'); b[n]='1'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	btfss	(52/8),(52)&7
	goto	u2581
	goto	u2580
u2581:
	goto	l595
u2580:
	
l2255:	
	goto	l596
	
l597:	
	
l596:	
	btfsc	(52/8),(52)&7
	goto	u2591
	goto	u2590
u2591:
	goto	l597
u2590:
	
l598:	
	
l2257:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2259:	
	movlw	(031h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2261:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2263:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u2997:
	decfsz	((??_keypad+0)+0),f
	goto	u2997
	decfsz	((??_keypad+0)+0+1),f
	goto	u2997
	decfsz	((??_keypad+0)+0+2),f
	goto	u2997
opt asmopt_on

	
l595:	
	line	103
	
l2265:	
;Locker.c: 103: if(RB5) {while(RB5); lcd_data('*'); b[n]='4'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(53/8),(53)&7
	goto	u2601
	goto	u2600
u2601:
	goto	l599
u2600:
	
l2267:	
	goto	l600
	
l601:	
	
l600:	
	btfsc	(53/8),(53)&7
	goto	u2611
	goto	u2610
u2611:
	goto	l601
u2610:
	
l602:	
	
l2269:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2271:	
	movlw	(034h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2273:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2275:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3007:
	decfsz	((??_keypad+0)+0),f
	goto	u3007
	decfsz	((??_keypad+0)+0+1),f
	goto	u3007
	decfsz	((??_keypad+0)+0+2),f
	goto	u3007
opt asmopt_on

	
l599:	
	line	104
	
l2277:	
;Locker.c: 104: if(RB6) {while(RB6); lcd_data('*'); b[n]='7'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l603
u2620:
	
l2279:	
	goto	l604
	
l605:	
	
l604:	
	btfsc	(54/8),(54)&7
	goto	u2631
	goto	u2630
u2631:
	goto	l605
u2630:
	
l606:	
	
l2281:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2283:	
	movlw	(037h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2285:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2287:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3017:
	decfsz	((??_keypad+0)+0),f
	goto	u3017
	decfsz	((??_keypad+0)+0+1),f
	goto	u3017
	decfsz	((??_keypad+0)+0+2),f
	goto	u3017
opt asmopt_on

	
l603:	
	line	105
	
l2289:	
;Locker.c: 105: if(RB7) {while(RB7); lcd_data('*'); b[n]='*'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2641
	goto	u2640
u2641:
	goto	l607
u2640:
	
l2291:	
	goto	l608
	
l609:	
	
l608:	
	btfsc	(55/8),(55)&7
	goto	u2651
	goto	u2650
u2651:
	goto	l609
u2650:
	
l610:	
	
l2293:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2295:	
	movlw	(02Ah)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2297:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2299:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3027:
	decfsz	((??_keypad+0)+0),f
	goto	u3027
	decfsz	((??_keypad+0)+0+1),f
	goto	u3027
	decfsz	((??_keypad+0)+0+2),f
	goto	u3027
opt asmopt_on

	
l607:	
	line	107
	
l2301:	
;Locker.c: 107: RB3=0; RB2=1; RB1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
	
l2303:	
	bsf	(50/8),(50)&7
	
l2305:	
	bcf	(49/8),(49)&7
	line	108
	
l2307:	
;Locker.c: 108: if(RB4) {while(RB4); lcd_data('*'); b[n]='2'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	btfss	(52/8),(52)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l611
u2660:
	
l2309:	
	goto	l612
	
l613:	
	
l612:	
	btfsc	(52/8),(52)&7
	goto	u2671
	goto	u2670
u2671:
	goto	l613
u2670:
	
l614:	
	
l2311:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2313:	
	movlw	(032h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2315:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2317:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3037:
	decfsz	((??_keypad+0)+0),f
	goto	u3037
	decfsz	((??_keypad+0)+0+1),f
	goto	u3037
	decfsz	((??_keypad+0)+0+2),f
	goto	u3037
opt asmopt_on

	
l611:	
	line	109
	
l2319:	
;Locker.c: 109: if(RB5) {while(RB5); lcd_data('*'); b[n]='5'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(53/8),(53)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l615
u2680:
	
l2321:	
	goto	l616
	
l617:	
	
l616:	
	btfsc	(53/8),(53)&7
	goto	u2691
	goto	u2690
u2691:
	goto	l617
u2690:
	
l618:	
	
l2323:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2325:	
	movlw	(035h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2327:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2329:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3047:
	decfsz	((??_keypad+0)+0),f
	goto	u3047
	decfsz	((??_keypad+0)+0+1),f
	goto	u3047
	decfsz	((??_keypad+0)+0+2),f
	goto	u3047
opt asmopt_on

	
l615:	
	line	110
	
l2331:	
;Locker.c: 110: if(RB6) {while(RB6); lcd_data('*'); b[n]='8'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2701
	goto	u2700
u2701:
	goto	l619
u2700:
	
l2333:	
	goto	l620
	
l621:	
	
l620:	
	btfsc	(54/8),(54)&7
	goto	u2711
	goto	u2710
u2711:
	goto	l621
u2710:
	
l622:	
	
l2335:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2337:	
	movlw	(038h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2339:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2341:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3057:
	decfsz	((??_keypad+0)+0),f
	goto	u3057
	decfsz	((??_keypad+0)+0+1),f
	goto	u3057
	decfsz	((??_keypad+0)+0+2),f
	goto	u3057
opt asmopt_on

	
l619:	
	line	111
	
l2343:	
;Locker.c: 111: if(RB7) {while(RB7); lcd_data('*'); b[n]='0'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2721
	goto	u2720
u2721:
	goto	l623
u2720:
	
l2345:	
	goto	l624
	
l625:	
	
l624:	
	btfsc	(55/8),(55)&7
	goto	u2731
	goto	u2730
u2731:
	goto	l625
u2730:
	
l626:	
	
l2347:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2349:	
	movlw	(030h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2351:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2353:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3067:
	decfsz	((??_keypad+0)+0),f
	goto	u3067
	decfsz	((??_keypad+0)+0+1),f
	goto	u3067
	decfsz	((??_keypad+0)+0+2),f
	goto	u3067
opt asmopt_on

	
l623:	
	line	113
	
l2355:	
;Locker.c: 113: RB3=0; RB2=0; RB1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
	
l2357:	
	bcf	(50/8),(50)&7
	
l2359:	
	bsf	(49/8),(49)&7
	line	114
	
l2361:	
;Locker.c: 114: if(RB4) {while(RB4); lcd_data('*'); b[n]='3'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	btfss	(52/8),(52)&7
	goto	u2741
	goto	u2740
u2741:
	goto	l627
u2740:
	
l2363:	
	goto	l628
	
l629:	
	
l628:	
	btfsc	(52/8),(52)&7
	goto	u2751
	goto	u2750
u2751:
	goto	l629
u2750:
	
l630:	
	
l2365:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2367:	
	movlw	(033h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2369:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2371:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3077:
	decfsz	((??_keypad+0)+0),f
	goto	u3077
	decfsz	((??_keypad+0)+0+1),f
	goto	u3077
	decfsz	((??_keypad+0)+0+2),f
	goto	u3077
opt asmopt_on

	
l627:	
	line	115
	
l2373:	
;Locker.c: 115: if(RB5) {while(RB5); lcd_data('*'); b[n]='6'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(53/8),(53)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l631
u2760:
	
l2375:	
	goto	l632
	
l633:	
	
l632:	
	btfsc	(53/8),(53)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l633
u2770:
	
l634:	
	
l2377:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2379:	
	movlw	(036h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2381:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2383:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3087:
	decfsz	((??_keypad+0)+0),f
	goto	u3087
	decfsz	((??_keypad+0)+0+1),f
	goto	u3087
	decfsz	((??_keypad+0)+0+2),f
	goto	u3087
opt asmopt_on

	
l631:	
	line	116
	
l2385:	
;Locker.c: 116: if(RB6) {while(RB6); lcd_data('*'); b[n]='9'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(54/8),(54)&7
	goto	u2781
	goto	u2780
u2781:
	goto	l635
u2780:
	
l2387:	
	goto	l636
	
l637:	
	
l636:	
	btfsc	(54/8),(54)&7
	goto	u2791
	goto	u2790
u2791:
	goto	l637
u2790:
	
l638:	
	
l2389:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2391:	
	movlw	(039h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2393:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2395:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3097:
	decfsz	((??_keypad+0)+0),f
	goto	u3097
	decfsz	((??_keypad+0)+0+1),f
	goto	u3097
	decfsz	((??_keypad+0)+0+2),f
	goto	u3097
opt asmopt_on

	
l635:	
	line	117
	
l2397:	
;Locker.c: 117: if(RB7) {while(RB7); lcd_data('*'); b[n]='#'; n++; _delay((unsigned long)((200)*(4000000/4000.0)));}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(55/8),(55)&7
	goto	u2801
	goto	u2800
u2801:
	goto	l639
u2800:
	
l2399:	
	goto	l640
	
l641:	
	
l640:	
	btfsc	(55/8),(55)&7
	goto	u2811
	goto	u2810
u2811:
	goto	l641
u2810:
	
l642:	
	
l2401:	
	movlw	(02Ah)
	fcall	_lcd_data
	
l2403:	
	movlw	(023h)
	movwf	(??_keypad+0)+0
	movf	(_n),w
	addlw	_b&0ffh
	movwf	fsr0
	movf	(??_keypad+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l2405:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
l2407:	
	opt asmopt_off
movlw  2
movwf	((??_keypad+0)+0+2),f
movlw	3
movwf	((??_keypad+0)+0+1),f
	movlw	186
movwf	((??_keypad+0)+0),f
u3107:
	decfsz	((??_keypad+0)+0),f
	goto	u3107
	decfsz	((??_keypad+0)+0+1),f
	goto	u3107
	decfsz	((??_keypad+0)+0+2),f
	goto	u3107
opt asmopt_on

	
l639:	
	line	118
	
l593:	
	line	99
	
l2409:	
	movlw	high(04h)
	subwf	(_n+1),w
	movlw	low(04h)
	skipnz
	subwf	(_n),w
	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l594
u2820:
	
l643:	
	line	119
	
l644:	
	return
	opt stack 0
GLOBAL	__end_of_keypad
	__end_of_keypad:
;; =============== function _keypad ends ============

	signat	_keypad,88
	global	_lcd_print
psect	text208,local,class=CODE,delta=2
global __ptext208
__ptext208:

;; *************** function _lcd_print *****************
;; Defined at:
;;		line 67 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;  msg             1    wreg     PTR const unsigned char 
;;		 -> STR_6(15), STR_5(15), STR_4(16), STR_3(7), 
;;		 -> STR_2(14), STR_1(11), 
;; Auto vars:     Size  Location     Type
;;  msg             1    4[COMMON] PTR const unsigned char 
;;		 -> STR_6(15), STR_5(15), STR_4(16), STR_3(7), 
;;		 -> STR_2(14), STR_1(11), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text208
	file	"E:\project folder\security system\Locker.c"
	line	67
	global	__size_of_lcd_print
	__size_of_lcd_print	equ	__end_of_lcd_print-_lcd_print
	
_lcd_print:	
	opt	stack 7
; Regs used in _lcd_print: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_print@msg stored from wreg
	movwf	(lcd_print@msg)
	line	68
	
l2245:	
;Locker.c: 68: while(*msg) lcd_data(*msg++);
	goto	l578
	
l579:	
	
l2247:	
	movf	(lcd_print@msg),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	
l2249:	
	movlw	(01h)
	movwf	(??_lcd_print+0)+0
	movf	(??_lcd_print+0)+0,w
	addwf	(lcd_print@msg),f
	
l578:	
	
l2251:	
	movf	(lcd_print@msg),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2571
	goto	u2570
u2571:
	goto	l579
u2570:
	
l580:	
	line	69
	
l581:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_print
	__end_of_lcd_print:
;; =============== function _lcd_print ends ============

	signat	_lcd_print,4216
	global	_lcd_init
psect	text209,local,class=CODE,delta=2
global __ptext209
__ptext209:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 58 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_cmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text209
	file	"E:\project folder\security system\Locker.c"
	line	58
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 7
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	59
	
l2243:	
;Locker.c: 59: lcd_cmd(0x02);
	movlw	(02h)
	fcall	_lcd_cmd
	line	60
;Locker.c: 60: lcd_cmd(0x28);
	movlw	(028h)
	fcall	_lcd_cmd
	line	61
;Locker.c: 61: lcd_cmd(0x0C);
	movlw	(0Ch)
	fcall	_lcd_cmd
	line	62
;Locker.c: 62: lcd_cmd(0x06);
	movlw	(06h)
	fcall	_lcd_cmd
	line	63
;Locker.c: 63: lcd_cmd(0x01);
	movlw	(01h)
	fcall	_lcd_cmd
	line	64
	
l575:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_data
psect	text210,local,class=CODE,delta=2
global __ptext210
__ptext210:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 41 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_print
;;		_keypad
;; This function uses a non-reentrant model
;;
psect	text210
	file	"E:\project folder\security system\Locker.c"
	line	41
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg+status,2+status,0]
;lcd_data@data stored from wreg
	movwf	(lcd_data@data)
	line	42
	
l2219:	
;Locker.c: 42: PORTD=(data & 0xf0);
	movf	(lcd_data@data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	43
	
l2221:	
;Locker.c: 43: RD0=1;
	bsf	(64/8),(64)&7
	line	44
	
l2223:	
;Locker.c: 44: RD1=0;
	bcf	(65/8),(65)&7
	line	45
	
l2225:	
;Locker.c: 45: RD2=1;
	bsf	(66/8),(66)&7
	line	46
	
l2227:	
;Locker.c: 46: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_lcd_data+0)+0+1),f
	movlw	151
movwf	((??_lcd_data+0)+0),f
u3117:
	decfsz	((??_lcd_data+0)+0),f
	goto	u3117
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u3117
	nop2
opt asmopt_on

	line	47
	
l2229:	
;Locker.c: 47: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	49
	
l2231:	
;Locker.c: 49: PORTD=((data<<4) & 0xf0);
	movf	(lcd_data@data),w
	movwf	(??_lcd_data+0)+0
	movlw	(04h)-1
u2565:
	clrc
	rlf	(??_lcd_data+0)+0,f
	addlw	-1
	skipz
	goto	u2565
	clrc
	rlf	(??_lcd_data+0)+0,w
	andlw	0F0h
	movwf	(8)	;volatile
	line	50
	
l2233:	
;Locker.c: 50: RD0=1;
	bsf	(64/8),(64)&7
	line	51
	
l2235:	
;Locker.c: 51: RD1=0;
	bcf	(65/8),(65)&7
	line	52
	
l2237:	
;Locker.c: 52: RD2=1;
	bsf	(66/8),(66)&7
	line	53
	
l2239:	
;Locker.c: 53: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_lcd_data+0)+0+1),f
	movlw	151
movwf	((??_lcd_data+0)+0),f
u3127:
	decfsz	((??_lcd_data+0)+0),f
	goto	u3127
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u3127
	nop2
opt asmopt_on

	line	54
	
l2241:	
;Locker.c: 54: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	55
	
l572:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_lcd_cmd
psect	text211,local,class=CODE,delta=2
global __ptext211
__ptext211:

;; *************** function _lcd_cmd *****************
;; Defined at:
;;		line 24 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;  com             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  com             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text211
	file	"E:\project folder\security system\Locker.c"
	line	24
	global	__size_of_lcd_cmd
	__size_of_lcd_cmd	equ	__end_of_lcd_cmd-_lcd_cmd
	
_lcd_cmd:	
	opt	stack 7
; Regs used in _lcd_cmd: [wreg+status,2+status,0]
;lcd_cmd@com stored from wreg
	movwf	(lcd_cmd@com)
	line	25
	
l2195:	
;Locker.c: 25: PORTD=(com & 0xf0);
	movf	(lcd_cmd@com),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	26
	
l2197:	
;Locker.c: 26: RD0=0;
	bcf	(64/8),(64)&7
	line	27
	
l2199:	
;Locker.c: 27: RD1=0;
	bcf	(65/8),(65)&7
	line	28
	
l2201:	
;Locker.c: 28: RD2=1;
	bsf	(66/8),(66)&7
	line	29
	
l2203:	
;Locker.c: 29: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	151
movwf	((??_lcd_cmd+0)+0),f
u3137:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u3137
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u3137
	nop2
opt asmopt_on

	line	30
	
l2205:	
;Locker.c: 30: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	32
	
l2207:	
;Locker.c: 32: PORTD=((com<<4) & 0xf0);
	movf	(lcd_cmd@com),w
	movwf	(??_lcd_cmd+0)+0
	movlw	(04h)-1
u2555:
	clrc
	rlf	(??_lcd_cmd+0)+0,f
	addlw	-1
	skipz
	goto	u2555
	clrc
	rlf	(??_lcd_cmd+0)+0,w
	andlw	0F0h
	movwf	(8)	;volatile
	line	33
	
l2209:	
;Locker.c: 33: RD0=0;
	bcf	(64/8),(64)&7
	line	34
	
l2211:	
;Locker.c: 34: RD1=0;
	bcf	(65/8),(65)&7
	line	35
	
l2213:	
;Locker.c: 35: RD2=1;
	bsf	(66/8),(66)&7
	line	36
	
l2215:	
;Locker.c: 36: _delay((unsigned long)((2)*(4000000/4000.0)));
	opt asmopt_off
movlw	3
movwf	((??_lcd_cmd+0)+0+1),f
	movlw	151
movwf	((??_lcd_cmd+0)+0),f
u3147:
	decfsz	((??_lcd_cmd+0)+0),f
	goto	u3147
	decfsz	((??_lcd_cmd+0)+0+1),f
	goto	u3147
	nop2
opt asmopt_on

	line	37
	
l2217:	
;Locker.c: 37: RD2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(66/8),(66)&7
	line	38
	
l569:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_cmd
	__end_of_lcd_cmd:
;; =============== function _lcd_cmd ends ============

	signat	_lcd_cmd,4216
	global	_EEPROM_Read
psect	text212,local,class=CODE,delta=2
global __ptext212
__ptext212:

;; *************** function _EEPROM_Read *****************
;; Defined at:
;;		line 89 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text212
	file	"E:\project folder\security system\Locker.c"
	line	89
	global	__size_of_EEPROM_Read
	__size_of_EEPROM_Read	equ	__end_of_EEPROM_Read-_EEPROM_Read
	
_EEPROM_Read:	
	opt	stack 7
; Regs used in _EEPROM_Read: [wreg]
;EEPROM_Read@addr stored from wreg
	movwf	(EEPROM_Read@addr)
	line	90
	
l2189:	
;Locker.c: 90: EEADR = addr;
	movf	(EEPROM_Read@addr),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	91
	
l2191:	
;Locker.c: 91: RD = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3168/8)^0180h,(3168)&7
	line	92
;Locker.c: 92: return EEDATA;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	
l2193:	
	line	93
	
l590:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Read
	__end_of_EEPROM_Read:
;; =============== function _EEPROM_Read ends ============

	signat	_EEPROM_Read,4217
	global	_EEPROM_Write
psect	text213,local,class=CODE,delta=2
global __ptext213
__ptext213:

;; *************** function _EEPROM_Write *****************
;; Defined at:
;;		line 73 in file "E:\project folder\security system\Locker.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  value           1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text213
	file	"E:\project folder\security system\Locker.c"
	line	73
	global	__size_of_EEPROM_Write
	__size_of_EEPROM_Write	equ	__end_of_EEPROM_Write-_EEPROM_Write
	
_EEPROM_Write:	
	opt	stack 7
; Regs used in _EEPROM_Write: [wreg]
;EEPROM_Write@addr stored from wreg
	movwf	(EEPROM_Write@addr)
	line	74
	
l2175:	
;Locker.c: 74: while(WR);
	goto	l584
	
l585:	
	
l584:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u2541
	goto	u2540
u2541:
	goto	l585
u2540:
	
l586:	
	line	75
	
l2177:	
;Locker.c: 75: EEADR = addr;
	movf	(EEPROM_Write@addr),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	line	76
;Locker.c: 76: EEDATA = value;
	movf	(EEPROM_Write@value),w
	movwf	(268)^0100h	;volatile
	line	77
	
l2179:	
;Locker.c: 77: WREN = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	line	79
	
l2181:	
;Locker.c: 79: GIE = 0;
	bcf	(95/8),(95)&7
	line	80
;Locker.c: 80: EECON2 = 0x55;
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	line	81
;Locker.c: 81: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	line	82
	
l2183:	
;Locker.c: 82: WR = 1;
	bsf	(3169/8)^0180h,(3169)&7
	line	83
	
l2185:	
;Locker.c: 83: GIE = 1;
	bsf	(95/8),(95)&7
	line	85
	
l2187:	
;Locker.c: 85: WREN = 0;
	bcf	(3170/8)^0180h,(3170)&7
	line	86
	
l587:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_Write
	__end_of_EEPROM_Write:
;; =============== function _EEPROM_Write ends ============

	signat	_EEPROM_Write,8312
psect	text214,local,class=CODE,delta=2
global __ptext214
__ptext214:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
