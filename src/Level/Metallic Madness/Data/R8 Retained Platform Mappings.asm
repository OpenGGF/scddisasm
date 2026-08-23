.MappingsStart:
	dc.w	.Frame0-.MappingsStart
	dc.w	.Frame1-.MappingsStart
	dc.w	.Frame2-.MappingsStart
	dc.w	.Empty-.MappingsStart
.Frame0:
	dc.b	7
; Y, size, tile word, X
	dc.b	$90,$B,0,0,$F4
	dc.b	$B0,$B,0,0,$F4
	dc.b	$D0,$B,0,0,$F4
	dc.b	$F0,$B,0,0,$F4
	dc.b	$10,$B,0,0,$F4
	dc.b	$30,$B,0,0,$F4
	dc.b	$50,$B,0,0,$F4
.Frame1:
	dc.b	7
	dc.b	$90,$F,0,$C,8
	dc.b	$B0,$F,0,$C,0
	dc.b	$D0,$F,0,$C,$F8
	dc.b	$F0,$F,0,$C,$F0
	dc.b	$10,$F,0,$C,$E8
	dc.b	$30,$F,0,$C,$E0
	dc.b	$50,$F,0,$C,$D8
.Frame2:
	dc.b	$E
	dc.b	$90,$D,0,$1C,$28
	dc.b	$A0,$D,0,$1C,$20
	dc.b	$B0,$D,0,$1C,$18
	dc.b	$C0,$D,0,$1C,$10
	dc.b	$D0,$D,0,$1C,8
	dc.b	$E0,$D,0,$1C,0
	dc.b	$F0,$D,0,$1C,$F8
	dc.b	0,$D,0,$1C,$F0
	dc.b	$10,$D,0,$1C,$E8
	dc.b	$20,$D,0,$1C,$E0
	dc.b	$30,$D,0,$1C,$D8
	dc.b	$40,$D,0,$1C,$D0
	dc.b	$50,$D,0,$1C,$C8
	dc.b	$60,$D,0,$1C,$C0
.Empty:
	dc.b	0
	even
