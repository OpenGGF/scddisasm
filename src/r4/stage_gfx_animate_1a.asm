; ------------------------------------------------------------------------------

AnimateStageGfx:
	tst.b	paused
	bne.w	locret_20FD2E
	jsr	LoadPowerupArt
	cmpi.w	#$280,scroll_fg_x
	bcc.w	locret_20FD2E
	cmpi.w	#$160,scroll_fg_y
	bcc.w	locret_20FD2E
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FD82,a1
	move.w	#$7F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	loc_20FCC6
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4500,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FCC6:
	lea	unk_20FDD4,a1
	move.w	#$7F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	loc_20FCFA
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4700,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FCFA:
	lea	unk_20FE26,a1
	move.w	#$7F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	locret_20FD2E
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4900,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20FD2E:
	rts

; ------------------------------------------------------------------------------

AnimateStageGfxScript:
	subq.b	#1,(a2)
	bpl.s	loc_20FD76
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	loc_20FD40
	moveq	#0,d0

loc_20FD40:
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

loc_20FD64:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FD64
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FD76:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FD82:
	dc.b	$18
	dc.b	0
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	1
	dc.b	8
	dc.b	2
	dc.b	8
	dc.b	3
	dc.b	8
	dc.b	4
	dc.b	8
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	7
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	1
	dc.b	8
	dc.b	2
	dc.b	8
	dc.b	3
	dc.b	8
	dc.b	4
	dc.b	8
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	7
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	6
	dc.b	0
	dc.b	6
	dc.b	0
	dc.l	byte_238A42
	dc.l	byte_238C42
	dc.l	byte_238E42
	dc.l	byte_239042
	dc.l	byte_239242
	dc.l	byte_239442
	dc.l	byte_239642
	dc.l	byte_239842

unk_20FDD4:
	dc.b	$18
	dc.b	0
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	1
	dc.b	8
	dc.b	2
	dc.b	8
	dc.b	3
	dc.b	8
	dc.b	4
	dc.b	8
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	7
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	6
	dc.b	0
	dc.b	6
	dc.b	0
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	1
	dc.b	8
	dc.b	2
	dc.b	8
	dc.b	3
	dc.b	8
	dc.b	4
	dc.b	8
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	7
	dc.l	byte_238A42
	dc.l	byte_238C42
	dc.l	byte_238E42
	dc.l	byte_239042
	dc.l	byte_239242
	dc.l	byte_239442
	dc.l	byte_239642
	dc.l	byte_239842

unk_20FE26:
	dc.b	$18
	dc.b	0
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	8
	dc.b	0
	dc.b	6
	dc.b	0
	dc.b	6
	dc.b	0
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	1
	dc.b	8
	dc.b	2
	dc.b	8
	dc.b	3
	dc.b	8
	dc.b	4
	dc.b	8
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	7
	dc.b	$3C
	dc.b	0
	dc.b	8
	dc.b	1
	dc.b	8
	dc.b	2
	dc.b	8
	dc.b	3
	dc.b	8
	dc.b	4
	dc.b	8
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	7
	dc.l	byte_238A42
	dc.l	byte_238C42
	dc.l	byte_238E42
	dc.l	byte_239042
	dc.l	byte_239242
	dc.l	byte_239442
	dc.l	byte_239642
	dc.l	byte_239842

; ------------------------------------------------------------------------------
