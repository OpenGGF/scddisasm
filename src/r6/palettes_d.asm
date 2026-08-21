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
	dc.l	Pal_200738
	dc.w	$FB20
	dc.w	$17
	dc.l	Pal_200798
	dc.w	$FB20
	dc.w	7

PlayerPalette:
	dcb.b	4,0
	dc.b	8, $22, $A, $44, $C, $66, $E, $88, $E, $EE, $A, $AA, 8, $88
	dc.b	4, $44, 8, $AE, 4, $6A, 0, $E, 0, 8, 0, 4, 0, $EE

StagePalette:
	dcb.b	5,0
	dc.b	4, 0, $48, 0, $8E, $A, $AA, $E, $EE, 8, $88, 4, $44, 0, $60
	dc.b	0, $80, 2, $C6, 0, $EE, 0, $88, 0, $44, 0, $E
	dcb.b	2,0
	dc.b	$A, $CA, 4, $64
	dcb.b	2,0
	dc.b	$E, $EE, 6, $8C, 0, $CE, 0, $E, 8, $CE, 0, $6E, 0, $2A, 0
	dc.b	4
	dcb.b	3,0
	dc.b	$22, 2, $46, 2, $6A
	dcb.b	2,0
	dcb.b	2,4
	dc.b	$E, $44
	dcb.b	2,$E
	dc.b	4, $EE, 8, $26, 6
	dcb.b	2,4
	dc.b	2, 8, $28, $A, $6A, $A, $CE
	dcb.b	2,0
	dc.b	2, $20, 2, $44, 0, $86, 2, $AE
	dc.b	8
	dc.b	$68
	dc.b	$A
	dc.b	$8A
	dc.b	$A
	dc.b	$CE
	dc.b	0
	dc.b	0
	dc.b	2
	dc.b	$22
	dc.b	2
	dc.b	$44
	dc.b	4
	dc.b	$68
	dc.b	6
	dc.b	$8E

Pal_200738:
	dcb.b	4,0
	dc.b	4, $44, 8, $88, $E, $40, 8, 0, $E, $EE, $E, $64, 0, 6, $E
	dc.b	$8E, 0, $8E, $A, $4E, 0, $EE, 0, $88, 0, $44, 0, $2E
	dcb.b	2,0
	dc.b	$A, $CA, 4, $64
	dcb.b	2,0
	dc.b	$E, $EE, 6, $8C, 0, $CE, 0, $E, 8, $CE, 0, $6E, 0, $2A, 0
	dc.b	4
	dcb.b	3,0
	dc.b	$22, 2, $46, 2, $6A
	dcb.b	2,0
	dcb.b	2,4
	dc.b	$E, $44
	dcb.b	2,$E
	dc.b	4, $EE, 8, $26, 6
	dcb.b	2,4
	dc.b	2, 8, $28, $A, $6A, $A, $CE
	dcb.b	2,0
	dc.b	2, $20, 2, $44, 0, $86, 2, $AE

Pal_200798:
	dc.b	6, $EE
	dcb.b	3,0
	dc.b	$6E, 6, $E, 8, $66, $A, $AA, $E, $EE, $A, $A8, 8, $86, 6
	dc.b	$64, 4, $42, 2, $20, 0, $EE, 0, $88, 0, $44, 0, $E

; ------------------------------------------------------------------------------
