.MappingsStart:
	dc.w	.Empty-.MappingsStart
	dc.w	.Visible-.MappingsStart
.Empty:
	dc.b	0
.Visible:
	dc.b	2
; Y, size, tile word, X
	dc.b	$F0,$F,0,0,$E0
	dc.b	$F0,$F,0,0,0
