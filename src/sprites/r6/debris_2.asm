; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F8, 0, 0, $10, $F8
	even

.Sprite1:
	dc.b	1
	dc.b	$F8, 0, 0, $11, 0
	even

.Sprite2:
	dc.b	1
	dc.b	0, 0, 0, $12, $F8
	even

.Sprite3:
	dc.b	1
	dc.b	0, 0, 0, $13, 0

; ------------------------------------------------------------------------------
