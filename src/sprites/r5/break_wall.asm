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
	dc.b	3
	dc.b	$E8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, $F8
	dc.b	8, 5, 0, 8, $F8

.Sprite1:
	dc.b	3
	dc.b	$E8, 5, 0, $C, $F8
	dc.b	$F8, 5, 0, $C, $F8
	dc.b	8, 5, 0, $C, $F8

.Sprite2:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

.Sprite3:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, 8, $F8

.Sprite5:
	dc.b	1
	dc.b	$F8, 5, 0, $C, $F8

; ------------------------------------------------------------------------------
