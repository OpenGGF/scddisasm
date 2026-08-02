; ------------------------------------------------------------------------------

CollapseLedgeSprites:
	dc.w	@CollapseLedgeSprites_0-*

@CollapseLedgeSprites_0:
	dc.b	$17
	dc.b	$D0, 5, 8, $D, $D8
	dc.b	$D0, 5, 8, $D, $E8
	dc.b	$D0, 5, 8, $D, $F8
	dc.b	$D0, 5, 8, $D, 8
	dc.b	$D0, 5, 8, $D, $18
	dc.b	$E0, 5, 8, $11, $D8
	dc.b	$E0, 5, 8, $11, $E8
	dc.b	$E0, 5, 8, $11, $F8
	dc.b	$E0, 5, 8, $11, 8
	dc.b	$E0, 5, 8, $11, $18
	dc.b	$F0, 5, 0, $19, $D8
	dc.b	$F0, 5, 8, $15, $E8
	dc.b	$F0, 5, 8, $15, $F8
	dc.b	$F0, 5, 8, $15, 8
	dc.b	$F0, 5, 8, $15, $18
	dc.b	0, 5, 8, $25, $D8
	dc.b	0, 5, 0, $1D, $E8
	dc.b	0, 5, 0, $21, $F8
	dc.b	0, 5, 0, $21, 8
	dc.b	0, 5, 8, $1D, $18
	dc.b	$10, 5, 0, $19, $F8
	dc.b	$10, 5, 0, $19, 8
	dc.b	$10, 5, 0, $19, $18

CollapseLedgeData:
	dc.w	@CollapseLedgeData_0-*

@CollapseLedgeData_0:
	dc.b	4
	dc.b	3
	dc.b	$FF
	dc.b	$FF
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	4
	dc.b	0
	dc.b	5
	dc.b	5
	dc.b	5
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6

CollapseLedgeSprites2:
	dc.w	@CollapseLedgeSprites2_0-*
	dc.w	@CollapseLedgeSprites2_1-CollapseLedgeSprites2
	dc.w	@CollapseLedgeSprites2_2-CollapseLedgeSprites2
	dc.w	@CollapseLedgeSprites2_3-CollapseLedgeSprites2
	dc.w	@CollapseLedgeSprites2_4-CollapseLedgeSprites2
	dc.w	@CollapseLedgeSprites2_5-CollapseLedgeSprites2
	dc.w	@CollapseLedgeSprites2_6-CollapseLedgeSprites2

@CollapseLedgeSprites2_0:
	dc.b	1
	dc.b	$F8, 5, 0, $19, $F8

@CollapseLedgeSprites2_1:
	dc.b	1
	dc.b	$F8, 5, 8, $25, $F8

@CollapseLedgeSprites2_2:
	dc.b	1
	dc.b	$F8, 5, 0, $1D, $F8

@CollapseLedgeSprites2_3:
	dc.b	1
	dc.b	$F8, 5, 0, $21, $F8

@CollapseLedgeSprites2_4:
	dc.b	1
	dc.b	$F8, 5, 8, $1D, $F8

@CollapseLedgeSprites2_5:
	dc.b	1
	dc.b	$F8, 5, 8, $15, $F8

@CollapseLedgeSprites2_6:
	dc.b	2
	dc.b	$E8, 5, 8, $D, $F8
	dc.b	$F8, 5, 8, $11, $F8
	dc.b	0

CollapseFloorSprites:
	dc.w	@CollapseFloorSprites_0-*
	dc.w	@CollapseFloorSprites_1-CollapseFloorSprites

@CollapseFloorSprites_0:
	dc.b	$20
	dc.b	$D8, 5, 0, $D, $C0
	dc.b	$D8, 5, 0, $D, $D0
	dc.b	$D8, 5, 0, $D, $E0
	dc.b	$D8, 5, 0, $D, $F0
	dc.b	$D8, 5, 0, $D, 0
	dc.b	$D8, 5, 0, $D, $10
	dc.b	$D8, 5, 0, $D, $20
	dc.b	$D8, 5, 0, $D, $30
	dc.b	$E8, 5, 0, $11, $C0
	dc.b	$E8, 5, 0, $11, $D0
	dc.b	$E8, 5, 0, $11, $E0
	dc.b	$E8, 5, 0, $11, $F0
	dc.b	$E8, 5, 0, $11, 0
	dc.b	$E8, 5, 0, $11, $10
	dc.b	$E8, 5, 0, $11, $20
	dc.b	$E8, 5, 0, $11, $30
	dc.b	$F8, 5, 0, $15, $C0
	dc.b	$F8, 5, 0, $15, $D0
	dc.b	$F8, 5, 0, $15, $E0
	dc.b	$F8, 5, 0, $15, $F0
	dc.b	$F8, 5, 0, $15, 0
	dc.b	$F8, 5, 0, $15, $10
	dc.b	$F8, 5, 0, $15, $20
	dc.b	$F8, 5, 0, $15, $30
	dc.b	8, 5, 0, $21, $C0
	dc.b	8, 5, 0, $21, $D0
	dc.b	8, 5, 0, $21, $E0
	dc.b	8, 5, 0, $21, $F0
	dc.b	8, 5, 0, $21, 0
	dc.b	8, 5, 0, $21, $10
	dc.b	8, 5, 0, $21, $20
	dc.b	8, 5, 0, $21, $30

@CollapseFloorSprites_1:
	dc.b	$18
	dc.b	$E0, 5, 0, $D, $C0
	dc.b	$E0, 5, 0, $D, $D0
	dc.b	$E0, 5, 0, $D, $E0
	dc.b	$E0, 5, 0, $D, $F0
	dc.b	$E0, 5, 0, $D, 0
	dc.b	$E0, 5, 0, $D, $10
	dc.b	$E0, 5, 0, $D, $20
	dc.b	$E0, 5, 0, $D, $30
	dc.b	$F0, 5, 0, $11, $C0
	dc.b	$F0, 5, 0, $11, $D0
	dc.b	$F0, 5, 0, $11, $E0
	dc.b	$F0, 5, 0, $11, $F0
	dc.b	$F0, 5, 0, $11, 0
	dc.b	$F0, 5, 0, $11, $10
	dc.b	$F0, 5, 0, $11, $20
	dc.b	$F0, 5, 0, $11, $30
	dc.b	0, 5, 0, $15, $C0
	dc.b	0, 5, 0, $15, $D0
	dc.b	0, 5, 0, $15, $E0
	dc.b	0, 5, 0, $15, $F0
	dc.b	0, 5, 0, $15, 0
	dc.b	0, 5, 0, $15, $10
	dc.b	0, 5, 0, $15, $20
	dc.b	0, 5, 0, $15, $30

CollapseFloorData:
	dc.w	@CollapseFloorData_0-*
	dc.w	@CollapseFloorData_2-CollapseFloorData

@CollapseFloorData_0:
	dc.b	7
	dc.b	2
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0

@CollapseFloorData_2:
	dc.b	7
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1

CollapseFloorSprites2:
	dc.w	@CollapseFloorSprites2_0-*
	dc.w	@CollapseFloorSprites2_1-CollapseFloorSprites2

@CollapseFloorSprites2_0:
	dc.b	4
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	8, 5, 0, $21, $F8

@CollapseFloorSprites2_1:
	dc.b	3
	dc.b	$E0, 5, 0, $D, $F8
	dc.b	$F0, 5, 0, $11, $F8
	dc.b	0, 5, 0, $15, $F8
	dc.b	0

; ------------------------------------------------------------------------------