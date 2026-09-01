; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Ground-animal mappings. Each nonempty frame contains one five-byte sprite
; piece (Y, size, tile high, tile low, X); Empty is used by the hologram pulse.
.Table:
	dc.w	.Leap-.Table
	dc.w	.Land-.Table
	dc.w	.Empty-.Table
	dc.w	.HologramLand-.Table
	dc.w	.HologramLeap-.Table

.Leap:
	dc.b	1
	dc.b	$F4, 6, 0, $E, $F8

.Land:
	dc.b	1
	dc.b	$F4, 6, 0, 8, $F8

.Empty:
	dc.b	0

.HologramLand:
	dc.b	1
	dc.b	$F4, 6, 0, 8, $F8

.HologramLeap:
	dc.b	1
	dc.b	$FC, 9, 0, $E, $F8

; ------------------------------------------------------------------------------
