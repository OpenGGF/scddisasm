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
	dc.l	Pal_200736
	dc.w	$FB20
	dc.w	$17

S1TitlePalette:
	dc.b	$A, $20, 6, 0, $C, 0, $E, $44, $E, $66, $E, $88, $E, $EE
	dc.b	0, $AE, 0, $6A, 0, $26, 0, $EE, $E, $AA, 0, $C, 0, 6, 0, 2
	dcb.b	4,0
	dc.b	$C, 0, $E, $22, $E, $44, $E, $66, $E, $88, $E, $EE, $A, $AA
	dc.b	8, $88, 6, $66, 4, $44, 2, $48, 8, $AE, 6, $8C
	dcb.b	3,0
	dc.b	$E, 8
	dcb.b	2,0
	dc.b	2, $E, $EE, 0, $26, 0, $48, 0, $6C, 0, $8E, 0, $CE, $C, $42
	dc.b	$E, $86, $E, $CA, $E, $EC, 0, $40, 0, $60, 0, $A4, 0, $E8
	dc.b	$C, $82, $A, 2, $C, $42, $E, $86, $E, $CA, $E, $EC, $E, $EE
	dc.b	$E, $AC, $E, $8A, $E, $68, 0, $E8, 0, $A4, 0, 2, 0, $26, 0
	dc.b	$6C, 0, $CE

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
	dc.b	$C, $22, $E, $44, $E, $88, 6, $A, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $4E, $A, $8E, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,0
	dc.b	$E, $EE, 2, 0, 8, $66, 4, $22, 4, $EE, 4, $8E, 2, $28, 0
	dc.b	4, 2, $40, $A, $68, $E, $AC, 8, $24, $C, $E6, 8, $C4, 6, $82
	dcb.b	2,0
	dc.b	$E, $EE
	dcb.b	2,0
	dc.b	8, $2A
	dcb.b	2,6
	dcb.b	2,2
	dc.b	0, $EC, 0, $AE, 6, $6E
	dcb.b	2,0
	dc.b	$E, $A0, $A, $60, 8, $40, 6, $20, 4
	dcb.b	2,0
	dc.b	2

Pal_200736:
	dcb.b	4,0
	dc.b	$C, $22, $E, $44, $E, $88, 6, $A, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $4E, $A, $8E, 0, $EE, 0, $88, 0, $44, 0, $2E, $E
	dc.b	$40, $E, $EE, 2, 0, 8, $66, 4, $22, 4, $EE, 4, $8E, 2, $28
	dc.b	0, 4, 2, $40, $A, $68, $E, $AC, 8, $24, $C, $E6, 8, $C4, 6
	dc.b	$82, $E, $40, $E, $64, $E, $A6, $E, $CA, $E, $EC, 0, $20
	dc.b	0, $60, 0, $A0, $A, 0, $E, $40, $E, $A0
	dcb.b	2,0
	dc.b	2, 0, 2, 6, 2, $4A, 2, $8C

; ------------------------------------------------------------------------------
