; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 time-variant palette cycles
; -------------------------------------------------------------------------

	if CC_VARIANT=1

CyclePalette:
PaletteCycle:
	rts

	else

CyclePalette:
PaletteCycle:
	lea	palCycleTimers.w,a5
	lea	palCycleSteps.w,a4
	lea	CCPalCycleScript1,a1
	lea	CCPalCycleColors1,a2
	bsr.s	CycleColor
	lea	CCPalCycleScript2,a1
	lea	CCPalCycleColors2,a2
	if CC_VARIANT=3
	bsr.s	CycleColor
	lea	CCPalCycleScript3,a1
	lea	CCPalCycleColors3,a2
	endif
	; The final configured cycle falls through to CycleColor, matching the
	; original routine without a redundant call and return pair.

	include	"Level/Palette Cycle Script.asm"

; -------------------------------------------------------------------------

CCPalCycleScript1:
	if CC_VARIANT=2
	dc.b	$2C, 3
	dc.b	1, 0
	dc.b	2, 1
	dc.b	1, 2
	else
	dc.b	$2A, 3
	dc.b	2, 0
	dc.b	1, 1
	dc.b	2, 2
	endif

CCPalCycleColors1:
	if CC_VARIANT=2
	dc.w	$EEE, $E0E, 0
	else
	dc.w	$EE0, $6C0, 0
	endif

; -------------------------------------------------------------------------

CCPalCycleScript2:
	if CC_VARIANT=2
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
	else
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
	endif

CCPalCycleColors2:
	if CC_VARIANT=2
	dc.w	$AE, 0
	else
	dc.w	$E0E, $E08, $E80, $EE0, $8E0, $E0, $E8, $EE, $8EE
	endif

	if CC_VARIANT=3

; -------------------------------------------------------------------------

CCPalCycleScript3:
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

CCPalCycleColors3:
	dc.w	$EE, $AE, $8C, $6A, $48, $26, 4, 2, 0

	endif

	endif
