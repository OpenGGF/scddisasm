; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F4, $E, $20, $6B, $F0
	even

.Sprite1:
	dc.b	2
	dc.b	$F4, $E, $20, $5F, $F0
	dc.b	$C, $D, 1, $A4, $F0
	even

.Sprite2:
	dc.b	2
	dc.b	$F4, $E, $20, $5F, $F0
	dc.b	$C, $D, 1, $AC, $F0
	dc.b	0

; ------------------------------------------------------------------------------
