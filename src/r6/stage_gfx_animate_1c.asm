; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FE16,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FD30
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4580,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FD30:
	subq.b	#1,stage_anim_timers+2
	bmi.s	loc_20FD38
	bra.s	loc_20FD4A

; ------------------------------------------------------------------------------

loc_20FD38:
	eori.b	#1,stage_anim_frames+2
	move.b	stage_anim_frames+2,d0
	ext.w	d0
	move.b	byte_20FD52(pc,d0.w),stage_anim_timers+2

loc_20FD4A:
	tst.b	stage_anim_frames+2
	beq.s	loc_20FD8A
	bra.s	loc_20FD54

; ------------------------------------------------------------------------------

byte_20FD52:
	dc.b	90
	dc.b	30

; ------------------------------------------------------------------------------

loc_20FD54:
	lea	unk_20FE08,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FD88
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20FD88:
	rts

; ------------------------------------------------------------------------------

loc_20FD8A:
	lea	stage_anim_gfx,a3
	move.w	#$3F,d6

loc_20FD94:
	move.l	#0,(a3)+
	dbf	d6,loc_20FD94
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
	bpl.w	loc_20FDFC
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FDDA
	moveq	#0,d0

loc_20FDDA:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20FDEA:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FDEA
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FDFC:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FE08:
	dc.b	4
	dc.b	3
	dc.l	byte_233C0C
	dc.l	byte_233D0C
	dc.l	byte_233E0C

unk_20FE16:
	dc.b	3
	dc.b	2
	dc.l	byte_233B0C
	dc.l	byte_233B8C

; ------------------------------------------------------------------------------
