; ------------------------------------------------------------------------------

DrawStageBg:
	lea	VDP_CTRL,a5
	lea	VDP_DATA,a6
	lea	scroll_flags_bg,a2
	lea	scroll_bg_x,a3
	lea	stage_map+$40,a4
	move.w	#$6000,d2
	bsr.w	R6StageDrawBackground
	lea	scroll_flags_bg2,a2
	lea	scroll_bg2_x,a3
	bra.w	R6StageDrawNoOpLayer2

; ------------------------------------------------------------------------------

DrawStage:
	lea	VDP_CTRL,a5
	lea	VDP_DATA,a6
	lea	scroll_flags_bg_work,a2
	lea	scroll_bg_x_work,a3
	lea	stage_map+$40,a4
	move.w	#$6000,d2
	bsr.w	R6StageDrawBackground
	lea	scroll_flags_bg2_work,a2
	lea	scroll_bg2_x_work,a3
	bsr.w	R6StageDrawNoOpLayer2
	lea	scroll_flags_bg3_work,a2
	lea	scroll_bg3_x_work,a3
	bsr.w	R6StageDrawNoOpLayer3
	lea	scroll_flags_fg_work,a2
	lea	scroll_fg_x_work,a3
	lea	stage_map,a4
	move.w	#$4000,d2

DrawStageFg:
	tst.b	(a2)
	beq.s	R6DrawStageFgReturn
	bclr	#0,(a2)
	beq.s	R6DrawStageFgTopRow
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

R6DrawStageFgTopRow:
	bclr	#1,(a2)
	beq.s	R6DrawStageFgBottomRow
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

R6DrawStageFgBottomRow:
	bclr	#2,(a2)
	beq.s	R6DrawStageFgRightColumn
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockColumn

R6DrawStageFgRightColumn:
	bclr	#3,(a2)
	beq.s	R6DrawStageFgReturn
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	DrawBlockColumn

R6DrawStageFgReturn:
	rts

; ------------------------------------------------------------------------------

R6StageDrawBackground:
	lea	R6StageDrawScrollLayerTable,a0
	adda.w	#1,a0
	moveq	#$FFFFFFF0,d4
	bclr	#0,(a2)
	bne.s	R6StageDrawUpdateBackgroundRow
	bclr	#1,(a2)
	beq.s	R6StageDrawCheckPendingRows
	move.w	#$E0,d4

