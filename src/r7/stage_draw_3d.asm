; ------------------------------------------------------------------------------

DrawStageBg:
	lea	(VDP_CTRL).l,a5
	lea	(VDP_DATA).l,a6
	lea	(scroll_flags_bg).w,a2
	lea	(scroll_bg_x).w,a3
	lea	(stage_map+$40).w,a4
	move.w	#$6000,d2
	bsr.w	sub_202F9E
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
	bsr.w	sub_202F9E
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

DrawStageFg:
	tst.b	(a2)
	beq.s	locret_202F9C
	bclr	#0,(a2)
	beq.s	loc_202F52
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

loc_202F52:
	bclr	#1,(a2)
	beq.s	loc_202F6C
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

loc_202F6C:
	bclr	#2,(a2)
	beq.s	loc_202F82
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockColumn

loc_202F82:
	bclr	#3,(a2)
	beq.s	locret_202F9C
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	DrawBlockColumn

locret_202F9C:
	rts

; ------------------------------------------------------------------------------

sub_202F9E:
	lea	(unk_20336A).l,a0
	adda.w	#1,a0
	moveq	#$FFFFFFF0,d4
	bclr	#0,(a2)
	bne.s	loc_202FBA
	bclr	#1,(a2)
	beq.s	loc_203004
	move.w	#$E0,d4

loc_202FBA:
	move.w	(scroll_bg_y).w,d0
	add.w	d4,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	move.b	(a0,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	movea.l	off_203034(pc,d0.w),a3
	beq.s	loc_202FEC
	moveq	#$FFFFFFF0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWrite
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	movea.l	(sp)+,a0
	bra.s	loc_203004

; ------------------------------------------------------------------------------

loc_202FEC:
	moveq	#0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWriteAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX
	movea.l	(sp)+,a0

loc_203004:
	tst.b	(a2)
	bne.s	loc_20300A
	rts

; ------------------------------------------------------------------------------

loc_20300A:
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	move.b	(a2),d0
	andi.b	#$A8,d0
	beq.s	loc_20301E
	lsr.b	#1,d0
	move.b	d0,(a2)
	move.w	#$140,d5

loc_20301E:
	move.w	(scroll_bg_y).w,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	suba.w	#1,a0
	lea	(a0,d0.w),a0
	bra.w	loc_203044

; ------------------------------------------------------------------------------

off_203034:
	dc.l	scroll_bg_x_work
	dc.l	scroll_bg_x_work
	dc.l	scroll_bg2_x_work
	dc.l	scroll_bg3_x_work

; ------------------------------------------------------------------------------

loc_203044:
	moveq	#$F,d6
	move.l	#$800000,d7

loc_20304C:
	moveq	#0,d0
	move.b	(a0)+,d0
	beq.s	loc_203078
	btst	d0,(a2)
	beq.s	loc_203078
	add.w	d0,d0
	movea.l	off_203034(pc,d0.w),a3
	movem.l	d4-d5/a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	movem.l	(sp)+,d4-d5
	bsr.w	GetBlockVramWrite
	bsr.w	DrawBlock
	movem.l	(sp)+,d4-d5/a0

loc_203078:
	addi.w	#$10,d4
	dbf	d6,loc_20304C
	clr.b	(a2)
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

loc_203092:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,loc_203092
	rts

; ------------------------------------------------------------------------------

DrawBlockRowAbsX:
	move.l	#$800000,d7
	move.l	d0,d1

loc_2030BC:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockDataAbsX
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,loc_2030BC
	rts

; ------------------------------------------------------------------------------

DrawBlockColumn:
	moveq	#$F,d6
	move.l	#$800000,d7
	move.l	d0,d1

loc_2030E8:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addi.w	#$100,d1
	andi.w	#$FFF,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d4
	dbf	d6,loc_2030E8
	rts

; ------------------------------------------------------------------------------

DrawBlock:
	or.w	d2,d0
	swap	d0
	btst	#4,(a0)
	bne.s	loc_203148
	btst	#3,(a0)
	bne.s	loc_203128
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	rts

; ------------------------------------------------------------------------------

loc_203128:
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

loc_203148:
	btst	#3,(a0)
	bne.s	loc_20316A
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

loc_20316A:
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
	beq.s	locret_2031DA
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

locret_2031DA:
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
	bne.s	loc_203240
	movem.l	(sp)+,d3-d5
	bra.s	loc_20326A

; ------------------------------------------------------------------------------

loc_203240:
	movem.l	(sp)+,d3-d5
	if STANDALONE=0
		move.w	d3,(a0)
	else
		bsr.w	WriteBlock
	endif
	bsr.w	CheckBlockVisible
	bne.s	loc_20326A
	movem.l	d3-d5,-(sp)
	lea	(stage_blocks).l,a1
	andi.w	#$3FF,d3
	lsl.w	#3,d3
	adda.w	d3,a1
	bsr.w	GetBlockVramWriteAbsXY
	bsr.w	DrawBlock
	movem.l	(sp)+,d3-d5

loc_20326A:
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

CheckBlockVisible:
	move.w	(scroll_fg_y).w,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d4
	bcs.s	loc_2032AE
	addi.w	#$F0,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d4
	bgt.s	loc_2032AE
	move.w	(scroll_fg_x).w,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d5
	bcs.s	loc_2032AE
	addi.w	#$150,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d5
	bgt.s	loc_2032AE
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2032AE:
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
	bra.w	loc_20333C

; ------------------------------------------------------------------------------

InitStageDrawFg:
	moveq	#$FFFFFFF0,d4
	moveq	#$F,d6

loc_203318:
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
	dbf	d6,loc_203318
	rts

; ------------------------------------------------------------------------------

loc_20333C:
	moveq	#$FFFFFFF0,d4
	moveq	#$F,d6

loc_203340:
	movem.l	d4-d6/a0,-(sp)
	lea	(unk_20336A).l,a0
	adda.w	#1,a0
	move.w	(scroll_bg_y).w,d0
	add.w	d4,d0
	andi.w	#$1F0,d0
	bsr.w	sub_2033BC
	movem.l	(sp)+,d4-d6/a0
	addi.w	#$10,d4
	dbf	d6,loc_203340
	rts

; ------------------------------------------------------------------------------

unk_20336A:
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
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	2
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

off_2033AC:
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg2_x&$FFFFFF
	dc.l	scroll_bg3_x&$FFFFFF

; ------------------------------------------------------------------------------

sub_2033BC:
	lsr.w	#4,d0
	move.b	(a0,d0.w),d0
	add.w	d0,d0
	movea.l	off_2033AC(pc,d0.w),a3
	beq.s	loc_2033DE
	moveq	#$FFFFFFF0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWrite
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	bra.s	locret_2033F2

; ------------------------------------------------------------------------------

loc_2033DE:
	moveq	#0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWriteAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX

locret_2033F2:
	rts

; ------------------------------------------------------------------------------