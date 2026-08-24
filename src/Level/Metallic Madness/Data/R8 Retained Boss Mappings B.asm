; Each piece is Y, size, tile word, X.
.MappingsStart:
	dc.w	.Frame0-.MappingsStart
	dc.w	.Frame1-.MappingsStart
	dc.w	.Frame2-.MappingsStart
	dc.w	.Frame3-.MappingsStart
	dc.w	.Frame4-.MappingsStart
	dc.w	.Frame5-.MappingsStart
.Frame0:
	dc.b	8
	dc.b	$F4,0,0,$37,$F0
	dc.b	$F4,0,0,1,$F8
	dc.b	$F4,0,0,$38,0
	dc.b	$F4,0,0,3,8
	dc.b	$FC,$C,0,$39,$F0
	dc.b	4,0,0,8,$F0
	dc.b	4,4,0,$3D,$F8
	dc.b	4,0,0,$B,8
.Frame1:
	dc.b	8
	dc.b	$F4,0,0,$37,$F0
	dc.b	$F4,0,0,1,$F8
	dc.b	$F4,0,0,$38,0
	dc.b	$F4,0,0,3,8
	dc.b	$FC,$C,0,$39,$F0
	dc.b	4,4,0,$C,$F0
	dc.b	4,0,0,$3F,0
	dc.b	4,0,0,$F,8
.Frame2:
	dc.b	3
	dc.b	$EF,1,0,$40,$F0
	dc.b	$FF,1,$10,$40,$F0
	dc.b	$EF,$B,0,$42,$F8
.Frame3:
	dc.b	3
	dc.b	$F4,4,0,$35,$FC
	dc.b	$F0,$D,0,$10,$F0
	dc.b	0,$D,$10,$10,$F0
.Frame4:
	dc.b	2
	dc.b	$F0,4,0,$18,$F8
	dc.b	$F8,$E,0,$1A,$F0
.Frame5:
	dc.b	2
	dc.b	$F1,8,0,$26,$F0
	dc.b	$F9,$E,0,$29,$F0