R6StageDrawUpdateBackgroundRow:
	move.w	scroll_bg_y,d0
	add.w	d4,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	move.b	(a0,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	movea.l	R6StageDrawScrollLayerPointers(pc,d0.w),a3
	beq.s	R6StageDrawDrawAbsoluteRow
	moveq	#$FFFFFFF0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWrite
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	movea.l	(sp)+,a0
	bra.s	R6StageDrawCheckPendingRows

; ------------------------------------------------------------------------------

R6StageDrawDrawAbsoluteRow:
	moveq	#0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWriteAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX
	movea.l	(sp)+,a0

R6StageDrawCheckPendingRows:
	tst.b	(a2)
	bne.s	R6StageDrawPreparePendingRows
	rts

; ------------------------------------------------------------------------------

R6StageDrawPreparePendingRows:
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	move.b	(a2),d0
	andi.b	#$A8,d0
	beq.s	R6StageDrawDrawPendingBlocks
	lsr.b	#1,d0
	move.b	d0,(a2)
	move.w	#$140,d5

R6StageDrawDrawPendingBlocks:
	move.w	scroll_bg_y,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	suba.w	#1,a0
	lea	(a0,d0.w),a0
	bra.w	R6StageDrawDrawPendingBlockList

; ------------------------------------------------------------------------------

R6StageDrawScrollLayerPointers:
	dc.l	scroll_bg_x_work
	dc.l	scroll_bg_x_work
	dc.l	scroll_bg2_x_work
	dc.l	scroll_bg3_x_work

; ------------------------------------------------------------------------------

R6StageDrawDrawPendingBlockList:
	moveq	#$F,d6
	move.l	#$800000,d7

R6StageDrawDrawPendingBlock:
	moveq	#0,d0
	move.b	(a0)+,d0
	beq.s	R6StageDrawFinishPendingBlockList
	btst	d0,(a2)
	beq.s	R6StageDrawFinishPendingBlockList
	add.w	d0,d0
	movea.l	R6StageDrawScrollLayerPointers(pc,d0.w),a3
	movem.l	d4-d5/a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	movem.l	(sp)+,d4-d5
	bsr.w	GetBlockVramWrite
	bsr.w	DrawBlock
	movem.l	(sp)+,d4-d5/a0

R6StageDrawFinishPendingBlockList:
	addi.w	#$10,d4
	dbf	d6,R6StageDrawDrawPendingBlock
	clr.b	(a2)
	rts

; ------------------------------------------------------------------------------

R6StageDrawNoOpLayer2:
	rts

; ------------------------------------------------------------------------------

R6StageDrawNoOpLayer3:
	rts

; ------------------------------------------------------------------------------

DrawBlockRow:
	moveq	#$15,d6

DrawBlockRow2:
	move.l	#$800000,d7
	move.l	d0,d1

R6DrawBlockRowLoop:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,R6DrawBlockRowLoop
	rts

; ------------------------------------------------------------------------------

DrawBlockRowAbsX:
	move.l	#$800000,d7
	move.l	d0,d1

R6DrawBlockRowAbsXLoop:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockDataAbsX
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,R6DrawBlockRowAbsXLoop
	rts

; ------------------------------------------------------------------------------

DrawBlockColumn:
	moveq	#$F,d6
	move.l	#$800000,d7
	move.l	d0,d1

R6DrawBlockColumnLoop:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addi.w	#$100,d1
	andi.w	#$FFF,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d4
	dbf	d6,R6DrawBlockColumnLoop
	rts

; ------------------------------------------------------------------------------

DrawBlock:
	or.w	d2,d0
	swap	d0
	btst	#4,(a0)
	bne.s	R6DrawBlockVerticalFlip
	btst	#3,(a0)
	bne.s	R6DrawBlockHorizontalFlip
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	rts

; ------------------------------------------------------------------------------

R6DrawBlockHorizontalFlip:
	move.l	d0,(a5)
	move.l	(a1)+,d4
	eori.l	#$8000800,d4
	swap	d4
	move.l	d4,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	move.l	(a1)+,d4
	eori.l	#$8000800,d4
	swap	d4
	move.l	d4,(a6)
	rts

; ------------------------------------------------------------------------------

R6DrawBlockVerticalFlip:
	btst	#3,(a0)
	bne.s	R6DrawBlockBothFlips
	move.l	d0,(a5)
	move.l	(a1)+,d5
	move.l	(a1)+,d4
	eori.l	#$10001000,d4
	move.l	d4,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	eori.l	#$10001000,d5
	move.l	d5,(a6)
	rts

; ------------------------------------------------------------------------------

R6DrawBlockBothFlips:
	move.l	d0,(a5)
	move.l	(a1)+,d5
	move.l	(a1)+,d4
	eori.l	#$18001800,d4
	swap	d4
	move.l	d4,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	eori.l	#$18001800,d5
	swap	d5
	move.l	d5,(a6)
	rts

; ------------------------------------------------------------------------------

GetBlockData:
	add.w	(a3),d5

; ------------------------------------------------------------------------------

GetBlockDataAbsX:
	add.w	4(a3),d4

GetBlockDataAbsXY:
	lea	stage_blocks,a1
	move.w	d4,d3
	lsr.w	#1,d3
	andi.w	#$380,d3
	lsr.w	#3,d5
	move.w	d5,d0
	lsr.w	#5,d0
	andi.w	#$7F,d0
	add.w	d3,d0
	if STANDALONE=0
		move.l	#StageChunks,d3
	else
		moveq	#0,d3
	endif
	move.b	(a4,d0.w),d3
	beq.s	R6GetBlockDataReturn
	subq.b	#1,d3
	andi.w	#$7F,d3
	ror.w	#7,d3
	add.w	d4,d4
	andi.w	#$1E0,d4
	andi.w	#$1E,d5
	add.w	d4,d3
	add.w	d5,d3
	if STANDALONE<>0
		bsr.w	GetWrittenBlock
	endif
	movea.l	d3,a0
	move.w	(a0),d3
	andi.w	#$3FF,d3
	lsl.w	#3,d3
	adda.w	d3,a1
	moveq	#1,d0

R6GetBlockDataReturn:
	rts

; ------------------------------------------------------------------------------

GetChunkBlock:
	move.w	d4,d3
	lsr.w	#1,d3
	andi.w	#$380,d3
	lsr.w	#3,d5
	move.w	d5,d0
	lsr.w	#5,d0
	andi.w	#$7F,d0
	add.w	d3,d0
	if STANDALONE=0
		move.l	#StageChunks,d3
	else
		moveq	#0,d3
	endif
	move.b	(a4,d0.w),d3
	subq.b	#1,d3
	andi.w	#$7F,d3
	ror.w	#7,d3
	add.w	d4,d4
	andi.w	#$1E0,d4
	andi.w	#$1E,d5
	add.w	d4,d3
	add.w	d5,d3
	if STANDALONE<>0
		bsr.w	GetWrittenBlock
	endif
	movea.l	d3,a0
	rts

; ------------------------------------------------------------------------------

PlaceBlock:
	move.l	a0,-(sp)
	lea	stage_map,a4
	lea	VDP_CTRL,a5
	lea	VDP_DATA,a6
	move.w	#$4000,d2
	move.l	#$800000,d7
	movem.l	d3-d5,-(sp)
	bsr.w	GetBlockDataAbsXY
	bne.s	R6PlaceBlockWrite
	movem.l	(sp)+,d3-d5
	bra.s	R6PlaceBlockReturn

; ------------------------------------------------------------------------------

R6PlaceBlockWrite:
	movem.l	(sp)+,d3-d5
	if STANDALONE=0
		move.w	d3,(a0)
	else
		bsr.w	WriteBlock
	endif
	bsr.w	CheckBlockVisible
	bne.s	R6PlaceBlockReturn
	movem.l	d3-d5,-(sp)
	lea	stage_blocks,a1
	andi.w	#$3FF,d3
	lsl.w	#3,d3
	adda.w	d3,a1
	bsr.w	GetBlockVramWriteAbsXY
	bsr.w	DrawBlock
	movem.l	(sp)+,d3-d5

R6PlaceBlockReturn:
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

CheckBlockVisible:
	move.w	scroll_fg_y,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d4
	bcs.s	R6CheckBlockVisibleOutside
	addi.w	#$F0,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d4
	bgt.s	R6CheckBlockVisibleOutside
	move.w	scroll_fg_x,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d5
	bcs.s	R6CheckBlockVisibleOutside
	addi.w	#$150,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d5
	bgt.s	R6CheckBlockVisibleOutside
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

R6CheckBlockVisibleOutside:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

GetBlockVramWrite:
	add.w	(a3),d5

GetBlockVramWriteAbsX:
	add.w	4(a3),d4

; ------------------------------------------------------------------------------

GetBlockVramWriteAbsXY:
	andi.w	#$F0,d4
	andi.w	#$1F0,d5
	lsl.w	#4,d4
	lsr.w	#2,d5
	add.w	d5,d4
	moveq	#3,d0
	swap	d0
	move.w	d4,d0
	rts

; ------------------------------------------------------------------------------

GetBlockVramWrite2:
	add.w	4(a3),d4
	add.w	(a3),d5
	andi.w	#$F0,d4
	andi.w	#$1F0,d5
	lsl.w	#4,d4
	lsr.w	#2,d5
	add.w	d5,d4
	moveq	#2,d0
	swap	d0
	move.w	d4,d0
	rts

; ------------------------------------------------------------------------------

InitStageDraw:
	lea	VDP_CTRL,a5
	lea	VDP_DATA,a6
	lea	scroll_fg_x,a3
	lea	stage_map,a4
	move.w	#$4000,d2
	bsr.s	InitStageDrawFg
	lea	scroll_bg_x,a3
	lea	stage_map+$40,a4
	move.w	#$6000,d2
	bra.w	R6InitStageDrawBg

; ------------------------------------------------------------------------------

InitStageDrawFg:
	moveq	#$FFFFFFF0,d4
	moveq	#$F,d6

R6InitStageDrawFgLoop:
	movem.l	d4-d6,-(sp)
	moveq	#0,d5
	move.w	d4,d1
	bsr.w	GetBlockVramWrite
	move.w	d1,d4
	moveq	#0,d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRow2
	movem.l	(sp)+,d4-d6
	addi.w	#$10,d4
	dbf	d6,R6InitStageDrawFgLoop
	rts

; ------------------------------------------------------------------------------

R6InitStageDrawBg:
	moveq	#$FFFFFFF0,d4
	moveq	#$F,d6

R6InitStageDrawBgLoop:
	movem.l	d4-d6/a0,-(sp)
	lea	R6StageDrawScrollLayerTable,a0
	adda.w	#1,a0
	move.w	scroll_bg_y,d0
	add.w	d4,d0
	andi.w	#$1F0,d0
	bsr.w	R6InitStageDrawBgRow
	movem.l	(sp)+,d4-d6/a0
	addi.w	#$10,d4
	dbf	d6,R6InitStageDrawBgLoop
	rts

; ------------------------------------------------------------------------------

R6StageDrawScrollLayerTable:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	4
	dc.b	0

R6StageDrawInitScrollLayerPointers:
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg2_x&$FFFFFF
	dc.l	scroll_bg3_x&$FFFFFF

; ------------------------------------------------------------------------------

R6InitStageDrawBgRow:
	lsr.w	#4,d0
	move.b	(a0,d0.w),d0
	add.w	d0,d0
	movea.l	R6StageDrawInitScrollLayerPointers(pc,d0.w),a3
	beq.s	R6InitStageDrawBgAbsoluteRow
	moveq	#$FFFFFFF0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWrite
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	bra.s	R6InitStageDrawBgRowReturn

; ------------------------------------------------------------------------------

R6InitStageDrawBgAbsoluteRow:
	moveq	#0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWriteAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX

R6InitStageDrawBgRowReturn:
	rts

; ------------------------------------------------------------------------------
