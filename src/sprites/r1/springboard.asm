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
	dc.b	$FC, 1, 0, 0, $F8
	dc.b	$FC, 8, 0, 2, 0
	even

.Sprite1:
	dc.b	2
	dc.b	$FC, 5, 0, 5, $F8
	dc.b	0, 5, 0, 9, 8
	even

.Sprite2:
	dc.b	2
	dc.b	$FC, 5, 0, $D, $F8
	dc.b	$F0, 5, 0, $11, 8
	even

.Sprite3:
	dc.b	2
	dc.b	$FC, 1, 8, 0, 0
	dc.b	$FC, 8, 8, 2, $E8
	even

.Sprite4:
	dc.b	2
	dc.b	$FC, 5, 8, 5, $F8
	dc.b	0, 5, 8, 9, $E8
	even

.Sprite5:
	dc.b	2
	dc.b	$FC, 5, 8, $D, $F8
	dc.b	$F0, 5, 8, $11, $E8

; ------------------------------------------------------------------------------
