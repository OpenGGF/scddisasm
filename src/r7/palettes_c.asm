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
	dc.l	Pal_200798
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_2007F8
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
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, $A, $CA, 0, $88, 6
	dc.b	$66, 6, $46, 6, $26, 6, 4
	dcb.b	2,0
	dc.b	6, $20, 4
	dcb.b	6,0
	dc.b	$20, 0, $60, 0, $8C, 0, $E, 0, $CE, $A, $CA, $A, $AA, $A
	dc.b	$C8, $C, $EA, $C, $E6, $E, $6C, $E, $AE, $E, $CE, 6, $EE
	dc.b	$E, $EE, 6, $EE, 8, $6E, 6, $EE, $E, $EE, $E, $CE, $C, $8E

S1LevelSelectPalette:
	if STAGE_ACT<>1
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
	endif

PlayerPalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE

StagePalette:
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 0, $20, 0, $EE, $E
	dc.b	$EE, $E, $AE, $C, $8C, $C, $6A, 4, $46, $E, $68, $A, $26
	dc.b	2, $22, 2, $40, 6, $82, 2, $C6, 0, $8C, 0, $E, 0, $CE, 2
	dc.b	$20, 2, $2E, 2, $40, 4, $60, 6, $A0, 8, 6, $C, 8, $C, $4E
	dc.b	0, $EE, $C, $CC, 0, $8E, 2, $E, 0, $EE, $C, $AE, 8, $6E, 6
	dc.b	$2E

Pal_200798:
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 0, $20, 0, $EE, $E
	dc.b	$EE, $E, $AE, $C, $8C, $C, $6A, 4, $46, $E, $68, $A, $26
	dc.b	2, $22, 2, $40, 6, $82, 2, $C6, 0, $8C, 0, $E, 0, $CE, 2
	dc.b	$20, 2, $2E, 2, $40, 4, $60, 6, $A0, 8, 6, $C, 8, $C, $4E
	dc.b	0, $EE, $C, $CC, 0, $8E, 2, $E, 0, $EE, $C, $AE, 8, $6E, 6
	dc.b	$2E

Pal_2007F8:
	dc.b	2, $22, 8, $E, 0, $6E, 0, $EE, $E, $EE, 0, $E0

; ------------------------------------------------------------------------------
