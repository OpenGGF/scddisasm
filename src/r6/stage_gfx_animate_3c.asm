; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	(stage_anim_timers).w,a2
	lea	(stage_anim_frames).w,a4
	lea	(unk_20E58A).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.w	loc_20E510
	bclr	#6,(boss_flags).w
	bne.s	loc_20E4B6
	btst	#7,(boss_flags).w
	beq.s	loc_20E4EC
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4E00,(a5)
	move.w	#$82,(dma_stack).w
	move.w	(dma_stack).w,(a5)
	bra.s	loc_20E510

; ------------------------------------------------------------------------------

loc_20E4B6:
	bset	#7,(boss_flags).w
	lea	(VDP_CTRL).l,a5
	move.w	#$8F01,(a5)
	move.l	#$940093FF,(a5)
	move.w	#$9780,(a5)
	move.l	#$46000081,(a5)
	move.w	#0,(VDP_DATA).l

loc_20E4DE:
	move.w	(a5),d1
	btst	#1,d1
	bne.s	loc_20E4DE
	move.w	#$8F02,(a5)
	bra.s	loc_20E510

; ------------------------------------------------------------------------------

loc_20E4EC:
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20E510:
	lea	(unk_20E598).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20E544
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4580,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

locret_20E544:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20E57E
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20E55C
	moveq	#0,d0

loc_20E55C:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(stage_anim_gfx).l,a3

loc_20E56C:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20E56C
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20E57E:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20E58A:
	dc.b	4
	dc.b	3
	dc.l	byte_233C0C
	dc.l	byte_233D0C
	dc.l	byte_233E0C

unk_20E598:
	dc.b	3
	dc.b	2
	dc.l	byte_233B0C
	dc.l	byte_233B8C

; ------------------------------------------------------------------------------