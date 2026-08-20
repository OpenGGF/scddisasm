; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present palette data
; -------------------------------------------------------------------------

PaletteTable:
	dc.l	Pal_S1SegaBG
	dc.w	palette
	dc.w	$1F
	dc.l	Pal_S1Title
	dc.w	palette
	dc.w	$1F
	dc.l	Pal_S1LevSel
	dc.w	palette
	dc.w	$1F
	dc.l	Pal_Sonic
	dc.w	palette
	dc.w	7
	dc.l	Pal_Level
	dc.w	palette+$20
	dc.w	$17
	dc.l	Pal_LevelEnd
	dc.w	palette+$20
	dc.w	$17

Pal_S1SegaBG:

Pal_S1Title:
	incbin	"Level/_Data/Palette (Sonic 1 Title).bin"
	even

Pal_S1LevSel:
	incbin	"Level/_Data/Palette (Sonic 1 Level Select).bin"
	even

Pal_Sonic:
	incbin	"Level/_Objects/Sonic/Data/Palette.bin"
	even

; R31A's recovered final palette. The second copy is used by the level-end
; fade after the stage palette has been cycled.
Pal_Level:
Pal_LevelEnd:
	dc.b	6, $66
	dcb.b	2, 0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0, $E, 8, 4
	dc.b	6, $EE, $A, $6E, 8, $4E, 8, $2C, 4, 6, 2, 4, 0, $E2, 0, $A0
	dc.b	0, $40
	dcb.b	2, 0
	dc.b	$E, $EE, $E, $A0, $E
	dcb.b	2, 4
	dc.b	$A, 0, $AE, 8, 4, 0, $EE, 0, $6E, 0, $4A, 0, $28, 0, 2, 0
	dc.b	$6E, 8, $C
	dcb.b	2, 8
	dc.b	0, $E
	dcb.b	2, 0
	dc.b	8, $80, 0, $EE
	dcb.b	2, $E
	dcb.b	3, 0
	dc.b	$E0
	even
