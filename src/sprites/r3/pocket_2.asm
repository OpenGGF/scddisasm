; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Visible-.Sprites
	dc.w	.Hidden-.Sprites

; Each nonempty frame starts with a piece count, followed by five-byte pieces:
; Y offset, size, tile attributes, tile index, and X offset.
.Visible:
	dc.b	2
	dc.b	$F8, 9, 0, 0, $E8
	dc.b	$F8, 9, 8, 0, 0

.Hidden:
	dc.b	0

; ------------------------------------------------------------------------------
