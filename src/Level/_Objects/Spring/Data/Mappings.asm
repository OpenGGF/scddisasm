MapSpr_Spring1:
	dc.w	SpringMap_Vertical0-MapSpr_Spring1
	dc.w	SpringMap_Vertical1-MapSpr_Spring1
	dc.w	SpringMap_Vertical2-MapSpr_Spring1

MapSpr_Spring2:
	dc.w	SpringMap_Horizontal0-MapSpr_Spring2
	dc.w	SpringMap_Horizontal1-MapSpr_Spring2
	dc.w	SpringMap_Horizontal2-MapSpr_Spring2

SpringMap_Vertical0:
	dc.b	2
	dc.b	$F8, $C, 0, 0, $F0
	dc.b	0, $C, 0, 4, $F0
	even

SpringMap_Vertical1:
	dc.b	1
	dc.b	0, $C, 0, 0, $F0
	even

SpringMap_Vertical2:
	dc.b	3
	dc.b	$E0, $C, 0, 0, $F0
	dc.b	$E8, 6, 0, 8, $F8
	dc.b	0, $C, 0, $E, $F0
	even

SpringMap_Horizontal0:
	dc.b	2
	dc.b	$F0, 3, 0, $12, 0
	dc.b	$F0, 3, 0, $16, $F8
	even

SpringMap_Horizontal1:
	dc.b	1
	dc.b	$F0, 3, 0, $12, $F8
	even

SpringMap_Horizontal2:
	dc.b	3
	dc.b	$F0, 3, 0, $12, $18
	dc.b	$F8, 9, 0, $1A, 0
	dc.b	$F0, 3, 0, $20, $F8

MapSpr_Spring3:
	dc.w	SpringMap_Diagonal0-MapSpr_Spring3
	dc.w	SpringMap_Diagonal1-MapSpr_Spring3
	dc.w	SpringMap_Diagonal2-MapSpr_Spring3

SpringMap_Diagonal0:
	dc.b	7
	dc.b	8, 0, 0, 0, $F0
	dc.b	0, 0, 0, 1, $F0
	dc.b	8, 0, 0, 2, $F8
	dc.b	$F0, 8, 0, 3, $F0
	dc.b	$F8, 0, 0, 6, $F0
	dc.b	$F8, 9, 0, 7, $F8
	dc.b	8, 4, 0, $D, 0
	even

SpringMap_Diagonal1:
	dc.b	7
	dc.b	8, 0, 0, 0, $F0
	dc.b	0, 0, 0, $F, $F0
	dc.b	8, 0, 0, $10, $F8
	dc.b	$F0, 5, 0, $11, $F0
	dc.b	$F8, 0, 0, 5, 0
	dc.b	0, 0, 0, $15, $F8
	dc.b	0, 5, 0, $16, 0
	even

SpringMap_Diagonal2:
	dc.b	8
	dc.b	8, 0, 0, 0, $F0
	dc.b	0, 0, 0, $1A, $F0
	dc.b	8, 0, 0, $1B, $F8
	dc.b	$E0, 8, 0, 3, 0
	dc.b	$E8, $E, 0, $1C, 0
	dc.b	$F8, 0, 0, $28, $F0
	dc.b	$F0, 2, 0, $29, $F8
	dc.b	0, 1, 0, $2C, 0
