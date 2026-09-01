; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Closed-.Sprites
	dc.w	.LeftLowered-.Sprites
	dc.w	.LeftRaised-.Sprites
	dc.w	.RightLowered-.Sprites
	dc.w	.RightRaised-.Sprites

; Each frame starts with a piece count followed by five-byte sprite pieces:
; signed Y, size, attributes/tile high, tile low, and signed X.
.Closed:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	even

.LeftLowered:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F8, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	even

.LeftRaised:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$E8, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	even

.RightLowered:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$F8, $A, 8, 0, 0
	even

.RightRaised:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$E8, $A, 8, 0, 0

; ------------------------------------------------------------------------------
