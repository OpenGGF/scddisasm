.Anim:
	dc.w	.OneUp-.Anim
	dc.w	.Rings-.Anim
	dc.w	.Shield-.Anim
	dc.w	.Invincibility-.Anim
	dc.w	.SpeedShoes-.Anim
	dc.w	.TimeStop-.Anim
	dc.w	.CombineRing-.Anim
	dc.w	.S-.Anim
	dc.w	.PastPost-.Anim
	dc.w	.FuturePost-.Anim

.OneUp:
	dc.b	1, $10, 0, 0, 8, 0, 0, 9, 0, 0, $FF
	even

.Rings:
	dc.b	1, $10, 1, 1, 8, 1, 1, 9, 1, 1, $FF
	even

.Shield:
	dc.b	1, $10, 2, 2, 8, 2, 2, 9, 2, 2, $FF
	even

.Invincibility:
	dc.b	1, $10, 3, 3, 8, 3, 3, 9, 3, 3, $FF
	even

.SpeedShoes:
	dc.b	1, $10, 4, 4, 8, 4, 4, 9, 4, 4, $FF
	even

.TimeStop:
	dc.b	1, $10, 5, 5, 8, 5, 5, 9, 5, 5, $FF
	even

.CombineRing:
	dc.b	1, $10, 6, 6, 8, 6, 6, 9, 6, 6, $FF
	even

.S:
	dc.b	1, $10, 7, 7, 8, 7, 7, 9, 7, 7, $FF
	even

.PastPost:
	dc.b	1, $A, $E, $F, $E, $B, $E, $F, $E, $FF
	even

.FuturePost:
	dc.b	1, $C, $E, $F, $E, $D, $E, $F, $E, $FF
