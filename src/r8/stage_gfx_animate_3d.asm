; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FCB2,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FB90
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7A60,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20FB90:
	lea	unk_20FCC4,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FBC4
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7B60,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20FBC4:
	lea	unk_20FCD6,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FBF8
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7C60,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20FBF8:
	lea	unk_20FCE8,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FC2C
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7EE0,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

loc_20FC2C:
	tst.b	boss_door_flag
	beq.s	loc_20FC38
	tst.b	(a4)
	beq.s	locret_20FC6C

loc_20FC38:
	lea	unk_20FD06,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FC6C
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7E60,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)

locret_20FC6C:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FCA6
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FC84
	moveq	#0,d0

loc_20FC84:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20FC94:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FC94
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FCA6:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FCB2:
	dc.b	6
	dc.b	4
	dc.l	byte_23C27A
	dc.l	byte_23C37A
	dc.l	byte_23C47A
	dc.l	byte_23C37A

unk_20FCC4:
	dc.b	3
	dc.b	4
	dc.l	byte_23C57A
	dc.l	byte_23C67A
	dc.l	byte_23C77A
	dc.l	byte_23C87A

unk_20FCD6:
	dc.b	4
	dc.b	4
	dc.l	byte_23C97A
	dc.l	byte_23CB7A
	dc.l	byte_23CD7A
	dc.l	byte_23CF7A

unk_20FCE8:
	dc.b	7
	dc.b	7
	dc.l	byte_23D97A
	dc.l	byte_23D9FA
	dc.l	byte_23DA7A
	dc.l	byte_23DAFA
	dc.l	byte_23DB7A
	dc.l	byte_23DBFA
	dc.l	byte_23DC7A

unk_20FD06:
	dc.b	4
	dc.b	6
	dc.l	byte_23DCFA
	dc.l	byte_23DD7A
	dc.l	byte_23DDFA
	dc.l	byte_23DE7A
	dc.l	byte_23DEFA
	dc.l	byte_23DF7A

; ------------------------------------------------------------------------------
