; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	3
	dc.b	$F8, 1, 0, $14, $F0
	dc.b	$F8, 5, 0, $16, $F8
	dc.b	$F8, 1, 8, $14, 8

.Sprite1:
	dc.b	2
	dc.b	$F0, 7, 0, $C, $F0
	dc.b	$F0, 7, 8, $C, 0

.Sprite2:
	dc.b	3
	dc.b	$F0, 3, 0, 0, $F0
	dc.b	$F0, 7, 0, 4, $F8
	dc.b	$F0, 3, 8, 0, 8

.Sprite3:
	dc.b	2
	dc.b	$F0, 7, $10, $C, $F0
	dc.b	$F0, 7, $18, $C, 0

; ------------------------------------------------------------------------------
