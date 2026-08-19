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

loc_202960:
	move.w	word_2029D0(pc,d0.w),d1
	bmi.s	loc_202972
	cmp.w	8(a6),d1
	bcc.s	loc_202972
	addq.w	#2,d0
	addq.b	#1,d2
	bra.s	loc_202960

; ------------------------------------------------------------------------------

loc_202972:
	cmp.b	r5_bg_change,d2
	bne.s	loc_20297E

loc_20297A:
	movea.l	(sp)+,a6
	rts

; ------------------------------------------------------------------------------

loc_20297E:
	move.b	d2,r5_bg_change
	clr.l	gfx_queue
	clr.w	gfx_queue_tiles
	moveq	#0,d1
	move.b	byte_2029E2(pc,d2.w),d1
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
	move.w	scroll_fg_y,d0
	move.w	scroll_fg_x,d1
	bsr.w	InitBgScroll
	bsr.w	InitStageDrawBg
	bra.s	loc_20297A

; ------------------------------------------------------------------------------

word_2029D0:
	dc.w	$E00
	dc.w	$2300
	dc.w	$FFFF
	dc.w	$E00
	dc.w	$1C00
	dc.w	$FFFF
	dc.w	$E00
	dc.w	$2300
	dc.w	$FFFF

byte_2029E2:
	dc.b	2
	dc.b	4
	dc.b	2
	dc.b	0

; ------------------------------------------------------------------------------
