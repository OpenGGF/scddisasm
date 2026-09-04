; ------------------------------------------------------------------------------

InitScroll:
	lea	player_object,a6
	moveq	#0,d0
	move.b	d0,unused_scroll_x_flag
	move.b	d0,unused_scroll_y_flag
	move.b	d0,unused_scroll_die
	move.b	d0,unused_scroll_timer
	move.b	d0,event_routine
	lea	R6ScrollInitialStateTable,a0
	move.w	(a0)+,d0
	move.w	d0,unused_scroll_routine
	move.l	(a0)+,d0
	move.l	d0,left_bound
	move.l	d0,target_left_bound
	move.l	(a0)+,d0
	move.l	d0,top_bound
	move.l	d0,target_top_bound
	move.w	left_bound,d0
	addi.w	#$240,d0
	move.w	d0,unused_scroll_x_keep
	move.w	#$1010,scroll_cross_x
	move.w	(a0)+,d0
	move.w	d0,scroll_focus_y
	move.w	#$A0,scroll_focus_x
	bra.w	R6ScrollInitCheckpoint

; ------------------------------------------------------------------------------

; Initial scroll state: routine, bounds, and focus coordinates.
R6ScrollInitialStateTable:
	dc.b	0
	dc.b	4
	dc.b	0
	dc.b	0
	dc.b	$23
	dc.b	$97
	dc.b	0
	dc.b	0
	dc.b	7
	dc.b	$10
	dc.b	0
	dc.b	$60

; ------------------------------------------------------------------------------

R6ScrollInitCheckpoint:
	tst.b	spawn_mode
	beq.s	R6ScrollInitStageSpawn
	jsr	LoadCheckpoint
	moveq	#0,d0
	moveq	#0,d1
	move.w	8(a6),d1
	move.w	$C(a6),d0
	bpl.s	R6ScrollInitCheckpointXReady
	moveq	#0,d0

R6ScrollInitCheckpointXReady:
	bra.s	R6ScrollInitClampForegroundX

; ------------------------------------------------------------------------------

R6ScrollInitStageSpawn:
	lea	StagePlayerSpawn,a1
	moveq	#0,d1
	move.w	(a1)+,d1
	move.w	d1,8(a6)
	moveq	#0,d0
	move.w	(a1),d0
	move.w	d0,$C(a6)

R6ScrollInitClampForegroundX:
	subi.w	#$A0,d1
	bcc.s	R6ScrollInitClampRightBound
	moveq	#0,d1

R6ScrollInitClampRightBound:
	move.w	right_bound,d2
	cmp.w	d2,d1
	bcs.s	R6ScrollInitStoreForegroundX
	move.w	d2,d1

R6ScrollInitStoreForegroundX:
	move.w	d1,scroll_fg_x
	subi.w	#$60,d0
	bcc.s	R6ScrollInitClampForegroundY
	moveq	#0,d0

R6ScrollInitClampForegroundY:
	cmp.w	bottom_bound,d0
	blt.s	R6ScrollInitStoreForegroundY
	move.w	bottom_bound,d0

R6ScrollInitStoreForegroundY:
	move.w	d0,scroll_fg_y
	bsr.w	R6ScrollSetLayerPositions
	lea	R6ScrollLoopChunkSeed,a1
	move.l	(a1),loop_chunk_1
	rts

; ------------------------------------------------------------------------------

StagePlayerSpawn:
	dc.b	0, $30, 1, $9C

; Initial loop-chunk seed copied into the scroll state.
R6ScrollLoopChunkSeed:
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F
	dc.b	$7F

; ------------------------------------------------------------------------------

R6ScrollSetLayerPositions:
	swap	d0
	lsr.l	#2,d0
	move.l	d0,scroll_bg_y
	swap	d0
	move.w	d0,scroll_bg2_y
	move.w	d0,scroll_bg3_y
	lsr.l	#1,d1
	move.w	d1,scroll_bg2_x
	lsr.l	#1,d1
	move.w	d1,scroll_bg3_x
	lsr.l	#2,d1
	move.l	d1,d2
	add.l	d2,d2
	add.l	d2,d1
	move.w	d1,scroll_bg_x
	rts

; ------------------------------------------------------------------------------

UpdateScroll:
	lea	player_object,a6
	tst.b	scroll_lock
	beq.s	R6ScrollUpdateActive
	rts

; ------------------------------------------------------------------------------

