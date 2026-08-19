; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FE1A,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FD00
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4440,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FD00:
	lea	unk_20FE28,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FD34
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$43C0,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FD34:
	lea	unk_20FDBC,a1
	move.w	#$1F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	locret_20FD68
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4340,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20FD68:
	rts

; ------------------------------------------------------------------------------

AnimateStageGfxScript:
	subq.b	#1,(a2)
	bpl.s	loc_20FDB0
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	loc_20FD7A
	moveq	#0,d0

loc_20FD7A:
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

loc_20FD9E:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FD9E
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FDB0:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FDBC:
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
	bpl.w	loc_20FE0E
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FDEC
	moveq	#0,d0

loc_20FDEC:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20FDFC:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FDFC
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FE0E:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FE1A:
	dc.b	4
	dc.b	3
	dc.l	byte_233C0C
	dc.l	byte_233D0C
	dc.l	byte_233E0C

unk_20FE28:
	dc.b	3
	dc.b	2
	dc.l	byte_233B0C
	dc.l	byte_233B8C

; ------------------------------------------------------------------------------
