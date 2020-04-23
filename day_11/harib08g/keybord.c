#include "bootpack.h"

struct FIFO8 keyfifo;

#define PORT_KEYSTA			0x0064
#define	KEYSTA_SEND_NOTREDY	0x02
#define KEYCMD_WRITE_MODE	0x60
#define KBC_MODE			0x47

void wait_KBC_sendready(void)
{
	/* キーボードコントローラーがデータ送信可能になるのを待つ */
	for (;;) {
		if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREDY) == 0) {
			break;
		}
	}
	return;
}


void init_keyboard(void)
{
	/* キーボードコントローラの初期化 */
	wait_KBC_sendready();
	io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
	wait_KBC_sendready();
	io_out8(PORT_KEYDAT, KBC_MODE);
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
