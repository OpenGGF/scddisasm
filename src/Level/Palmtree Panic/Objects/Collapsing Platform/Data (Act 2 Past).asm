; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Past collapsing platform object data
; Tracked-history translation of origin/test:src/r1/collapse_data_2b.asm.
; -------------------------------------------------------------------------

; ------------------------------------------------------------------------------

	even
MapSpr_CollapsePlatform1:
	dc.w	CollapsePlatform1_Map-MapSpr_CollapsePlatform1

CollapsePlatform1_Map:
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

	even
ObjCollapsePlatform_Sizes1:
	dc.w	CollapsePlatformSizes1_0-ObjCollapsePlatform_Sizes1

CollapsePlatformSizes1_0:
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

	even
MapSpr_CollapsePlatform3:
	dc.w	CollapsePlatform3_Map0-MapSpr_CollapsePlatform3
	dc.w	CollapsePlatform3_Map1-MapSpr_CollapsePlatform3
	dc.w	CollapsePlatform3_Map2-MapSpr_CollapsePlatform3
	dc.w	CollapsePlatform3_Map3-MapSpr_CollapsePlatform3
	dc.w	CollapsePlatform3_Map4-MapSpr_CollapsePlatform3
	dc.w	CollapsePlatform3_Map5-MapSpr_CollapsePlatform3
	dc.w	CollapsePlatform3_Map6-MapSpr_CollapsePlatform3

CollapsePlatform3_Map0:
	dc.b	1
	dc.b	$F8, 5, 0, $19, $F8

CollapsePlatform3_Map1:
	dc.b	1
	dc.b	$F8, 5, 8, $25, $F8

CollapsePlatform3_Map2:
	dc.b	1
	dc.b	$F8, 5, 0, $1D, $F8

CollapsePlatform3_Map3:
	dc.b	1
	dc.b	$F8, 5, 0, $21, $F8

CollapsePlatform3_Map4:
	dc.b	1
	dc.b	$F8, 5, 8, $1D, $F8

CollapsePlatform3_Map5:
	dc.b	1
	dc.b	$F8, 5, 8, $15, $F8

CollapsePlatform3_Map6:
	dc.b	2
	dc.b	$E8, 5, 8, $D, $F8
	dc.b	$F8, 5, 8, $11, $F8
	dc.b	0

	even
MapSpr_CollapsePlatform2:
	dc.w	CollapsePlatform2_Map0-MapSpr_CollapsePlatform2
	dc.w	CollapsePlatform2_Map1-MapSpr_CollapsePlatform2

CollapsePlatform2_Map0:
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

CollapsePlatform2_Map1:
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

	even
ObjCollapsePlatform_Sizes2:
	dc.w	CollapsePlatformSizes2_0-ObjCollapsePlatform_Sizes2
	dc.w	CollapsePlatformSizes2_2-ObjCollapsePlatform_Sizes2

CollapsePlatformSizes2_0:
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

CollapsePlatformSizes2_2:
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

even
MapSpr_CollapsePlatform4:
	dc.w	CollapsePlatform4_Map0-MapSpr_CollapsePlatform4
	dc.w	CollapsePlatform4_Map1-MapSpr_CollapsePlatform4

CollapsePlatform4_Map0:
	dc.b	4
	dc.b	$D8, 5, 0, $D, $F8
	dc.b	$E8, 5, 0, $11, $F8
	dc.b	$F8, 5, 0, $15, $F8
	dc.b	8, 5, 0, $21, $F8

CollapsePlatform4_Map1:
	dc.b	3
	dc.b	$E0, 5, 0, $D, $F8
	dc.b	$F0, 5, 0, $11, $F8
	dc.b	0, 5, 0, $15, $F8
	dc.b	0

; ------------------------------------------------------------------------------
