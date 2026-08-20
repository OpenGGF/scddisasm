; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
.Sprites2:
	dc.w	.Sprite0-.Sprites2
	dc.w	.Sprite1-.Sprites2
	dc.w	.Sprite2-.Sprites2
	dc.w	.Sprite32-.Sprites2
	dc.w	.Sprite42-.Sprites2
	dc.w	.Sprite52-.Sprites2

.Sprite32:
	dc.b	4
	dc.b	$F6, $C, 0, $2F, $F0
	dc.b	$FE, 0, 0, 4, $F0
	dc.b	$FE, 4, 0, $33, $F8
	dc.b	6, 8, 0, $35, $F0

.Sprite42:
	dc.b	3
	dc.b	$F8, 0, 0, $A, $F0
	dc.b	$F8, 8, 0, $38, $F8
	dc.b	0, 8, 0, $3B, $F0

.Sprite52:
	dc.b	3
	dc.b	$F6, 0, 0, $11, $F0
	dc.b	$F6, 4, 0, $3E, $F8
	dc.b	$FE, $C, 0, $40, $F0
	even

.Sprites1:
	dc.w	.Sprite0-.Sprites1
	dc.w	.Sprite1-.Sprites1
	dc.w	.Sprite2-.Sprites1
	dc.w	.Sprite31-.Sprites1
	dc.w	.Sprite41-.Sprites1
	dc.w	.Sprite51-.Sprites1

.Sprite31:
	dc.b	4
	dc.b	$F4, $C, 0, 0, $F0
	dc.b	$FC, 0, 0, 4, $F0
	dc.b	$FC, 4, 0, 5, $F8
	dc.b	4, 8, 0, 7, $F0

.Sprite41:
	dc.b	3
	dc.b	$F8, 0, 0, $A, $F0
	dc.b	$F8, 8, 0, $B, $F8
	dc.b	0, 8, 0, $E, $F0

.Sprite51:
	dc.b	3
	dc.b	$F8, 0, 0, $11, $F0
	dc.b	$F8, 4, 0, $12, $F8
	dc.b	0, $C, 0, $14, $F0

.Sprite0:
	dc.b	1
	dc.b	$F4, 9, 0, $18, $F4

.Sprite1:
	dc.b	1
	dc.b	$F4, $A, 0, $1E, $F4

.Sprite2:
	dc.b	3
	dc.b	$F0, 3, 0, $27, $F4
	dc.b	$F0, 3, 0, $2B, $FC
	dc.b	$F0, 3, 8, $27, 4

; ------------------------------------------------------------------------------
