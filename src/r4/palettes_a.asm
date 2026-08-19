; ------------------------------------------------------------------------------

PaletteTable:
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	PlayerPalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	PlayerPalette
	dc.w	$FB00
	dc.w	7
	dc.l	StagePalette
	dc.w	$FB20
	dc.w	$17

S1TitlePalette:
	dcb.b	2,0
	dc.b	2, $22, $E, $60, $E, $82, $E, $A4, $E, $C6, $E, $EE, $A, $AA
	dc.b	8, $88, 4, $44, $A, $EC, 6, $A8, 4, $6C, 0, $48, 0, 4, 0
	dc.b	$EE
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,2
	dc.b	$E, $EE, 2, 0, $E, $E2, 6, 4, $A, 6, $E, $6A, 0, $20, 2, $80
	dc.b	4, $C0, 6, $EA, 0, $22, 0, $66, 0, $AA, 6, $EE, 8, $EE
	dcb.b	2,0
	dc.b	$E, $EE, $E, $CA, $E, $A8, $E, $86
	dcb.b	2,0
	dc.b	8, $A0, 6, $46, $A, $8A, $E, $EE, 2, $40, 2
	dcb.b	2,0
	dc.b	$20, 2, $40, 4, $60, 6, $80

PlayerPalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE

StagePalette:
	dcb.b	4,0
	dc.b	8, 0, $E, $40, $E, $64, 0, 6, $E, $EE, 0, $8E, 8, $88, 4
	dc.b	$44, 8, $E0, 4, $80, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,2
	dc.b	$E, $EC
	dcb.b	2,0
	dc.b	$E, $E0, 2, 4, 6, $A, $E, $4E, 2, 0, $A, $24, $E, $84, $E
	dc.b	$C8, 0, $26, 0, $48, 0, $8C, 0, $AE, 0, $EE
	dcb.b	2,2
	dc.b	$A, $CE, 0, $8E, 0, $28, 0, 4
	dcb.b	2,0
	dc.b	$E, $EE, 0, $EE, 0, $8E, 6, $A, 2, 4, 0, 2
	dcb.b	3,0
	dc.b	2, 4, $46, 6, $68

; ------------------------------------------------------------------------------
