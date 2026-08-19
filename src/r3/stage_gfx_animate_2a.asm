; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	subq.b	#1,stage_anim_timers
	bpl.w	locret_20F166
	move.b	#$A,stage_anim_timers
	moveq	#0,d0
	move.b	stage_anim_frames,d0
	addq.b	#1,d0
	cmpi.b	#2,d0
	bcs.s	loc_20F0F8
	moveq	#0,d0

loc_20F0F8:
	move.b	d0,stage_anim_frames
	lsl.w	#3,d0
	movea.l	off_20F168(pc,d0.w),a1
	movea.l	off_20F168+4(pc,d0.w),a2
	bsr.s	sub_20F156
	lea	VDP_CTRL,a5
	move.l	#$940093A0,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7680,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	movea.l	a2,a1
	bsr.s	sub_20F156
	lea	VDP_CTRL,a5
	move.l	#$94009360,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$79C0,(a5)
	move.w	#$80,dma_stack
	move.w	dma_stack,(a5)
	rts

; ------------------------------------------------------------------------------

sub_20F156:
	lea	stage_anim_gfx,a3
	move.w	#$BF,d0

loc_20F160:
	move.l	(a1)+,(a3)+
	dbf	d0,loc_20F160

locret_20F166:
	rts

; ------------------------------------------------------------------------------

off_20F168:
	dc.l	byte_23459A, byte_2346DA
	dc.l	byte_23439A, byte_2344DA

; ------------------------------------------------------------------------------
