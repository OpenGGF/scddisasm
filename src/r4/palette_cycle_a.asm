; ------------------------------------------------------------------------------

; Act 1 palette cycles switch between the upper-screen and standard groups.
CyclePalette:
	tst.b	act
	bne.s	R4PaletteCycleStandardPath
	cmpi.w	#$280,scroll_fg_x
	bcc.s	R4PaletteCycleStandardPath
	cmpi.w	#$160,scroll_fg_y
	bcs.s	R4PaletteCycleAct1UpperScreen
	bset	#7,palette_cycle_timers+4
	bne.s	R4PaletteCycleStandardPath
	moveq	#4,d0
	bsr.w	LoadPalette

R4PaletteCycleStandardPath:
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
	bsr.w	CycleColor
	lea	R4PaletteCycleGroup4Timing,a1
	lea	R4PaletteCycleColors,a2
	bra.w	CycleColor

; ------------------------------------------------------------------------------

R4PaletteCycleAct1UpperScreen:
	lea	palette_cycle_timers,a5
	lea	palette_cycle_steps,a4
	lea	R4PaletteCycleAct1UpperGroup1Timing,a1
	lea	R4PaletteCycleAct1UpperGroup1Colors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleAct1UpperGroup2Timing,a1
	lea	R4PaletteCycleAct1UpperGroup2Colors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleAct1UpperGroup3Timing,a1
	lea	R4PaletteCycleAct1UpperGroup3Colors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleAct1UpperGroup4Timing,a1
	lea	R4PaletteCycleAct1UpperGroup4Colors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleAct1UpperGroup5Timing,a1
	lea	R4PaletteCycleAct1UpperGroup5Colors,a2
	bsr.w	CycleColor
	lea	R4PaletteCycleAct1UpperGroup6Timing,a1
	lea	R4PaletteCycleAct1UpperGroup6Colors,a2

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
R4PaletteCycleAct1UpperGroup1Timing:
	dc.b	$20, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 3
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

R4PaletteCycleAct1UpperGroup1Colors:
	dc.w	2
	dc.w	$4A
	dc.w	$28
	dc.w	4

R4PaletteCycleAct1UpperGroup2Timing:
	dc.b	$32, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 4
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

R4PaletteCycleAct1UpperGroup2Colors:
	dc.w	$A80
	dc.w	$A4E
	dc.w	$E8C
	dc.w	$A48
	dc.w	$A60

R4PaletteCycleAct1UpperGroup3Timing:
	dc.b	$33, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 3
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

R4PaletteCycleAct1UpperGroup3Colors:
	dc.w	$620
	dc.w	$408
	dc.w	$A48
	dc.w	$624

R4PaletteCycleAct1UpperGroup4Timing:
	dc.b	$34, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 2
	dc.b	8, 3
	dc.b	8, 4
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

R4PaletteCycleAct1UpperGroup4Colors:
	dc.w	$A60
	dc.w	$82C
	dc.w	$C6A
	dc.w	$826
	dc.w	$842

R4PaletteCycleAct1UpperGroup5Timing:
	dc.b	$39, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 1
	dc.b	8, 0
	dc.b	8, 0
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

R4PaletteCycleAct1UpperGroup5Colors:
	dc.w	$64C
	dc.w	$66C

R4PaletteCycleAct1UpperGroup6Timing:
	dc.b	$3A, 8
	dc.b	$3C, 0
	dc.b	8, 1
	dc.b	8, 1
	dc.b	8, 0
	dc.b	8, 0
	dc.b	8, 0
	dc.b	6, 0
	dc.b	6, 0

R4PaletteCycleAct1UpperGroup6Colors:
	dc.w	$408
	dc.w	$42A

R4PaletteCycleGroup1Timing:
	dc.b	$31, 4
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 2
	dc.b	2, 3

R4PaletteCycleGroup2Timing:
	dc.b	$32, 4
	dc.b	2, 1
	dc.b	2, 2
	dc.b	2, 3
	dc.b	2, 0

R4PaletteCycleGroup3Timing:
	dc.b	$33, 4
	dc.b	2, 2
	dc.b	2, 3
	dc.b	2, 0
	dc.b	2, 1

R4PaletteCycleGroup4Timing:
	dc.b	$34, 4
	dc.b	2, 3
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 2

R4PaletteCycleColors:
	dc.w	$EEE
	dc.w	$ECA
	dc.w	$EA8
	dc.w	$E86

; ------------------------------------------------------------------------------
