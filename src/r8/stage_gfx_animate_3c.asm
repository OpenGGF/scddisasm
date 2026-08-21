; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FB9E,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FAB0
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7E20,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20FAB0:
	lea	unk_20FBB0,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FAE4
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7F20,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20FAE4:
	lea	unk_20FBC2,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FB18
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4020,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20FB18:
	tst.b	boss_door_flag
	beq.s	loc_20FB24
	tst.b	(a4)
	beq.s	locret_20FB58

loc_20FB24:
	lea	unk_20FBD4,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FB58
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4220,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20FB58:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FB92
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FB70
	moveq	#0,d0

loc_20FB70:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20FB80:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FB80
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FB92:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FB9E:
	dc.b	6
	dc.b	4
	dc.l	byte_21E396
	dc.l	byte_21E496
	dc.l	byte_21E596
	dc.l	byte_21E496

unk_20FBB0:
	dc.b	3
	dc.b	4
	dc.l	byte_21E696
	dc.l	byte_21E796
	dc.l	byte_21E896
	dc.l	byte_21E996

unk_20FBC2:
	dc.b	4
	dc.b	4
	dc.l	byte_21EA96
	dc.l	byte_21EC96
	dc.l	byte_21EE96
	dc.l	byte_21F096

unk_20FBD4:
	dc.b	4
	dc.b	6
	dc.l	byte_21F296
	dc.l	byte_21F316
	dc.l	byte_21F396
	dc.l	byte_21F416
	dc.l	byte_21F496
	dc.l	byte_21F516

; ------------------------------------------------------------------------------
