; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$E8, 3, 0, 0, $F8
	dc.b	$E8, 3, 8, 0, 0
	dc.b	8, 1, 0, 4, $F8
	dc.b	8, 1, 8, 4, 0
	even

.Sprite1:
	dc.b	2
	dc.b	$F8, 1, 0, 6, $F8
	dc.b	$F8, 1, 8, 6, 0
	even

.Sprite2:
	dc.b	2
	dc.b	$F8, 1, 0, 8, $F8
	dc.b	$F8, 1, 8, 8, 0
	even

.Sprite3:
	dc.b	2
	dc.b	$F8, 1, 0, $A, $F8
	dc.b	$F8, 1, 8, $A, 0

; ------------------------------------------------------------------------------
