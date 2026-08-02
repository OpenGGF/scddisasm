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
	dc.l	0
	dc.w	0
	dc.w	$FFFF
	dc.l	Pal_200776
	dc.w	$FB20
	dc.w	2

S1TitlePalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, $44, 4, $EE, 8
	dc.b	$CA, 6, $A6, 2, $64, 0, $44, 0, $EE, 8, $CA, 6, $AC, 4, $68
	dc.b	2, $44, 8, $AC, 4, $68, $A, $CE, 6, $AE, 4, $6A, 2, $44, 2
	dc.b	$44, 0, $22, 6, $8A, 8, $8E, 4, $68, 6, $6C, 4, $6A, 2, $4A
	dc.b	2, $48, 8, $8C, $A, $8C, 6, $88, 4, $8A, 8, $6C, $A, $CA

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
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 0, 2, 6, $CC, $A
	dc.b	$80, 6, $40, 2, $20
	dcb.b	2,0
	dc.b	$A, $EE, 4, $8E, 0, $68, 0, $24, 0, 2, $C, $28, 4, $24, 8
	dc.b	$8C, 4, $4C, 0, 6, 0, 2, 0, 2
	dcb.b	2,0
	dcb.b	2,$E
	dcb.b	2,$A
	dcb.b	2,6
	dc.b	4, $A, 2, 8, 0, 6, 0, 4, 6, 8, $C, $6E, 4, $22, 6, $44, 6
	dcb.b	2,8
	dc.b	$A4

Pal_200776:
	dc.b	2, $22, 8, $E, 0, $6E, 0, $EE, $E, $EE, 0, $E0

; ------------------------------------------------------------------------------