R6ScrollUpdateActive:
	clr.w	scroll_flags_fg
	clr.w	scroll_flags_bg
	clr.w	scroll_flags_bg2
	clr.w	scroll_flags_bg3
	if REGION=USA
		bsr.w	StageEvents
		bsr.w	ScrollFgX
		bsr.w	ScrollFgY
	else
		bsr.w	ScrollFgX
		bsr.w	ScrollFgY
		bsr.w	StageEvents
	endif
	move.w	scroll_fg_y,scroll_y
	move.w	scroll_bg_y,scroll_y+2
	move.w	scroll_x_move,d4
	ext.l	d4
	asl.l	#6,d4
	moveq	#6,d6
	bsr.w	ScrollBg3X
	move.w	scroll_x_move,d4
	ext.l	d4
	asl.l	#7,d4
	moveq	#4,d6
	bsr.w	ScrollBg2X
	lea	bg_scroll_lines,a1
	move.w	scroll_x_move,d4
	ext.l	d4
	asl.l	#4,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#2,d6
	bsr.w	ScrollBgX
	move.w	scroll_fg_y,d0
	lsr.w	#2,d0
	bsr.w	ScrollBgY
	move.w	scroll_bg_y,scroll_y+2
	move.w	scroll_bg_y,scroll_bg2_y
	move.w	scroll_bg_y,scroll_bg3_y
	move.b	scroll_flags_bg3,d0
	or.b	scroll_flags_bg2,d0
	or.b	d0,scroll_flags_bg
	clr.b	scroll_flags_bg3
	clr.b	scroll_flags_bg2
	lea	bg_scroll_lines,a1
	move.w	scroll_fg_x,d0
	neg.w	d0
	swap	d0
	bsr.w	R6ScrollUpdateBackgroundCurve
	move.w	scroll_bg3_x,d0
	neg.w	d0
	moveq	#$17,d6

R6ScrollFillBackgroundLayer3:
	move.w	d0,(a1)+
	dbf	d6,R6ScrollFillBackgroundLayer3
	move.w	scroll_bg2_x,d0
	neg.w	d0
	moveq	#$2D,d6

R6ScrollFillBackgroundLayer2:
	move.w	d0,(a1)+
	dbf	d6,R6ScrollFillBackgroundLayer2
	lea	scroll_lines,a1
	lea	bg_scroll_lines,a2
	move.w	scroll_bg_y,d0
	move.w	d0,d2
	andi.w	#$3F8,d0
	lsr.w	#2,d0
	moveq	#$1D,d1
	lea	(a2,d0.w),a2
	bra.w	R6ScrollWriteScrollLinePattern

; ------------------------------------------------------------------------------

; Background curve segment repeat counts.
R6ScrollCurveSegmentLengths:
	dc.b	5
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	0

; ------------------------------------------------------------------------------

R6ScrollUpdateBackgroundCurve:
	move.w	scroll_bg_x,d0
	move.w	scroll_fg_x,d2
	sub.w	d0,d2
	ext.l	d2
	moveq	#0,d3
	move.w	scroll_bg_x,d4
	moveq	#8,d6
	adda.w	#$34,a1

R6ScrollBackgroundCurveSegment:
	move.b	d3,d0
	jsr	SineCosine
	move.w	#$100,d5
	sub.w	d1,d5
	muls.w	d2,d5
	lsr.l	#8,d5
	add.w	d4,d5
	neg.w	d5
	moveq	#0,d1
	move.b	R6ScrollCurveSegmentLengths(pc,d6.w),d1

R6ScrollBackgroundCurveRepeat:
	move.w	d5,-(a1)
	dbf	d1,R6ScrollBackgroundCurveRepeat
	addq.b	#6,d3
	dbf	d6,R6ScrollBackgroundCurveSegment
	adda.w	#$34,a1
	rts

; ------------------------------------------------------------------------------

R6ScrollWriteScrollLinePattern:
	andi.w	#7,d2
	add.w	d2,d2
	move.w	(a2)+,d0
	jmp	R6ScrollWriteScrollLinePatternRun(pc,d2.w)

; ------------------------------------------------------------------------------

R6ScrollWriteScrollLinePatternEntry:
	move.w	(a2)+,d0

R6ScrollWriteScrollLinePatternRun:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,R6ScrollWriteScrollLinePatternEntry
	rts

; ------------------------------------------------------------------------------

	neg.w	d0
	jmp	R6ScrollWriteScrollLinePatternNegativeRun(pc,d2.w)

; ------------------------------------------------------------------------------

	neg.w	d0

R6ScrollWriteScrollLinePatternNegativeRun:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,R6ScrollWriteScrollLinePatternEntry
	rts

; ------------------------------------------------------------------------------

