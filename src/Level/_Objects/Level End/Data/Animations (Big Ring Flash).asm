; ------------------------------------------------------------------------------
; Big-ring flash animation: delay, eight expansion frames, then delete ($FC).
; ------------------------------------------------------------------------------
.Anim:
	dc.w	.ExpandAndDelete-.Anim

.ExpandAndDelete:
	dc.b	2, 0, 1, 2, 3, 4, 5, 6, 7, $FC
