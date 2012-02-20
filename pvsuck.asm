;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Thu Dec 22 00:04:02 2011
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
	.file	"pvsuck.c"
	list	p=16f877
	radix dec
	include "p16f877.inc"
;--------------------------------------------------------
; config word 
;--------------------------------------------------------
	__config 0x37f9
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ADCON0_bits
	extern	_ADCON1_bits
	extern	_CCP1CON_bits
	extern	_CCP2CON_bits
	extern	_EECON1_bits
	extern	_INTCON_bits
	extern	_OPTION_REG_bits
	extern	_PCON_bits
	extern	_PIE1_bits
	extern	_PIE2_bits
	extern	_PIR1_bits
	extern	_PIR2_bits
	extern	_PORTA_bits
	extern	_PORTB_bits
	extern	_PORTC_bits
	extern	_PORTD_bits
	extern	_PORTE_bits
	extern	_RCSTA_bits
	extern	_SSPCON_bits
	extern	_SSPCON2_bits
	extern	_SSPSTAT_bits
	extern	_STATUS_bits
	extern	_T1CON_bits
	extern	_T2CON_bits
	extern	_TRISA_bits
	extern	_TRISB_bits
	extern	_TRISC_bits
	extern	_TRISD_bits
	extern	_TRISE_bits
	extern	_TXSTA_bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	___sdcc_saved_fsr
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_delay
	global	_isr
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_pvsuck_0	udata
r0x1001	res	1
r0x1002	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  _isr	;Function start
; 0 exit points
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=0previous max_key=0 
_isr	;Function start
; 0 exit points
; >>> gen.c:2340:genFunction
	.line	10; "pvsuck.c"	void isr() interrupt 0 {                                                                                                         /* interrupt service routine */
	MOVWF	WSAVE
; >>> gen.c:2341:genFunction
	SWAPF	STATUS,W
; >>> gen.c:2346:genFunction
	CLRF	STATUS
; >>> gen.c:2347:genFunction
	MOVWF	SSAVE
; >>> gen.c:2349:genFunction
	MOVF	PCLATH,W
; >>> gen.c:2351:genFunction
	CLRF	PCLATH
; >>> gen.c:2352:genFunction
	MOVWF	PSAVE
; >>> gen.c:2354:genFunction
	MOVF	FSR,W
; >>> gen.c:2355:genFunction
	.line	12; "pvsuck.c"	}
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
	MOVWF	FSR
; >>> gen.c:2511:genEndFunction
	MOVF	PSAVE,W
; >>> gen.c:2512:genEndFunction
	MOVWF	PCLATH
; >>> gen.c:2513:genEndFunction
	CLRF	STATUS
; >>> gen.c:2515:genEndFunction
	SWAPF	SSAVE,W
; >>> gen.c:2516:genEndFunction
	MOVWF	STATUS
; >>> gen.c:2517:genEndFunction
	SWAPF	WSAVE,F
; >>> gen.c:2518:genEndFunction
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	
;; gen.c:6803:genpic14Code *{*

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_pvsuck	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=8previous max_key=3 
_main	;Function start
; 2 exit points
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _TRISB, size = 1
;; 	line = 6342 result AOP_DIR=_TRISB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  6434
; >>> gen.c:6443:genAssign
;;	1013
;;	1029  _TRISB   offset=0
	.line	24; "pvsuck.c"	TRISB = 0;
	BANKSEL	_TRISB
	CLRF	_TRISB
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _PORTB, size = 1
;; 	line = 6342 result AOP_DIR=_PORTB, size=1, left -=-, size=0, right AOP_LIT=0x0f, size=1
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
_00117_DS_
	.line	27; "pvsuck.c"	PORTB = 0x0F;
	MOVLW	0x0f
; >>> gen.c:6441:genAssign
;;	1013
;;	1029  _PORTB   offset=0
	BANKSEL	_PORTB
	MOVWF	_PORTB
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
; >>> gen.c:2118:genCall
	.line	29; "pvsuck.c"	delay();
	CALL	_delay
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _PORTB, size = 1
;; 	line = 6342 result AOP_DIR=_PORTB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  6434
; >>> gen.c:6443:genAssign
;;	1013
;;	1029  _PORTB   offset=0
	.line	31; "pvsuck.c"	PORTB = 0x00;
	BANKSEL	_PORTB
	CLRF	_PORTB
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
; >>> gen.c:2118:genCall
	.line	33; "pvsuck.c"	delay();
	CALL	_delay
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; gen.c:2614:genGoto *{*
; >>> gen.c:2616:genGoto
;; ***	popGetLabel  key=2, label offset 15
	GOTO	_00117_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;entry:  _delay	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x1001
;   r0x1002
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=4previous max_key=0 
_delay	;Function start
; 2 exit points
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=2
;; 	line = 6342 result AOP_REG=r0x1049, size=2, left -=-, size=0, right AOP_LIT=0x10, size=2
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	.line	18; "pvsuck.c"	for (counter = 0; counter<10000; counter++) {
	MOVLW	0x10
; >>> gen.c:6441:genAssign
;;	1109 rIdx = r0x1049 
	BANKSEL	r0x1001
	MOVWF	r0x1001
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	MOVLW	0x27
; >>> gen.c:6441:genAssign
;;	1109 rIdx = r0x104A 
	MOVWF	r0x1002
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; gen.c:6695:genDjnz *{*
;; ***	genDjnz  6696
;; genarith.c:832:genMinus *{*
;; ***	genMinus  833
;;	721 register type nRegs=2
;;	606
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; genarith.c:270:genAddLit *{*
;; ***	genAddLit  271
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; hi = ff	genAddLit  342
; >>> genarith.c:353:genAddLit
_00111_DS_
	MOVLW	0xff
; >>> genarith.c:354:genAddLit
;;	1109 rIdx = r0x1049 
	BANKSEL	r0x1001
	ADDWF	r0x1001,F
; >>> genarith.c:355:genAddLit
	BTFSS	STATUS,0
; >>> genarith.c:356:genAddLit
;;	1109 rIdx = r0x104A 
	DECF	r0x1002,F
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; ***	addSign  797
;; genarith.c:798:addSign *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6187:genIfx *{*
;; ***	genIfx  6188
;;	721 register type nRegs=2
;; ***	pic14_toBoolean  1500
; >>> gen.c:1509:pic14_toBoolean
;;	1109 rIdx = r0x1049 
	MOVF	r0x1001,W
; >>> gen.c:1514:pic14_toBoolean
;;	1109 rIdx = r0x104A 
	IORWF	r0x1002,W
; >>> gen.c:6233:genIfx
	BTFSS	STATUS,2
; >>> gen.c:6234:genIfx
;; ***	popGetLabel  key=3, label offset 8
	GOTO	_00111_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
	RETURN	
; exit point of _delay
;; gen.c:6803:genpic14Code *{*


;	code size estimation:
;	   39+    6 =    45 instructions (  102 byte)

	end
