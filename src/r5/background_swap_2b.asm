; ------------------------------------------------------------------------------

CheckBackgroundSwap:
	move.l	a6,-(sp)
	lea	player_object,a6
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	move.b	act,d1
	move.w	d1,d3
	add.w	d1,d1
	add.w	d3,d1
	add.w	d1,d1
	add.w	d1,d0

loc_2028EA:
	move.w	word_20294E(pc,d0.w),d1
	bmi.s	loc_2028FC
	cmp.w	8(a6),d1
	bcc.s	loc_2028FC
	addq.w	#2,d0
	addq.b	#1,d2
	bra.s	loc_2028EA

; ------------------------------------------------------------------------------

loc_2028FC:
	cmp.b	r5_bg_change,d2
	bne.s	loc_202908

loc_202904:
	movea.l	(sp)+,a6
	rts

; ------------------------------------------------------------------------------

loc_202908:
	move.b	d2,r5_bg_change
	clr.l	gfx_queue
	clr.w	gfx_queue_tiles
	moveq	#0,d1
	move.b	byte_202960(pc,d2.w),d1
	moveq	#0,d0
	move.b	d1,d0
	lsr.b	#2,d0
	move.w	d0,d2
	addi.b	#$E,d0
	bsr.w	AddGfxQueue
	move.w	d2,d0
	addq.b	#4,d0
	move.w	d0,d2
	jsr	LoadPalette
	move.w	d2,d0
	jsr	LoadFadePalette
	lea	stage_map+$40,a3
	bsr.w	LoadStageMapLayer
	bsr.w	InitStageDrawBg
	bra.s	loc_202904

; ------------------------------------------------------------------------------

word_20294E:
	dc.w	$E00
	dc.w	$2300
	dc.w	$FFFF
	dc.w	$E00
	dc.w	$1C00
	dc.w	$FFFF
	dc.w	$E00
	dc.w	$2300
	dc.w	$FFFF

byte_202960:
	dc.b	2
	dc.b	4
	dc.b	2
	dc.b	0

; ------------------------------------------------------------------------------
