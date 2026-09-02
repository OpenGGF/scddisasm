; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Indicator-.Sprites

; One frame of two five-byte pieces: signed Y, size,
; attributes/tile high, tile low, and signed X.
.Indicator:
	dc.b	2
	dc.b	$F8, 1, 0, $1A, $F8
	dc.b	$F8, 1, 8, $1A, 0

; ------------------------------------------------------------------------------
