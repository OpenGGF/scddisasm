; ------------------------------------------------------------------------------

PaletteTable:
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	S1TitlePalette
	dc.w	$FB00
	dc.w	$1F
	dc.l	PlayerPalette
	dc.w	$FB00
	dc.w	7
	dc.l	StagePalette
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_200790
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_2007F0
	dc.w	$FB20
	dc.w	7

S1TitlePalette:
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
	dc.b	4, 0, $48, 0, $8E, $A, $AA, $E, $EE, 8, $88, 4, $44, 0, $60
	dc.b	0, $80, 2, $C6, 0, $EE, 0, $88, 0, $44, 0, $E
	dcb.b	3,0
	dc.b	$EE, 0, $C0, 0, $40, 0, $AE, $C, 4, 0, $C0, 0, $E, $C, $EE
	dc.b	$E, $E6, $E, $A0, $E, $20, 4, 0, $E, $26, $E, $8E, $C, $CE
	dcb.b	2,0
	dc.b	$C, $28, 2, $20, 2, $20, 2, $20, 4, $EC, $E, $EE, 2, $40
	dc.b	6, $A0, $A, $E0, $E, $E0, 2, 0, 6, 2, $A, 4, $A, $62, $E
	dc.b	$80

Pal_200790:
	dcb.b	4,0
	dc.b	4, $44, 8, $88, $E, $40, 8, 0, $E, $EE, $E, $64, 0, 6, $E
	dc.b	$8E, 0, $8E, $A, $4E, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	3,0
	dc.b	$EE, 0, $C0, 0, $40, 0, $AE, $C, 4, 0, $C0, 0, $E, $C, $EE
	dc.b	$E, $E6, $E, $A0, $E, $20, 4, 0, $E, $26, $E, $8E, $C, $CE
	dcb.b	2,0
	dc.b	$C, $28, 2, $20, 2, $20, 2, $20, 4, $EC, $E, $EE, 2, $40
	dc.b	6, $A0, $A, $E0, $E, $E0, 2, 0, 6, 2, $A, 4, $A, $62, $E
	dc.b	$80

Pal_2007F0:
	dcb.b	5,0
	dc.b	$6E, 6, $E, 8, $66, $A, $AA, $E, $EE, $C, $8A, $A, $68, 8
	dc.b	$46, 6, $24, 4, 2, 0, $EE, 0, $88, 0, $44, 0, $E

; ------------------------------------------------------------------------------
