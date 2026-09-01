.Anim:
	dc.w	.Vertical-.Anim
	dc.w	.Diagonal-.Anim

.Vertical:
	dc.b	0
	dc.b	0, 0, 0, 2, 2, 2, 2, 2
	dc.b	2, 0
	dc.b	$FC
	even

.Diagonal:
	dc.b	0
	dc.b	4, 3, 3, 5, 5, 5, 5, 5
	dc.b	5, 3
	dc.b	$FC
