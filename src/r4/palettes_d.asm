; ------------------------------------------------------------------------------

PaletteTable:
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	S1LevelSelectPalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	PlayerPalette
	dc.w	$FB00
	dc.w	7
	dc.l	StagePalette
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_20069A
	dc.w	$FB20
	dc.w	7

S1TitlePalette:
	dcb.b	4,0
	dc.b	$A, 2, $C, 4, $E, 6, $E, $28, $E, $EE, 8, $4A, 6, $28, 2
	dc.b	4, 6, $4E, 2, $A, 0, $E, 0, 8, 0, 4, 0, $EE
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,0
	dc.b	$C, $AE
	dcb.b	2,0
	dc.b	2, $2E, 2, $8E
	dcb.b	2,0
	dc.b	2, $28, 2, $4C, 0, 4, 2, $26, 2, $4A, 2, $24, 4, $24, 8, $48
	dc.b	$A, $6A, $C, $8C
	dcb.b	4,0
	dc.b	6, 4, $A, $48, $E, $8C, 0, $82, 2, $6C, 2, $2A
	dcb.b	3,2
	dc.b	4, 2, 6, 2, $26
	dcb.b	2,0
	dc.b	2, 4, 2, 6, 2, $26

S1LevelSelectPalette:
	dcb.b	5,0
	dc.b	2, 0
	dcb.b	2,2
	dc.b	$24, 2, $24, 4, $46, 4, $46, 2, $24, 2, $24, 4, $46, 6, $68
	dc.b	2, $24, 0, 2
	dcb.b	9,0
	dcb.b	2,2
	dc.b	$24, 2, $24, 4, $46, 6, $68, 2, $24, 4, $46, 2, $24, 0
	dcb.b	2,2
	dc.b	$24, 4, $46, 2, $24
	dcb.b	2,0
	dc.b	2, $24
	dcb.b	3,0
	dc.b	$EE
	dcb.b	9,0
	dc.b	$EE
	dcb.b	$14,0
	dc.b	$E, $EC
	dcb.b	8,0
	dc.b	$E, $EC
	dcb.b	$12,0

PlayerPalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE

StagePalette:
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,0
	dc.b	$E, $EE
	dcb.b	3,0
	dc.b	$4E, 0, $CE
	dcb.b	3,0
	dc.b	$28, 0, $6C, 0, $24, 0, $46, 4, $8A, 2, 0, 6, $44, $A, $88
	dc.b	$C, $AA, $E, $CC
	dcb.b	4,0
	dc.b	$C, $6A, $C, $8C, $C, $AE, 4, $E0, 0, $EE, 0, $4E, 0, $20
	dc.b	0, $22, 0, $64, 0, $88
	dcb.b	3,0
	dc.b	2, 0, $26, 0, $48

Pal_20069A:
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E

; ------------------------------------------------------------------------------
