.Map:
	dc.w	.Frame0-.Map
	dc.w	.Frame1-.Map

.Frame0:
	dc.b	4
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	8, 5, 0, $21, $F8

.Frame1:
	dc.b	3
	dc.b	$E0, 5, 0, $D, $F8
	dc.b	$F0, 5, 0, $11, $F8
	dc.b	0, 5, 0, $15, $F8
	dc.b	0
