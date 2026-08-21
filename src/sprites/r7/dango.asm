; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites1:
	dc.w	.Sprite01-.Sprites1
	dc.w	.Sprite11-.Sprites1
	dc.w	.Sprite21-.Sprites1
	dc.w	.Sprite3-.Sprites1
	dc.w	.Sprite4-.Sprites1
	dc.w	.Sprite5-.Sprites1

.Sprite01:
	dc.b	8
	dc.b	$F4, 0, 0, 0, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, 2, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, 4, $F0
	dc.b	4, 0, 0, 8, $F0
	dc.b	4, 4, 0, 9, $F8
	dc.b	4, 0, 0, $B, 8

.Sprite11:
	dc.b	8
	dc.b	$F4, 0, 0, 0, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, 2, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, 4, $F0
	dc.b	4, 4, 0, $C, $F0
	dc.b	4, 0, 0, $E, 0
	dc.b	4, 0, 0, $F, 8

.Sprite21:
	dc.b	3
	dc.b	$F4, 4, 0, $35, $FB
	dc.b	$F0, $D, 0, $10, $F0
	dc.b	0, $D, $10, $10, $F0
	even

.Sprites2:
	dc.w	.Sprite02-.Sprites2
	dc.w	.Sprite12-.Sprites2
	dc.w	.Sprite22-.Sprites2
	dc.w	.Sprite3-.Sprites2
	dc.w	.Sprite4-.Sprites2
	dc.w	.Sprite5-.Sprites2

.Sprite02:
	dc.b	8
	dc.b	$F4, 0, 0, $37, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, $38, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, $39, $F0
	dc.b	4, 0, 0, 8, $F0
	dc.b	4, 4, 0, $3D, $F8
	dc.b	4, 0, 0, $B, 8

.Sprite12:
	dc.b	8
	dc.b	$F4, 0, 0, $37, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, $38, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, $39, $F0
	dc.b	4, 4, 0, $C, $F0
	dc.b	4, 0, 0, $3F, 0
	dc.b	4, 0, 0, $F, 8

.Sprite22:
	dc.b	3
	dc.b	$EF, 1, 0, $40, $F0
	dc.b	$FF, 1, $10, $40, $F0
	dc.b	$EF, $B, 0, $42, $F8

.Sprite3:
	dc.b	3
	dc.b	$F4, 4, 0, $35, $FC
	dc.b	$F0, $D, 0, $10, $F0
	dc.b	0, $D, $10, $10, $F0

.Sprite4:
	dc.b	2
	dc.b	$F0, 4, 0, $18, $F8
	dc.b	$F8, $E, 0, $1A, $F0

.Sprite5:
	dc.b	2
	dc.b	$F1, 8, 0, $26, $F0
	dc.b	$F9, $E, 0, $29, $F0

; ------------------------------------------------------------------------------
