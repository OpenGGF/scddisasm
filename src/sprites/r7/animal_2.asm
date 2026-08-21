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
	dc.b	$F4, 6, 0, $E, $F8

.Sprite1:
	dc.b	1
	dc.b	$F4, 6, 0, 8, $F8

.Sprite2:
	dc.b	0

.Sprite3:
	dc.b	1
	dc.b	$F4, 6, 0, 8, $F8

.Sprite4:
	dc.b	1
	dc.b	$FC, 9, 0, $E, $F8

; ------------------------------------------------------------------------------
