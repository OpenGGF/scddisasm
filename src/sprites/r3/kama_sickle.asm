; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; Six one-piece rotation frames for a thrown sickle. Each piece is
; Y, size/shape, tile high byte, tile low byte, X.
; Each frame begins with its piece count; tile attribute bits encode flips.
; ------------------------------------------------------------------------------
.Sprites:
	dc.w	.Base-.Sprites
	dc.w	.Alternate-.Sprites
	dc.w	.VerticalFlip-.Sprites
	dc.w	.BothFlips-.Sprites
	dc.w	.BothFlipsAlternate-.Sprites
	dc.w	.HorizontalFlip-.Sprites

.Base:
	dc.b	1
	dc.b	$F8, 5, 0, $19, $F8
	even

.Alternate:
	dc.b	1
	dc.b	$F8, 5, 0, $1D, $F8
	even

.VerticalFlip:
	dc.b	1
	dc.b	$F8, 5, $10, $19, $F8
	even

.BothFlips:
	dc.b	1
	dc.b	$F8, 5, $18, $19, $F8
	even

.BothFlipsAlternate:
	dc.b	1
	dc.b	$F8, 5, $18, $1D, $F8
	even

.HorizontalFlip:
	dc.b	1
	dc.b	$F8, 5, 8, $19, $F8

; ------------------------------------------------------------------------------
