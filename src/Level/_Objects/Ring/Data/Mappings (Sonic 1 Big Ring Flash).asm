.Map:
	dc.w	.Frame0-.Map
	dc.w	.Frame1-.Map
	dc.w	.Frame2-.Map
	dc.w	.Frame3-.Map
	dc.w	.Frame4-.Map
	dc.w	.Frame5-.Map
	dc.w	.Frame6-.Map
	dc.w	.Frame7-.Map

.Frame0:
	dc.b	2
	dc.b	$E0, $F, 0, 0, 0
	dc.b	0, $F, $10, 0, 0

.Frame1:
	dc.b	4
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	$E0, 7, 0, $20, $10
	dc.b	0, $F, $10, $10, $F0
	dc.b	0, 7, $10, $20, $10

.Frame2:
	dc.b	4
	dc.b	$E0, $F, 0, $28, $E8
	dc.b	$E0, $B, 0, $38, 8
	dc.b	0, $F, $10, $28, $E8
	dc.b	0, $B, $10, $38, 8

.Frame3:
	dc.b	4
	dc.b	$E0, $F, 8, $34, $E0
	dc.b	$E0, $F, 0, $34, 0
	dc.b	0, $F, $18, $34, $E0
	dc.b	0, $F, $10, $34, 0

.Frame4:
	dc.b	4
	dc.b	$E0, $B, 8, $38, $E0
	dc.b	$E0, $F, 8, $28, $F8
	dc.b	0, $B, $18, $38, $E0
	dc.b	0, $F, $18, $28, $F8

.Frame5:
	dc.b	4
	dc.b	$E0, 7, 8, $20, $E0
	dc.b	$E0, $F, 8, $10, $F0
	dc.b	0, 7, $18, $20, $E0
	dc.b	0, $F, $18, $10, $F0

.Frame6:
	dc.b	2
	dc.b	$E0, $F, 8, 0, $E0
	dc.b	0, $F, $18, 0, $E0

.Frame7:
	dc.b	4
	dc.b	$E0, $F, 0, $44, $E0
	dc.b	$E0, $F, 8, $44, 0
	dc.b	0, $F, $10, $44, $E0
	dc.b	0, $F, $18, $44, 0
