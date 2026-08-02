; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	(stage_anim_timers).w,a2
	lea	(stage_anim_frames).w,a4
	lea	(unk_20FDF2).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FCD8
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4FC0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FCD8:
	lea	(unk_20FE00).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20FD0C
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4F40,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20FD0C:
	lea	(unk_20FD94).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	locret_20FD40
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4EC0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

locret_20FD40:
	rts

; ------------------------------------------------------------------------------

AnimateStageGfxScript:
	subq.b	#1,(a2)
	bpl.s	loc_20FD88
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	loc_20FD52
	moveq	#0,d0

loc_20FD52:
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
	lea	(stage_anim_gfx).l,a3

loc_20FD76:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FD76
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FD88:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FD94:
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
	bpl.w	loc_20FDE6
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FDC4
	moveq	#0,d0

loc_20FDC4:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(stage_anim_gfx).l,a3

loc_20FDD4:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FDD4
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FDE6:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FDF2:
	dc.b	4
	dc.b	3
	dc.l	byte_233C0C
	dc.l	byte_233D0C
	dc.l	byte_233E0C

unk_20FE00:
	dc.b	3
	dc.b	2
	dc.l	byte_233B0C
	dc.l	byte_233B8C

; ------------------------------------------------------------------------------