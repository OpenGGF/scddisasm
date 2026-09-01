.Anim:
	dc.w	.Invisible-.Anim
	dc.w	.Appear-.Anim
	dc.w	.Vanish-.Anim

.Invisible:
	dc.b	2, 5, $FF
	even

.Appear:
	dc.b	2, 1, 5, 2, 5, 3, 5, 4, 5, $FC

.Vanish:
	dc.b	2, 1, 0, 2, 0, 3, 0, 4, 0, $FC
