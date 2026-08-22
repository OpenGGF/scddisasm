; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Present PLC lists
; -------------------------------------------------------------------------

PLCLists:
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Std-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Section1-PLCLists
	dc.w	PLC_Section2-PLCLists
	dc.w	PLC_Section3-PLCLists
	dc.w	PLC_Section4-PLCLists
	dc.w	PLC_Update0-PLCLists
	dc.w	PLC_Update1-PLCLists
	dc.w	PLC_Update2-PLCLists
	dc.w	PLC_Update3-PLCLists
	dc.w	PLC_Update4-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Results-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Signpost-PLCLists

PLC_Stage:
	dc.w	1
	dc.l	Art_LevelTiles
	dc.w	0
	dc.l	Art_Checkpoint
	dc.w	$D960

PLC_Std:
	dc.w	$D
	dc.l	Art_Spikes
	dc.w	$6600
	dc.l	Art_SpringWheel
	dc.w	$6700
	dc.l	Art_TunnelDoor
	dc.w	$69C0
	dc.l	Art_TitleCard
	dc.w	$6C00
	dc.l	Art_TitleCardText
	dc.w	$7A00
	dc.l	Art_Platform
	dc.w	$97C0
	dc.l	Art_GoalPost
	dc.w	$9EE0
	dc.l	Art_Springs
	dc.w	$A400
	dc.l	Art_HUD
	dc.w	$AD00
	dc.l	Art_MonitorTimePosts
	dc.w	$B500
	dc.l	Art_Explosions
	dc.w	$D000
	dc.l	Art_Points
	dc.w	$D8C0
	dc.l	Art_Flower
	dc.w	$DAE0
	dc.l	Art_Rings
	dc.w	$F5C0

PLC_Section0:
	dc.w	$A
	dc.l	Art_FloatBlock
	dc.w	$6B40
	dc.l	Art_Boulder
	dc.w	$6D80
	dc.l	Art_SpinningDisc
	dc.w	$7000
	dc.l	Art_Animals
	dc.w	$71E0
	dc.l	Art_PataBata
	dc.w	$74E0
	dc.l	Art_Springboard
	dc.w	$7B60
	dc.l	Art_LogShadow
	dc.w	$7E00
	dc.l	Art_Anton
	dc.w	$8000
	dc.l	Art_Swing
	dc.w	$8300
	dc.l	Art_Tamabboh
	dc.w	$8580
	dc.l	Art_DiagonalSpring
	dc.w	$9200

PLC_Section1:
	dc.w	9
	dc.l	Art_FloatBlock
	dc.w	$6B40
	dc.l	Art_Boulder
	dc.w	$6D80
	dc.l	Art_SpinningDisc
	dc.w	$7000
	dc.l	Art_Animals
	dc.w	$71E0
	dc.l	Art_Mosqui
	dc.w	$74E0
	dc.l	Art_LogShadow
	dc.w	$7E00
	dc.l	Art_Anton
	dc.w	$8000
	dc.l	Art_Swing
	dc.w	$8300
	dc.l	Art_Tamabboh
	dc.w	$8580
	dc.l	Art_DiagonalSpring
	dc.w	$9200

PLC_Section2:
	dc.w	8
	dc.l	Art_FloatBlock
	dc.w	$6B40
	dc.l	Art_Boulder
	dc.w	$6D80
	dc.l	Art_SpinningDisc
	dc.w	$7000
	dc.l	Art_Animals
	dc.w	$71E0
	dc.l	Art_TunnelDoorSplash
	dc.w	$74E0
	dc.l	Art_RobotGenWithered
	dc.w	$8000
	dc.l	Art_Swing
	dc.w	$8300
	dc.l	Art_Tamabboh
	dc.w	$8580
	dc.l	Art_DiagonalSpring
	dc.w	$9200

PLC_Section3:
	dc.w	9
	dc.l	Art_FloatBlock
	dc.w	$6B40
	dc.l	Art_Boulder
	dc.w	$6D80
	dc.l	Art_SpinningDisc
	dc.w	$7000
	dc.l	Art_Animals
	dc.w	$71E0
	dc.l	Art_PataBata
	dc.w	$74E0
	dc.l	Art_Anton
	dc.w	$7B60
	dc.l	Art_RobotGenWithered
	dc.w	$8000
	dc.l	Art_Swing
	dc.w	$8300
	dc.l	Art_Tamabboh
	dc.w	$8580
	dc.l	Art_DiagonalSpring
	dc.w	$9200

PLC_Section4:
	dc.w	8
	dc.l	Art_FloatBlock
	dc.w	$6B40
	dc.l	Art_Boulder
	dc.w	$6D80
	dc.l	Art_SpinningDisc
	dc.w	$7000
	dc.l	Art_Animals
	dc.w	$71E0
	dc.l	Art_PataBata
	dc.w	$74E0
	dc.l	Art_TagaTaga
	dc.w	$7B60
	dc.l	Art_Swing
	dc.w	$8300
	dc.l	Art_Tamabboh
	dc.w	$8580
	dc.l	Art_DiagonalSpring
	dc.w	$9200

PLC_Update0:
	dc.w	4
	dc.l	Art_SpinningDisc
	dc.w	$7000
	dc.l	Art_Animals
	dc.w	$71E0
	dc.l	Art_PataBata
	dc.w	$74E0
	dc.l	Art_Springboard
	dc.w	$7B60
	dc.l	Art_DiagonalSpring
	dc.w	$9200

PLC_Update1:
	dc.w	2
	dc.l	Art_Mosqui
	dc.w	$74E0
	dc.l	Art_LogShadow
	dc.w	$7E00
	dc.l	Art_Anton
	dc.w	$8000

PLC_Update2:
	dc.w	1
	dc.l	Art_TunnelDoorSplash
	dc.w	$74E0
	dc.l	Art_RobotGenWithered
	dc.w	$8000

PLC_Update3:
	dc.w	2
	dc.l	Art_PataBata
	dc.w	$74E0
	dc.l	Art_Anton
	dc.w	$7B60
	dc.l	Art_RobotGenWithered
	dc.w	$8000

PLC_Update4:
	dc.w	0
	dc.l	Art_TagaTaga
	dc.w	$7B60

PLC_Results:
	dc.w	0
	dc.l	Art_Results
	dc.w	$7880

PLC_Signpost:
	dc.w	2
	dc.l	Art_Signpost
	dc.w	$8780
	dc.l	Art_BigRing
	dc.w	$9100
	dc.l	Art_BigRingFlash
	dc.w	$7DE0
