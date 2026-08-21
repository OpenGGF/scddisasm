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
	dc.b	0
	even

.Sprite1:
	dc.b	3
	dc.b	$F4, 9, 0, 0, $F4
	dc.b	4, 0, 0, 0, $FC
	dc.b	4, 0, 0, 0, 4
	even

.Sprite2:
	dc.b	3
	dc.b	$F4, 9, 8, 0, $F4
	dc.b	4, 0, 8, 0, $F4
	dc.b	4, 0, 8, 0, $FC
	even

.Sprite3:
	dc.b	2
	dc.b	$F4, 9, $18, 0, $F4
	dc.b	4, 0, $18, 0, $FC
	even

.Sprite4:
	dc.b	2
	dc.b	$F4, 9, $10, 0, $F4
	dc.b	4, 0, $10, 0, $FC
	even

.Sprite5:
	dc.b	1
	dc.b	$F4, $A, 0, 6, $F4

; ------------------------------------------------------------------------------
