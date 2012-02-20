/* ----------------------------------------------------------------------- */
/* Template source file generated by piklab */
#include <pic16f877.h>

/* ----------------------------------------------------------------------- */
/* Configuration bits: adapt to your setup and needs */
typedef unsigned int word;
word at 0x2007 CONFIG = _XT_OSC & _WDT_OFF & _PWRTE_OFF & _BODEN_ON & _LVP_ON & _CPD_OFF & _WRT_ENABLE_ON & _DEBUG_ON & _CP_OFF;

void isr() interrupt 0 {
    /* interrupt service routine */
    /* << insert interrupt code >> */
}

void delay();

void delay() {
    int counter = 0;
    for (counter = 0; counter<10000; counter++) {
        ;
    }
}

void main(void) {
    TRISB = 0;
    while (1) {
        PORTB = 0x0F;

        delay();

        PORTB = 0x00;

        delay();
    }
}
