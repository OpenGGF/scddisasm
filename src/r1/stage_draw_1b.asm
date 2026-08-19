; ------------------------------------------------------------------------------

DrawStageBg:
	lea	VDP_CTRL,a5
	lea	VDP_DATA,a6
	lea	scroll_flags_bg,a2
	lea	scroll_bg_x,a3
	lea	stage_map+$40,a4
	move.w	#$6000,d2
	bsr.w	sub_202FC2
	lea	scroll_flags_bg2,a2
	lea	scroll_bg2_x,a3
	bra.w	nullsub_1

; ------------------------------------------------------------------------------

DrawStage:
	lea	VDP_CTRL,a5
	lea	VDP_DATA,a6
	lea	scroll_flags_bg_work,a2
	lea	scroll_bg_x_work,a3
	lea	stage_map+$40,a4
	move.w	#$6000,d2
	bsr.w	sub_202FC2
	lea	scroll_flags_bg2_work,a2
	lea	scroll_bg2_x_work,a3
	bsr.w	nullsub_1
	lea	scroll_flags_bg3_work,a2
	lea	scroll_bg3_x_work,a3
	bsr.w	nullsub_2
	lea	scroll_flags_fg_work,a2
	lea	scroll_fg_x_work,a3
	lea	stage_map,a4
	move.w	#$4000,d2

DrawStageFg:
	tst.b	(a2)
	beq.s	locret_202FC0
	bclr	#0,(a2)
	beq.s	loc_202F76
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

loc_202F76:
	bclr	#1,(a2)
	beq.s	loc_202F90
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	move.w	#$E0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockRow

loc_202F90:
	bclr	#2,(a2)
	beq.s	loc_202FA6
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	bsr.w	DrawBlockColumn

loc_202FA6:
	bclr	#3,(a2)
	beq.s	locret_202FC0
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	GetBlockVramWrite
	moveq	#$FFFFFFF0,d4
	move.w	#$140,d5
	bsr.w	DrawBlockColumn

locret_202FC0:
	rts

; ------------------------------------------------------------------------------

sub_202FC2:
	lea	unk_203394,a0
	adda.w	#1,a0
	move.w	#$FFF0,d4
	bclr	#0,(a2)
	bne.s	loc_202FE0
	bclr	#1,(a2)
	beq.s	loc_20302A
	move.w	#$E0,d4

