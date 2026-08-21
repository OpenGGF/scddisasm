; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Good Future PLC lists
; -------------------------------------------------------------------------

PLCLists:
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Main-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Section1-PLCLists
	dc.w	PLC_Section2-PLCLists
	dc.w	PLC_Section3-PLCLists
	dc.w	PLC_Section4-PLCLists
	dc.w	PLC_Section5-PLCLists
	dc.w	PLC_Update0-PLCLists
	dc.w	PLC_Update1-PLCLists
	dc.w	PLC_Update2-PLCLists
	dc.w	PLC_Update3-PLCLists
	dc.w	PLC_Update4-PLCLists
	dc.w	PLC_Update5-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Results-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Signpost-PLCLists

PLC_Stage:
	dc.w	0
	dc.l	StageGfx
	dc.w	0

PLC_Main:
	dc.w	$E
	dc.l	Art_TunnelDoor
	dc.w	$67C0
	dc.l	Art_Block
	dc.w	$6940
	dc.l	Art_TitleCard
	dc.w	$6C00
	dc.l	Art_TitleCardText
	dc.w	$7A00
	dc.l	Art_Checkpoint
	dc.w	$9000
	dc.l	Art_Spring45
	dc.w	$9200
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
	dc.l	Art_SpikesV2
	dc.w	$6400
	dc.l	Art_SpringWheel
	dc.w	$6500
	dc.l	Art_Boulder
	dc.w	$6B80
	dc.l	Art_SpinningDisc
	dc.w	$6E00
	dc.l	Art_LogInside
	dc.w	$6FE0
	dc.l	Art_SceneryCD
	dc.w	$71E0
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Springboard
	dc.w	$7B80
	dc.l	Art_PataBata
	dc.w	$7E40
	dc.l	Art_Tamabboh
	dc.w	$84C0
	dc.l	Art_Animals
	dc.w	$8C20

PLC_Section1:
	dc.w	$A
	dc.l	Art_SpikesV2
	dc.w	$6400
	dc.l	Art_SpringWheel
	dc.w	$6500
	dc.l	Art_Boulder
	dc.w	$6B80
	dc.l	Art_SpinningDisc
	dc.w	$6E00
	dc.l	Art_LogInside
	dc.w	$6FE0
	dc.l	Art_SceneryCD
	dc.w	$71E0
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Anton
	dc.w	$7B80
	dc.l	Art_PataBata
	dc.w	$7E40
	dc.l	Art_Tamabboh
	dc.w	$84C0
	dc.l	Art_Animals
	dc.w	$8C20

PLC_Section2:
	dc.w	9
	dc.l	Art_SpikesV2
	dc.w	$6400
	dc.l	Art_SpringWheel
	dc.w	$6500
	dc.l	Art_Boulder
	dc.w	$6B80
	dc.l	Art_SpinningDisc
	dc.w	$6E00
	dc.l	Art_Swing
	dc.w	$6FE0
	dc.l	Art_Splash
	dc.w	$7260
	dc.l	Art_PataBata
	dc.w	$7E40
	dc.l	Art_Tamabboh
	dc.w	$84C0
	dc.l	Art_Animals
	dc.w	$8C20

PLC_Section3:
	dc.w	$A
	dc.l	Art_SpikesV2
	dc.w	$6400
	dc.l	Art_SpringWheel
	dc.w	$6500
	dc.l	Art_Boulder
	dc.w	$6B80
	dc.l	Art_SpinningDisc
	dc.w	$6E00
	dc.l	Art_Swing
	dc.w	$6FE0
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Anton
	dc.w	$7B80
	dc.l	Art_PataBata
	dc.w	$7E40
	dc.l	Art_Tamabboh
	dc.w	$84C0
	dc.l	Art_Animals
	dc.w	$8C20

PLC_Section4:
	dc.w	$A
	dc.l	Art_SpikesV2
	dc.w	$6400
	dc.l	Art_SpringWheel
	dc.w	$6500
	dc.l	Art_Boulder
	dc.w	$6B80
	dc.l	Art_SpinningDisc
	dc.w	$6E00
	dc.l	Art_Swing
	dc.w	$6FE0
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Anton
	dc.w	$7B80
	dc.l	Art_TagaTaga
	dc.w	$7E40
	dc.l	Art_Tamabboh
	dc.w	$84C0
	dc.l	Art_Animals
	dc.w	$8C20

PLC_Section5:
	dc.w	9
	dc.l	Art_SpikesV2
	dc.w	$6400
	dc.l	Art_SpringWheel
	dc.w	$6500
	dc.l	Art_Boulder
	dc.w	$6B80
	dc.l	Art_SpinningDisc
	dc.w	$6E00
	dc.l	Art_PataBata
	dc.w	$6FE0
	dc.l	Art_Springboard
	dc.w	$7B80
	dc.l	Art_TagaTaga
	dc.w	$7E40
	dc.l	Art_Tamabboh
	dc.w	$84C0
	dc.l	Art_Animals
	dc.w	$8C20

PLC_Update0:
	dc.w	1
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Springboard
	dc.w	$7B80

PLC_Update1:
	dc.w	3
	dc.l	Art_LogInside
	dc.w	$6FE0
	dc.l	Art_SceneryCD
	dc.w	$71E0
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Anton
	dc.w	$7B80

PLC_Update2:
	dc.w	1
	dc.l	Art_Swing
	dc.w	$6FE0
	dc.l	Art_Splash
	dc.w	$7260

PLC_Update3:
	dc.w	2
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Anton
	dc.w	$7B80
	dc.l	Art_PataBata
	dc.w	$7E40

PLC_Update4:
	dc.w	3
	dc.l	Art_Swing
	dc.w	$6FE0
	dc.l	Art_Mosqui
	dc.w	$7260
	dc.l	Art_Anton
	dc.w	$7B80
	dc.l	Art_TagaTaga
	dc.w	$7E40

PLC_Update5:
	dc.w	1
	dc.l	Art_PataBata
	dc.w	$6FE0
	dc.l	Art_Springboard
	dc.w	$7B80

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
