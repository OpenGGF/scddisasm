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
	dcb.b	3,0
	dc.b	$24, 8, $20, $A, $40, $C, $62, $C, $84, $E, $EE, 8, $8A, 6
	dc.b	$68, 2, $24, 6, $8C, 2, $48, 2, $4E, 2, 8, 0, 4, 0, $EE
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,0
	dc.b	$A, $A8
	dcb.b	2,0
	dc.b	$A, $A0, 0, 2, 0, $26, 0, $6A, 2, 0, 2, $20, 6, $40, 8, $64
	dcb.b	3,0
	dc.b	$20, 0, $42, 0, $88, 2, $AA
	dcb.b	2,0
	dc.b	$C, $EA, $C, $C0, $E, $E0, $E, $E4
	dcb.b	6,0
	dc.b	2, $A0, 0, $20, 4, $8C
	dcb.b	3,0
	dc.b	2, 0, $24, 0, $4A, 0, $8C

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
	dc.b	$E, $E0, 0, $24, 0, $6C, 2, $AE, 2, 0, 6, $22, $A, $66, $E
	dc.b	$AA, 0, $22, 0, $40, 0, $82, 2, $C6, 6, $EE
	dcb.b	4,0
	dc.b	$C, $C0, $E, $E0, $E, $E4
	dcb.b	9,0
	dc.b	$60, $A, $CE, 0, $22, 0, $44, 0, $66, 2, $8C, 4, $CE

; ------------------------------------------------------------------------------