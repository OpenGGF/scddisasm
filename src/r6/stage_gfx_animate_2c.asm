; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FE68,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FD82
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4580,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FD82:
	subq.b	#1,stage_anim_timers+2
	bmi.s	loc_20FD8A
	bra.s	loc_20FD9C

; ------------------------------------------------------------------------------

loc_20FD8A:
	eori.b	#1,stage_anim_frames+2
	move.b	stage_anim_frames+2,d0
	ext.w	d0
	move.b	byte_20FDA4(pc,d0.w),stage_anim_timers+2

loc_20FD9C:
	tst.b	stage_anim_frames+2
	beq.s	loc_20FDDC
	bra.s	loc_20FDA6

; ------------------------------------------------------------------------------

byte_20FDA4:
	dc.b	$5A
	dc.b	$1E

; ------------------------------------------------------------------------------

loc_20FDA6:
	lea	unk_20FE5A,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FDDA
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20FDDA:
	rts

; ------------------------------------------------------------------------------

loc_20FDDC:
	lea	stage_anim_gfx,a3
	move.w	#$3F,d6

loc_20FDE6:
	move.l	#0,(a3)+
	dbf	d6,loc_20FDE6
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FE4E
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FE2C
	moveq	#0,d0

loc_20FE2C:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20FE3C:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FE3C
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FE4E:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FE5A:
	dc.b	4
	dc.b	3
	dc.l	byte_233C0C
	dc.l	byte_233D0C
	dc.l	byte_233E0C

unk_20FE68:
	dc.b	3
	dc.b	2
	dc.l	byte_233B0C
	dc.l	byte_233B8C

; ------------------------------------------------------------------------------
