;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Tue Feb 21 00:01:53 2012
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
	extern	__print_format
	extern	_printf_small
	extern	_printf
	extern	_vprintf
	extern	_sprintf
	extern	_vsprintf
	extern	_puts
	extern	_gets
	extern	_getchar
	extern	_putchar
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
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_delay
	global	_serial_setup_19200
	global	_timer_intr
	global	_print
	global	_main
	global	_ring
	global	_ring_pointer

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
UD_pvsuck_0	udata
_ring	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_pvsuck_0	udata
r0x1012	res	1
r0x1013	res	1
r0x1016	res	1
r0x1015	res	1
r0x1014	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_pvsuck_0	idata
_ring_pointer
	db	0x00

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
;entry:  _timer_intr	;Function start
; 0 exit points
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=11previous max_key=0 
_timer_intr	;Function start
; 0 exit points
; >>> gen.c:2340:genFunction
	.line	42; "pvsuck.c"	void timer_intr() interrupt 0 {
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
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:5608:genPointerGet *{*
;; ***	genPointerGet  5609
;; gen.c:5397:genNearPointerGet *{*
;; ***	genNearPointerGet  5398
;;	641
;;	aopForRemat 425
;;	446: rname _PIR1_bits, val 0, const = 0
;; ***	genNearPointerGet  5414
;;	721 register type nRegs=1
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; gen.c:5240:genUnpackBits *{*
;; ***	genUnpackBits  5241
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1_bits
; >>> gen.c:5257:genUnpackBits
	.line	43; "pvsuck.c"	if(TXIF) { // serial interrupt
	BANKSEL	_PIR1_bits
	BTFSS	_PIR1_bits,4
; >>> gen.c:5258:genUnpackBits
;; ***	popGetLabel  key=3, label offset 15
	GOTO	_00118_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _TXREG, size = 1
;; 	line = 6342 result AOP_DIR=_TXREG, size=1, left -=-, size=0, right AOP_LIT=0x6e, size=1
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	.line	46; "pvsuck.c"	TXREG = 'n';
	MOVLW	0x6e
; >>> gen.c:6441:genAssign
;;	1013
;;	1029  _TXREG   offset=0
	MOVWF	_TXREG
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _PIE1_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1_bits
;; 	line = 5965 result AOP_PCODE=_PIE1_bits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1_bits
; >>> gen.c:5720:genPackBits
	.line	47; "pvsuck.c"	TXIE = 0;
	BANKSEL	_PIE1_bits
	BCF	_PIE1_bits,4
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
; >>> gen.c:2508:genEndFunction
_00118_DS_
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
; >>> gen.c:2509:genEndFunction
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
;; ***	genFunction  2285 curr label offset=22previous max_key=6 
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
	.line	79; "pvsuck.c"	TRISB = 0;
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
_00134_DS_
	.line	81; "pvsuck.c"	PORTB = 0x0F;
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
	.line	83; "pvsuck.c"	delay();
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
	.line	85; "pvsuck.c"	PORTB = 0x00;
	BANKSEL	_PORTB
	CLRF	_PORTB
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
; >>> gen.c:2118:genCall
	.line	87; "pvsuck.c"	delay();
	CALL	_delay
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; gen.c:2614:genGoto *{*
; >>> gen.c:2616:genGoto
;; ***	popGetLabel  key=2, label offset 32
	GOTO	_00134_DS_
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
;entry:  _print	;Function start
; 2 exit points
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;9 compiler assigned registers:
;   r0x1014
;   STK00
;   r0x1015
;   STK01
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=15previous max_key=3 
_print	;Function start
; 2 exit points
;; gen.c:2261:resultRemat *{*
;; gen.c:6739:genReceive *{*
;; ***	genReceive  6740
;;	721 register type nRegs=3
;; gen.c:1866:assignResultValue *{*
;; ***	assignResultValue  1868
;; 	line = 1870 result -=-, size=0, left AOP_REG=r0x104A, size=3, right -=-, size=0
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x104E 
	.line	57; "pvsuck.c"	void print(char* p) {
	BANKSEL	r0x1014
	MOVWF	r0x1014
; >>> gen.c:1393:get_returnvalue
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVF	STK00,W
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x104D 
	MOVWF	r0x1015
; >>> gen.c:1393:get_returnvalue
;; ***	popRegFromIdx,1043  , rIdx=0x7e
	MOVF	STK01,W
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x104A 
	MOVWF	r0x1016
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=1
;; 	line = 6342 result AOP_REG=r0x104F, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  6434
; >>> gen.c:6443:genAssign
;;	1109 rIdx = r0x104F 
	.line	62; "pvsuck.c"	while(c = *p) {
	CLRF	r0x1017
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=3
;;	721 register type nRegs=3
;; 	line = 6342 result AOP_REG=r0x104A, size=3, left -=-, size=0, right AOP_REG=r0x104A, size=3
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:5608:genPointerGet *{*
;; ***	genPointerGet  5609
;; gen.c:5496:genGenPointerGet *{*
;; ***	genGenPointerGet  5497
;;	721 register type nRegs=3
;;	721 register type nRegs=1
;; 	line = 5502 result AOP_REG=r0x1050, size=1, left AOP_REG=r0x104A, size=3, right -=-, size=0
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x104A 
_00123_DS_
	BANKSEL	r0x1016
	MOVF	r0x1016,W
; >>> gen.c:5521:genGenPointerGet
;; ***	popRegFromIdx,1043  , rIdx=0x7e
	MOVWF	STK01
;; ***	mov2w  1356  offset=1
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x104D 
	MOVF	r0x1015,W
; >>> gen.c:5523:genGenPointerGet
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVWF	STK00
;; ***	mov2w  1356  offset=2
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x104E 
	MOVF	r0x1014,W
; >>> gen.c:1402:call_libraryfunc
	PAGESEL	__gptrget1
; >>> gen.c:1404:call_libraryfunc
	CALL	__gptrget1
; >>> gen.c:1406:call_libraryfunc
	PAGESEL	$
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1050 
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVWF	r0x1019
;; gen.c:2261:resultRemat *{*
;; gen.c:6187:genIfx *{*
;; ***	genIfx  6188
;;	721 register type nRegs=1
;; ***	pic14_toBoolean  1500
; >>> gen.c:1506:pic14_toBoolean
	MOVF	r0x1018,W
	BTFSC	STATUS,2
; >>> gen.c:6237:genIfx
;; ***	popGetLabel  key=3, label offset 22
	GOTO	_00125_DS_
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;;	641
;;	aopForRemat 425
;;	446: rname _ring, val 0, const = 0
;;	721 register type nRegs=1
;;	721 register type nRegs=2
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_ring
;; 	line = 554 result AOP_REG=r0x1050, size=2, left AOP_PCODE=_ring, size=2, right AOP_REG=r0x104F, size=1
;; ***	pic14_getDataSize  1426
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1426
;; ***	genPlus  653
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_ring
; >>> genarith.c:662:genPlus
;;	1109 rIdx = r0x104F 
	.line	63; "pvsuck.c"	ring[i] = c;
	MOVF	r0x1017,W
; >>> genarith.c:671:genPlus
	ADDLW	(_ring + 0)
; >>> genarith.c:672:genPlus
;;	1109 rIdx = r0x1050 
	MOVWF	r0x1018
; >>> genarith.c:735:genPlus
	MOVLW	high (_ring + 0)
; >>> genarith.c:736:genPlus
	BTFSC	STATUS,0
; >>> genarith.c:737:genPlus
	ADDLW	0x01
; >>> genarith.c:738:genPlus
;;	1109 rIdx = r0x1052 
	MOVWF	r0x101A
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	721 register type nRegs=2
;; ***	genNearPointerSet  5963
;;	721 register type nRegs=1
;; 	line = 5965 result AOP_REG=r0x1050, size=2, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1050 
	MOVF	r0x1018,W
; >>> gen.c:5146:setup_fsr
	MOVWF	FSR
;; gen.c:5116:SetIrp *{*
; >>> gen.c:5133:SetIrp
	BCF	STATUS,7
; >>> gen.c:5135:SetIrp
	BTFSC	r0x101A,0
; >>> gen.c:5136:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  5992
; >>> gen.c:6001:genNearPointerSet
;;	1109 rIdx = r0x1051 
	MOVF	r0x1019,W
; >>> gen.c:6006:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  6014
;; ***	genNearPointerSet  6025
;; ***	genNearPointerSet  6036
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;;	721 register type nRegs=1
;;	606
;; 	line = 554 result AOP_REG=r0x104F, size=1, left AOP_REG=r0x104F, size=1, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1426
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  156
; >>> genarith.c:168:genPlusIncr
;;	1109 rIdx = r0x104F 
	.line	64; "pvsuck.c"	i++;
	INCF	r0x1017,F
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;;	721 register type nRegs=3
;;	606
;; 	line = 554 result AOP_REG=r0x104A, size=3, left AOP_REG=r0x104A, size=3, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1446
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  156
; >>> genarith.c:168:genPlusIncr
;;	1109 rIdx = r0x104A 
	.line	65; "pvsuck.c"	p++;
	INCF	r0x1016,F
; >>> genarith.c:172:genPlusIncr
	BTFSC	STATUS,2
; >>> genarith.c:173:genPlusIncr
;;	1109 rIdx = r0x104D 
	INCF	r0x1015,F
;; gen.c:2261:resultRemat *{*
;; gen.c:2614:genGoto *{*
; >>> gen.c:2616:genGoto
;; ***	popGetLabel  key=1, label offset 22
	GOTO	_00123_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;;	641
;;	aopForRemat 425
;;	446: rname _ring, val 0, const = 0
;;	721 register type nRegs=1
;;	721 register type nRegs=2
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_ring
;; 	line = 554 result AOP_REG=r0x104F, size=2, left AOP_PCODE=_ring, size=2, right AOP_REG=r0x104F, size=1
;; ***	pic14_getDataSize  1426
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	pic14_getDataSize  1426
;; ***	genPlus  653
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_ring
; >>> genarith.c:662:genPlus
;;	1109 rIdx = r0x104F 
_00125_DS_
	.line	67; "pvsuck.c"	ring[i]      = 0; // terminate
	BANKSEL	r0x1017
	MOVF	r0x1017,W
; >>> genarith.c:671:genPlus
	ADDLW	(_ring + 0)
; >>> genarith.c:672:genPlus
;;	1109 rIdx = r0x104F 
	MOVWF	r0x1017
; >>> genarith.c:735:genPlus
	MOVLW	high (_ring + 0)
; >>> genarith.c:736:genPlus
	BTFSC	STATUS,0
; >>> genarith.c:737:genPlus
	ADDLW	0x01
; >>> genarith.c:738:genPlus
;;	1109 rIdx = r0x104A 
	MOVWF	r0x1016
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	721 register type nRegs=2
;; ***	genNearPointerSet  5963
;; 	line = 5965 result AOP_REG=r0x104F, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x104F 
	MOVF	r0x1017,W
; >>> gen.c:5146:setup_fsr
	MOVWF	FSR
;; gen.c:5116:SetIrp *{*
; >>> gen.c:5133:SetIrp
	BCF	STATUS,7
; >>> gen.c:5135:SetIrp
	BTFSC	r0x1016,0
; >>> gen.c:5136:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  5992
; >>> gen.c:5999:genNearPointerSet
	MOVLW	0x00
; >>> gen.c:6006:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  6014
;; ***	genNearPointerSet  6025
;; ***	genNearPointerSet  6036
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _ring_pointer, size = 1
;; 	line = 6342 result AOP_DIR=_ring_pointer, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  6434
; >>> gen.c:6443:genAssign
;;	1013
;;	1029  _ring_pointer   offset=0
	.line	68; "pvsuck.c"	ring_pointer = 0;
	BANKSEL	_ring_pointer
	CLRF	_ring_pointer
;; gen.c:2261:resultRemat *{*
;; gen.c:5608:genPointerGet *{*
;; ***	genPointerGet  5609
;; gen.c:5397:genNearPointerGet *{*
;; ***	genNearPointerGet  5398
;;	641
;;	aopForRemat 425
;;	446: rname _ring, val 0, const = 0
;; gen.c:5352:genDataPointerGet *{*
;; ***	genDataPointerGet  5353
;;	721 register type nRegs=1
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_ring
;; 	line = 5365 result AOP_REG=r0x104A, size=1, left AOP_PCODE=_ring, size=2, right -=-, size=0
; >>> gen.c:5374:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1130 _ring
	.line	69; "pvsuck.c"	c            = ring[0];
	BANKSEL	_ring
	MOVF	(_ring + 0),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVWF	r0x1019
;; gen.c:2261:resultRemat *{*
;; gen.c:6187:genIfx *{*
;; ***	genIfx  6188
;;	721 register type nRegs=1
;; ***	pic14_toBoolean  1500
; >>> gen.c:1506:pic14_toBoolean
	.line	70; "pvsuck.c"	if(c) {
	MOVF	r0x1019,W
	BTFSC	STATUS,2
; >>> gen.c:6237:genIfx
;; ***	popGetLabel  key=6, label offset 22
	GOTO	_00128_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _ring_pointer, size = 1
;; 	line = 6342 result AOP_DIR=_ring_pointer, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	.line	71; "pvsuck.c"	ring_pointer++; // Only move forward if there is a char there
	MOVLW	0x01
; >>> gen.c:6441:genAssign
;;	1013
;;	1029  _ring_pointer   offset=0
	BANKSEL	_ring_pointer
	MOVWF	_ring_pointer
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _PIE1_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1_bits
;; 	line = 5965 result AOP_PCODE=_PIE1_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1_bits
; >>> gen.c:5720:genPackBits
	.line	72; "pvsuck.c"	TXIE = 1;
	BANKSEL	_PIE1_bits
	BSF	_PIE1_bits,4
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=1
;; ***	aopForSym 350
;;	361 sym->rname = _TXREG, size = 1
;; 	line = 6342 result AOP_DIR=_TXREG, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genAssign  6434
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1051 
	.line	73; "pvsuck.c"	TXREG = c;
	BANKSEL	r0x1019
	MOVF	r0x1019,W
; >>> gen.c:6453:genAssign
;;	1013
;;	1029  _TXREG   offset=0
	BANKSEL	_TXREG
	MOVWF	_TXREG
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
_00128_DS_
	RETURN	
; exit point of _print
;; gen.c:6803:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _serial_setup_19200	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=4previous max_key=3 
_serial_setup_19200	;Function start
; 2 exit points
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _SPBRG, size = 1
;; 	line = 6342 result AOP_DIR=_SPBRG, size=1, left -=-, size=0, right AOP_LIT=0x0c, size=1
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	.line	31; "pvsuck.c"	SPBRG = 12; // 4MHz = > 19200 baud
	MOVLW	0x0c
; >>> gen.c:6441:genAssign
;;	1013
;;	1029  _SPBRG   offset=0
	BANKSEL	_SPBRG
	MOVWF	_SPBRG
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _TXSTA_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTA_bits
;; 	line = 5965 result AOP_PCODE=_TXSTA_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTA_bits
; >>> gen.c:5720:genPackBits
	.line	32; "pvsuck.c"	BRGH  = 1;
	BSF	_TXSTA_bits,2
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _TXSTA_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTA_bits
;; 	line = 5965 result AOP_PCODE=_TXSTA_bits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTA_bits
; >>> gen.c:5720:genPackBits
	.line	33; "pvsuck.c"	SYNC  = 0;
	BCF	_TXSTA_bits,4
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _RCSTA_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_RCSTA_bits
;; 	line = 5965 result AOP_PCODE=_RCSTA_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_RCSTA_bits
; >>> gen.c:5720:genPackBits
	.line	34; "pvsuck.c"	SPEN  = 1;
	BANKSEL	_RCSTA_bits
	BSF	_RCSTA_bits,7
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _PIE1_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1_bits
;; 	line = 5965 result AOP_PCODE=_PIE1_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1_bits
; >>> gen.c:5720:genPackBits
	.line	35; "pvsuck.c"	TXIE  = 1;
	BANKSEL	_PIE1_bits
	BSF	_PIE1_bits,4
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _TXSTA_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTA_bits
;; 	line = 5965 result AOP_PCODE=_TXSTA_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTA_bits
; >>> gen.c:5720:genPackBits
	.line	38; "pvsuck.c"	TXEN  = 1;
	BSF	_TXSTA_bits,5
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;; ***	aopForSym 350
;;	361 sym->rname = _TXREG, size = 1
;; 	line = 6342 result AOP_DIR=_TXREG, size=1, left -=-, size=0, right AOP_LIT=0x6e, size=1
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	.line	39; "pvsuck.c"	TXREG = 'n'; // Actually emit our char.
	MOVLW	0x6e
; >>> gen.c:6441:genAssign
;;	1013
;;	1029  _TXREG   offset=0
	BANKSEL	_TXREG
	MOVWF	_TXREG
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
	RETURN	
; exit point of _serial_setup_19200
;; gen.c:6803:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _delay	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x1012
;   r0x1013
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=0previous max_key=0 
_delay	;Function start
; 2 exit points
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=2
;; 	line = 6342 result AOP_REG=r0x1048, size=2, left -=-, size=0, right AOP_LIT=0xe8, size=2
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	.line	22; "pvsuck.c"	for (counter = 0; counter<1000; counter++) {
	MOVLW	0xe8
; >>> gen.c:6441:genAssign
;;	1109 rIdx = r0x1048 
	BANKSEL	r0x1012
	MOVWF	r0x1012
;; ***	genAssign  6434
; >>> gen.c:6439:genAssign
	MOVLW	0x03
; >>> gen.c:6441:genAssign
;;	1109 rIdx = r0x1049 
	MOVWF	r0x1013
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
_00107_DS_
	MOVLW	0xff
; >>> genarith.c:354:genAddLit
;;	1109 rIdx = r0x1048 
	BANKSEL	r0x1012
	ADDWF	r0x1012,F
; >>> genarith.c:355:genAddLit
	BTFSS	STATUS,0
; >>> genarith.c:356:genAddLit
;;	1109 rIdx = r0x1049 
	DECF	r0x1013,F
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
;;	1109 rIdx = r0x1048 
	MOVF	r0x1012,W
; >>> gen.c:1514:pic14_toBoolean
;;	1109 rIdx = r0x1049 
	IORWF	r0x1013,W
; >>> gen.c:6233:genIfx
	BTFSS	STATUS,2
; >>> gen.c:6234:genIfx
;; ***	popGetLabel  key=3, label offset 4
	GOTO	_00107_DS_
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
;	  118+   26 =   144 instructions (  340 byte)

	end
