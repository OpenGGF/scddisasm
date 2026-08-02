; ------------------------------------------------------------------------------

DrawStageBg:
	lea	(VDP_CTRL).l,a5
	lea	(VDP_DATA).l,a6
	lea	(scroll_flags_bg).w,a2
	lea	(scroll_bg_x).w,a3
	lea	(stage_map+$40).w,a4
	move.w	#$6000,d2
	bsr.w	DrawStageFg
	lea	(scroll_flags_bg2).w,a2
	lea	(scroll_bg2_x).w,a3
	bra.w	nullsub_6

; ------------------------------------------------------------------------------

DrawStage:
	lea	(VDP_CTRL).l,a5
	lea	(VDP_DATA).l,a6
	lea	(scroll_flags_bg_work).l,a2
	lea	(scroll_bg_x_work).l,a3
	lea	(stage_map+$40).w,a4
	move.w	#$6000,d2
	bsr.w	DrawStageFg
	lea	(scroll_flags_bg2_work).l,a2
	lea	(scroll_bg2_x_work).l,a3
	bsr.w	nullsub_6
	lea	(scroll_flags_bg3_work).l,a2
	lea	(scroll_bg3_x_work).l,a3
	bsr.w	nullsub_7
	lea	(scroll_flags_fg_work).l,a2
	lea	(scroll_fg_x_work).l,a3
	lea	(stage_map).w,a4
	move.w	#$4000,d2

; ------------------------------------------------------------------------------

DrawStageFg:
	tst.b	(a2)
	beq.s	locret_20339C
	bclr	#0,(a2)
	beq.s	loc_203352
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

loc_203352:
	bclr	#1,(a2)
	beq.s	loc_20336C
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

loc_20336C:
	bclr	#2,(a2)
	beq.s	loc_203382
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockColumn

loc_203382:
	bclr	#3,(a2)
	beq.s	locret_20339C
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	DrawBlockColumn

locret_20339C:
	rts

; ------------------------------------------------------------------------------

nullsub_6:
	rts

; ------------------------------------------------------------------------------

nullsub_7:
	rts

; ------------------------------------------------------------------------------

DrawBlockRow:
	moveq	#$15,d6

DrawBlockRow2:
	move.l	#$800000,d7
	move.l	d0,d1

loc_2033AC:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,loc_2033AC
	rts

; ------------------------------------------------------------------------------

DrawBlockRowAbsX:
	move.l	#$800000,d7
	move.l	d0,d1

loc_2033D6:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockDataAbsX
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,loc_2033D6
	rts

; ------------------------------------------------------------------------------

DrawBlockColumn:
	moveq	#$F,d6
	move.l	#$800000,d7
	move.l	d0,d1

loc_203402:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addi.w	#$100,d1
	andi.w	#$FFF,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d4
	dbf	d6,loc_203402
	rts

; ------------------------------------------------------------------------------

DrawBlock:
	or.w	d2,d0
	swap	d0
	btst	#4,(a0)
	bne.s	loc_203462
	btst	#3,(a0)
	bne.s	loc_203442
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	rts

; ------------------------------------------------------------------------------

loc_203442:
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

loc_203462:
	btst	#3,(a0)
	bne.s	loc_203484
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

loc_203484:
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
	lea	(stage_blocks).l,a1
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
	beq.s	locret_2034F4
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

locret_2034F4:
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
	lea	(stage_map).w,a4
	lea	(VDP_CTRL).l,a5
	lea	(VDP_DATA).l,a6
	move.w	#$4000,d2
	move.l	#$800000,d7
	movem.l	d3-d5,-(sp)
	bsr.w	GetBlockDataAbsXY
	bne.s	loc_20355A
	movem.l	(sp)+,d3-d5
	bra.s	loc_203584

; ------------------------------------------------------------------------------

loc_20355A:
	movem.l	(sp)+,d3-d5
	if STANDALONE=0
		move.w	d3,(a0)
	else
		bsr.w	WriteBlock
	endif
	bsr.w	CheckBlockVisible
	bne.s	loc_203584
	movem.l	d3-d5,-(sp)
	lea	(stage_blocks).l,a1
	andi.w	#$3FF,d3
	lsl.w	#3,d3
	adda.w	d3,a1
	bsr.w	GetBlockVramWriteAbsXY
	bsr.w	DrawBlock
	movem.l	(sp)+,d3-d5

loc_203584:
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

CheckBlockVisible:
	move.w	(scroll_fg_y).w,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d4
	bcs.s	loc_2035C8
	addi.w	#$F0,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d4
	bgt.s	loc_2035C8
	move.w	(scroll_fg_x).w,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d5
	bcs.s	loc_2035C8
	addi.w	#$150,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d5
	bgt.s	loc_2035C8
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2035C8:
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
	lea	(VDP_CTRL).l,a5
	lea	(VDP_DATA).l,a6
	lea	(scroll_fg_x).w,a3
	lea	(stage_map).w,a4
	move.w	#$4000,d2
	bsr.s	InitStageDrawFg
	lea	(scroll_bg_x).w,a3
	lea	(stage_map+$40).w,a4
	move.w	#$6000,d2

; ------------------------------------------------------------------------------

InitStageDrawFg:
	moveq	#$FFFFFFF0,d4
	moveq	#$F,d6

loc_20362E:
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
	dbf	d6,loc_20362E
	rts

; ------------------------------------------------------------------------------