; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------

.Sprites:
	dc.w	.Normal-.Sprites
	dc.w	.Alternate-.Sprites

; Each frame is one five-byte sprite piece after the piece count.
.Normal:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0
	even

.Alternate:
	dc.b	1
	dc.b	$F0, $F, $10, 0, $F0

; -------------------------------------------------------------------------
