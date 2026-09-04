; ------------------------------------------------------------------------------

; Graphics-list entries contain a long source pointer and a word VRAM offset.

AddGfxQueue:
	movem.l	a1-a2,-(sp)
	lea	GfxLists,a1
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	lea	(a1,d0.w),a1
	lea	gfx_queue,a2

AddGfxQueueFindFreeSlot:
	tst.l	(a2)
	beq.s	AddGfxQueueCopyEntry
	addq.w	#6,a2
	bra.s	AddGfxQueueFindFreeSlot

; ------------------------------------------------------------------------------

AddGfxQueueCopyEntry:
	move.w	(a1)+,d0
	bmi.s	AddGfxQueueDone

AddGfxQueueCopyLoop:
	move.l	(a1)+,(a2)+
	move.w	(a1)+,(a2)+
	dbf	d0,AddGfxQueueCopyLoop

AddGfxQueueDone:
	movem.l	(sp)+,a1-a2
	rts

; ------------------------------------------------------------------------------

InitGfxQueue:
	movem.l	a1-a2,-(sp)
	lea	GfxLists,a1
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	lea	(a1,d0.w),a1
	bsr.s	ClearGfxQueue
	lea	gfx_queue,a2
	move.w	(a1)+,d0
	bmi.s	InitGfxQueueDone

InitGfxQueueCopyLoop:
	move.l	(a1)+,(a2)+
	move.w	(a1)+,(a2)+
	dbf	d0,InitGfxQueueCopyLoop

InitGfxQueueDone:
	movem.l	(sp)+,a1-a2
	rts

; ------------------------------------------------------------------------------

ClearGfxQueue:
	lea	gfx_queue,a2
	moveq	#$1F,d0

ClearGfxQueueLoop:
	clr.l	(a2)+
	dbf	d0,ClearGfxQueueLoop
	rts

; ------------------------------------------------------------------------------

AdvanceGfxQueue:
	tst.l	gfx_queue
	beq.s	AdvanceGfxQueueDone
	tst.w	gfx_queue_tiles
	bne.s	AdvanceGfxQueueDone
	movea.l	gfx_queue,a0
	lea	WriteNemesisRowVram,a3
	lea	nemesis_code_table,a1
	move.w	(a0)+,d2
	bpl.s	AdvanceGfxQueuePrepareWrite
	adda.w	#$A,a3

AdvanceGfxQueuePrepareWrite:
	andi.w	#$7FFF,d2
	move.w	d2,gfx_queue_tiles
	bsr.w	BuildNemesisCodeTable
	move.b	(a0)+,d5
	asl.w	#8,d5
	move.b	(a0)+,d5
	moveq	#$10,d6
	moveq	#0,d0
	move.l	a0,gfx_queue
	move.l	a3,gfx_queue_write
	move.l	d0,gfx_queue_repeat
	move.l	d0,gfx_queue_pixel
	move.l	d0,gfx_queue_row
	move.l	d5,gfx_queue_read
	move.l	d6,gfx_queue_shift

AdvanceGfxQueueDone:
	rts

; ------------------------------------------------------------------------------

ProcessGfxQueueFast:
	tst.w	gfx_queue_tiles
	beq.w	ProcessGfxQueueDone

ProcessGfxQueueLarge:
	move.w	#$12,gfx_queue_process
	moveq	#0,d0
	move.w	gfx_queue+4,d0
	addi.w	#$240,gfx_queue+4
	bra.s	ProcessGfxQueueMain

; ------------------------------------------------------------------------------

ProcessGfxQueueSlow:
	tst.w	gfx_queue_tiles
	beq.s	ProcessGfxQueueDone
	tst.b	scroll_lock
	bne.s	ProcessGfxQueueLarge
	move.w	#3,gfx_queue_process
	moveq	#0,d0
	move.w	gfx_queue+4,d0
	addi.w	#$60,gfx_queue+4

ProcessGfxQueueMain:
	lea	VDP_CTRL,a4
	lsl.l	#2,d0
	lsr.w	#2,d0
	ori.w	#$4000,d0
	swap	d0
	move.l	d0,(a4)
	subq.w	#4,a4
	movea.l	gfx_queue,a0
	movea.l	gfx_queue_write,a3
	move.l	gfx_queue_repeat,d0
	move.l	gfx_queue_pixel,d1
	move.l	gfx_queue_row,d2
	move.l	gfx_queue_read,d5
	move.l	gfx_queue_shift,d6
	lea	nemesis_code_table,a1

ProcessGfxQueueLoop:
	movea.w	#8,a5
	bsr.w	NewNemesisRow
	subq.w	#1,gfx_queue_tiles
	beq.s	ProcessGfxQueueFinalize
	subq.w	#1,gfx_queue_process
	bne.s	ProcessGfxQueueLoop
	move.l	a0,gfx_queue
	move.l	a3,gfx_queue_write
	move.l	d0,gfx_queue_repeat
	move.l	d1,gfx_queue_pixel
	move.l	d2,gfx_queue_row
	move.l	d5,gfx_queue_read
	move.l	d6,gfx_queue_shift

ProcessGfxQueueDone:
	rts

; ------------------------------------------------------------------------------

ProcessGfxQueueFinalize:
	lea	gfx_queue,a0
	moveq	#$15,d0

ProcessGfxQueueFinalizeLoop:
	move.l	6(a0),(a0)+
	dbf	d0,ProcessGfxQueueFinalizeLoop
	rts

; ------------------------------------------------------------------------------

LoadGfxList:
	lea	GfxLists,a1
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	lea	(a1,d0.w),a1
	move.w	(a1)+,d1

LoadGfxListLoop:
	movea.l	(a1)+,a0
	moveq	#0,d0
	move.w	(a1)+,d0
	lsl.l	#2,d0
	lsr.w	#2,d0
	ori.w	#$4000,d0
	swap	d0
	move.l	d0,VDP_CTRL
	bsr.w	DecompNemesisVram
	dbf	d1,LoadGfxListLoop
	rts

; ------------------------------------------------------------------------------
