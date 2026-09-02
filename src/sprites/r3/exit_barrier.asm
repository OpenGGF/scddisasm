; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.OneSegment-.Sprites
	dc.w	.TwoSegments-.Sprites
	dc.w	.ThreeSegments-.Sprites
	dc.w	.FourSegments-.Sprites
	dc.w	.FiveSegments-.Sprites
	dc.w	.SixSegments-.Sprites
	dc.w	.SevenSegments-.Sprites
	dc.w	.EightSegments-.Sprites

; Each frame adds one 16-pixel-wide segment. Every segment is a five-byte
; sprite piece: signed Y, size, attributes/tile high, tile low, and signed X.
.OneSegment:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $30

.TwoSegments:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.ThreeSegments:
	dc.b	3
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.FourSegments:
	dc.b	4
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.FiveSegments:
	dc.b	5
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.SixSegments:
	dc.b	6
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.SevenSegments:
	dc.b	7
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

.EightSegments:
	dc.b	8
	dc.b	$F0, 7, 0, 0, $C0
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

; ------------------------------------------------------------------------------
