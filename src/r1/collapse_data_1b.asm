; ------------------------------------------------------------------------------

CollapseLedgeSprites:
	dc.w	@CollapseLedgeSprites_0-*
	dc.w	@CollapseLedgeSprites_1-CollapseLedgeSprites

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

@CollapseLedgeSprites_1:
	dc.b	$10
	dc.b	$D8, 5, 8, $D, $E0
	dc.b	$D8, 5, 8, $D, $F0
	dc.b	$D8, 5, 8, $D, 0
	dc.b	$D8, 5, 8, $D, $10
	dc.b	$E8, 5, 8, $11, $E0
	dc.b	$E8, 5, 8, $11, $F0
	dc.b	$E8, 5, 8, $11, 0
	dc.b	$E8, 5, 8, $11, $10
	dc.b	$F8, 5, 8, $15, $E0
	dc.b	$F8, 5, 8, $15, $F0
	dc.b	$F8, 5, 8, $15, 0
	dc.b	$F8, 5, 8, $15, $10
	dc.b	8, 5, 8, $25, $E0
	dc.b	8, 5, 0, $1D, $F0
	dc.b	8, 5, 0, $21, 0
	dc.b	8, 5, 0, $21, $10
	dc.b	0

CollapseLedgeData:
	dc.w	@CollapseLedgeData_0-*
	dc.w	@CollapseLedgeData_2-CollapseLedgeData

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

@CollapseLedgeData_2:
	dc.b	3
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	5
	dc.b	5
	dc.b	5
	dc.b	5
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
	dc.w	@CollapseFloorSprites_0-CollapseFloorSprites
	dc.w	@CollapseFloorSprites_2-CollapseFloorSprites
	dc.w	@CollapseFloorSprites_3-CollapseFloorSprites
	dc.w	@CollapseFloorSprites_4-CollapseFloorSprites
	dc.w	@CollapseFloorSprites_5-CollapseFloorSprites

@CollapseFloorSprites_0:
	dc.b	$12
	dc.b	$E0, 5, 0, $D, $D0
	dc.b	$E0, 5, 0, $D, $E0
	dc.b	$E0, 5, 0, $D, $F0
	dc.b	$E0, 5, 0, $D, 0
	dc.b	$E0, 5, 0, $D, $10
	dc.b	$E0, 5, 0, $D, $20
	dc.b	$F0, 5, 0, $11, $D0
	dc.b	$F0, 5, 0, $11, $E0
	dc.b	$F0, 5, 0, $11, $F0
	dc.b	$F0, 5, 0, $11, 0
	dc.b	$F0, 5, 0, $11, $10
	dc.b	$F0, 5, 0, $11, $20
	dc.b	0, 5, 0, $15, $D0
	dc.b	0, 5, 0, $15, $E0
	dc.b	0, 5, 0, $15, $F0
	dc.b	0, 5, 0, $15, 0
	dc.b	0, 5, 0, $15, $10
	dc.b	0, 5, 0, $15, $20

@CollapseFloorSprites_2:
	dc.b	$2D
	dc.b	$D0, 5, 0, $D, $B8
	dc.b	$D0, 5, 0, $D, $C8
	dc.b	$D0, 5, 0, $D, $D8
	dc.b	$D0, 5, 0, $D, $E8
	dc.b	$D0, 5, 0, $D, $F8
	dc.b	$D0, 5, 0, $D, 8
	dc.b	$D0, 5, 0, $D, $18
	dc.b	$D0, 5, 0, $D, $28
	dc.b	$D0, 5, 0, $D, $38
	dc.b	$E0, 5, 0, $11, $B8
	dc.b	$E0, 5, 0, $11, $C8
	dc.b	$E0, 5, 0, $11, $D8
	dc.b	$E0, 5, 0, $11, $E8
	dc.b	$E0, 5, 0, $11, $F8
	dc.b	$E0, 5, 0, $11, 8
	dc.b	$E0, 5, 0, $11, $18
	dc.b	$E0, 5, 0, $11, $28
	dc.b	$E0, 5, 0, $11, $38
	dc.b	$F0, 5, 0, $15, $B8
	dc.b	$F0, 5, 0, $15, $C8
	dc.b	$F0, 5, 0, $15, $D8
	dc.b	$F0, 5, 0, $15, $E8
	dc.b	$F0, 5, 0, $15, $F8
	dc.b	$F0, 5, 0, $15, 8
	dc.b	$F0, 5, 0, $15, $18
	dc.b	$F0, 5, 0, $15, $28
	dc.b	$F0, 5, 0, $15, $38
	dc.b	0, 5, 0, $2B, $B8
	dc.b	0, 5, 0, $2B, $C8
	dc.b	0, 5, 0, $2B, $D8
	dc.b	0, 5, 0, $2B, $E8
	dc.b	0, 5, 0, $2B, $F8
	dc.b	0, 5, 0, $2B, 8
	dc.b	0, 5, 0, $2B, $18
	dc.b	0, 5, 0, $2B, $28
	dc.b	0, 5, 0, $2B, $38
	dc.b	$10, 5, 0, $1D, $B8
	dc.b	$10, 5, 0, $21, $C8
	dc.b	$10, 5, 0, $21, $D8
	dc.b	$10, 5, 0, $21, $E8
	dc.b	$10, 5, 0, $21, $F8
	dc.b	$10, 5, 0, $21, 8
	dc.b	$10, 5, 0, $21, $18
	dc.b	$10, 5, 0, $21, $28
	dc.b	$10, 5, 8, $1D, $38

