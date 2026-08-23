.Scripts:
	dc.w	.Idle-.Scripts
	dc.w	.Hold-.Scripts
	dc.w	.Activate-.Scripts
	dc.w	.Move-.Scripts
	dc.w	.Step-.Scripts
	dc.w	.Stop-.Scripts
.Idle:
	dc.b	9,0,1,$FF
.Hold:
	dc.b	0,0,$FC
.Activate:
	dc.b	3,4,4,5,$FC
.Move:
	dc.b	4,2,3,2,3,2,3,$FC
.Step:
	dc.b	4,2,3,$FF
.Stop:
	dc.b	4,5,4,4,$FC
