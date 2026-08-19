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

; ------------------------------------------------------------------------------
