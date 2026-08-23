.Scripts:
	dc.w	.Idle-.Scripts
	dc.w	.Hold-.Scripts
	dc.w	.Activate-.Scripts
	dc.w	.Move-.Scripts
	dc.w	.Step-.Scripts
	dc.w	.Stop-.Scripts
.Idle:
	dc.b	$1D,0,1,$FF
.Hold:
	dc.b	$3B,0,$FC
.Activate:
	dc.b	9,4,4,5,$FC
.Move:
	dc.b	9,2,3,2,3,2,3,2,3,2,3,2,3,$FC
.Step:
	dc.b	9,2,3,$FF
.Stop:
	dc.b	9,5,4,4,$FC
