; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

; Robot-generator mappings. Every nonempty frame is a count followed by
; five-byte sprite pieces (Y, size, tile high, tile low, X).
.Table:
	dc.w	.GoodFuture-.Table
	dc.w	.GoodFuturePast-.Table
	dc.w	.Inactive-.Table
	dc.w	.Active0-.Table
	dc.w	.Active1-.Table
	dc.w	.Active2-.Table
	dc.w	.Active3-.Table
	dc.w	.Destroyed-.Table

.Destroyed:
	dc.b	0

.GoodFuture:
	dc.b	4
	dc.b	$10, 9, 0, 9, $E8
	dc.b	$10, 9, 8, 9, 0
	dc.b	$10, 9, 0, 9, $D8
	dc.b	$10, 9, 8, 9, $10

.GoodFuturePast:
	dc.b	4
	dc.b	$10, 9, 0, $11, $E8
	dc.b	$10, 9, 8, $11, 0
	dc.b	$10, 9, 0, $11, $D8
	dc.b	$10, 9, 8, $11, $10

.Inactive:
	dc.b	$C
	dc.b	$E0, $A, 0, 0, $E8
	dc.b	$E0, $A, 8, 0, 0
	dc.b	8, $A, $10, 0, $E8
	dc.b	8, $A, $18, 0, 0
	dc.b	$E0, $A, 0, 0, $D8
	dc.b	$E0, $A, 8, 0, $F0
	dc.b	8, $A, $10, 0, $D8
	dc.b	8, $A, $18, 0, $F0
	dc.b	$E0, $A, 0, 0, $F8
	dc.b	$E0, $A, 8, 0, $10
	dc.b	8, $A, $10, 0, $F8
	dc.b	8, $A, $18, 0, $10

.Active0:
	dc.b	$12
	dc.b	$E0, $A, 0, 0, $E8
	dc.b	$E0, $A, 8, 0, 0
	dc.b	$F8, 1, 0, $D, $FA
	dc.b	$F8, 1, $18, $F, $FE
	dc.b	8, $A, $10, 0, $E8
	dc.b	8, $A, $18, 0, 0
	dc.b	$E0, $A, 0, 0, $D8
	dc.b	$E0, $A, 8, 0, $F0
	dc.b	$F8, 1, 0, $D, $EA
	dc.b	$F8, 1, $18, $F, $EE
	dc.b	8, $A, $10, 0, $D8
	dc.b	8, $A, $18, 0, $F0
	dc.b	$E0, $A, 0, 0, $F8
	dc.b	$E0, $A, 8, 0, $10
	dc.b	$F8, 1, 0, $D, $A
	dc.b	$F8, 1, $18, $F, $E
	dc.b	8, $A, $10, 0, $F8
	dc.b	8, $A, $18, 0, $10

.Active1:
	dc.b	$18
	dc.b	$E0, 4, 0, 9, $F8
	dc.b	$E0, $A, 0, 0, $E8
	dc.b	$E0, $A, 8, 0, 0
	dc.b	$F8, 1, 0, $F, $FA
	dc.b	$F8, 1, $18, $D, $FE
	dc.b	$18, 4, $10, 9, $F8
	dc.b	8, $A, $10, 0, $E8
	dc.b	8, $A, $18, 0, 0
	dc.b	$E0, 4, 0, 9, $E8
	dc.b	$E0, $A, 0, 0, $D8
	dc.b	$E0, $A, 8, 0, $F0
	dc.b	$F8, 1, 0, $F, $EA
	dc.b	$F8, 1, $18, $D, $EE
	dc.b	$18, 4, $10, 9, $E8
	dc.b	8, $A, $10, 0, $D8
	dc.b	8, $A, $18, 0, $F0
	dc.b	$E0, 4, 0, 9, 8
	dc.b	$E0, $A, 0, 0, $F8
	dc.b	$E0, $A, 8, 0, $10
	dc.b	$F8, 1, 0, $F, $A
	dc.b	$F8, 1, $18, $D, $E
	dc.b	$18, 4, $10, 9, 8
	dc.b	8, $A, $10, 0, $F8
	dc.b	8, $A, $18, 0, $10

.Active2:
	dc.b	$18
	dc.b	$E0, 4, 0, $B, $F8
	dc.b	$E0, $A, 0, 0, $E8
	dc.b	$E0, $A, 8, 0, 0
	dc.b	$F8, 1, $18, $F, $FA
	dc.b	$F8, 1, 0, $D, $FE
	dc.b	$18, 4, $10, $B, $F8
	dc.b	8, $A, $10, 0, $E8
	dc.b	8, $A, $18, 0, 0
	dc.b	$E0, 4, 0, $B, $E8
	dc.b	$E0, $A, 0, 0, $D8
	dc.b	$E0, $A, 8, 0, $F0
	dc.b	$F8, 1, $18, $F, $EA
	dc.b	$F8, 1, 0, $D, $EE
	dc.b	$18, 4, $10, $B, $E8
	dc.b	8, $A, $10, 0, $D8
	dc.b	8, $A, $18, 0, $F0
	dc.b	$E0, 4, 0, $B, 8
	dc.b	$E0, $A, 0, 0, $F8
	dc.b	$E0, $A, 8, 0, $10
	dc.b	$F8, 1, $18, $F, $A
	dc.b	$F8, 1, 0, $D, $E
	dc.b	$18, 4, $10, $B, 8
	dc.b	8, $A, $10, 0, $F8
	dc.b	8, $A, $18, 0, $10

.Active3:
	dc.b	$18
	dc.b	$E0, 4, 0, 9, $F8
	dc.b	$E0, $A, 0, 0, $E8
	dc.b	$E0, $A, 8, 0, 0
	dc.b	$F8, 1, $18, $D, $FA
	dc.b	$F8, 1, 0, $F, $FE
	dc.b	$18, 4, $10, 9, $F8
	dc.b	8, $A, $10, 0, $E8
	dc.b	8, $A, $18, 0, 0
	dc.b	$E0, 4, 0, 9, $E8
	dc.b	$E0, $A, 0, 0, $D8
	dc.b	$E0, $A, 8, 0, $F0
	dc.b	$F8, 1, $18, $D, $EA
	dc.b	$F8, 1, 0, $F, $EE
	dc.b	$18, 4, $10, 9, $E8
	dc.b	8, $A, $10, 0, $D8
	dc.b	8, $A, $18, 0, $F0
	dc.b	$E0, 4, 0, 9, 8
	dc.b	$E0, $A, 0, 0, $F8
	dc.b	$E0, $A, 8, 0, $10
	dc.b	$F8, 1, $18, $D, $A
	dc.b	$F8, 1, 0, $F, $E
	dc.b	$18, 4, $10, 9, 8
	dc.b	8, $A, $10, 0, $F8
	dc.b	8, $A, $18, 0, $10

; ------------------------------------------------------------------------------
