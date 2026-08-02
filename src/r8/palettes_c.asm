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
	dc.l	Pal_200796
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_2007F6
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_200876
	dc.w	$FBA0
	dc.w	7
	dc.l	Pal_200856
	dc.w	$FB20
	dc.w	7
	dc.l	Pal_200856
	dc.w	$FB20
	dc.w	7
	dc.l	0
	dc.w	0
	dc.w	$FFFF
	dc.l	Pal_200896
	dc.w	$FB20
	dc.w	7

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
	dc.b	$C, 0, $E, $40, $C, $80, $A, $AA, $E, $EE, 8, $88, 4, $44
	dc.b	4, $60, 6, $A0, 0, $6C, 0, $EE, 0, $88, 0, $44, 0, $E
	dcb.b	2,0
	dc.b	4, $22
	dcb.b	3,0
	dc.b	$80, 0, $E0, 0, $40, $E, $E6, $C, $A0, $A, $60, 0, 6, 0, $4A
	dc.b	0, $AE, $A, $64, $E, $A6, $E, $CA, $E, $EE
	dcb.b	3,0
	dc.b	$EE, 2, 4, 6, 8, $C, $E, $C, $8E, $E, $EE, 0, $40, 0, $80
	dc.b	0, $E0, 4, 0, 8, $22, $C, $40, $E, $82, $E, $A6, $E, $E8

Pal_200796:
	dcb.b	4,0
	dc.b	$C, 0, $E, $40, $C, $80, $A, $AA, $E, $EE, 8, $88, 4, $44
	dc.b	4, $60, 6, $A0, 0, $6C, 0, $EE, 0, $88, 0, $44, 0, $E, $A
	dc.b	2, 4, $22
	dcb.b	3,0
	dc.b	$80, 0, $E0, 0, $40, $E, $E6, $C, $A0, $A, $60, 0, 6, 0, $4A
	dc.b	0, $AE, $A, $64, $E, $A6, $E, $CA, $E, $EE, $A
	dcb.b	2,2
	dc.b	0, $E, $88, $A, $AC
	dcb.b	2,0
	dc.b	2, $42, 0, $62, 0, $A2, $E, $CC, 8, $44, 8, $84, $A, $C6
	dc.b	8, $20, $C, $26, $E, $48, 6, 0

Pal_2007F6:
	dcb.b	4,0
	dc.b	$C, 0, $E, $40, $C, $80, $A, $AA, $E, $EE, 8, $88, 4, $44
	dc.b	4, $60, 6, $A0, 0, $6C, 0, $EE, 0, $88, 0, $44, 0, $E, $A
	dc.b	2, 4, $22
	dcb.b	3,0
	dc.b	$80, 0, $E0, 0, $40, $E, $E6, $C, $A0, $A, $60, 0, 6, 0, $4A
	dc.b	0, $AE, $A, $64, $E, $A6, $E, $CA, $E, $EE, $A
	dcb.b	2,2
	dc.b	0, $E, $88, $A, $AC, 0, $22, 2, $42, 0, $62, 0, $A2, $E, $CC
	dc.b	8, $64, 8, $A4, $A, $E8, 8, $22, $C, $26, $E, $48, 6, 0

Pal_200856:
	dcb.b	$1F,0
	dc.b	$E

Pal_200876:
	dc.b	2, $EE
	dcb.b	2,0
	dc.b	$A, $86, 4, $20, 6, $42, 8, $64, $E, $EE, $C, $A8
	dcb.b	9,0
	dc.b	$EE, 0, $88
	dcb.b	3,0
	dc.b	$E

Pal_200896:
	dc.b	$C, $66
	dcb.b	2,0
	dc.b	6, $28, 8, $4A, $E, $6E, $E, $8E, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 0, $6C, 0, $C2, 0, $80, 8, 6, 0, $E

; ------------------------------------------------------------------------------