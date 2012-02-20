/* ----------------------------------------------------------------------- */
/* Template source file generated by piklab */
#include <pic16f877.h>

/* ----------------------------------------------------------------------- */
/* Configuration bits: adapt to your setup and needs */
code char at __CONFIG1H CONFIG1H = _OSC_RC_OSC2_1H & _OSCS_OFF_1H;
code char at __CONFIG2L CONFIG2L = _PUT_OFF_2L & _BODEN_ON_2L & _BODENV_2_0V_2L;
code char at __CONFIG2H CONFIG2H = _WDT_ON_2H & _WDTPS_1_128_2H;
code char at __CONFIG3H CONFIG3H = _CCP2MUX_RC1_3H;
code char at __CONFIG4L CONFIG4L = _STVR_ON_4L & _LVP_ON_4L & _BACKBUG_OFF_4L;
code char at __CONFIG5L CONFIG5L = _CP_0_OFF_5L & _CP_1_OFF_5L & _CP_2_OFF_5L & _CP_3_OFF_5L;
code char at __CONFIG5H CONFIG5H = _CPB_OFF_5H & _CPD_OFF_5H;
code char at __CONFIG6L CONFIG6L = _WRT_0_OFF_6L & _WRT_1_OFF_6L & _WRT_2_OFF_6L & _WRT_3_OFF_6L;
code char at __CONFIG6H CONFIG6H = _WRTC_OFF_6H & _WRTB_OFF_6H & _WRTD_OFF_6H;
code char at __CONFIG7L CONFIG7L = _EBTR_0_OFF_7L & _EBTR_1_OFF_7L & _EBTR_2_OFF_7L & _EBTR_3_OFF_7L;
code char at __CONFIG7H CONFIG7H = _EBTRB_OFF_7H;


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
Template source file generation not implemented yet for this toolchain...