; ------------------------------------------------------------------------------
; Flower-capsule animation scripts. Each record starts with a frame delay and
; ends with $FF to restart. The intact capsule deliberately dwells on frames
; 0 and 1 for the original irregular sequence; released seeds cycle 3-8.
; ------------------------------------------------------------------------------
.Anim:
	dc.w	.Intact-.Anim
	dc.w	.Seed-.Anim

.Intact:
	dc.b	1
	dc.b	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
	dc.b	0, 0, 1, 0, 0, 1, $FF
	even

.Seed:
	dc.b	2, 3, 4, 5, 6, 7, 8, $FF
	even
