; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Flying-animal mappings. Each nonempty frame contains one five-byte sprite
; piece (Y, size, tile high, tile low, X); Empty is used by the hologram pulse.
.Table:
	dc.w	.WingUp-.Table
	dc.w	.WingDown-.Table
	dc.w	.Empty-.Table

.WingUp:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

.WingDown:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8

.Empty:
	dc.b	0

; ------------------------------------------------------------------------------
