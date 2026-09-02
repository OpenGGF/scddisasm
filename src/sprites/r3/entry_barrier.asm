; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Normal-.Sprites
	dc.w	.Alternate-.Sprites

; Each frame contains three five-byte pieces: signed Y, size,
; attributes/tile high, tile low, and signed X.
.Normal:
	dc.b	3
	dc.b	$F0, $F, 0, $86, $D0
	dc.b	$F0, $F, 0, $96, $F0
	dc.b	$F0, $F, 0, $96, $10

.Alternate:
	dc.b	3
	dc.b	$F0, $F, 0, $C6, $D0
	dc.b	$F0, $F, 0, $C6, $F0
	dc.b	$F0, $F, 0, $C6, $10

; ------------------------------------------------------------------------------
