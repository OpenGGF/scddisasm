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
	dc.b	3
	dc.b	$F4, 8, 0, 0, $F8
	dc.b	$FC, 5, 0, 3, $F0
	dc.b	$FC, 5, 0, 7, 0

.Sprite1:
	dc.b	2
	dc.b	$FC, 5, 0, 3, $F0
	dc.b	$FC, 5, 0, $B, 0

.Sprite2:
	dc.b	2
	dc.b	$F0, $A, 0, $F, $F8
	dc.b	8, 4, 0, $18, $F0

.Sprite3:
	dc.b	1
	dc.b	$F0, $B, 0, $1A, $F8

.Sprite4:
	dc.b	1
	dc.b	$F0, $B, 0, $26, $F4

; ------------------------------------------------------------------------------
