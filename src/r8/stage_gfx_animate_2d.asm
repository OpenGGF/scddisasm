; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	(stage_anim_timers).w,a2
	lea	(stage_anim_frames).w,a4
	lea	(unk_20FC40).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FB2A
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$46A0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FB2A:
	lea	(unk_20FC52).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FB5E
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$47A0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FB5E:
	lea	(unk_20FC64).l,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FB92
	lea	(VDP_CTRL).l,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$48A0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FB92:
	lea	(unk_20FC76).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FBC6
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4AA0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FBC6:
	lea	(unk_20FC94).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FBFA
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4B20,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

locret_20FBFA:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FC34
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FC12
	moveq	#0,d0

loc_20FC12:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(stage_anim_gfx).l,a3

loc_20FC22:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FC22
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FC34:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FC40:
	dc.b	6
	dc.b	4
	dc.l	byte_21DF96
	dc.l	byte_21E096
	dc.l	byte_21E196
	dc.l	byte_21E096

unk_20FC52:
	dc.b	3
	dc.b	4
	dc.l	byte_21E296
	dc.l	byte_21E396
	dc.l	byte_21E496
	dc.l	byte_21E596

unk_20FC64:
	dc.b	4
	dc.b	4
	dc.l	byte_21E696
	dc.l	byte_21E896
	dc.l	byte_21EA96
	dc.l	byte_21EC96

unk_20FC76:
	dc.b	7
	dc.b	7
	dc.l	byte_21F696
	dc.l	byte_21F716
	dc.l	byte_21F796
	dc.l	byte_21F816
	dc.l	byte_21F896
	dc.l	byte_21F916
	dc.l	byte_21F996

unk_20FC94:
	dc.b	4
	dc.b	6
	dc.l	byte_21FA16
	dc.l	byte_21FA96
	dc.l	byte_21FB16
	dc.l	byte_21FB96
	dc.l	byte_21FC16
	dc.l	byte_21FC96

; ------------------------------------------------------------------------------