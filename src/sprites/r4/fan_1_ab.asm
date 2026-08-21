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
	dc.b	$F8, $D, 0, 0, $F0

.Sprite1:
	dc.b	1
	dc.b	$F8, 9, 0, 8, $F4

.Sprite2:
	dc.b	2
	dc.b	$F8, 1, 0, $E, $F8
	dc.b	$F8, 1, 8, $E, 0

.Sprite3:
	dc.b	1
	dc.b	$F8, 9, 8, 8, $F4

.Sprite4:
	dc.b	1
	dc.b	$F8, $D, 8, 0, $F0

; ------------------------------------------------------------------------------
