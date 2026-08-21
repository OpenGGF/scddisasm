; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F0, $F, 0, $A6, $F0
	even

.Sprite1:
	dc.b	1
	dc.b	$F0, $F, 0, $B6, $F0
	even

.Sprite2:
	dc.b	1
	dc.b	$F0, $F, 8, $B6, $F0
	even

; ------------------------------------------------------------------------------
