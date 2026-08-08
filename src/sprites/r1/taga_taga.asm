; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites1:
	dc.w	.Sprite0-.Sprites1
	dc.w	.Sprite1-.Sprites1
	dc.w	.Sprite2-.Sprites1
	dc.w	.Sprite31-.Sprites1
	dc.w	.Sprite41-.Sprites1
	dc.w	.Sprite51-.Sprites1
	dc.w	.Sprite6-.Sprites1

.Sprite31:
	dc.b	4
	dc.b	$F0, 5, 0, $D, $F0
	dc.b	$F0, 5, 8, $D, 0
	dc.b	0, 5, 0, $11, $F0
	dc.b	0, 5, 8, $11, 0

.Sprite41:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $15, $F8
	dc.b	$EA, 3, 8, $15, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $19, $F0
	dc.b	$FE, 6, $18, $19, 0

.Sprite51:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $15, $F8
	dc.b	$EA, 3, 8, $15, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $1F, $F0
	dc.b	$FE, 6, $18, $1F, 0
	even

.Sprites2:
	dc.w	.Sprite0-.Sprites2
	dc.w	.Sprite1-.Sprites2
	dc.w	.Sprite2-.Sprites2
	dc.w	.Sprite32-.Sprites2
	dc.w	.Sprite42-.Sprites2
	dc.w	.Sprite52-.Sprites2
	dc.w	.Sprite6-.Sprites2

.Sprite32:
	dc.b	4
	dc.b	$F0, 5, 0, $25, $F0
	dc.b	$F0, 5, 8, $25, 0
	dc.b	0, 5, 0, $11, $F0
	dc.b	0, 5, 8, $11, 0

.Sprite42:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $29, $F8
	dc.b	$EA, 3, 8, $29, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $19, $F0
	dc.b	$FE, 6, $18, $19, 0

.Sprite52:
	dc.b	6
	dc.b	$FA, 0, $10, 0, $F0
	dc.b	$EA, 3, 0, $29, $F8
	dc.b	$EA, 3, 8, $29, 0
	dc.b	$FA, 0, $18, 0, 8
	dc.b	$FE, 6, $10, $1F, $F0
	dc.b	$FE, 6, $18, $1F, 0
	even

.Sprite0:
	dc.b	6
	dc.b	$FE, 0, 0, 0, $F0
	dc.b	$F6, 3, 0, 1, $F8
	dc.b	$F6, 3, 8, 1, 0
	dc.b	$FE, 0, 8, 0, 8
	dc.b	$EA, 6, 0, $19, $F0
	dc.b	$EA, 6, 8, $19, 0
	even

.Sprite1:
	dc.b	6
	dc.b	$FE, 0, 0, 0, $F0
	dc.b	$F6, 3, 0, 1, $F8
	dc.b	$F6, 3, 8, 1, 0
	dc.b	$FE, 0, 8, 0, 8
	dc.b	$EA, 6, 0, $1F, $F0
	dc.b	$EA, 6, 8, $1F, 0
	even

.Sprite2:
	dc.b	2
	dc.b	$F0, 7, 0, 5, $F0
	dc.b	$F0, 7, 8, 5, 0
	even

.Sprite6:
	dc.b	0

; ------------------------------------------------------------------------------
