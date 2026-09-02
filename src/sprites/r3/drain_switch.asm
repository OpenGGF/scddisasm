; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Rest-.Sprites
	dc.w	.TransitionA-.Sprites
	dc.w	.Midpoint-.Sprites
	dc.w	.TransitionB-.Sprites

; Frames start with a piece count followed by five-byte sprite pieces:
; signed Y, size, attributes/tile high, tile low, and signed X.
.Rest:
	dc.b	3
	dc.b	$F8, 1, 0, $14, $F0
	dc.b	$F8, 5, 0, $16, $F8
	dc.b	$F8, 1, 8, $14, 8

.TransitionA:
	dc.b	2
	dc.b	$F0, 7, 0, $C, $F0
	dc.b	$F0, 7, 8, $C, 0

.Midpoint:
	dc.b	3
	dc.b	$F0, 3, 0, 0, $F0
	dc.b	$F0, 7, 0, 4, $F8
	dc.b	$F0, 3, 8, 0, 8

.TransitionB:
	dc.b	2
	dc.b	$F0, 7, $10, $C, $F0
	dc.b	$F0, 7, $18, $C, 0

; ------------------------------------------------------------------------------