loc_202FE0:
	move.w	scroll_bg_y,d0
	add.w	d4,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	move.b	(a0,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	movea.l	off_20305A(pc,d0.w),a3
	beq.s	loc_203012
	moveq	#$FFFFFFF0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWrite
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	movea.l	(sp)+,a0
	bra.s	loc_20302A

; ------------------------------------------------------------------------------

loc_203012:
	moveq	#0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWriteAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX
	movea.l	(sp)+,a0

loc_20302A:
	tst.b	(a2)
	bne.s	loc_203030
	rts

; ------------------------------------------------------------------------------

loc_203030:
	moveq	#$FFFFFFF0,d4
	moveq	#$FFFFFFF0,d5
	move.b	(a2),d0
	andi.b	#$A8,d0
	beq.s	loc_203044
	lsr.b	#1,d0
	move.b	d0,(a2)
	move.w	#$140,d5

loc_203044:
	move.w	scroll_bg_y,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	suba.w	#1,a0
	lea	(a0,d0.w),a0
	bra.w	loc_20306A

; ------------------------------------------------------------------------------

off_20305A:
	dc.l	scroll_bg_x_work
	dc.l	scroll_bg_x_work
	dc.l	scroll_bg2_x_work
	dc.l	scroll_bg3_x_work

; ------------------------------------------------------------------------------

loc_20306A:
	moveq	#$F,d6
	move.l	#$800000,d7

loc_203072:
	moveq	#0,d0
	move.b	(a0)+,d0
	btst	d0,(a2)
	beq.s	loc_20309C
	add.w	d0,d0
	movea.l	off_20305A(pc,d0.w),a3
	movem.l	d4-d5/a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	movem.l	(sp)+,d4-d5
	bsr.w	GetBlockVramWrite
	bsr.w	DrawBlock
	movem.l	(sp)+,d4-d5/a0

loc_20309C:
	addi.w	#$10,d4
	dbf	d6,loc_203072
	clr.b	(a2)
	rts

; ------------------------------------------------------------------------------

nullsub_1:
	rts

; ------------------------------------------------------------------------------

nullsub_2:
	rts

; ------------------------------------------------------------------------------

DrawBlockRow:
	moveq	#$15,d6

DrawBlockRow2:
	move.l	#$800000,d7
	move.l	d0,d1

loc_2030B6:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,loc_2030B6
	rts

; ------------------------------------------------------------------------------

DrawBlockRowAbsX:
	move.l	#$800000,d7
	move.l	d0,d1

loc_2030E0:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockDataAbsX
	move.l	d1,d0
	bsr.w	DrawBlock
	addq.b	#4,d1
	andi.b	#$7F,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d5
	dbf	d6,loc_2030E0
	rts

; ------------------------------------------------------------------------------

DrawBlockColumn:
	moveq	#$F,d6
	move.l	#$800000,d7
	move.l	d0,d1

loc_20310C:
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	move.l	d1,d0
	bsr.w	DrawBlock
	addi.w	#$100,d1
	andi.w	#$FFF,d1
	movem.l	(sp)+,d4-d5
	addi.w	#$10,d4
	dbf	d6,loc_20310C
	rts

; ------------------------------------------------------------------------------

DrawBlock:
	or.w	d2,d0
	swap	d0
	btst	#4,(a0)
	bne.s	loc_20316C
	btst	#3,(a0)
	bne.s	loc_20314C
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	add.l	d7,d0
	move.l	d0,(a5)
	move.l	(a1)+,(a6)
	rts

; ------------------------------------------------------------------------------

loc_20314C:
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

loc_20316C:
	btst	#3,(a0)
	bne.s	loc_20318E
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

loc_20318E:
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
	beq.s	locret_2031FE
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

locret_2031FE:
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
	bne.s	loc_203264
	movem.l	(sp)+,d3-d5
	bra.s	loc_20328E

; ------------------------------------------------------------------------------

loc_203264:
	movem.l	(sp)+,d3-d5
	if STANDALONE=0
		move.w	d3,(a0)
	else
		bsr.w	WriteBlock
	endif
	bsr.w	CheckBlockVisible
	bne.s	loc_20328E
	movem.l	d3-d5,-(sp)
	lea	stage_blocks,a1
	andi.w	#$3FF,d3
	lsl.w	#3,d3
	adda.w	d3,a1
	bsr.w	GetBlockVramWriteAbsXY
	bsr.w	DrawBlock
	movem.l	(sp)+,d3-d5

loc_20328E:
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

CheckBlockVisible:
	move.w	scroll_fg_y,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d4
	bcs.s	loc_2032D2
	addi.w	#$F0,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d4
	bgt.s	loc_2032D2
	move.w	scroll_fg_x,d0
	move.w	d0,d1
	andi.w	#$FFF0,d0
	subi.w	#$10,d0
	cmp.w	d0,d5
	bcs.s	loc_2032D2
	addi.w	#$150,d1
	andi.w	#$FFF0,d1
	cmp.w	d1,d5
	bgt.s	loc_2032D2
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2032D2:
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
	bsr.s	sub_203338
	lea	scroll_bg_x,a3
	lea	stage_map+$40,a4
	move.w	#$6000,d2
	bra.w	loc_203362

; ------------------------------------------------------------------------------

sub_203338:
	move.w	#$FFF0,d4
	moveq	#$F,d6

loc_20333E:
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
	dbf	d6,loc_20333E
	rts

; ------------------------------------------------------------------------------

loc_203362:
	move.w	#$FFF0,d4
	moveq	#$F,d6

loc_203368:
	movem.l	d4-d6/a0,-(sp)
	lea	unk_203394,a0
	adda.w	#1,a0
	move.w	scroll_bg_y,d0
	add.w	d4,d0
	andi.w	#$1F0,d0
	bsr.w	sub_2033C6
	movem.l	(sp)+,d4-d6/a0
	addi.w	#$10,d4
	dbf	d6,loc_203368
	rts

; ------------------------------------------------------------------------------

	dc.b	0
	dc.b	0

unk_203394:
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

off_2033B6:
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg2_x&$FFFFFF
	dc.l	scroll_bg3_x&$FFFFFF

; ------------------------------------------------------------------------------

sub_2033C6:
	lsr.w	#4,d0
	move.b	(a0,d0.w),d0
	add.w	d0,d0
	movea.l	off_2033B6(pc,d0.w),a3
	beq.s	loc_2033E8
	moveq	#$FFFFFFF0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWrite
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	bra.s	locret_2033FC

; ------------------------------------------------------------------------------

loc_2033E8:
	moveq	#0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVramWriteAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX

locret_2033FC:
	rts

; ------------------------------------------------------------------------------
