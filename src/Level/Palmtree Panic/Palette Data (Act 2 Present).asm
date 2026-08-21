; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Present palette data
; -------------------------------------------------------------------------

PaletteTable:
	dc.l	Pal_S1SegaBG			; Sonic 1 SEGA screen background (leftover)
	dc.w	palette
	dc.w	$1F
	dc.l	Pal_S1Title			; Sonic 1 title screen (leftover)
	dc.w	palette
	dc.w	$1F
	dc.l	Pal_S1LevSel			; Sonic 1 level select screen (leftover)
	dc.w	palette
	dc.w	$1F
	dc.l	Pal_Sonic			; Sonic
	dc.w	palette
	dc.w	7
	dc.l	Pal_LevelProto			; Level (prototype)
	dc.w	palette+$20
	dc.w	$17
	dc.l	Pal_Level			; Level
	dc.w	palette+$20
	dc.w	$17

; -------------------------------------------------------------------------

; Sonic 1 SEGA screen background (leftover, data completely removed)
Pal_S1SegaBG:

; Sonic 1 title screen (leftover)
Pal_S1Title:
	incbin	"Level/_Data/Palette (Sonic 1 Title).bin"
	even

; Sonic 1 level select screen (leftover)
Pal_S1LevSel:
	incbin	"Level/_Data/Palette (Sonic 1 Level Select).bin"
	even

; Sonic palette
Pal_Sonic:
	incbin	"Level/_Objects/Sonic/Data/Palette.bin"
	even

; R12A level palette (prototype)
Pal_LevelProto:
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, $E, $8E, $A, $4E, 0, $EE, 0, $88, 0, $44, 0, $2E, $A
	dc.b	$22, 8, $EE
	dcb.b	2,$E
	dc.b	0, 2, 0, $AE
	dcb.b	3,0
	dc.b	$4A, 0, $26, 2, $E8, 0, $A0, 0, $60, 0, $40, $E, $CA, $E
	dc.b	$A8, $C, $60, $E, $86, $A, $22, $E, $66, $E, $88, $E, $CC
	dc.b	$E, $EE, $E, $CC, $E, $CA, $E, $EE, $E, $A8, 0, $60, 0, $A4
	dc.b	0, $E8, 4
	dcb.b	2,2
	dc.b	$26, 0, $6A, 0, $AE
	even

; R12A level palette
Pal_Level:
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, $E, $8E, $A, $4E, 0, $EE, 0, $88, 0, $44, 0, $2E, $A
	dc.b	0, 8, $EE, 8, $E, 0, 4, 0, $8E
	dcb.b	3,0
	dc.b	$4C, 0, $26, 2, $E8, 0, $A0, 0, $60, 0, $40, $E, $CA, $E
	dc.b	$A8, $C, $60, $E, $86, $A, 0, $E, $EE, $E, $EA, $C, $C6, $E
	dc.b	$64, 0, $EE, 0, $8E, 0, $6A, 0, $24
	dcb.b	2,0
	dc.b	$E, $EC, $E, $C8, $E, $86, 0, $42, 0, $A6, 0, $64
	even
