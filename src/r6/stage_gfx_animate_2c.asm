; ------------------------------------------------------------------------------

AnimateStageGfx:
	jsr	LoadPowerupArt
	lea	stage_anim_timers,a2
	lea	stage_anim_frames,a4
	lea	R6StageGfxTwoFrameAnimationTable,a1
	move.w	#$1F,d6
	bsr.w	AnimateTilesSimple
	bne.s	R6StageGfxAfterPrimaryAnimation
	lea	VDP_CTRL,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4580,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

R6StageGfxAfterPrimaryAnimation:
	subq.b	#1,stage_anim_timers+2
	bmi.s	R6StageGfxUpdateSpecialTimer
	bra.s	R6StageGfxSpecialFrameCheck

; ------------------------------------------------------------------------------

R6StageGfxUpdateSpecialTimer:
	eori.b	#1,stage_anim_frames+2
	move.b	stage_anim_frames+2,d0
	ext.w	d0
	move.b	R6StageGfxSpecialFrameDurations(pc,d0.w),stage_anim_timers+2

R6StageGfxSpecialFrameCheck:
	tst.b	stage_anim_frames+2
	beq.s	R6StageGfxClearSpecialTiles
	bra.s	R6StageGfxAfterSpecialFrame

; ------------------------------------------------------------------------------

; Special stage-animation frame durations.
R6StageGfxSpecialFrameDurations:
	dc.b	$5A
	dc.b	$1E

; ------------------------------------------------------------------------------

R6StageGfxAfterSpecialFrame:
	lea	R6StageGfxThreeFrameAnimationTable,a1
	move.w	#$3F,d6
	bsr.w	AnimateTilesSimple
	bne.s	R6StageGfxReturn
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)

R6StageGfxReturn:
	rts

; ------------------------------------------------------------------------------

R6StageGfxClearSpecialTiles:
	lea	stage_anim_gfx,a3
	move.w	#$3F,d6

R6StageGfxClearSpecialTileLoop:
	move.l	#0,(a3)+
	dbf	d6,R6StageGfxClearSpecialTileLoop
	lea	VDP_CTRL,a5
	move.l	#$94009380,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$4600,(a5)
	move.w	#$81,dma_stack
	move.w	dma_stack,(a5)
	rts

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
