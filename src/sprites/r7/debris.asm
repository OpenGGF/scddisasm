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
	dc.b	$FC, 0, 0, $11, $FC
	even

.Sprite1:
	dc.b	1
	dc.b	$FC, 0, 8, $11, $FC
	even

.Sprite2:
	dc.b	1
	dc.b	$FC, 0, $10, $11, $FC
	even

.Sprite3:
	dc.b	1
	dc.b	$FC, 0, $18, $11, $FC

; ------------------------------------------------------------------------------
