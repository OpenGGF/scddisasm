; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites

.Sprite0:
	dc.b	5
	dc.b	$E4, 0, 0, 0, $E4
	dc.b	$EC, 6, 0, 1, $E4
	dc.b	$F4, 0, 0, 7, $F4
	dc.b	$FC, $C, 0, 8, $F4
	dc.b	$FC, 0, 0, $C, $14
	even

.Sprite1:
	; Negative piece counts are treated as 0
	dc.b	-1

; ------------------------------------------------------------------------------
