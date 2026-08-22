; ------------------------------------------------------------------------------

CheckBackgroundSwap:
	if REGION=USA
		tst.b	scroll_flags_fg
		bne.s	loc_R5USA_CheckBackgroundSwap_DirectReturn
		moveq	#0,d2
		lea	word_R5USA_CheckBackgroundSwap_Thresholds,a0

loc_R5USA_CheckBackgroundSwap_Loop:
		move.w	(a0)+,d1
		bmi.s	loc_R5USA_CheckBackgroundSwap_Return
		cmp.w	player_object+obj.x,d1
		bcc.s	loc_R5USA_CheckBackgroundSwap_Return
		addq.b	#1,d2
		bra.s	loc_R5USA_CheckBackgroundSwap_Loop

loc_R5USA_CheckBackgroundSwap_Return:
		cmp.b	r5_bg_change,d2
		bne.s	loc_R5USA_CheckBackgroundSwap_Change

loc_R5USA_CheckBackgroundSwap_DirectReturn:
		rts

loc_R5USA_CheckBackgroundSwap_Change:
		move.b	d2,r5_bg_change
		clr.l	gfx_queue
		clr.w	gfx_queue_tiles
		moveq	#0,d1
		move.b	byte_R5USA_CheckBackgroundSwap_Ids(pc,d2.w),d1
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
		bsr.w	sub_202A98
		move.b	#1,r5_usa_unknown_195c
		rts

word_R5USA_CheckBackgroundSwap_Thresholds:
		dc.w	$E00
		dc.w	$1C00
		dc.w	-1
		dc.w	$E00
		dc.w	$2300
		dc.w	-1

byte_R5USA_CheckBackgroundSwap_Ids:
		dc.b	2
		dc.b	4
		dc.b	2
		dc.b	0
	else
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

loc_2028E4:
	move.w	word_202948(pc,d0.w),d1
	bmi.s	loc_2028F6
	cmp.w	8(a6),d1
	bcc.s	loc_2028F6
	addq.w	#2,d0
	addq.b	#1,d2
	bra.s	loc_2028E4

; ------------------------------------------------------------------------------

loc_2028F6:
	cmp.b	r5_bg_change,d2
	bne.s	loc_202902

loc_2028FE:
	movea.l	(sp)+,a6
	rts

; ------------------------------------------------------------------------------

loc_202902:
	move.b	d2,r5_bg_change
	clr.l	gfx_queue
	clr.w	gfx_queue_tiles
	moveq	#0,d1
	move.b	byte_20295A(pc,d2.w),d1
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
	bra.s	loc_2028FE

; ------------------------------------------------------------------------------

word_202948:
	dc.w	$E00
	dc.w	$2300
	dc.w	$FFFF
	dc.w	$E00
	dc.w	$1C00
	dc.w	$FFFF
	dc.w	$E00
	dc.w	$2300
	dc.w	$FFFF

byte_20295A:
	dc.b	2
	dc.b	4
	dc.b	2
	dc.b	0
	endif

; ------------------------------------------------------------------------------
