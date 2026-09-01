; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Standard object-animation script: a frame delay followed by frame indices;
; $FF loops to the start of the projector-hologram sequence.
.Table:
	dc.w	.Hologram-.Table

.Hologram:
	dc.b	0
	dc.b	3, 3, 2, 3, 3, 2, 3, 3
	dc.b	2, 3, 3, 2, 3, 3, 2, 2
	dc.b	3, 3, 2, 2, 3, 3, 2, 2
	dc.b	3, 3, 2, 2, 4, 4, 2, 4
	dc.b	4, 2, 4, 4, 2, 4, 4, 2
	dc.b	4, 4, 2, 2, 4, 4, 2, 2
	dc.b	4, 4, 2, 2, 4, 4, 2, 2
	dc.b	$FF

; ------------------------------------------------------------------------------
