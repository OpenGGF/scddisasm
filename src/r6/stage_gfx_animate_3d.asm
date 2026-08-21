; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20E5D2,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.w	loc_20E4B8
	bclr	#6,boss_flags
	bne.s	loc_20E45E
	btst	#7,boss_flags
	beq.s	loc_20E494
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4E00,(a5)
	move.w	#$82,dma_stack
	move.w	dma_stack,(a5)
	bra.s	loc_20E4B8

; ------------------------------------------------------------------------------

loc_20E45E:
	bset	#7,boss_flags
	lea	VDP_CTRL,a5
	move.w	#$8F01,(a5)
	move.l	#$940093FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$50000081,(a5)
	move.w	#0,VDP_DATA

loc_20E486:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	loc_20E486
	move.w	#$8F02,(a5)
	bra.s	loc_20E4B8

; ------------------------------------------------------------------------------

loc_20E494:
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$5000,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20E4B8:
	lea	unk_20E5E0,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20E4EC
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4F80,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20E4EC:
	lea	unk_20E574,a1
	move.w	#$1F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	locret_20E520
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4F00,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20E520:
	rts

; ------------------------------------------------------------------------------

AnimateStageGfxScript:
	subq.b	#1,(a2)
	bpl.s	loc_20E568
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	loc_20E532
	moveq	#0,d0

loc_20E532:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	2(a1,d0.w),(a2)
	move.b	3(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	add.w	d0,d0
	moveq	#0,d1
	move.b	(a1),d1
	add.w	d1,d1
	add.w	d1,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20E556:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20E556
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20E568:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20E574:
	dc.b	4
	dc.b	0
	dc.b	4
	dc.b	0
	dc.b	9
	dc.b	1
	dc.b	4
	dc.b	2
	dc.b	$F
	dc.b	3
	dc.l	byte_233F0C
	dc.l	byte_233F8C
	dc.l	byte_23400C
	dc.l	byte_23408C

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20E5C6
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20E5A4
	moveq	#0,d0

loc_20E5A4:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20E5B4:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20E5B4
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20E5C6:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20E5D2:
	dc.b	4
	dc.b	3
	dc.l	byte_233C0C
	dc.l	byte_233D0C
	dc.l	byte_233E0C

unk_20E5E0:
	dc.b	3
	dc.b	2
	dc.l	byte_233B0C
	dc.l	byte_233B8C

; ------------------------------------------------------------------------------
