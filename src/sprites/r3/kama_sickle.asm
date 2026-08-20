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

.Sprite0:
	dc.b	1
	dc.b	$F8, 5, 0, $19, $F8
	even

.Sprite1:
	dc.b	1
	dc.b	$F8, 5, 0, $1D, $F8
	even

.Sprite2:
	dc.b	1
	dc.b	$F8, 5, $10, $19, $F8
	even

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, $18, $19, $F8
	even

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, $18, $1D, $F8
	even

.Sprite5:
	dc.b	1
	dc.b	$F8, 5, 8, $19, $F8

; ------------------------------------------------------------------------------
