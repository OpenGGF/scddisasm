.Map:
	dc.w	.Frame0-.Map
	dc.w	.Frame1-.Map
	dc.w	.Frame2-.Map
	dc.w	.Frame3-.Map
	dc.w	.Frame4-.Map
	dc.w	.Frame5-.Map

.Frame0:
	dc.b	2
	dc.b	$F8, $C, 0, 0, $F0
	dc.b	0, $C, 0, 4, $F0

.Frame1:
	dc.b	1
	dc.b	0, $C, 0, 0, $F0

.Frame2:
	dc.b	3
	dc.b	$E8, $C, 0, 0, $F0
	dc.b	$F0, 5, 0, 8, $F8
	dc.b	0, $C, 0, $C, $F0

.Frame3:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $F8

.Frame4:
	dc.b	1
	dc.b	$F0, 3, 0, 4, $F8

.Frame5:
	dc.b	4
	dc.b	$F0, 3, 0, 4, $10
	dc.b	$F8, 9, 0, 8, $F8
	dc.b	$F0, 0, 0, 0, $F8
	dc.b	8, 0, 0, 3, $F8
