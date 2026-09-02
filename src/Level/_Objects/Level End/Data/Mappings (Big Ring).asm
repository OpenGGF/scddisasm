; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; Four big-ring rotation frames. Each frame begins with a piece count, followed by five-byte pieces: Y, size/shape, tile high byte, tile low byte, X.
; Even-length frames retain one zero alignment byte where required.
; ------------------------------------------------------------------------------
.Map:
	dc.w	.RingA-.Map
	dc.w	.RingB-.Map
	dc.w	.RingEdge-.Map
	dc.w	.RingC-.Map

.RingA:
	dc.b	$A
	dc.b	$E0, 9, 0, 0, $E8
	dc.b	$E0, 9, 0, 6, 0
	dc.b	$E8, 0, 0, $C, $E0
	dc.b	$E8, 0, 0, $D, $18
	dc.b	$F0, 7, 0, $E, $E0
	dc.b	$10, 0, 0, $16, $E0
	dc.b	$10, 9, 0, $17, $E8
	dc.b	$10, 9, 0, $1D, 0
	dc.b	$10, 0, 0, $23, $18
	dc.b	$F0, 7, 0, $24, $10
	even

.RingB:
	dc.b	$A
	dc.b	$E0, $D, 0, $2C, $F0
	dc.b	$E8, 0, 0, $34, $E8
	dc.b	$F0, 7, 0, $35, $E8
	dc.b	$10, 0, 0, $3D, $E8
	dc.b	$10, $D, 0, $3E, $F0
	dc.b	$E8, 0, 0, $46, $10
	dc.b	$F0, 0, 0, $47, 0
	dc.b	$F0, 7, 0, $48, 8
	dc.b	8, 0, 0, $50, 0
	dc.b	$10, 0, 0, $51, $10
	even

.RingEdge:
	dc.b	2
	dc.b	$E0, $B, 0, $52, $F4
	dc.b	0, $B, 0, $5E, $F4
	even

.RingC:
	dc.b	$A
	dc.b	$E0, $D, 8, $2C, $F0
	dc.b	$E8, 0, 8, $34, $10
	dc.b	$F0, 7, 8, $35, 8
	dc.b	$10, 0, 8, $3D, $10
	dc.b	$10, $D, 8, $3E, $F0
	dc.b	$E8, 0, 8, $46, $E8
	dc.b	$F0, 0, 8, $47, $F8
	dc.b	$F0, 7, 8, $48, $E8
	dc.b	8, 0, 8, $50, $F8
	dc.b	$10, 0, 8, $51, $E8
	even
