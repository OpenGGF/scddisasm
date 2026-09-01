; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Rotation0-.Sprites
	dc.w	.Rotation1-.Sprites
	dc.w	.Rotation2-.Sprites

; Each frame contains one five-byte piece: signed Y, size,
; attributes/tile high, tile low, and signed X.
.Rotation0:
	dc.b	1
	dc.b	$F0, $F, 0, $A6, $F0
	even

.Rotation1:
	dc.b	1
	dc.b	$F0, $F, 0, $B6, $F0
	even

.Rotation2:
	dc.b	1
	dc.b	$F0, $F, 8, $B6, $F0
	even

; ------------------------------------------------------------------------------
