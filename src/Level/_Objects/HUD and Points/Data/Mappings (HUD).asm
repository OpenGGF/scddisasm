.Map:
	dc.w	.Score-.Map
	dc.w	.Lives-.Map
	dc.w	.DebugPosition-.Map
	dc.w	.Rings-.Map

.Score:
	dc.b	$E
	dc.b	0, 1, 0, 0, 0
	dc.b	0, 5, 0, 2, 8
	dc.b	0, 1, 0, 6, $18
	dc.b	0, 1, 0, 8, $20
	dc.b	0, 9, 0, $1B, $28
	dc.b	0, $D, 0, $21, $40
	dc.b	$10, 9, 0, $A, 0
	dc.b	$10, 1, 0, 8, $18
	dc.b	$10, 1, 0, $29, $28
	dc.b	$10, 0, 0, $18, $30
	dc.b	$10, 5, 0, $2B, $38
	dc.b	$10, 0, 0, $19, $48
	dc.b	$10, 5, 0, $2F, $50
	dc.b	$20, 9, 0, $33, $30
	even

.Lives:
	dc.b	3
	dc.b	0, 5, 0, $39, 0
	dc.b	8, 0, 0, $1A, $10
	dc.b	4, 1, 0, $3D, $18
	even

.DebugPosition:
	dc.b	$B
	dc.b	0, 1, 0, 0, 0
	dc.b	0, 5, 0, 2, 8
	dc.b	0, 1, 0, 6, $18
	dc.b	0, 1, 0, 8, $20
	dc.b	0, 9, 0, $1B, $28
	dc.b	0, 9, 0, $21, $40
	dc.b	$10, 9, 0, $A, 0
	dc.b	$10, 1, 0, 8, $18
	dc.b	$10, 5, 0, $2B, $38
	dc.b	$10, 5, 0, $2F, $48
	dc.b	$20, 9, 0, $33, $30
	even

.Rings:
	dc.b	3
	dc.b	$20, 1, 0, $10, 0
	dc.b	$20, 9, 0, $12, 8
	dc.b	$20, 1, 0, 0, $20
