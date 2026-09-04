; ------------------------------------------------------------------------------

; Act 1 skips these cycles; active R42/R43 acts use three palette groups.
CyclePalette:
	tst.b	act
	bne.s	R4PaletteCycleActive
	rts

; ------------------------------------------------------------------------------

R4PaletteCycleActive:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	R4PaletteCycleGroup1Timing,a1
	lea	R4PaletteCycleColors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleGroup2Timing,a1
	lea	R4PaletteCycleColors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleGroup3Timing,a1
	lea	R4PaletteCycleColors,a2
	bra.w	*+4

; ------------------------------------------------------------------------------

CycleColor:
	subq.b	#1,(a5)
	bpl.s	R4PaletteCycleReturn
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
	bcs.s	R4PaletteCycleWriteFrame
	moveq	#0,d0

R4PaletteCycleWriteFrame:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	(a1,d0.w),(a5)
	move.b	1(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	move.w	(a2,d0.w),(a3)

R4PaletteCycleReturn:
	adda.w	#1,a4
	adda.w	#1,a5
	rts

; ------------------------------------------------------------------------------

; Timing records: palette offset, entry count, then delay/index pairs.
; Color tables contain the word values selected by each timing index.
R4PaletteCycleGroup1Timing:
	dc.b	$32, 3
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 2

R4PaletteCycleGroup2Timing:
	dc.b	$33, 3
	dc.b	2, 1
	dc.b	2, 2
	dc.b	2, 0

R4PaletteCycleGroup3Timing:
	dc.b	$34, 3
	dc.b	2, 2
	dc.b	2, 0
	dc.b	2, 1

R4PaletteCycleColors:
	dc.w	$CC0
	dc.w	$EE0
	dc.w	$EE4

; ------------------------------------------------------------------------------
