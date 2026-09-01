.Map:
	dc.w	.Frame0-.Map
	dc.w	.Frame1-.Map
	dc.w	.Frame2-.Map
	dc.w	.Frame3-.Map
	dc.w	.Frame4-.Map
	dc.w	.Frame5-.Map
	dc.w	.Frame6-.Map
	dc.w	.Frame7-.Map
	dc.w	.Invisible-.Map

.Frame0:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

.Frame1:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8

.Frame2:
	dc.b	1
	dc.b	$F8, 1, 0, 8, $FC

.Frame3:
	dc.b	1
	dc.b	$F8, 5, 8, 4, $F8

.Frame4:
	dc.b	1
	dc.b	$F8, 5, 0, $A, $F8

.Frame5:
	dc.b	1
	dc.b	$F8, 5, $18, $A, $F8

.Frame6:
	dc.b	1
	dc.b	$F8, 5, $10, $A, $F8

.Frame7:
	dc.b	1
	dc.b	$F8, 5, 8, $A, $F8

.Invisible:
	dc.b	0
