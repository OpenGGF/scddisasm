.Map:
	dc.w	.RewardTier0-MapSpr_Points
	dc.w	.RewardTier1-MapSpr_Points
	dc.w	.RewardTier2-MapSpr_Points
	dc.w	.RewardTier3-MapSpr_Points
	dc.w	.RewardTier4-MapSpr_Points
	dc.w	.RewardTier5-MapSpr_Points

.RewardTier0:
	dc.b	2
	dc.b	0, 0, 0, 0, $F8
	dc.b	0, 0, 0, 3, 0
	even

.RewardTier1:
	dc.b	2
	dc.b	0, 0, 0, 1, $F8
	dc.b	0, 0, 0, 3, 0
	even

.RewardTier2:
	dc.b	2
	dc.b	0, 0, 0, 2, $F8
	dc.b	0, 0, 0, 3, 0
	even

.RewardTier3:
	dc.b	2
	dc.b	0, 0, 0, 4, $F8
	dc.b	0, 0, 0, 3, 0
	even

.RewardTier4:
	dc.b	1
	dc.b	0, 0, 0, 4, $FC
	even

.RewardTier5:
	dc.b	3
	dc.b	0, 0, 0, 0, $F4
	dc.b	0, 0, 0, 3, $FC
	dc.b	0, 0, 0, 3, 4
