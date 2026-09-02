; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Lowered-.Sprites
	dc.w	.Midpoint-.Sprites
	dc.w	.Raised-.Sprites

; Each frame contains two five-byte pieces: signed Y, size,
; attributes/tile high, tile low, and signed X.
.Lowered:
	dc.b	2
	dc.b	$F8, 5, 0, $1C, $F0
	dc.b	$F8, 5, 8, $1C, 0

.Midpoint:
	dc.b	2
	dc.b	$F8, 5, 0, $20, $F0
	dc.b	$F8, 5, 8, $20, 0

.Raised:
	dc.b	2
	dc.b	$F8, 5, 0, $24, $F0
	dc.b	$F8, 5, 8, $24, 0

; ------------------------------------------------------------------------------
