#include "bootpack.h"

#define PORT_KEYDAT  0x0060
struct FIFO8 keyfifo;
struct FIFO8 mousefifo;


void init_pic(void)
/* Initialize pic */
{
    io_out8(PIC0_IMR, 0xff );
    io_out8(PIC1_IMR, 0xff );

    io_out8(PIC0_ICW1, 0x11 );
    io_out8(PIC0_ICW2, 0x20 );
    io_out8(PIC0_ICW3, 1 << 2);
    io_out8(PIC0_ICW4, 0x01 );

    io_out8(PIC1_ICW1, 0x11 );
    io_out8(PIC1_ICW2, 0x28 );
    io_out8(PIC1_ICW3, 2 );
    io_out8(PIC1_ICW4, 0x01 );

    io_out8(PIC0_IMR, 0x0fb );
    io_out8(PIC1_IMR, 0xff );

    return;
}

void inthandler21(int *esp)
{
	unsigned char data;
	io_out8(PIC0_OCW2, 0x61);	/* IRQ-01受付完了をPICに通知 */
	data = io_in8(PORT_KEYDAT);
	fifo8_put(&keyfifo, data);
	return;
}


void inthandler2c(int *esp)
/* PS/2 mouse interrupt */
{
    unsigned char data;
    io_out8(PIC1_OCW2, 0x64);
    io_out8(PIC0_OCW2, 0x62);
    data = io_in8(PORT_KEYDAT);
    fifo8_put(&mousefifo, data);
    return;
}

void inthandler27(int *esp)
/* PIC0からの不完全割り込み対策 */
/* Athlon64X2機などではチップセットの都合によりPICの初期化時にこの割り込みが1度だけおこる */
/* この割り込み処理関数は、その割り込みに対して何もしないでやり過ごす */
/* なぜ何もしなくていいの？
	→  この割り込みはPIC初期化時の電気的なノイズによって発生したものなので、
		まじめに何か処理してやる必要がない。									*/
{
    io_out8(PIC0_OCW2, 0x67);
    return;
}