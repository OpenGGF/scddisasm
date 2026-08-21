; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite5-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$F8, $C, 0, 0, $F0
	dc.b	0, $C, 0, 4, $F0

.Sprite1:
	dc.b	1
	dc.b	0, $C, 0, 0, $F0

.Sprite2:
	dc.b	3
	dc.b	$E8, $C, 0, 0, $F0
	dc.b	$F0, 5, 0, 8, $F8
	dc.b	0, $C, 0, $C, $F0

.Sprite3:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $F8

.Sprite4:
	dc.b	1
	dc.b	$F0, 3, 0, 4, $F8

.Sprite5:
	dc.b	4
	dc.b	$F0, 3, 0, 4, $10
	dc.b	$F8, 9, 0, 8, $F8
	dc.b	$F0, 0, 0, 0, $F8
	dc.b	8, 0, 0, 3, $F8

; ------------------------------------------------------------------------------
