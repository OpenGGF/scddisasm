; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Tidal Tempest Act 1 time-variant palette data
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
	if TT_VARIANT=0
	dc.l	Pal_Level
	dc.w	palette+$20
	dc.w	$17
	dc.l	Pal_LevelEnd
	dc.w	palette+$20
	dc.w	$17
	elseif TT_VARIANT=1
	dc.l	Pal_Level
	dc.w	palette+$20
	dc.w	$17
	elseif TT_VARIANT=2
	dc.l	Pal_LevelAlt1
	dc.w	palette+$20
	dc.w	7
	dc.l	Pal_LevelAlt2
	dc.w	palette+$20
	dc.w	7
	dc.l	Pal_LevelAlt3
	dc.w	palette+$20
	dc.w	7
	dc.l	Pal_Level
	dc.w	palette+$20
	dc.w	$17
	else
	dc.l	Pal_Level
	dc.w	palette+$20
	dc.w	$17
	dc.l	Pal_LevelAlt1
	dc.w	palette+$20
	dc.w	7
	dc.l	Pal_LevelAlt2
	dc.w	palette+$20
	dc.w	7
	endif

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

	if TT_VARIANT=0

Pal_Level:
	dc.b	6, $66
	dcb.b	2,0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0, $E, 8, 4
	dc.b	6, $EE, $A, $6E, 8, $4E, 8, $2C, 4, 6, 2, 4, 0, $E2, 0, $A0
	dc.b	0, $40
	dcb.b	2,0
	dc.b	$E, $EE, $E, $A0, $E
	dcb.b	2,4
	dc.b	$A, 0, $AE, 8, 4, 0, $EE, 0, $6E, 0, $4A, 0, $28, 0, 2, 0
	dc.b	$6E, 8, $C
	dcb.b	2,8
	dc.b	0, $E
	dcb.b	2,0
	dc.b	8, $80, 0, $EE
	dcb.b	2,$E
	dcb.b	3,0
	dc.b	$E0

Pal_LevelEnd:
	dc.b	6, $66
	dcb.b	2,0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0, $E, 8, 4
	dc.b	6, $EE, $A, $6E, 8, $4E, 8, $2C, 4, 6, 2, 4, 0, $E0, 0, $A0
	dc.b	0, $40
	dcb.b	2,0
	dc.b	$E, $EE, $E, $A0, $E
	dcb.b	2,4
	dc.b	$A, 0, $AE, 8, 4, 0, $EE, 0, $6E, 0, $4A, 0, $28, 0, 2, 0
	dc.b	$6E, 8, $C
	dcb.b	2,8
	dc.b	0, $E
	dcb.b	2,0
	dc.b	8, $80, 0, $EE
	dcb.b	2,$E
	dcb.b	3,0
	dc.b	$E0

	elseif TT_VARIANT=1

Pal_Level:
	dc.b	6, $66
	dcb.b	2,0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, $6C
	dc.b	$A, $EE, 2, $CE, 2, $8C, 0, $48, 0, 4, 0, 2, 4, $E0, 0, $80
	dc.b	0, $40
	dcb.b	3,0
	dc.b	$EE, $C, $E, 2, 6, 0, $A, $E
	dcb.b	2,2
	dc.b	$6C, 4, $EE, 2, $A4, 6, $60, 4, $40, 4, 0, 8, $EE, 0, $CE
	dc.b	2, $8E, 0, $E0, 6, $4C, 6, 8, 2, $20
	dcb.b	2,$E
	dcb.b	2,8
	dc.b	$E, $EE

	elseif TT_VARIANT=2

Pal_LevelAlt1:
	dc.b	6, $66
	dcb.b	2,0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0
	dcb.b	2,$E
	dc.b	0, 8, $EE, $A, $E0, 8, $A0, 6, $60, 6, 0, 2
	dcb.b	2,0
	dc.b	$EA, 0, $C0, 0, $60
	dcb.b	2,0
	dc.b	$E, $4C
	dcb.b	2,$E
	dc.b	$C
	dcb.b	2,8
	dc.b	4, $A, 0, $E
	dcb.b	2,0
	dc.b	$E8, 0, $C0, 0, $60, 0, $40, 6, 0, $E, $EE, $E, $A0, $E, $20
	dc.b	0, $AE, 0, $4E
	dcb.b	5,0
	dc.b	$AE, 0, $20, 4, $86

Pal_LevelAlt2:
	dcb.b	4,0
	dc.b	$E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E
	dc.b	$EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE
	dc.b	$E, $EE

Pal_LevelAlt3:
	dcb.b	4,0
	dc.b	2, $22, 4, $44, 6, $66, 8, $88, $A, $AA, $C, $CC, $E, $EE
	dc.b	$E, $AC, $A, $68, 8, $46, 0, $EE, 0, $88, 0, $44, 0, $E

Pal_Level:
	dc.b	6, $66
	dcb.b	2,0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0
	dcb.b	2,$E
	dc.b	0, 8, $EE, $A, $E0, 8, $A0, 6, $60, 6, 0, 2
	dcb.b	2,0
	dc.b	$EA, 0, $C0, 0, $60
	dcb.b	2,0
	dc.b	$E, $4C
	dcb.b	2,$E
	dc.b	$C
	dcb.b	2,8
	dc.b	4, $A, 0, $E
	dcb.b	2,0
	dc.b	$E8, 0, $C0, 0, $60, 0, $40, 6, 0, $E, $EE, $E, $A0, $E, $20
	dc.b	0, $AE, 0, $4E
	dcb.b	5,0
	dc.b	$AE, 0, $20
	dcb.b	2,0

	else

Pal_Level:
	dc.b	6, $66
	dcb.b	2,0
	dc.b	$E, $42, $E, $86, 0, $60, 0, $A0, $E, $EE, 8, $88, 4, $44
	dc.b	$C, $20, 0, 6, 0, $6E, 0, $EE, 0, $88, 0, $44, 0, $E, 0, $22
	dc.b	$C, $EA, 6, $88, 4, $64, 2, $44, 0, 2
	dcb.b	3,0
	dc.b	$CE, 0, $4E, 0, 8, $E, $E0, 8, $EE, 0, $A2, 4, $42, 4, 2
	dcb.b	2,4
	dc.b	0, $22, 0, $AE, 0, $44, 6, $EE, 6, 2
	dcb.b	3,0
	dc.b	$4E, 0, 8, 0, 4, 0, $E0, 0, $40
	dcb.b	2,$E
	dc.b	$A, 4, 0, $AE, 2, 0, 2, $EE

Pal_LevelAlt1:
	dcb.b	4,0
	dc.b	$E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E
	dc.b	$EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE
	dc.b	$E, $EE

Pal_LevelAlt2:
	dcb.b	4,0
	dc.b	2, $22, 4, $44, 6, $66, 8, $88, $A, $AA, $C, $CC, $E, $EE
	dc.b	$E, $AC, $A, $68, 8, $46, 0, $EE, 0, $88, 0, $44, 0, $E

	endif

	even