ScrollFgX:
	move.w	scroll_fg_x,d4
	bsr.s	CheckScrollFgX
	move.w	scroll_fg_x,d0
	andi.w	#$10,d0
	move.b	scroll_cross_x,d1
	eor.b	d1,d0
	bne.s	R6ScrollForegroundXReturn
	eori.b	#$10,scroll_cross_x
	move.w	scroll_fg_x,d0
	sub.w	d4,d0
	bpl.s	R6ScrollForegroundXSetRightFlag
	bset	#2,scroll_flags_fg
	rts

; ------------------------------------------------------------------------------

R6ScrollForegroundXSetRightFlag:
	bset	#3,scroll_flags_fg

R6ScrollForegroundXReturn:
	rts

; ------------------------------------------------------------------------------

CheckScrollFgX:
	move.w	8(a6),d0
	sub.w	scroll_fg_x,d0
	sub.w	scroll_focus_x,d0
	beq.s	R6ScrollForegroundXNoMovement
	bcs.s	R6ScrollForegroundXAdvanceNegative
	bra.s	R6ScrollForegroundXAdvancePositive

; ------------------------------------------------------------------------------

R6ScrollForegroundXNoMovement:
	clr.w	scroll_x_move
	rts

; ------------------------------------------------------------------------------

R6ScrollForegroundXAdvancePositive:
	cmpi.w	#$10,d0
	blt.s	R6ScrollForegroundXApplyRightBound
	move.w	#$10,d0

R6ScrollForegroundXApplyRightBound:
	add.w	scroll_fg_x,d0
	cmp.w	right_bound,d0
	blt.s	R6ScrollForegroundXStore
	move.w	right_bound,d0

R6ScrollForegroundXStore:
	move.w	d0,d1
	sub.w	scroll_fg_x,d1
	asl.w	#8,d1
	move.w	d0,scroll_fg_x
	move.w	d1,scroll_x_move
	rts

; ------------------------------------------------------------------------------

R6ScrollForegroundXAdvanceNegative:
	cmpi.w	#$FFF0,d0
	bge.s	R6ScrollForegroundXClampLeftBound
	move.w	#$FFF0,d0

R6ScrollForegroundXClampLeftBound:
	add.w	scroll_fg_x,d0
	cmp.w	left_bound,d0
	bgt.s	R6ScrollForegroundXStore
	move.w	left_bound,d0
	bra.s	R6ScrollForegroundXStore

; ------------------------------------------------------------------------------

ScrollFgXSlow:
	tst.w	d0
	bpl.s	R6ScrollForegroundXSlowPositive
	move.w	#$FFFE,d0
	bra.s	R6ScrollForegroundXAdvanceNegative

; ------------------------------------------------------------------------------

R6ScrollForegroundXSlowPositive:
	move.w	#2,d0
	bra.s	R6ScrollForegroundXAdvancePositive

; ------------------------------------------------------------------------------

ScrollFgY:
	moveq	#0,d1
	move.w	$C(a6),d0
	sub.w	scroll_fg_y,d0
	btst	#2,$22(a6)
	beq.s	R6ScrollForegroundYCameraOffset
	subq.w	#5,d0

R6ScrollForegroundYCameraOffset:
	btst	#1,$22(a6)
	beq.s	R6ScrollForegroundYFocusCheck
	addi.w	#$20,d0
	sub.w	scroll_focus_y,d0
	bcs.s	R6ScrollForegroundYMaxSpeed
	subi.w	#$40,d0
	bcc.s	R6ScrollForegroundYMaxSpeed
	tst.b	bottom_bound_shift
	bne.s	R6ScrollForegroundYClearBoundShift
	bra.s	R6ScrollForegroundYNoMovement

; ------------------------------------------------------------------------------

R6ScrollForegroundYFocusCheck:
	sub.w	scroll_focus_y,d0
	bne.s	R6ScrollForegroundYFocus60Speed
	tst.b	bottom_bound_shift
	bne.s	R6ScrollForegroundYClearBoundShift

R6ScrollForegroundYNoMovement:
	clr.w	scroll_y_move
	rts

; ------------------------------------------------------------------------------

R6ScrollForegroundYFocus60Speed:
	cmpi.w	#$60,scroll_focus_y
	bne.s	R6ScrollForegroundYFocusOtherSpeed
	move.w	$14(a6),d1
	bpl.s	R6ScrollForegroundYUseVelocitySpeed
	neg.w	d1

