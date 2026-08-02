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
	dc.l	Pal_200724
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
	dc.b $C, 0, $E, $40, $C, $80, $A, $AA, $E, $EE, 8, $88, 4, $44
	dc.b	4, $60, 6, $A0, 0, $6C, 0, $EE, 0, $88, 0, $44, 0, $E, 8
	dc.b	$26
	dcb.b	2,2
	dc.b	4, $80, 8, $C0, $E, $E4, $E, $EE, 6, $AE, 4, $6C, 2, $2A
	dc.b	8, $E, 0, $8E, 4, $CE, 6, $46, $E, $68, $E, $C2, $E, $E6
	dc.b	8, $26, 8, $2A, 6, $4E, 2, $CE, 6, 0, $C, $20, $E, $60, 4
	dc.b	0, 6, 4, 8, $2C
	dcb.b	2,0
	dc.b	2
	dcb.b	2,0
	dc.b	2, 4
	dcb.b	2,$C
	dc.b	$C0, 0, $E0
Pal_200724:
	dcb.b	4,0
	dc.b	$C, 0, $E, $40, $C, $80, $A, $AA, $E, $EE, 8, $88, 4, $44
	dc.b	4, $60, 6, $A0, 0, $6C, 0, $EE, 0, $88, 0, $44, 0, $E, $A
	dc.b	4
	dcb.b	2,2
	dc.b	4, $80, 8, $C0, $E, $E4, $E, $EE, 6, $AE, 4, $6C, 2, $2A
	dc.b	8, $E, 0, $8E, 4, $CE, 6, $46, $E, $68, $E, $C2, $E, $E6
	dc.b	8, $26, $E, $EE, $E, $EE, 4
	dcb.b	4,0
	dc.b	$24, 0, $68, 0, $AE, 6, 0, 8, 0, $E, $40, $E, $A0, $E, 6
	dc.b	$E, $66, $E, $A8, $E, $EE

; ------------------------------------------------------------------------------