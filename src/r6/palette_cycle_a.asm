; ------------------------------------------------------------------------------

CyclePalette:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	R6PaletteCycleGroup1Timing,a1
	lea	R6PaletteCycleGroup1Colors,a2
	bsr.w	CycleColor
	lea	R6PaletteCycleGroup2Timing,a1
	lea	R6PaletteCycleGroup2Colors,a2
	bsr.w	CycleColor
	lea	R6PaletteCycleGroup3Timing,a1
	lea	R6PaletteCycleGroup3Colors,a2
	bsr.w	CycleColor
	lea	R6PaletteCycleGroup4Timing,a1
	lea	R6PaletteCycleGroup4Colors,a2

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	R6PaletteCycleReturn
	moveq	#0,d0
	move.b	(a1)+,d0
	move.b	(a1)+,d1
	add.w	d0,d0
	lea	palette,a3
	lea	(a3,d0.w),a3
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	d1,d0
	bcs.s	R6PaletteCycleWrap
	moveq	#0,d0

R6PaletteCycleWrap:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

R6PaletteCycleReturn:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

; Timing records: palette offset, frame count, then delay/color pairs.
R6PaletteCycleGroup1Timing:
	dc.b	$21, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

; Palette colors indexed by the timing records.
R6PaletteCycleGroup1Colors:
	dc.w	$EE
	dc.w	$E
	dc.w	0

R6PaletteCycleGroup2Timing:
	dc.b	$22, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

R6PaletteCycleGroup2Colors:
	dc.w	$E
	dc.w	0
	dc.w	$EE

R6PaletteCycleGroup3Timing:
	dc.b	$23, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 2

R6PaletteCycleGroup3Colors:
	dc.w	0
	dc.w	$EE
	dc.w	$E

R6PaletteCycleGroup4Timing:
	dc.b	$31, $5B
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	1, 0
	dc.b	1, 2
	dc.b	1, 0
	dc.b	1, 3
	dc.b	1, 0
	dc.b	$1E, 1

R6PaletteCycleGroup4Colors:
	dc.w	0
	dc.w	$C28
	dc.w	$EE
	dc.w	$EEE

; ------------------------------------------------------------------------------
