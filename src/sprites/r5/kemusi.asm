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
	dc.b	$F4, 6, 0, 0, $F8

.Sprite1:
	dc.b	1
	dc.b	$F4, 6, 0, 6, $F8

.Sprite2:
	dc.b	1
	dc.b	$F4, 6, 0, $C, $F8

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, $12, $F8

; ------------------------------------------------------------------------------