@CollapseFloorSprites_3:
	dc.b	$14
	dc.b	$D8, 5, 0, $D, $D8
	dc.b	$D8, 5, 0, $D, $E8
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$D8, 5, 0, $D, 8
	dc.b	$D8, 5, 0, $D, $18
	dc.b	$E8, 5, 0, $11, $D8
	dc.b	$E8, 5, 0, $11, $E8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$E8, 5, 0, $11, 8
	dc.b	$E8, 5, 0, $11, $18
	dc.b	$F8, 5, 0, $15, $D8
	dc.b	$F8, 5, 0, $15, $E8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	$F8, 5, 0, $15, 8
	dc.b	$F8, 5, 0, $15, $18
	dc.b	8, 5, 0, $1D, $D8
	dc.b	8, 5, 0, $21, $E8
	dc.b	8, 5, 0, $21, $F8
	dc.b	8, 5, 0, $21, 8
	dc.b	8, 5, 0, $21, $18

@CollapseFloorSprites_4:
	dc.b	$14
	dc.b	$D8, 5, 0, $D, $D8
	dc.b	$D8, 5, 0, $D, $E8
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$D8, 5, 0, $D, 8
	dc.b	$D8, 5, 0, $D, $18
	dc.b	$E8, 5, 0, $11, $D8
	dc.b	$E8, 5, 0, $11, $E8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$E8, 5, 0, $11, 8
	dc.b	$E8, 5, 0, $11, $18
	dc.b	$F8, 5, 0, $15, $D8
	dc.b	$F8, 5, 0, $15, $E8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	$F8, 5, 0, $15, 8
	dc.b	$F8, 5, 0, $15, $18
	dc.b	8, 5, 0, $21, $D8
	dc.b	8, 5, 0, $21, $E8
	dc.b	8, 5, 0, $21, $F8
	dc.b	8, 5, 0, $21, 8
	dc.b	8, 5, 8, $1D, $18

@CollapseFloorSprites_5:
	dc.b	$32
	dc.b	$D0, 5, 0, $D, $B0
	dc.b	$D0, 5, 0, $D, $C0
	dc.b	$D0, 5, 0, $D, $D0
	dc.b	$D0, 5, 0, $D, $E0
	dc.b	$D0, 5, 0, $D, $F0
	dc.b	$D0, 5, 0, $D, 0
	dc.b	$D0, 5, 0, $D, $10
	dc.b	$D0, 5, 0, $D, $20
	dc.b	$D0, 5, 0, $D, $30
	dc.b	$D0, 5, 0, $D, $40
	dc.b	$E0, 5, 0, $11, $B0
	dc.b	$E0, 5, 0, $11, $C0
	dc.b	$E0, 5, 0, $11, $D0
	dc.b	$E0, 5, 0, $11, $E0
	dc.b	$E0, 5, 0, $11, $F0
	dc.b	$E0, 5, 0, $11, 0
	dc.b	$E0, 5, 0, $11, $10
	dc.b	$E0, 5, 0, $11, $20
	dc.b	$E0, 5, 0, $11, $30
	dc.b	$E0, 5, 0, $11, $40
	dc.b	$F0, 5, 0, $15, $B0
	dc.b	$F0, 5, 0, $15, $C0
	dc.b	$F0, 5, 0, $15, $D0
	dc.b	$F0, 5, 0, $15, $E0
	dc.b	$F0, 5, 0, $15, $F0
	dc.b	$F0, 5, 0, $15, 0
	dc.b	$F0, 5, 0, $15, $10
	dc.b	$F0, 5, 0, $15, $20
	dc.b	$F0, 5, 0, $15, $30
	dc.b	$F0, 5, 0, $15, $40
	dc.b	0, 5, 0, $2B, $B0
	dc.b	0, 5, 0, $2B, $C0
	dc.b	0, 5, 0, $2B, $D0
	dc.b	0, 5, 0, $2B, $E0
	dc.b	0, 5, 0, $2B, $F0
	dc.b	0, 5, 0, $2B, 0
	dc.b	0, 5, 0, $2B, $10
	dc.b	0, 5, 0, $2B, $20
	dc.b	0, 5, 0, $2B, $30
	dc.b	0, 5, 0, $2B, $40
	dc.b	$10, 5, 0, $1D, $B0
	dc.b	$10, 5, 0, $21, $C0
	dc.b	$10, 5, 0, $21, $D0
	dc.b	$10, 5, 0, $21, $E0
	dc.b	$10, 5, 0, $21, $F0
	dc.b	$10, 5, 0, $21, 0
	dc.b	$10, 5, 0, $21, $10
	dc.b	$10, 5, 0, $21, $20
	dc.b	$10, 5, 0, $21, $30
	dc.b	$10, 5, 8, $1D, $40

