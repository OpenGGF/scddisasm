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
	dc.b	$F4, 6, 0, $12, $F8

.Sprite1:
	dc.b	1
	dc.b	$F4, 6, 0, $C, $F8

.Sprite2:
	dc.b	0

.Sprite3:
	dc.b	1
	dc.b	$F8, 9, 0, $C, $F4

.Sprite4:
	dc.b	1
	dc.b	$F8, 9, 0, $12, $F4

; ------------------------------------------------------------------------------
