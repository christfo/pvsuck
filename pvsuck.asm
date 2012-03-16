;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Fri Mar 16 00:28:42 2012
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
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_delay
	global	_serial_setup_19200
	global	_intr
	global	_print
	global	_main
	global	_txring
	global	_txring_in
	global	_txring_out

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
_txring	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_pvsuck_0	udata
r0x1014	res	1
r0x1013	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
r0x101B	res	1
r0x101D	res	1
r0x101C	res	1
r0x101E	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_pvsuck_0	idata
_txring_in
	db	0x00


ID_pvsuck_1	idata
_txring_out
	db	0x00


ID_pvsuck_2	code
__str_0
	retlw 0x48 ; 'H'
	retlw 0x65 ; 'e'
	retlw 0x6c ; 'l'
	retlw 0x6c ; 'l'
	retlw 0x6f ; 'o'
	retlw 0x20 ; ' '
	retlw 0x57 ; 'W'
	retlw 0x6f ; 'o'
	retlw 0x72 ; 'r'
	retlw 0x6c ; 'l'
	retlw 0x64 ; 'd'
	retlw 0x0a ; '.'
	retlw 0x00 ; '.'
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
;entry:  _intr	;Function start
; 0 exit points
;2 compiler assigned registers:
;   r0x1013
;   r0x1014
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=9previous max_key=0 
_intr	;Function start
; 0 exit points
; >>> gen.c:2340:genFunction
	.line	38; "pvsuck.c"	void intr() interrupt 0 {
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
	.line	39; "pvsuck.c"	if(TXIF) { // serial interrupt
	BANKSEL	_PIR1_bits
	BTFSS	_PIR1_bits,4
; >>> gen.c:5258:genUnpackBits
;; ***	popGetLabel  key=5, label offset 13
	GOTO	_00118_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; gen.c:3388:genCmpEq *{*
;; ***	genCmpEq  3389
;; ifx is non-null
;; ***	aopForSym 350
;;	361 sym->rname = _txring_out, size = 1
;; ***	aopForSym 350
;;	361 sym->rname = _txring_in, size = 1
;; 	line = 3400 result AOP_CRY=0x00, size=0, left AOP_DIR=_txring_out, size=1, right AOP_DIR=_txring_in, size=1
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1013
;;	1027  _txring_in   offset=0 - had to alloc by reg name
	.line	40; "pvsuck.c"	if( txring_out != txring_in ) {
	BANKSEL	_txring_in
	MOVF	_txring_in,W
; >>> gen.c:3469:genCmpEq
;;	1013
;;	1029  _txring_out   offset=0
	.line	41; "pvsuck.c"	txring_out = (txring_out + 1) & (RING_SZ-1);
	BANKSEL	_txring_out
	XORWF	_txring_out,W
	BTFSC	STATUS,2
	GOTO	_00118_DS_
	INCF	_txring_out,W
	BANKSEL	r0x1013
	MOVWF	r0x1013
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; ***	addSign  797
;; genarith.c:798:addSign *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; gen.c:3719:genAnd *{*
;; ***	genAnd  3720
;;	721 register type nRegs=1
;; ***	aopForSym 350
;;	361 sym->rname = _txring_out, size = 1
;; 	line = 3754 result AOP_DIR=_txring_out, size=1, left AOP_REG=r0x104D, size=1, right AOP_LIT=0x0f, size=1
; >>> gen.c:3952:genAnd
	MOVLW	0x0f
; >>> gen.c:3953:genAnd
;;	1109 rIdx = r0x104D 
	ANDWF	r0x1013,W
; >>> gen.c:3954:genAnd
;;	1013
;;	1029  _txring_out   offset=0
	BANKSEL	_txring_out
	MOVWF	_txring_out
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;;	641
;;	aopForRemat 425
;;	446: rname _txring, val 0, const = 0
;; ***	aopForSym 350
;;	361 sym->rname = _txring_out, size = 1
;;	721 register type nRegs=2
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_txring
;; 	line = 554 result AOP_REG=r0x104D, size=2, left AOP_PCODE=_txring, size=2, right AOP_DIR=_txring_out, size=1
;; ***	pic14_getDataSize  1426
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_PCODE, right AOP_DIR
;; ***	pic14_getDataSize  1426
;; ***	genPlus  653
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_txring
; >>> genarith.c:662:genPlus
;;	1013
;;	1029  _txring_out   offset=0
	.line	42; "pvsuck.c"	TXREG = txring[txring_out];
	MOVF	_txring_out,W
; >>> genarith.c:671:genPlus
	ADDLW	(_txring + 0)
; >>> genarith.c:672:genPlus
;;	1109 rIdx = r0x104D 
	BANKSEL	r0x1013
	MOVWF	r0x1013
; >>> genarith.c:735:genPlus
	MOVLW	high (_txring + 0)
; >>> genarith.c:736:genPlus
	BTFSC	STATUS,0
; >>> genarith.c:737:genPlus
	ADDLW	0x01
; >>> genarith.c:738:genPlus
;;	1109 rIdx = r0x104E 
	MOVWF	r0x1014
;; gen.c:2261:resultRemat *{*
;; gen.c:5608:genPointerGet *{*
;; ***	genPointerGet  5609
;; gen.c:5397:genNearPointerGet *{*
;; ***	genNearPointerGet  5398
;;	721 register type nRegs=2
;; ***	genNearPointerGet  5414
;; ***	aopForSym 350
;;	361 sym->rname = _TXREG, size = 1
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x104D 
	MOVF	r0x1013,W
; >>> gen.c:5146:setup_fsr
	MOVWF	FSR
;; gen.c:5116:SetIrp *{*
; >>> gen.c:5133:SetIrp
	BCF	STATUS,7
; >>> gen.c:5135:SetIrp
	BTFSC	r0x1014,0
; >>> gen.c:5136:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  5443
; >>> gen.c:5449:genNearPointerGet
	MOVF	INDF,W
; >>> gen.c:5453:genNearPointerGet
;;	1013
;;	1029  _TXREG   offset=0
	BANKSEL	_TXREG
	MOVWF	_TXREG
;; ***	genNearPointerGet  5472
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
;   _serial_setup_19200
;   _print
;   _delay
;   _serial_setup_19200
;   _print
;   _delay
;5 compiler assigned registers:
;   r0x101C
;   r0x101D
;   r0x101E
;   STK01
;   STK00
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=26previous max_key=12 
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
	.line	62; "pvsuck.c"	TRISB = 0;
	BANKSEL	_TRISB
	CLRF	_TRISB
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
; >>> gen.c:2118:genCall
	.line	63; "pvsuck.c"	serial_setup_19200();
	CALL	_serial_setup_19200
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6521:genCast *{*
;; ***	genCast  6522
;;	641
;;	aopForRemat 425
;;	446: rname __str_0, val 0, const = 0
;;	721 register type nRegs=3
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	__str_0
;; 	line = 6530 result AOP_REG=r0x1059, size=3, left -=-, size=0, right AOP_PCODE=__str_0, size=2
;; ***	genCast  6563
;; gen.c:1324:mov2w_op *{*
; >>> gen.c:1339:mov2w_op
_00144_DS_
	.line	65; "pvsuck.c"	print("Hello World\n");
	MOVLW	high (__str_0 + 0)
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x105A 
	BANKSEL	r0x101C
	MOVWF	r0x101C
;; gen.c:1324:mov2w_op *{*
; >>> gen.c:1339:mov2w_op
	MOVLW	(__str_0 + 0)
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1059 
	MOVWF	r0x101D
; >>> gen.c:6620:genCast
	MOVLW	0x80
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x105B 
	MOVWF	r0x101E
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
;;	721 register type nRegs=3
;;	721 register type nRegs=3
;; 	2079 left AOP_REG
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1059 
	MOVF	r0x101D,W
;; 	2079 left AOP_REG
; >>> gen.c:2087:genCall
;; ***	popRegFromIdx,1043  , rIdx=0x7e
	MOVWF	STK01
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=1
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x105A 
	MOVF	r0x101C,W
;; 	2079 left AOP_REG
; >>> gen.c:2087:genCall
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVWF	STK00
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=2
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x105B 
	MOVF	r0x101E,W
; >>> gen.c:2118:genCall
	CALL	_print
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
;; 	2079 left AOP_LIT
;; gen.c:1324:mov2w_op *{*
; >>> gen.c:1339:mov2w_op
	.line	66; "pvsuck.c"	delay(1000);
	MOVLW	0xe8
;; 	2079 left AOP_LIT
; >>> gen.c:2087:genCall
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVWF	STK00
;; gen.c:1324:mov2w_op *{*
; >>> gen.c:1339:mov2w_op
	MOVLW	0x03
; >>> gen.c:2118:genCall
	CALL	_delay
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; gen.c:2614:genGoto *{*
; >>> gen.c:2616:genGoto
;; ***	popGetLabel  key=2, label offset 42
	GOTO	_00144_DS_
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
;   _intr
;   __gptrget1
;   _intr
;9 compiler assigned registers:
;   r0x1015
;   STK00
;   r0x1016
;   STK01
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;; Starting pCode block
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2283:genFunction *{*
;; ***	genFunction  2285 curr label offset=13previous max_key=9 
_print	;Function start
; 2 exit points
;; gen.c:2261:resultRemat *{*
;; gen.c:6739:genReceive *{*
;; ***	genReceive  6740
;;	721 register type nRegs=3
;; gen.c:1866:assignResultValue *{*
;; ***	assignResultValue  1868
;; 	line = 1870 result -=-, size=0, left AOP_REG=r0x1052, size=3, right -=-, size=0
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1054 
	.line	47; "pvsuck.c"	void print(char* p) {
	BANKSEL	r0x1015
	MOVWF	r0x1015
; >>> gen.c:1393:get_returnvalue
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVF	STK00,W
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1053 
	MOVWF	r0x1016
; >>> gen.c:1393:get_returnvalue
;; ***	popRegFromIdx,1043  , rIdx=0x7e
	MOVF	STK01,W
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1052 
	MOVWF	r0x1017
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=3
;;	721 register type nRegs=3
;; 	line = 6342 result AOP_REG=r0x1052, size=3, left -=-, size=0, right AOP_REG=r0x1052, size=3
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
;; 	line = 5502 result AOP_REG=r0x1055, size=1, left AOP_REG=r0x1052, size=3, right -=-, size=0
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1052 
_00129_DS_
	.line	49; "pvsuck.c"	while(c = *p) {
	BANKSEL	r0x1017
	MOVF	r0x1017,W
; >>> gen.c:5521:genGenPointerGet
;; ***	popRegFromIdx,1043  , rIdx=0x7e
	MOVWF	STK01
;; ***	mov2w  1356  offset=1
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1053 
	MOVF	r0x1016,W
; >>> gen.c:5523:genGenPointerGet
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVWF	STK00
;; ***	mov2w  1356  offset=2
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1054 
	MOVF	r0x1015,W
; >>> gen.c:1402:call_libraryfunc
	PAGESEL	__gptrget1
; >>> gen.c:1404:call_libraryfunc
	CALL	__gptrget1
; >>> gen.c:1406:call_libraryfunc
	PAGESEL	$
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1055 
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
;; ***	popGetLabel  key=6, label offset 26
	GOTO	_00132_DS_
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;; ***	aopForSym 350
;;	361 sym->rname = _txring_in, size = 1
;;	721 register type nRegs=1
;; 	line = 554 result AOP_REG=r0x1055, size=1, left AOP_DIR=_txring_in, size=1, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1426
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_DIR, right AOP_LIT
;; 	genPlusIncr  156
;; 	genPlusIncr  180
;; 	couldn't increment 
;; ***	pic14_getDataSize  1426
;;	adding lit to something. size 1
;; genarith.c:270:genAddLit *{*
;; ***	genAddLit  271
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;;  left and result aren't same	genAddLit  461
; >>> genarith.c:473:genAddLit
;;	1013
;;	1029  _txring_in   offset=0
	.line	50; "pvsuck.c"	unsigned char txring_next = (txring_in + 1) & (RING_SZ-1);
	BANKSEL	_txring_in
	INCF	_txring_in,W
;; genarith.c:253:emitMOVWF *{*
; >>> genarith.c:257:emitMOVWF
;;	1109 rIdx = r0x1055 
	BANKSEL	r0x1018
	MOVWF	r0x1018
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1426
;; ***	addSign  797
;; genarith.c:798:addSign *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; NULL :(	3526
;; gen.c:3719:genAnd *{*
;; ***	genAnd  3720
;;	721 register type nRegs=1
;;	721 register type nRegs=1
;; 	line = 3754 result AOP_REG=r0x1055, size=1, left AOP_REG=r0x1055, size=1, right AOP_LIT=0x0f, size=1
; >>> gen.c:3902:genAnd
	MOVLW	0x0f
; >>> gen.c:3904:genAnd
;;	1109 rIdx = r0x1055 
	ANDWF	r0x1018,F
;; gen.c:2261:resultRemat *{*
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; gen.c:3388:genCmpEq *{*
;; ***	genCmpEq  3389
;; ifx is non-null
;;	721 register type nRegs=1
;; ***	aopForSym 350
;;	361 sym->rname = _txring_out, size = 1
;; 	line = 3400 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1055, size=1, right AOP_DIR=_txring_out, size=1
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1013
;;	1029  _txring_out   offset=0
	.line	51; "pvsuck.c"	if (txring_next != txring_out) {
	BANKSEL	_txring_out
	MOVF	_txring_out,W
; >>> gen.c:3469:genCmpEq
;;	1109 rIdx = r0x1055 
	.line	52; "pvsuck.c"	txring[txring_next] = c;
	BANKSEL	r0x1018
	XORWF	r0x1018,W
	BTFSC	STATUS,2
	GOTO	_00129_DS_
	MOVF	r0x1018,W
	ADDLW	(_txring + 0)
; >>> genarith.c:672:genPlus
;;	1109 rIdx = r0x1057 
	MOVWF	r0x101A
; >>> genarith.c:735:genPlus
	MOVLW	high (_txring + 0)
; >>> genarith.c:736:genPlus
	BTFSC	STATUS,0
; >>> genarith.c:737:genPlus
	ADDLW	0x01
; >>> genarith.c:738:genPlus
;;	1109 rIdx = r0x1058 
	MOVWF	r0x101B
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	721 register type nRegs=2
;; ***	genNearPointerSet  5963
;;	721 register type nRegs=1
;; 	line = 5965 result AOP_REG=r0x1057, size=2, left -=-, size=0, right AOP_REG=r0x1056, size=1
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1057 
	MOVF	r0x101A,W
; >>> gen.c:5146:setup_fsr
	MOVWF	FSR
;; gen.c:5116:SetIrp *{*
; >>> gen.c:5133:SetIrp
	BCF	STATUS,7
; >>> gen.c:5135:SetIrp
	BTFSC	r0x101B,0
; >>> gen.c:5136:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerSet  5992
; >>> gen.c:6001:genNearPointerSet
;;	1109 rIdx = r0x1056 
	MOVF	r0x1019,W
; >>> gen.c:6006:genNearPointerSet
	MOVWF	INDF
;; ***	genNearPointerSet  6014
;; ***	genNearPointerSet  6025
;; ***	genNearPointerSet  6036
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=1
;; ***	aopForSym 350
;;	361 sym->rname = _txring_in, size = 1
;; 	line = 6342 result AOP_DIR=_txring_in, size=1, left -=-, size=0, right AOP_REG=r0x1055, size=1
;; ***	genAssign  6434
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1055 
	.line	53; "pvsuck.c"	txring_in = txring_next;
	MOVF	r0x1018,W
; >>> gen.c:6453:genAssign
;;	1013
;;	1029  _txring_in   offset=0
	BANKSEL	_txring_in
	MOVWF	_txring_in
;; gen.c:2261:resultRemat *{*
;; gen.c:2030:genCall *{*
;; ***	genCall  2032
;; gen.c:1765:saveRegisters *{*
;; ***	saveRegisters  1767
; >>> gen.c:2118:genCall
	.line	54; "pvsuck.c"	intr(); // call here to prime if empty tx buffer
	CALL	_intr
;; gen.c:1809:unsaveRegisters *{*
;; ***	unsaveRegisters  1811
;; gen.c:2261:resultRemat *{*
;; ***	genPlus  547
;; genarith.c:548:genPlus *{*
;;	721 register type nRegs=3
;;	606
;; 	line = 554 result AOP_REG=r0x1052, size=3, left AOP_REG=r0x1052, size=3, right AOP_LIT=0x01, size=1
;; ***	pic14_getDataSize  1426
;; ***	pic14_getDataSize  1446
;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  156
; >>> genarith.c:168:genPlusIncr
;;	1109 rIdx = r0x1052 
	.line	55; "pvsuck.c"	p++;
	BANKSEL	r0x1017
	INCF	r0x1017,F
; >>> genarith.c:172:genPlusIncr
	BTFSC	STATUS,2
; >>> genarith.c:173:genPlusIncr
;;	1109 rIdx = r0x1053 
	INCF	r0x1016,F
;; gen.c:2261:resultRemat *{*
;; gen.c:2614:genGoto *{*
; >>> gen.c:2616:genGoto
;; ***	popGetLabel  key=3, label offset 26
	GOTO	_00129_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
_00132_DS_
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
;; ***	genFunction  2285 curr label offset=4previous max_key=1 
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
	.line	21; "pvsuck.c"	SPBRG = 12; // 4MHz = > 19200 baud
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
	.line	22; "pvsuck.c"	BRGH  = 1;
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
	.line	23; "pvsuck.c"	SYNC  = 0;
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
	.line	24; "pvsuck.c"	SPEN  = 1;
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
	.line	25; "pvsuck.c"	TXIE  = 1;
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
	.line	28; "pvsuck.c"	TXEN = 1;
	BSF	_TXSTA_bits,5
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _INTCON_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCON_bits
;; 	line = 5965 result AOP_PCODE=_INTCON_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCON_bits
; >>> gen.c:5720:genPackBits
	.line	29; "pvsuck.c"	GIE  = 1;
	BANKSEL	_INTCON_bits
	BSF	_INTCON_bits,7
;; gen.c:2261:resultRemat *{*
;; gen.c:2261:resultRemat *{*
;; gen.c:6117:genPointerSet *{*
;; ***	genPointerSet  6118
;; gen.c:5945:genNearPointerSet *{*
;; ***	genNearPointerSet  5946
;;	641
;;	aopForRemat 425
;;	446: rname _INTCON_bits, val 0, const = 0
;; ***	genNearPointerSet  5963
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCON_bits
;; 	line = 5965 result AOP_PCODE=_INTCON_bits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;; gen.c:5694:genPackBits *{*
;; ***	genPackBits  5695
;;	858: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCON_bits
; >>> gen.c:5720:genPackBits
	.line	30; "pvsuck.c"	PEIE = 1;
	BSF	_INTCON_bits,6
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
;5 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   r0x1015
;   r0x1016
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
;; gen.c:6739:genReceive *{*
;; ***	genReceive  6740
;;	721 register type nRegs=2
;; gen.c:1866:assignResultValue *{*
;; ***	assignResultValue  1868
;; 	line = 1870 result -=-, size=0, left AOP_REG=r0x1048, size=2, right -=-, size=0
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1049 
	.line	12; "pvsuck.c"	void delay(unsigned count) {
	BANKSEL	r0x1013
	MOVWF	r0x1013
; >>> gen.c:1393:get_returnvalue
;; ***	popRegFromIdx,1043  , rIdx=0x7f
	MOVF	STK00,W
; >>> gen.c:1367:movwf
;;	1109 rIdx = r0x1048 
	MOVWF	r0x1014
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=2
;;	721 register type nRegs=2
;; 	line = 6342 result AOP_REG=r0x1048, size=2, left -=-, size=0, right AOP_REG=r0x1048, size=2
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:6332:genAssign *{*
;; ***	genAssign  6333
;;	721 register type nRegs=2
;;	721 register type nRegs=2
;; 	line = 6342 result AOP_REG=r0x104A, size=2, left -=-, size=0, right AOP_REG=r0x1048, size=2
;; ***	genAssign  6434
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=0
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1048 
_00105_DS_
	.line	13; "pvsuck.c"	while (count--)  {
	BANKSEL	r0x1014
	MOVF	r0x1014,W
; >>> gen.c:6453:genAssign
;;	1109 rIdx = r0x104A 
	MOVWF	r0x1015
;; ***	genAssign  6434
;; gen.c:1324:mov2w_op *{*
;; ***	mov2w  1356  offset=1
; >>> gen.c:1361:mov2w
;;	1109 rIdx = r0x1049 
	MOVF	r0x1013,W
; >>> gen.c:6453:genAssign
;;	1109 rIdx = r0x104B 
	MOVWF	r0x1016
;; gen.c:2261:resultRemat *{*
;; gen.c:3504:ifxForOp *{*
;; ***	ifxForOp  3506
;; NULL :(	3526
;; ic-next	 is an IFX
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
	MOVLW	0xff
; >>> genarith.c:354:genAddLit
;;	1109 rIdx = r0x1048 
	ADDWF	r0x1014,F
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
;;	1109 rIdx = r0x104A 
	MOVF	r0x1015,W
; >>> gen.c:1514:pic14_toBoolean
;;	1109 rIdx = r0x104B 
	IORWF	r0x1016,W
; >>> gen.c:6233:genIfx
	BTFSS	STATUS,2
; >>> gen.c:6234:genIfx
;; ***	popGetLabel  key=1, label offset 4
	GOTO	_00105_DS_
;; gen.c:2261:resultRemat *{*
;; gen.c:2597:genLabel *{*
;; ***	genLabel  2600
;; gen.c:2261:resultRemat *{*
;; gen.c:2435:genEndFunction *{*
;; ***	genEndFunction  2437
	.line	14; "pvsuck.c"	continue;
	RETURN	
; exit point of _delay
;; gen.c:6803:genpic14Code *{*


;	code size estimation:
;	  136+   28 =   164 instructions (  384 byte)

	end
