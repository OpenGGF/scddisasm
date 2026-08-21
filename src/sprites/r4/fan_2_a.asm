; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F0, 7, 8, $10, $F8

.Sprite1:
	dc.b	1
	dc.b	$F4, 6, 8, $18, $F8

.Sprite2:
	dc.b	2
	dc.b	$F8, 4, 8, $1E, $F8
	dc.b	0, 4, $18, $1E, $F8

.Sprite3:
	dc.b	1
	dc.b	$F4, 6, $18, $18, $F8

.Sprite4:
	dc.b	1
	dc.b	$F0, 7, $18, $10, $F8

; ------------------------------------------------------------------------------
