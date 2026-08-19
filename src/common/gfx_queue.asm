; ------------------------------------------------------------------------------

AddGfxQueue:
	movem.l	a1-a2,-(sp)
	lea	GfxLists,a1
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	lea	(a1,d0.w),a1
	lea	gfx_queue,a2

loc_202520:
	tst.l	(a2)
	beq.s	loc_202528
	addq.w	#6,a2
	bra.s	loc_202520

; ------------------------------------------------------------------------------

loc_202528:
	move.w	(a1)+,d0
	bmi.s	loc_202534

loc_20252C:
	move.l	(a1)+,(a2)+
	move.w	(a1)+,(a2)+
	dbf	d0,loc_20252C

loc_202534:
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
	bmi.s	loc_202560

loc_202558:
	move.l	(a1)+,(a2)+
	move.w	(a1)+,(a2)+
	dbf	d0,loc_202558

loc_202560:
	movem.l	(sp)+,a1-a2
	rts

; ------------------------------------------------------------------------------

ClearGfxQueue:
	lea	gfx_queue,a2
	moveq	#$1F,d0

loc_20256C:
	clr.l	(a2)+
	dbf	d0,loc_20256C
	rts

; ------------------------------------------------------------------------------

AdvanceGfxQueue:
	tst.l	gfx_queue
	beq.s	locret_2025C8
	tst.w	gfx_queue_tiles
	bne.s	locret_2025C8
	movea.l	gfx_queue,a0
	lea	WriteNemesisRowVram,a3
	lea	nemesis_code_table,a1
	move.w	(a0)+,d2
	bpl.s	loc_202596
	adda.w	#$A,a3

loc_202596:
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

locret_2025C8:
	rts

; ------------------------------------------------------------------------------

ProcessGfxQueueFast:
	tst.w	gfx_queue_tiles
	beq.w	locret_202668

ProcessGfxQueueLarge:
	move.w	#$12,gfx_queue_process
	moveq	#0,d0
	move.w	gfx_queue+4,d0
	addi.w	#$240,gfx_queue+4
	bra.s	ProcessGfxQueueMain

; ------------------------------------------------------------------------------

ProcessGfxQueueSlow:
	tst.w	gfx_queue_tiles
	beq.s	locret_202668
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

loc_202638:
	movea.w	#8,a5
	bsr.w	NewNemesisRow
	subq.w	#1,gfx_queue_tiles
	beq.s	loc_20266A
	subq.w	#1,gfx_queue_process
	bne.s	loc_202638
	move.l	a0,gfx_queue
	move.l	a3,gfx_queue_write
	move.l	d0,gfx_queue_repeat
	move.l	d1,gfx_queue_pixel
	move.l	d2,gfx_queue_row
	move.l	d5,gfx_queue_read
	move.l	d6,gfx_queue_shift

locret_202668:
	rts

; ------------------------------------------------------------------------------

loc_20266A:
	lea	gfx_queue,a0
	moveq	#$15,d0

loc_202670:
	move.l	6(a0),(a0)+
	dbf	d0,loc_202670
	rts

; ------------------------------------------------------------------------------

LoadGfxList:
	lea	GfxLists,a1
	add.w	d0,d0
	move.w	(a1,d0.w),d0
	lea	(a1,d0.w),a1
	move.w	(a1)+,d1

loc_20268C:
	movea.l	(a1)+,a0
	moveq	#0,d0
	move.w	(a1)+,d0
	lsl.l	#2,d0
	lsr.w	#2,d0
	ori.w	#$4000,d0
	swap	d0
	move.l	d0,VDP_CTRL
	bsr.w	DecompNemesisVram
	dbf	d1,loc_20268C
	rts

; ------------------------------------------------------------------------------
