; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Up-.Sprites
	dc.w	.Down-.Sprites
	dc.w	.Left-.Sprites
	dc.w	.Right-.Sprites

; Each orientation is one five-byte sprite piece after the piece count.
.Up:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0
	even

.Down:
	dc.b	1
	dc.b	$F0, $F, $10, 0, $F0
	even

.Left:
	dc.b	1
	dc.b	$F0, $F, 0, $10, $F0
	even

.Right:
	dc.b	1
	dc.b	$F0, $F, 8, $10, $F0

; ------------------------------------------------------------------------------
