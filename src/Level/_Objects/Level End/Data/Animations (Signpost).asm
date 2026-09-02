; ------------------------------------------------------------------------------
; Signpost spin animation: delay, observable face/turn-frame sequence, restart.
; The final zero byte is alignment after the $FF command.
; ------------------------------------------------------------------------------
.Anim:
	dc.w	.Spin-.Anim

.Spin:
	dc.b	1, 0, 1, 2, 4, 3, 3, 1, 2, 4, $FF
	even
