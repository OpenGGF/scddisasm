; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	byte_20FA18,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20F902
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4440,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20F902:
	lea	byte_20FA2A,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20F936
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4540,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20F936:
	lea	byte_20FA3C,a1
	move.w	#$7F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20F96A
	lea	VDP_CTRL,a5
	move.l	#$94019300,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4640,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20F96A:
	lea	byte_20FA4E,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	loc_20F99E
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4840,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

loc_20F99E:
	lea	byte_20FA6C,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20F9D2
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$48C0,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20F9D2:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FA0C
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20F9EA
	moveq	#0,d0

loc_20F9EA:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20F9FA:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20F9FA
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FA0C:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

byte_20FA18:
	dc.b	6
	dc.b	4
	dc.l	byte_21DF96
	dc.l	byte_21E096
	dc.l	byte_21E196
	dc.l	byte_21E096

byte_20FA2A:
	dc.b	3
	dc.b	4
	dc.l	byte_21E296
	dc.l	byte_21E396
	dc.l	byte_21E496
	dc.l	byte_21E596

byte_20FA3C:
	dc.b	4
	dc.b	4
	dc.l	byte_21E696
	dc.l	byte_21E896
	dc.l	byte_21EA96
	dc.l	byte_21EC96

byte_20FA4E:
	dc.b	7
	dc.b	7
	dc.l	byte_21F696
	dc.l	byte_21F716
	dc.l	byte_21F796
	dc.l	byte_21F816
	dc.l	byte_21F896
	dc.l	byte_21F916
	dc.l	byte_21F996

byte_20FA6C:
	dc.b	4
	dc.b	6
	dc.l	byte_21FA16
	dc.l	byte_21FA96
	dc.l	byte_21FB16
	dc.l	byte_21FB96
	dc.l	byte_21FC16
	dc.l	byte_21FC96

; ------------------------------------------------------------------------------
