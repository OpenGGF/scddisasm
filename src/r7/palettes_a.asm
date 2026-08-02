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
	dc.l	Pal_2006A4
	dc.w	$FB20
	dc.w	$17

S1TitlePalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, 0, $A, $EA, 0
	dc.b	$E8, 0, $A6, 0, $62, 0, $40, 0, $6A, 0, $80, 6, $C6, 4, $E4
	dc.b	0, $42, 8, $C8, 4, $64, 2, $42, 0, $CA, $A, $C8, 2
	dcb.b	3,0
	dc.b	6, 2, $C, 6
	dcb.b	2,$A
	dc.b	$E, $40, $E, $6E, 4, 8
	dcb.b	3,$E
	dc.b	$CE, 0, $8A, 0, $44, 0, $22, 0, $EA, $E, $EE, 0, $E0

S1LevelSelectPalette:
	if STAGE_ACT=0
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
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, 0, $C, $CC, 0
	dc.b	$CC, 0, $68, 0, $24
	dcb.b	3,0
	dc.b	$E, 4, $60, 6, $A4, 0, $E0, 0, 2, 8, $88, 4, $44, 2, $22
	dc.b	0, $6C, $E, 0, 2
	dcb.b	3,0
	dc.b	6, 2, $C, 6
	dcb.b	2,$A
	dc.b	$E, $40, $E, $6E, 4, 8
	dcb.b	3,$E
	dc.b	$CE, 0, $8A, 0, $44, 0, $22, 0, $EA, $E, $EE, 0, $E0

Pal_2006A4:
	dcb.b	5,0
	dc.b	$E0, 8, $E8, $E, $40, $C, $80, $E, $EE, 8, $88, 4, $44, 8
	dc.b	$20
	dcb.b	2,8
	dc.b	$E, $8E, 0, $EE, 0, $88, 0, $44, 0, $E, 2, 0, $C, $CC, 0
	dc.b	$CC, 0, $68, 0, $24
	dcb.b	3,0
	dc.b	$E, 4, $60, 6, $A4, 0, $E0, 0, 2, 8, $88, 4, $44, 2, $22
	dc.b	0, $6C, $E, 0, 2
	dcb.b	3,0
	dc.b	6, 2, $C, 6
	dcb.b	2,$A
	dc.b	$E, $40, $E, $6E, 4, 8
	dcb.b	3,$E
	dc.b	$CE, 0, $8A, 0, $44, 0, $22, 0, $EA, $E, $EE, 0, $E0

; ------------------------------------------------------------------------------