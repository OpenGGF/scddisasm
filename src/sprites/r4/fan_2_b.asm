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
	dc.b	$F0, 7, 0, $10, $F8

.Sprite1:
	dc.b	1
	dc.b	$F4, 6, 0, $18, $F8

.Sprite2:
	dc.b	2
	dc.b	$F8, 4, 0, $1E, $F8
	dc.b	0, 4, $10, $1E, $F8

.Sprite3:
	dc.b	1
	dc.b	$F4, 6, $10, $18, $F8

.Sprite4:
	dc.b	1
	dc.b	$F0, 7, $10, $10, $F8

; ------------------------------------------------------------------------------
