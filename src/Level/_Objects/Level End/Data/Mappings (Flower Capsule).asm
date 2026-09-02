; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; Flower-capsule and released-seed frames. Each frame begins with a piece count, followed by five-byte pieces: Y, size/shape, tile high byte, tile low byte, X.
; Even-length frames retain one zero alignment byte where required.
; ------------------------------------------------------------------------------
.Map:
	dc.w	.IntactA-.Map
	dc.w	.IntactB-.Map
	dc.w	.Broken-.Map
	dc.w	.SeedA-.Map
	dc.w	.SeedB-.Map
	dc.w	.SeedC-.Map
	dc.w	.SeedD-.Map
	dc.w	.SeedE-.Map
	dc.w	.SeedF-.Map

.IntactA:
	dc.b	$C
	dc.b	$E0, 1, 0, 0, $F8
	dc.b	$E0, 1, 8, 0, 0
	dc.b	$F0, 8, 0, 2, $E8
	dc.b	$F0, 8, 0, 5, 0
	dc.b	$F8, $D, 0, 8, $E0
	dc.b	$F8, $D, 0, $10, 0
	dc.b	8, $D, 0, $18, $E0
	dc.b	8, $D, 8, $18, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	even

.IntactB:
	dc.b	$C
	dc.b	$E0, 1, 0, $24, $F8
	dc.b	$E0, 1, 8, $24, 0
	dc.b	$F0, 8, 0, $26, $E8
	dc.b	$F0, 8, 0, $29, 0
	dc.b	$F8, $D, 0, $2C, $E0
	dc.b	$F8, $D, 0, $34, 0
	dc.b	8, $D, 0, $3C, $E0
	dc.b	8, $D, 8, $3C, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	even

.Broken:
	dc.b	6
	dc.b	8, $D, 0, $44, $E0
	dc.b	8, $D, 0, $4C, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	even

.SeedA:
	dc.b	1
	dc.b	$F8, 5, 0, $5C, $F8

.SeedB:
	dc.b	1
	dc.b	$F8, 5, 0, $60, $F8

.SeedC:
	dc.b	1
	dc.b	$F8, 5, 0, $64, $F8

.SeedD:
	dc.b	1
	dc.b	$F8, 5, 8, $64, $F8

.SeedE:
	dc.b	1
	dc.b	$F8, 5, 8, $60, $F8

.SeedF:
	dc.b	1
	dc.b	$F8, 5, 8, $5C, $F8
