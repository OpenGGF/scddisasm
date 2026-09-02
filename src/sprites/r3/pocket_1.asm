; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Hidden-.Sprites
	dc.w	.Capture-.Sprites
	dc.w	.Open-.Sprites
	dc.w	.Closing-.Sprites

; Each nonempty frame starts with a piece count, followed by five-byte pieces:
; Y offset, size, tile attributes, tile index, and X offset.
.Hidden:
	dc.b	0

.Capture:
	dc.b	2
	dc.b	$F8, 9, $C0, 0, $E8
	dc.b	$F8, 9, $C8, 0, 0

.Open:
	dc.b	2
	dc.b	$E8, 5, 0, 6, $F0
	dc.b	$E8, 5, 8, 6, 0

.Closing:
	dc.b	2
	dc.b	$F0, 0, 0, $A, $F8
	dc.b	$F0, 0, 8, $A, 0

; ------------------------------------------------------------------------------
