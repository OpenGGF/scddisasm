; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20EADA,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20EA2C
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$42C0,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20EA2C:
	lea	unk_20EAEC,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20EA60
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$43C0,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20EA60:
	lea	unk_20EAFE,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20EA94
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$44C0,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20EA94:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20EACE
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20EAAC
	moveq	#0,d0

loc_20EAAC:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20EABC:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20EABC
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20EACE:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20EADA:
	dc.b	6
	dc.b	4
	dc.l	byte_2345CA
	dc.l	byte_2346CA
	dc.l	byte_2347CA
	dc.l	byte_2346CA

unk_20EAEC:
	dc.b	3
	dc.b	4
	dc.l	byte_2348CA
	dc.l	byte_2349CA
	dc.l	byte_234ACA
	dc.l	byte_234BCA

unk_20EAFE:
	dc.b	4
	dc.b	4
	dc.l	byte_234CCA
	dc.l	byte_234ECA
	dc.l	byte_2350CA
	dc.l	byte_2352CA

; ------------------------------------------------------------------------------
