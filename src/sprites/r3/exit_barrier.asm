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

.Sprite0:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $30

.Sprite1:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.Sprite2:
	dc.b	3
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.Sprite3:
	dc.b	4
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.Sprite4:
	dc.b	5
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.Sprite5:
	dc.b	6
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.Sprite6:
	dc.b	7
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.Sprite7:
	dc.b	8
	dc.b	$F0, 7, 0, 0, $C0
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

; ------------------------------------------------------------------------------
