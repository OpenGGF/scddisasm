; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Projector and hologram mappings. Each nonempty frame is a count followed by
; five-byte sprite pieces (Y, size, tile high, tile low, X).
.Table:
	dc.w	.ProjectorIntact-.Table
	dc.w	.Empty-.Table
	dc.w	.BeamA-.Table
	dc.w	.BeamB-.Table
	dc.w	.MetalSonicA-.Table
	dc.w	.MetalSonicB-.Table

.ProjectorIntact:
	dc.b	1
	dc.b	$F4, $A, 0, $28, $F4

.Empty:
	dc.b	0

.BeamA:
	dc.b	1
	dc.b	$FC, 4, 0, $31, $F8

.BeamB:
	dc.b	1
	dc.b	$FC, 4, $10, $31, $F8

.MetalSonicA:
	dc.b	3
	dc.b	$E8, $A, 8, 0, $FC
	dc.b	$F8, 5, 8, 9, $EC
	dc.b	0, 5, 8, $D, $FC

.MetalSonicB:
	dc.b	4
	dc.b	$E8, $F, 8, $11, $F4
	dc.b	$E8, 0, 8, $21, $EC
	dc.b	0, 1, 8, $22, $EC
	dc.b	8, $C, 8, $24, $F4

; ------------------------------------------------------------------------------
