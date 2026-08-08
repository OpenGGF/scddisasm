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
	dc.b	$FC, 0, 0, $25, $FC

.Sprite1:
	dc.b	1
	dc.b	$FC, 0, 0, $26, $FC

.Sprite2:
	dc.b	2
	dc.b	$F8, 4, 0, $27, $F8
	dc.b	0, 4, $10, $27, $F8

.Sprite3:
	dc.b	2
	dc.b	$F8, 4, 0, $29, $F8
	dc.b	0, 4, $10, $29, $F8

; ------------------------------------------------------------------------------
