; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	R6StageGfxThreeFrameAnimationTable,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	R6StageGfxAfterPrimaryAnimation
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$5640,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

R6StageGfxAfterPrimaryAnimation:
	lea	R6StageGfxTwoFrameAnimationTable,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	R6StageGfxAfterSecondaryAnimation
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$55C0,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

R6StageGfxAfterSecondaryAnimation:
	lea	R6StageGfxScriptTable,a1
	move.w	#$1F,d6
	bsr.w	AnimateStageGfxScript
	bne.s	R6StageGfxReturn
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$5540,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

R6StageGfxReturn:
	rts

; ------------------------------------------------------------------------------

AnimateStageGfxScript:
	subq.b	#1,(a2)
	bpl.s	R6StageGfxScriptNoUpdate
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	R6StageGfxScriptStoreFrame
	moveq	#0,d0

R6StageGfxScriptStoreFrame:
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
	lea	stage_anim_gfx,a3

R6StageGfxScriptCopyLoop:
	move.l	(a1)+,(a3)+
	dbf	d6,R6StageGfxScriptCopyLoop
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

R6StageGfxScriptNoUpdate:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

; Scripted stage-animation frame durations and tile streams.
R6StageGfxScriptTable:
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
	dc.l	R6StageGfxScriptTiles0
	dc.l	R6StageGfxScriptTiles1
	dc.l	R6StageGfxScriptTiles2
	dc.l	R6StageGfxScriptTiles3

; ------------------------------------------------------------------------------

AnimateTilesSimple:
	subq.b	#1,(a2)
	bpl.w	R6StageGfxSimpleNoUpdate
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	R6StageGfxSimpleStoreFrame
	moveq	#0,d0

R6StageGfxSimpleStoreFrame:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	stage_anim_gfx,a3

R6StageGfxSimpleCopyLoop:
	move.l	(a1)+,(a3)+
	dbf	d6,R6StageGfxSimpleCopyLoop
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

R6StageGfxSimpleNoUpdate:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

; Three-frame stage-animation timing and tile streams.
R6StageGfxThreeFrameAnimationTable:
	dc.b	4
	dc.b	3
	dc.l	R6StageGfxThreeFrameTiles0
	dc.l	R6StageGfxThreeFrameTiles1
	dc.l	R6StageGfxThreeFrameTiles2

; Two-frame stage-animation timing and tile streams.
R6StageGfxTwoFrameAnimationTable:
	dc.b	3
	dc.b	2
	dc.l	R6StageGfxTwoFrameTiles0
	dc.l	R6StageGfxTwoFrameTiles1

; ------------------------------------------------------------------------------
