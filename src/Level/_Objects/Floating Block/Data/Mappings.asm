.Map:
	dc.w	.Invisible-.Map
	dc.w	.Frame1-.Map
	dc.w	.Frame2-.Map
	dc.w	.Frame3-.Map
	dc.w	.Frame4-.Map
	dc.w	.Frame5-.Map

.Invisible:
	dc.b	0
	even

.Frame1:
	dc.b	3
	dc.b	$F4, 9, 0, 0, $F4
	dc.b	4, 0, 0, 0, $FC
	dc.b	4, 0, 0, 0, 4
	even

.Frame2:
	dc.b	3
	dc.b	$F4, 9, 8, 0, $F4
	dc.b	4, 0, 8, 0, $F4
	dc.b	4, 0, 8, 0, $FC
	even

.Frame3:
	dc.b	2
	dc.b	$F4, 9, $18, 0, $F4
	dc.b	4, 0, $18, 0, $FC
	even

.Frame4:
	dc.b	2
	dc.b	$F4, 9, $10, 0, $F4
	dc.b	4, 0, $10, 0, $FC
	even

.Frame5:
	dc.b	1
	dc.b	$F4, $A, 0, 6, $F4
