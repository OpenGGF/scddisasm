.Map:
	dc.w	.Frame0-.Map
	dc.w	.Frame1-.Map

.Frame0:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8
	even

.Frame1:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8
