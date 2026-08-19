; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	unk_20FBD8,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	locret_20FB92
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4740,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

locret_20FB92:
	rts

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	loc_20FBCC
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	loc_20FBAA
	moveq	#0,d0

loc_20FBAA:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

loc_20FBBA:
	move.l	(a1)+,(a3)+
	dbf	d6,loc_20FBBA
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20FBCC:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

unk_20FBD8:
	dc.b	4
	dc.b	6
	dc.l	byte_21FC16
	dc.l	byte_21FC96
	dc.l	byte_21FD16
	dc.l	byte_21FD96
	dc.l	byte_21FE16
	dc.l	byte_21FE96

; ------------------------------------------------------------------------------
