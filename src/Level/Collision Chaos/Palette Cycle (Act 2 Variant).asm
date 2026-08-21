; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos Act 2 time-variant palette cycles
; -------------------------------------------------------------------------

	if CC2_VARIANT=1

PaletteCycle:
	rts

	else

PaletteCycle:
	lea	palCycleTimers.w,a5
	lea	palCycleSteps.w,a4
	lea	CC2PalCycleScript1,a1
	lea	CC2PalCycleColors1,a2
	bsr.w	CycleColor
	lea	CC2PalCycleScript2,a1
	lea	CC2PalCycleColors2,a2
	bsr.w	CycleColor
	if CC2_VARIANT=0
	lea	CC2PalCycleScript3,a1
	lea	CC2PalCycleColors3,a2
	bsr.w	CycleColor
	lea	CC2PalCycleScript4,a1
	lea	CC2PalCycleColors4,a2
	bsr.w	CycleColor
	elseif CC2_VARIANT=3
	lea	CC2PalCycleScript3,a1
	lea	CC2PalCycleColors3,a2
	bsr.w	CycleColor
	endif
	rts

	include	"Level/Palette Cycle Script.asm"

	if CC2_VARIANT=0

CC2PalCycleScript1:
	dc.b	$2F, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	2, 2

CC2PalCycleColors1:
	dc.w	$EE, $E, 0

CC2PalCycleScript2:
	dc.b	$3C, $10
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 0
	dc.b	2, 1
	dc.b	8, 1

CC2PalCycleColors2:
	dc.w	$EE, 0

CC2PalCycleScript3:
	dc.b	$3D, $F
	dc.b	$16, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	2, 1
	dc.b	2, 0
	dc.b	1, 2
	dc.b	2, 1
	dc.b	1, 2
	dc.b	2, 1
	dc.b	1, 2
	dc.b	2, 1

CC2PalCycleColors3:
	dc.w	0, $E0E, $EAE

CC2PalCycleScript4:
	dc.b	$3F, 2
	dc.b	1, 0
	dc.b	2, 1

CC2PalCycleColors4:
	dc.w	$EE0, 0

	elseif CC2_VARIANT=2

CC2PalCycleScript1:
	dc.b	$2C, 3
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 2

CC2PalCycleColors1:
	dc.w	$EEE, $E0E, 0

CC2PalCycleScript2:
	dc.b	$3D, $10
	dc.b	$1E, 0
	dc.b	5, 1
	dc.b	$F, 0
	dc.b	5, 1
	dc.b	1, 0
	dc.b	5, 1
	dc.b	1, 0
	dc.b	$3C, 1
	dc.b	1, 0
	dc.b	8, 1
	dc.b	1, 0
	dc.b	8, 1
	dc.b	1, 0
	dc.b	8, 1
	dc.b	1, 0
	dc.b	8, 1

CC2PalCycleColors2:
	dc.w	$AE, 0

	else

CC2PalCycleScript1:
	dc.b	$2A, 3
	dc.b	2, 0
	dc.b	1, 1
	dc.b	2, 2

CC2PalCycleColors1:
	dc.w	$EE0, $6C0, 0

CC2PalCycleScript2:
	dc.b	$3B, $11
	dc.b	9, 0
	dc.b	9, 1
	dc.b	9, 2
	dc.b	9, 3
	dc.b	9, 4
	dc.b	9, 5
	dc.b	9, 6
	dc.b	9, 7
	dc.b	9, 8
	dc.b	9, 7
	dc.b	9, 6
	dc.b	9, 5
	dc.b	9, 4
	dc.b	9, 3
	dc.b	9, 2
	dc.b	9, 1
	dc.b	9, 0

CC2PalCycleColors2:
	dc.w	$E0E, $E08, $E80, $EE0, $8E0, $E0, $E8, $EE, $8EE

CC2PalCycleScript3:
	dc.b	$3D, $10
	dc.b	$C, 0
	dc.b	9, 1
	dc.b	9, 2
	dc.b	9, 3
	dc.b	9, 4
	dc.b	9, 5
	dc.b	9, 6
	dc.b	9, 7
	dc.b	9, 8
	dc.b	9, 7
	dc.b	9, 6
	dc.b	9, 5
	dc.b	9, 4
	dc.b	9, 3
	dc.b	9, 2
	dc.b	9, 1

CC2PalCycleColors3:
	dc.w	$EE, $AE, $8C, $6A, $48, $26, 4, 2, 0

	endif
	endif
