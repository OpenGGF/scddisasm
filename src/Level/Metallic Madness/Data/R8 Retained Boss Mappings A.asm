; Each piece is Y, size, tile word, X.
; The final three entries intentionally select shared frames in mappings B.
.MappingsStart:
	dc.w	.Frame0-.MappingsStart
	dc.w	.Frame1-.MappingsStart
	dc.w	.Frame2-.MappingsStart
	dc.w	$DC,$EC,$F7
.Frame0:
	dc.b	8
	dc.b	$F4,0,0,0,$F0
	dc.b	$F4,0,0,1,$F8
	dc.b	$F4,0,0,2,0
	dc.b	$F4,0,0,3,8
	dc.b	$FC,$C,0,4,$F0
	dc.b	4,0,0,8,$F0
	dc.b	4,4,0,9,$F8
	dc.b	4,0,0,$B,8
.Frame1:
	dc.b	8
	dc.b	$F4,0,0,0,$F0
	dc.b	$F4,0,0,1,$F8
	dc.b	$F4,0,0,2,0
	dc.b	$F4,0,0,3,8
	dc.b	$FC,$C,0,4,$F0
	dc.b	4,4,0,$C,$F0
	dc.b	4,0,0,$E,0
	dc.b	4,0,0,$F,8
.Frame2:
	dc.b	3
	dc.b	$F4,4,0,$35,$FB
	dc.b	$F0,$D,0,$10,$F0
	dc.b	0,$D,$10,$10,$F0
