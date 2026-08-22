; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 3 PLC lists
; -------------------------------------------------------------------------

PLCLists:
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Main-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Boss-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Results-PLCLists

PLC_Stage:
	dc.w	0
	dc.l	StageGfx
	dc.w	0

PLC_Main:
	dc.w	9
	dc.l	Art_TitleCard
	dc.w	$6C00
	dc.l	Art_TitleCardText
	dc.w	$7A00
	dc.l	Art_Boulder
	dc.w	$9FC0
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
	dc.w	3
	dc.l	DoorGfx
	dc.w	$75C0
	dc.l	WaterfallGfx
	dc.w	$7740
	dc.l	AnimalsGfx
	dc.w	$79E0
	dc.l	TamabbohGfx
	dc.w	$7CE0

PLC_Boss:
	dc.w	2
	dc.l	Art_FlowerCapsule
	dc.w	$9020
	dc.l	BossMachineGfx
	dc.w	$6B20
	dc.l	EggmanGfx
	dc.w	$7FA0

PLC_Results:
	dc.w	0
	dc.l	Art_Results
	dc.w	$7880
