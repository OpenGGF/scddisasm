; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20EC56,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20EB74
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4500,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20EB74:
	lea	unk_20EC68,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20EBA8
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20EBA8:
	lea	unk_20EC7A,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20EBDC
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4700,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20EBDC:
	lea	unk_20EC8C,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20EC10
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4900,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20EC10:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20EC4A
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20EC28
	moveq	#0,d0

loc_20EC28:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20EC38:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20EC38
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20EC4A:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20EC56:
	dc.b	6
	dc.b	4
	dc.l	byte_21E396
	dc.l	byte_21E496
	dc.l	byte_21E596
	dc.l	byte_21E496

unk_20EC68:
	dc.b	3
	dc.b	4
	dc.l	byte_21E696
	dc.l	byte_21E796
	dc.l	byte_21E896
	dc.l	byte_21E996

unk_20EC7A:
	dc.b	4
	dc.b	4
	dc.l	byte_21EA96
	dc.l	byte_21EC96
	dc.l	byte_21EE96
	dc.l	byte_21F096

unk_20EC8C:
	dc.b	7
	dc.b	7
	dc.l	byte_21FA96
	dc.l	byte_21FB16
	dc.l	byte_21FB96
	dc.l	byte_21FC16
	dc.l	byte_21FC96
	dc.l	byte_21FD16
	dc.l	byte_21FD96

; ------------------------------------------------------------------------------
