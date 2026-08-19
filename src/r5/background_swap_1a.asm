; ------------------------------------------------------------------------------

CheckBackgroundSwap:
	move.l	a6,-(sp)
	moveq	#0,d2
	lea	word_2029BA,a0

loc_20294E:
	move.w	(a0)+,d1
	bmi.s	loc_20295C
	cmp.w	player_object+obj.x,d1
	bcc.s	loc_20295C
	addq.b	#1,d2
	bra.s	loc_20294E

; ------------------------------------------------------------------------------

loc_20295C:
	cmp.b	r5_bg_change,d2
	bne.s	loc_202968

loc_202964:
	movea.l	(sp)+,a6
	rts

; ------------------------------------------------------------------------------

loc_202968:
	move.b	d2,r5_bg_change

	clr.l	gfx_queue					; Discard graphics queue
	clr.w	gfx_queue_tiles
	
	moveq	#0,d1						; Load new background graphics
	move.b	byte_2029CC(pc,d2.w),d1
	moveq	#0,d0
	move.b	d1,d0
	lsr.b	#2,d0
	move.w	d0,d2
	addi.b	#$E,d0
	bsr.w	AddGfxQueue

	move.w	d2,d0						; Load new background palette
	addq.b	#4,d0
	move.w	d0,d2
	jsr	LoadPalette
	move.w	d2,d0
	jsr	LoadFadePalette

	lea	stage_map+$40,a3				; Load new background map
	bsr.w	LoadStageMapLayer

	move.w	scroll_fg_y,d0					; Reinitialize scrolling and drawing
	move.w	scroll_fg_x,d1
	bsr.w	InitBgScroll
	bsr.w	InitStageDrawBg

	bra.s	loc_202964

; ------------------------------------------------------------------------------

word_2029BA:
	dc.w	$E00
	dc.w	$2300
	dc.w	-1
	dc.w	$E00
	dc.w	$2300
	dc.w	-1
	dc.w	$E00
	dc.w	$2300
	dc.w	-1

byte_2029CC:
	dc.b	2
	dc.b	4
	dc.b	2
	dc.b	0

; ------------------------------------------------------------------------------
