; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Normal-.Sprites
	dc.w	.Flash-.Sprites

; Each frame contains one five-byte piece: signed Y, size,
; attributes/tile high, tile low, and signed X.
.Normal:
	dc.b	1
	dc.b	$F8, 5, 0, $C, $F8

.Flash:
	dc.b	1
	dc.b	$F4, $A, 0, $10, $F4

; ------------------------------------------------------------------------------