R6ScrollForegroundYUseVelocitySpeed:
	cmpi.w	#$800,d1
	bcc.s	R6ScrollForegroundYMaxSpeed
	move.w	#$600,d1
	cmpi.w	#6,d0
	bgt.s	R6ScrollForegroundYApplyPositiveDelta
	cmpi.w	#$FFFA,d0
	blt.s	R6ScrollForegroundYApplyNegativeDelta
	bra.s	R6ScrollForegroundYApplyDelta

; ------------------------------------------------------------------------------

R6ScrollForegroundYFocusOtherSpeed:
	move.w	#$200,d1
	cmpi.w	#2,d0
	bgt.s	R6ScrollForegroundYApplyPositiveDelta
	cmpi.w	#$FFFE,d0
	blt.s	R6ScrollForegroundYApplyNegativeDelta
	bra.s	R6ScrollForegroundYApplyDelta

; ------------------------------------------------------------------------------

R6ScrollForegroundYMaxSpeed:
	move.w	#$1000,d1
	cmpi.w	#$10,d0
	bgt.s	R6ScrollForegroundYApplyPositiveDelta
	cmpi.w	#$FFF0,d0
	blt.s	R6ScrollForegroundYApplyNegativeDelta
	bra.s	R6ScrollForegroundYApplyDelta

; ------------------------------------------------------------------------------

R6ScrollForegroundYClearBoundShift:
	moveq	#0,d0
	move.b	d0,bottom_bound_shift

R6ScrollForegroundYApplyDelta:
	moveq	#0,d1
	move.w	d0,d1
	add.w	scroll_fg_y,d1
	tst.w	d0
	bpl.w	R6ScrollForegroundYBottomBoundWrap
	bra.w	R6ScrollForegroundYTopBoundWrap

; ------------------------------------------------------------------------------

R6ScrollForegroundYApplyNegativeDelta:
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	add.l	scroll_fg_y,d1
	swap	d1

R6ScrollForegroundYTopBoundWrap:
	cmp.w	top_bound,d1
	bgt.s	R6ScrollForegroundYFinalize
	cmpi.w	#$FF00,d1
	bgt.s	R6ScrollForegroundYTopBoundClamp
	andi.w	#$7FF,d1
	andi.w	#$7FF,$C(a6)
	andi.w	#$7FF,scroll_fg_y
	andi.w	#$3FF,scroll_bg_y
	bra.s	R6ScrollForegroundYFinalize

; ------------------------------------------------------------------------------

R6ScrollForegroundYTopBoundClamp:
	move.w	top_bound,d1
	bra.s	R6ScrollForegroundYFinalize

; ------------------------------------------------------------------------------

R6ScrollForegroundYApplyPositiveDelta:
	ext.l	d1
	asl.l	#8,d1
	add.l	scroll_fg_y,d1
	swap	d1

R6ScrollForegroundYBottomBoundWrap:
	cmp.w	bottom_bound,d1
	blt.s	R6ScrollForegroundYFinalize
	subi.w	#$800,d1
	bcs.s	R6ScrollForegroundYBottomBoundClamp
	andi.w	#$7FF,$C(a6)
	subi.w	#$800,scroll_fg_y
	andi.w	#$3FF,scroll_bg_y
	bra.s	R6ScrollForegroundYFinalize

; ------------------------------------------------------------------------------

R6ScrollForegroundYBottomBoundClamp:
	move.w	bottom_bound,d1

R6ScrollForegroundYFinalize:
	move.w	scroll_fg_y,d4
	swap	d1
	move.l	d1,d3
	sub.l	scroll_fg_y,d3
	ror.l	#8,d3
	move.w	d3,scroll_y_move
	move.l	d1,scroll_fg_y
	move.w	scroll_fg_y,d0
	andi.w	#$10,d0
	move.b	scroll_cross_y,d1
	eor.b	d1,d0
	bne.s	R6ScrollForegroundYReturn
	eori.b	#$10,scroll_cross_y
	move.w	scroll_fg_y,d0
	sub.w	d4,d0
	bpl.s	R6ScrollForegroundYSetDownFlag
	bset	#0,scroll_flags_fg
	rts

; ------------------------------------------------------------------------------

R6ScrollForegroundYSetDownFlag:
	bset	#1,scroll_flags_fg

R6ScrollForegroundYReturn:
	rts

; ------------------------------------------------------------------------------

ScrollBgXY:
	move.l	scroll_bg_x,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,scroll_bg_x
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg_x,d3
	eor.b	d3,d1
	bne.s	R6ScrollBackgroundXYBeginY
	eori.b	#$10,scroll_cross_bg_x
	sub.l	d2,d0
	bpl.s	R6ScrollBackgroundXYSetXFlag
	bset	#2,scroll_flags_bg
	bra.s	R6ScrollBackgroundXYBeginY

