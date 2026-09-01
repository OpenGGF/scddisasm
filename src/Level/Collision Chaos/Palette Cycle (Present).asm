; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Present palette cycle
; -------------------------------------------------------------------------

	if CC_VARIANT<>0
	include	"Level/Collision Chaos/Palette Cycle (Act 1 Variant).asm"
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
	bsr.s	CycleColor
	lea	CCPalCycleScript3,a1
	lea	CCPalCycleColors3,a2
	bsr.s	CycleColor
	lea	CCPalCycleScript4,a1
	lea	CCPalCycleColors4,a2
	; The fourth cycle falls through to CycleColor. This matches the original
	; routine while avoiding one redundant call and return pair.

; -------------------------------------------------------------------------

	include	"Level/Palette Cycle Script.asm"

; -------------------------------------------------------------------------

CCPalCycleScript1:
	dc.b	$2F, 3
	dc.b	1, 0
	dc.b	1, 1
	dc.b	2, 2

CCPalCycleColors1:
	dc.w	$EE, $E, 0

; -------------------------------------------------------------------------

CCPalCycleScript2:
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
	dc.b	8, 1

CCPalCycleColors2:
	dc.w	$EE, 0

; -------------------------------------------------------------------------

CCPalCycleScript3:
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

CCPalCycleColors3:
	dc.w	0, $E0E, $EAE

; -------------------------------------------------------------------------

CCPalCycleScript4:
	dc.b	$3F, 2
	dc.b	1, 0
	dc.b	2, 1

CCPalCycleColors4:
	dc.w	$EE0, 0

; -------------------------------------------------------------------------

	endif
