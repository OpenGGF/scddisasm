; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	(stage_anim_timers).w,a2
	lea	(stage_anim_frames).w,a4
	lea	(unk_20FD3A).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FC58
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$43C0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FC58:
	lea	(unk_20FD4C).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FC8C
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$44C0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FC8C:
	lea	(unk_20FD5E).l,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FCC0
	lea	(VDP_CTRL).l,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$45C0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FCC0:
	lea	(unk_20FD70).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FCF4
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4840,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

locret_20FCF4:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FD2E
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FD0C
	moveq	#0,d0

loc_20FD0C:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(stage_anim_gfx).l,a3

loc_20FD1C:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FD1C
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FD2E:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FD3A:
	dc.b	6
	dc.b	4
	dc.l	byte_21DF96
	dc.l	byte_21E096
	dc.l	byte_21E196
	dc.l	byte_21E096

unk_20FD4C:
	dc.b	3
	dc.b	4
	dc.l	byte_21E296
	dc.l	byte_21E396
	dc.l	byte_21E496
	dc.l	byte_21E596

unk_20FD5E:
	dc.b	4
	dc.b	4
	dc.l	byte_21E696
	dc.l	byte_21E896
	dc.l	byte_21EA96
	dc.l	byte_21EC96

unk_20FD70:
	dc.b	4
	dc.b	6
	dc.l	byte_21EE96
	dc.l	byte_21EF16
	dc.l	byte_21EF96
	dc.l	byte_21F016
	dc.l	byte_21F096
	dc.l	byte_21F116

; ------------------------------------------------------------------------------