; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	(stage_anim_timers).w,a2
	lea	(stage_anim_frames).w,a4
	lea	(byte_20EB0C).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20E972
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7FA0,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20E972:
	lea	(byte_20EB1E).l,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20E9A6
	lea	(VDP_CTRL).l,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$40A0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20E9A6:
	lea	(byte_20EB30).l,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20E9DA
	lea	(VDP_CTRL).l,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$41A0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20E9DA:
	lea	(byte_20EA96).l,a1
	move.w	#$7F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	loc_20EA0E
	lea	(VDP_CTRL).l,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7DA0,(a5)
	move.w	#$80,(dma_stack).w
	move.w	(dma_stack).w,(a5)

loc_20EA0E:
	lea	(byte_20EB42).l,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20EA42
	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$43A0,(a5)
	move.w	#$81,(dma_stack).w
	move.w	(dma_stack).w,(a5)

locret_20EA42:
	rts

; ------------------------------------------------------------------------------

AnimateStageGfxScript:
	subq.b	#1,(a2)
	bpl.s	loc_20EA8A
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	loc_20EA54
	moveq	#0,d0

loc_20EA54:
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

loc_20EA78:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20EA78
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20EA8A:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

byte_20EA96:
	dc.b	$10, 0
	dc.b	3, 0
	dc.b	3, 1
	dc.b	$C, 2
	dc.b	3, 3
	dc.b	3, 0
	dc.b	3, 1
	dc.b	$C, 2
	dc.b	3, 3
	dc.b	3, 0
	dc.b	3, 1
	dc.b	$C, 2
	dc.b	3, 3
	dc.b	$32, 0
	dc.b	3, 1
	dc.b	$C, 2
	dc.b	3, 3
	dc.l	byte_2354CA
	dc.l	byte_2356CA
	dc.l	byte_2358CA
	dc.l	byte_235ACA

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20EB00
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20EADE
	moveq	#0,d0

loc_20EADE:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(stage_anim_gfx).l,a3

loc_20EAEE:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20EAEE
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20EB00:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

byte_20EB0C:
	dc.b	6
	dc.b	4
	dc.l	byte_2345CA
	dc.l	byte_2346CA
	dc.l	byte_2347CA
	dc.l	byte_2346CA
byte_20EB1E:
	dc.b	3
	dc.b	4
	dc.l	byte_2348CA
	dc.l	byte_2349CA
	dc.l	byte_234ACA
	dc.l	byte_234BCA
byte_20EB30:
	dc.b	4
	dc.b	4
	dc.l	byte_234CCA
	dc.l	byte_234ECA
	dc.l	byte_2350CA
	dc.l	byte_2352CA
byte_20EB42:
	dc.b	7
	dc.b	7
	dc.l	byte_235CCA
	dc.l	byte_235D4A
	dc.l	byte_235DCA
	dc.l	byte_235E4A
	dc.l	byte_235ECA
	dc.l	byte_235F4A
	dc.l	byte_235FCA

; ------------------------------------------------------------------------------