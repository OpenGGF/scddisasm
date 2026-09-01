.Map:
	dc.w	.OneUp-.Map
	dc.w	.Rings-.Map
	dc.w	.Shield-.Map
	dc.w	.Invincibility-.Map
	dc.w	.SpeedShoes-.Map
	dc.w	.TimeStop-.Map
	dc.w	.CombineRing-.Map
	dc.w	.S-.Map
	dc.w	.Past-.Map
	dc.w	.Future-.Map
	dc.w	.PostPast-.Map
	dc.w	.PostPastFlip-.Map
	dc.w	.PostFuture-.Map
	dc.w	.PostFutureFlip-.Map
	dc.w	.PostTransitionWide-.Map
	dc.w	.PostTransitionNarrow-.Map
	dc.w	.Breaking-.Map
	dc.w	.Broken-.Map
	dc.w	.PastHUD-.Map
	dc.w	.FutureHUD-.Map

.OneUp:
	dc.b	4
	dc.b	$F6, 5, 0, $12, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Rings:
	dc.b	4
	dc.b	$F6, 5, 0, $16, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Shield:
	dc.b	4
	dc.b	$F6, 5, 0, $1A, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Invincibility:
	dc.b	4
	dc.b	$F6, 5, 0, $1E, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.SpeedShoes:
	dc.b	4
	dc.b	$F6, 5, 0, $22, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.TimeStop:
	dc.b	4
	dc.b	$F6, 5, 0, $26, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.CombineRing:
	dc.b	4
	dc.b	$F6, 5, 0, $2A, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.S:
	dc.b	4
	dc.b	$F6, 5, 0, $2E, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Past:
	dc.b	4
	dc.b	$F6, 5, 0, $48, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Future:
	dc.b	4
	dc.b	$F6, 5, 8, $48, $F8
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.PostPast:
	dc.b	5
	dc.b	$D8, $D, 0, $32, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.PostPastFlip:
	dc.b	5
	dc.b	$D8, $D, 8, $32, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.PostFuture:
	dc.b	5
	dc.b	$D8, $D, 0, $3A, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.PostFutureFlip:
	dc.b	5
	dc.b	$D8, $D, 8, $3A, $F0
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.PostTransitionWide:
	dc.b	5
	dc.b	$D8, 5, 0, $42, $F8
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.PostTransitionNarrow:
	dc.b	5
	dc.b	$D8, 1, 0, $46, $FC
	dc.b	$E8, 3, 0, $4C, $F8
	dc.b	$E8, 3, 8, $4C, 0
	dc.b	8, 1, 0, $50, $F8
	dc.b	8, 1, 8, $50, 0
	even

.Breaking:
	dc.b	3
	dc.b	$F0, 6, 0, 0, $F0
	dc.b	$F0, 6, 8, 0, 0
	dc.b	8, $C, 0, 6, $F0
	even

.Broken:
	dc.b	1
	dc.b	0, $D, 0, $A, $F0
	even

.PastHUD:
	dc.b	1
	dc.b	$F8, $D, 0, $32, $F0
	even

.FutureHUD:
	dc.b	1
	dc.b	$F8, $D, 0, $3A, $F0
