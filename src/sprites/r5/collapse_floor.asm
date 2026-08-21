; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite5-.Sprites
	dc.w	.Sprite6-.Sprites
	dc.w	.Sprite7-.Sprites
	dc.w	.Sprite8-.Sprites
	dc.w	.Sprite9-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F0, 5, 0, 0, $F8
	dc.b	0, 5, 0, 4, $F8

.Sprite1:
	dc.b	4
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0

.Sprite2:
	dc.b	6
	dc.b	$F0, 5, 0, 0, $E8
	dc.b	0, 5, 0, 4, $E8
	dc.b	$F0, 5, 0, 0, $F8
	dc.b	0, 5, 0, 4, $F8
	dc.b	$F0, 5, 0, 0, 8
	dc.b	0, 5, 0, 4, 8

.Sprite3:
	dc.b	8
	dc.b	$F0, 5, 0, 0, $E0
	dc.b	0, 5, 0, 4, $E0
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0
	dc.b	$F0, 5, 0, 0, $10
	dc.b	0, 5, 0, 4, $10

.Sprite4:
	dc.b	$A
	dc.b	$F0, 5, 0, 0, $D8
	dc.b	0, 5, 0, 4, $D8
	dc.b	$F0, 5, 0, 0, $E8
	dc.b	0, 5, 0, 4, $E8
	dc.b	$F0, 5, 0, 0, $F8
	dc.b	0, 5, 0, 4, $F8
	dc.b	$F0, 5, 0, 0, 8
	dc.b	0, 5, 0, 4, 8
	dc.b	$F0, 5, 0, 0, $18
	dc.b	0, 5, 0, 4, $18

.Sprite5:
	dc.b	$C
	dc.b	$F0, 5, 0, 0, $D0
	dc.b	0, 5, 0, 4, $D0
	dc.b	$F0, 5, 0, 0, $E0
	dc.b	0, 5, 0, 4, $E0
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0
	dc.b	$F0, 5, 0, 0, $10
	dc.b	0, 5, 0, 4, $10
	dc.b	$F0, 5, 0, 0, $20
	dc.b	0, 5, 0, 4, $20

.Sprite6:
	dc.b	$E
	dc.b	$F0, 5, 0, 0, $C8
	dc.b	0, 5, 0, 4, $C8
	dc.b	$F0, 5, 0, 0, $D8
	dc.b	0, 5, 0, 4, $D8
	dc.b	$F0, 5, 0, 0, $E8
	dc.b	0, 5, 0, 4, $E8
	dc.b	$F0, 5, 0, 0, $F8
	dc.b	0, 5, 0, 4, $F8
	dc.b	$F0, 5, 0, 0, 8
	dc.b	0, 5, 0, 4, 8
	dc.b	$F0, 5, 0, 0, $18
	dc.b	0, 5, 0, 4, $18
	dc.b	$F0, 5, 0, 0, $28
	dc.b	0, 5, 0, 4, $28

.Sprite7:
	dc.b	$10
	dc.b	$F0, 5, 0, 0, $C0
	dc.b	0, 5, 0, 4, $C0
	dc.b	$F0, 5, 0, 0, $D0
	dc.b	0, 5, 0, 4, $D0
	dc.b	$F0, 5, 0, 0, $E0
	dc.b	0, 5, 0, 4, $E0
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0
	dc.b	$F0, 5, 0, 0, $10
	dc.b	0, 5, 0, 4, $10
	dc.b	$F0, 5, 0, 0, $20
	dc.b	0, 5, 0, 4, $20
	dc.b	$F0, 5, 0, 0, $30
	dc.b	0, 5, 0, 4, $30

.Sprite8:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

.Sprite9:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8

; ------------------------------------------------------------------------------
