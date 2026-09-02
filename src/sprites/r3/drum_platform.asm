; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Drum-platform bounce-cycle mappings. Nonempty frames contain two five-byte
; sprite pieces after the piece count.

.Sprites:
	dc.w	.Extended-.Sprites
	dc.w	.Contract1-.Sprites
	dc.w	.Contract2-.Sprites
	dc.w	.Contract3-.Sprites
	dc.w	.FullyContracted-.Sprites
	dc.w	.Expand3-.Sprites
	dc.w	.Expand2-.Sprites
	dc.w	.Expand1-.Sprites
	dc.w	.CycleReturn-.Sprites
	dc.w	.LowerRim-.Sprites
	dc.w	.Hidden-.Sprites
	dc.w	.UpperRim-.Sprites

.Extended:
	dc.b	2
	dc.b	$F0, 9, 0, 3, $E8
	dc.b	$F0, 9, 8, 3, 0
	even

.Contract1:
	dc.b	2
	dc.b	$F4, 9, 0, 9, $E8
	dc.b	$F4, 9, 8, 9, 0
	even

.Contract2:
	dc.b	2
	dc.b	$F8, 9, 0, $F, $E8
	dc.b	$F8, 9, 8, $F, 0
	even

.Contract3:
	dc.b	2
	dc.b	$FC, 9, 0, $15, $E8
	dc.b	$FC, 9, 8, $15, 0
	even

.FullyContracted:
	dc.b	2
	dc.b	$FC, 9, 0, $1B, $E8
	dc.b	$FC, 9, 8, $1B, 0
	even

.Expand3:
	dc.b	2
	dc.b	$FC, 9, $10, $15, $E8
	dc.b	$FC, 9, $18, $15, 0
	even

.Expand2:
	dc.b	2
	dc.b	$FC, 9, $10, $F, $E8
	dc.b	$FC, 9, $18, $F, 0
	even

.Expand1:
	dc.b	2
	dc.b	$FC, 9, $10, 9, $E8
	dc.b	$FC, 9, $18, 9, 0
	even

.CycleReturn:
	dc.b	2
	dc.b	0, 9, $10, 3, $E8
	dc.b	0, 9, $18, 3, 0
	even

.LowerRim:
	dc.b	2
	dc.b	0, 8, $10, 0, $E8
	dc.b	0, 8, $18, 0, 0
	even

.Hidden:
	dc.b	0
	; Ignored five-byte piece-shaped tail record; the zero count hides it.
	dc.b	$FC, 0, $10, 0, $E8
	even

.UpperRim:
	dc.b	2
	dc.b	$F8, 8, 0, 0, $E8
	dc.b	$F8, 8, 8, 0, 0

; ------------------------------------------------------------------------------