; ------------------------------------------------------------------------------

R6ScrollBackgroundXYSetXFlag:
	bset	#3,scroll_flags_bg

R6ScrollBackgroundXYBeginY:
	move.l	scroll_bg_y,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,scroll_bg_y
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg_y,d2
	eor.b	d2,d1
	bne.s	R6ScrollBackgroundXYReturn
	eori.b	#$10,scroll_cross_bg_y
	sub.l	d3,d0
	bpl.s	R6ScrollBackgroundXYSetYFlag
	bset	#0,scroll_flags_bg
	rts

; ------------------------------------------------------------------------------

R6ScrollBackgroundXYSetYFlag:
	bset	#1,scroll_flags_bg

R6ScrollBackgroundXYReturn:
	rts

; ------------------------------------------------------------------------------

UnkScrollBgY:
	move.l	scroll_bg_y,d3
	move.l	d3,d0
	add.l	d5,d0
	move.l	d0,scroll_bg_y
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg_y,d2
	eor.b	d2,d1
	bne.s	R6ScrollBackgroundYAlternateReturn
	eori.b	#$10,scroll_cross_bg_y
	sub.l	d3,d0
	bpl.s	R6ScrollBackgroundYAlternateSetFlag
	bset	#4,scroll_flags_bg
	rts

; ------------------------------------------------------------------------------

R6ScrollBackgroundYAlternateSetFlag:
	bset	#5,scroll_flags_bg

R6ScrollBackgroundYAlternateReturn:
	rts

; ------------------------------------------------------------------------------

ScrollBgY:
	move.w	scroll_bg_y,d3
	move.w	d0,scroll_bg_y
	move.w	d0,d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg_y,d2
	eor.b	d2,d1
	bne.s	R6ScrollBackgroundYReturn
	eori.b	#$10,scroll_cross_bg_y
	sub.w	d3,d0
	bpl.s	R6ScrollBackgroundYSetFlag
	bset	#0,scroll_flags_bg
	rts

; ------------------------------------------------------------------------------

R6ScrollBackgroundYSetFlag:
	bset	#1,scroll_flags_bg

R6ScrollBackgroundYReturn:
	rts

; ------------------------------------------------------------------------------

ScrollBgX:
	move.l	scroll_bg_x,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,scroll_bg_x
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg_x,d3
	eor.b	d3,d1
	bne.s	R6ScrollBackgroundXReturn
	eori.b	#$10,scroll_cross_bg_x
	sub.l	d2,d0
	bpl.s	R6ScrollBackgroundXSetAdvanceFlag
	bset	d6,scroll_flags_bg
	bra.s	R6ScrollBackgroundXReturn

; ------------------------------------------------------------------------------

R6ScrollBackgroundXSetAdvanceFlag:
	addq.b	#1,d6
	bset	d6,scroll_flags_bg

R6ScrollBackgroundXReturn:
	rts

; ------------------------------------------------------------------------------

ScrollBg2X:
	move.l	scroll_bg2_x,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,scroll_bg2_x
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg2_x,d3
	eor.b	d3,d1
	bne.s	R6ScrollBackground2XReturn
	eori.b	#$10,scroll_cross_bg2_x
	sub.l	d2,d0
	bpl.s	R6ScrollBackground2XSetAdvanceFlag
	bset	d6,scroll_flags_bg2
	bra.s	R6ScrollBackground2XReturn

; ------------------------------------------------------------------------------

R6ScrollBackground2XSetAdvanceFlag:
	addq.b	#1,d6
	bset	d6,scroll_flags_bg2

R6ScrollBackground2XReturn:
	rts

; ------------------------------------------------------------------------------

ScrollBg3X:
	move.l	scroll_bg3_x,d2
	move.l	d2,d0
	add.l	d4,d0
	move.l	d0,scroll_bg3_x
	move.l	d0,d1
	swap	d1
	andi.w	#$10,d1
	move.b	scroll_cross_bg3_x,d3
	eor.b	d3,d1
	bne.s	R6ScrollBackground3XReturn
	eori.b	#$10,scroll_cross_bg3_x
	sub.l	d2,d0
	bpl.s	R6ScrollBackground3XSetAdvanceFlag
	bset	d6,scroll_flags_bg3
	bra.s	R6ScrollBackground3XReturn

; ------------------------------------------------------------------------------

R6ScrollBackground3XSetAdvanceFlag:
	addq.b	#1,d6
	bset	d6,scroll_flags_bg3

R6ScrollBackground3XReturn:
	rts

; ------------------------------------------------------------------------------
