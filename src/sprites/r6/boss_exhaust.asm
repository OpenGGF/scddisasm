; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F0, $F, 0, $33, $F0
	even

.Sprite1:
	dc.b	1
	dc.b	$F0, $F, 8, $33, $F0
	even

.Sprite2:
	dc.b	1
	dc.b	$F0, $E, 0, $43, $F0
	even

.Sprite3:
	dc.b	1
	dc.b	$F0, $E, 8, $43, $F0

; ------------------------------------------------------------------------------