CollapseFloorData:
	dc.w	@CollapseFloorData_0-*
	dc.w	@CollapseFloorData_0-CollapseFloorData
	dc.w	@CollapseFloorData_4-CollapseFloorData
	dc.w	@CollapseFloorData_6-CollapseFloorData
	dc.w	@CollapseFloorData_8-CollapseFloorData
	dc.w	@CollapseFloorData_A-CollapseFloorData

@CollapseFloorData_0:
	dc.b	5
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0

@CollapseFloorData_4:
	dc.b	8
	dc.b	3
	dc.b	1
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	2

@CollapseFloorData_6:
	dc.b	4
	dc.b	2
	dc.b	4
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6

@CollapseFloorData_8:
	dc.b	4
	dc.b	2
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	6
	dc.b	5

@CollapseFloorData_A:
	dc.b	9
	dc.b	3
	dc.b	1
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	0

CollapseFloorSprites2:
	dc.w	@CollapseFloorSprites2_0-*
	dc.w	@CollapseFloorSprites2_1-CollapseFloorSprites2
	dc.w	@CollapseFloorSprites2_2-CollapseFloorSprites2
	dc.w	@CollapseFloorSprites2_3-CollapseFloorSprites2
	dc.w	@CollapseFloorSprites2_4-CollapseFloorSprites2
	dc.w	@CollapseFloorSprites2_5-CollapseFloorSprites2
	dc.w	@CollapseFloorSprites2_6-CollapseFloorSprites2

@CollapseFloorSprites2_0:
	dc.b	3
	dc.b	$E0, 5, 0, $D, $F8
	dc.b	$F0, 5, 0, $11, $F8
	dc.b	0, 5, 0, $15, $F8

@CollapseFloorSprites2_1:
	dc.b	5
	dc.b	$D0, 5, 0, $D, $F8
	dc.b	$E0, 5, 0, $11, $F8
	dc.b	$F0, 5, 0, $15, $F8
	dc.b	0, 5, 0, $2B, $F8
	dc.b	$10, 5, 0, $1D, $F8

@CollapseFloorSprites2_2:
	dc.b	5
	dc.b	$D0, 5, 0, $D, $F8
	dc.b	$E0, 5, 0, $11, $F8
	dc.b	$F0, 5, 0, $15, $F8
	dc.b	0, 5, 0, $2B, $F8
	dc.b	$10, 5, 8, $1D, $F8

@CollapseFloorSprites2_3:
	dc.b	5
	dc.b	$D0, 5, 0, $D, $F8
	dc.b	$E0, 5, 0, $11, $F8
	dc.b	$F0, 5, 0, $15, $F8
	dc.b	0, 5, 0, $2B, $F8
	dc.b	$10, 5, 0, $21, $F8

@CollapseFloorSprites2_4:
	dc.b	4
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	8, 5, 0, $1D, $F8

@CollapseFloorSprites2_5:
	dc.b	4
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	8, 5, 8, $1D, $F8

@CollapseFloorSprites2_6:
	dc.b	4
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	8, 5, 0, $21, $F8
	dc.b	0

; ------------------------------------------------------------------------------
