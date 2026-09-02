; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; Eight expanding big-ring flash frames. Each frame begins with a piece count, followed by five-byte pieces: Y, size/shape, tile high byte, tile low byte, X.
; Even-length frames retain one zero alignment byte where required.
; ------------------------------------------------------------------------------
.Map:
	dc.w	.Flash0-.Map
	dc.w	.Flash1-.Map
	dc.w	.Flash2-.Map
	dc.w	.Flash3-.Map
	dc.w	.Flash4-.Map
	dc.w	.Flash5-.Map
	dc.w	.Flash6-.Map
	dc.w	.Flash7-.Map

.Flash0:
	dc.b	6
	dc.b	$E0, 8, 0, 0, 0
	dc.b	$E8, 1, 0, 3, 0
	dc.b	$E8, $A, 0, 5, 8
	dc.b	0, $A, $10, 5, 8
	dc.b	8, 1, $10, 3, 0
	dc.b	$18, 8, $10, 0, 0
	even

.Flash1:
	dc.b	6
	dc.b	$E0, 2, 0, $E, $F0
	dc.b	$E0, $F, 0, $11, $F8
	dc.b	$E8, 2, 0, $21, $18
	dc.b	0, 2, $10, $21, $18
	dc.b	0, $F, $10, $11, $F8
	dc.b	8, 2, $10, $E, $F0
	even

.Flash2:
	dc.b	$A
	dc.b	$E0, 7, 0, $24, $E8
	dc.b	$E0, $D, 0, $2C, $F8
	dc.b	$F0, 5, 0, $34, $F8
	dc.b	$F0, 5, 0, $34, 8
	dc.b	$E8, 2, 0, $B, $18
	dc.b	0, 2, $10, $B, $18
	dc.b	0, 5, 0, $34, 8
	dc.b	0, 5, 0, $34, $F8
	dc.b	$10, $D, $10, $2C, $F8
	dc.b	0, 7, $10, $24, $E8
	even

.Flash3:
	dc.b	$10
	dc.b	$E0, 0, 8, 2, $E8
	dc.b	$E0, 0, 0, 2, $10
	dc.b	$E8, 6, 0, $38, $E0
	dc.b	$E0, 5, 8, $2E, $F0
	dc.b	$E0, 5, 0, $2E, 0
	dc.b	$F0, 5, 0, $34, $F0
	dc.b	$F0, 5, 0, $34, 0
	dc.b	$E8, 6, 8, $38, $10
	dc.b	0, 6, $10, $38, $E0
	dc.b	$18, 0, $18, 2, $E8
	dc.b	0, 5, 0, $34, $F0
	dc.b	$10, 5, $18, $2E, $F0
	dc.b	0, 5, 0, $34, 0
	dc.b	$10, 5, $10, $2E, 0
	dc.b	$18, 0, $10, 2, $10
	dc.b	0, 6, $18, $38, $10
	even

.Flash4:
	dc.b	$A
	dc.b	$E8, 2, 8, $B, $E0
	dc.b	$E0, $D, 8, $2C, $E8
	dc.b	$F0, 5, 0, $34, $E8
	dc.b	$F0, 5, 0, $34, $F8
	dc.b	$E0, 7, 8, $24, 8
	dc.b	0, 2, $18, $B, $E0
	dc.b	0, 5, 0, $34, $E8
	dc.b	0, 5, 0, $34, $F8
	dc.b	$10, $D, $18, $2C, $E8
	dc.b	0, 7, $18, $24, 8
	even

.Flash5:
	dc.b	6
	dc.b	$E8, 2, 8, $21, $E0
	dc.b	$E0, $F, 8, $11, $E8
	dc.b	$E0, 2, 8, $E, 8
	dc.b	0, 2, $18, $21, $E0
	dc.b	0, $F, $18, $11, $E8
	dc.b	8, 2, $18, $E, 8
	even

.Flash6:
	dc.b	6
	dc.b	$E0, 8, 8, 0, $E8
	dc.b	$E8, 1, 8, 3, $F8
	dc.b	$E8, $A, 8, 5, $E0
	dc.b	0, $A, $18, 5, $E0
	dc.b	8, 1, $18, 3, $F8
	dc.b	$18, 8, $18, 0, $E8
	even

.Flash7:
	dc.b	$11
	dc.b	$E0, 4, 0, $3E, 0
	dc.b	$E8, 9, 0, $40, 0
	dc.b	$E8, 0, 0, $46, $18
	dc.b	$F8, 4, 0, $47, $10
	dc.b	0, 4, $10, $47, $10
	dc.b	8, 9, $10, $40, 0
	dc.b	$10, 0, $10, $46, $18
	dc.b	$18, 4, $10, $3E, 0
	dc.b	$E0, 4, 8, $3E, $F0
	dc.b	$E8, 0, 8, $46, $E0
	dc.b	$E8, 9, 8, $40, $E8
	dc.b	$F8, 4, 8, $47, $E0
	dc.b	0, 4, $18, $47, $E0
	dc.b	$10, 0, $18, $46, $E0
	dc.b	8, 9, $18, $40, $E8
	dc.b	$18, 4, $18, $3E, $F0
	dc.b	$F8, 5, 0, $49, $F8
