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
	dc.l	Pal_2006AC
	dc.w	$FB20
	dc.w	7

S1TitlePalette:
	dcb.b	4,0
	dc.b	$A, $40, $C, $60, $C, $80, $E, $A2, $E, $EE, 8, $C4, 6, $A2
	dc.b	2, $60, 6, $C8, 2, $84, 0, $28, 0, 2, 0, $20, 0, $EE
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,0
	dc.b	$E, $E4
	dcb.b	2,0
	dc.b	8, $EA, 0, $80, 2, $A0, 0, $40, 2, $E0, 4, $60, 8, $A0, $C
	dc.b	$C0, 2, 0, 6, $40, $A, $60, $C, $A2, $C, $C4
	dcb.b	2,0
	dc.b	$A, $C8, 4, $86, 8, $88, 8, $AA, 0, $20, 0, $60, 0, $C0, 0
	dc.b	$20, 2, $60, 6, $A2
	dcb.b	2,0
	dc.b	2, 0, 2, $20, 4, $42, 8, $86

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
	dcb.b	2,0
	dc.b	4, $CE, 0, $60, 0, $80, 6, $CC, 0, $E0, 8, $40, $C, $82, $E
	dc.b	$C8
	dcb.b	2,2
	dc.b	4, 8, $A, $2C, $C, $6E, $E, $AE
	dcb.b	2,0
	dc.b	$C, $CC, $C, $82, $E, $A6, $E, $CA, 0, $40, 0, $80, 0, $E0
	dc.b	2, $20, 6, $62, $A, $A6, 8, 0, 2, 0, 6, $24, 8, $46, $C, $8A

Pal_2006AC:
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E

; ------------------------------------------------------------------------------