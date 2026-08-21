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
	dc.l	Pal_2006EA
	dc.w	$FB20
	dc.w	7
	dc.l	Pal_20070A
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

Pal_2006EA:
	dcb.b	4,0
	dc.b	$E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E
	dc.b	$EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE, $E, $EE
	dc.b	$E, $EE

Pal_20070A:
	dcb.b	4,0
	dc.b	2, $22, 4, $44, 6, $66, 8, $88, $A, $AA, $C, $CC, $E, $EE
	dc.b	$E, $AC, $A, $68, 8, $46, 0, $EE, 0, $88, 0, $44, 0, $E

; ------------------------------------------------------------------------------
