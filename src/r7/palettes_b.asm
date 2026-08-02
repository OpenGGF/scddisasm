; ------------------------------------------------------------------------------

PaletteTable:
	dc.l	PlayerPalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	PlayerPalette
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
	dc.l	Pal_20066A
	dc.w	$FB20
	dc.w	$17

PlayerPalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE

StagePalette:
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, 0, $A, $E8, 0
	dc.b	$C6, 0, $62, 0, $40
	dcb.b	3,0
	dc.b	8, 0, $20, 0, $AE, 6
	dcb.b	2,0
	dc.b	2, 4, $CC, 2, $46, 0, $64, $E, $AE, 0, $E, 2
	dcb.b	3,0
	dc.b	2, $20, 0, $22, 0, $44, $E, $40, $A, $EE, $E, $EE, $A, 6
	dc.b	8, $88, 0, $8E, 8, 4, 6, 2, 4, 0, 6, $EE, 0, $EE

Pal_20066A:
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, 0, $A, $E8, 0
	dc.b	$C6, 0, $62, 0, $40
	dcb.b	3,0
	dc.b	8, 0, $20, 0, $AE, 6
	dcb.b	2,0
	dc.b	2, 4, $CC, 2, $46, 0, $64, $E, $AE, 0, $E, 2
	dcb.b	3,0
	dc.b	2, $20, 0, $22, 0, $44, $E, $40, $A, $EE, $E, $EE, $A, 6
	dc.b	8, $88, 0, $8E, 8, 4, 6, 2, 4, 0, 6, $EE, 0, $EE

; ------------------------------------------------------------------------------