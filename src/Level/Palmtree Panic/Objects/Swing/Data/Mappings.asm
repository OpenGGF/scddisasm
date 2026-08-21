; -------------------------------------------------------------------------
; Palmtree Panic swinging platform mappings
; -------------------------------------------------------------------------

MapSpr_Swing:
	dc.w	.Swing0-MapSpr_Swing
	dc.w	.Swing1-MapSpr_Swing
	dc.w	.Swing2-MapSpr_Swing

.Swing0:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8
	even

.Swing1:
	dc.b	2
	dc.b	$F8, 9, 0, 8, $E8
	dc.b	$F8, 9, 8, 8, 0
	even

.Swing2:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8
	even
