; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 time-variant PLC lists
; -------------------------------------------------------------------------

PLCLists:
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Std-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Stage-PLCLists
	if CC_VARIANT=1
	dc.w	PLC_Animals-PLCLists
	dc.w	PLC_Projector-PLCLists
	dc.w	PLC_Section1-PLCLists
	dc.w	PLC_Section2-PLCLists
	dc.w	PLC_Section3-PLCLists
	dc.w	PLC_Update0-PLCLists
	dc.w	PLC_Update1-PLCLists
	dc.w	PLC_Update2-PLCLists
	dc.w	PLC_Update3-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Section0-PLCLists
	else
	rept	9
	dc.w	PLC_Section0-PLCLists
	endr
	endif
	dc.w	PLC_Results-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Signpost-PLCLists

PLC_Stage:
	dc.w	0
	dc.l	StageGfx
	dc.w	0

PLC_Std:
	if CC_VARIANT=1
	dc.w	$E
	dc.l	Art_Animals
	dc.w	$F2E0
	else
	dc.w	$E
	dc.l	Art_GoalPost
	dc.w	$6000
	endif
	dc.l	Art_TitleCard
	dc.w	$6C00
	dc.l	Art_TitleCardText
	dc.w	$7A00
	dc.l	Art_Tentou
	dc.w	$8D40
	dc.l	Art_SpikeBomb
	dc.w	$92A0
	dc.l	Art_Flipper
	dc.w	$93A0
	dc.l	Art_Bumper
	dc.w	$99C0
	dc.l	Art_DiagonalSpring
	dc.w	$9E40
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

	if CC_VARIANT=1

PLC_Section0:
	dc.w	$C
	dc.l	Art_GoalPost
	dc.w	$6000
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_OneWayBarrier
	dc.w	$6E20
	dc.l	Art_FireShoot
	dc.w	$6F20
	dc.l	Art_RetractBlock
	dc.w	$73E0
	dc.l	Art_Teleporter
	dc.w	$75E0
	dc.l	Art_Pocket
	dc.w	$75E0
	dc.l	Art_SpikeChain
	dc.w	$77A0
	dc.l	Art_KamaKama
	dc.w	$7E40
	dc.l	Art_Ga
	dc.w	$8420

PLC_Section1:
	dc.w	$B
	dc.l	Art_GoalPost
	dc.w	$6000
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_RobotTransportB
	dc.w	$67C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_OneWayBarrier
	dc.w	$6E20
	dc.l	Art_FireShoot
	dc.w	$6F20
	dc.l	Art_RetractBlock
	dc.w	$73E0
	dc.l	Art_Teleporter
	dc.w	$75E0
	dc.l	Art_Pocket
	dc.w	$75E0
	dc.l	Art_SpikeChain
	dc.w	$77A0
	dc.l	Art_KamaKama
	dc.w	$7E40
	dc.l	Art_Ga
	dc.w	$8420

PLC_Section2:
	dc.w	$A
	dc.l	Art_GoalPost
	dc.w	$6000
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Hologram
	dc.w	$67C0
	dc.l	Art_OneWayBarrier
	dc.w	$6E20
	dc.l	Art_FireShoot
	dc.w	$6F20
	dc.l	Art_RetractBlock
	dc.w	$73E0
	dc.l	Art_Teleporter
	dc.w	$75E0
	dc.l	Art_Pocket
	dc.w	$75E0
	dc.l	Art_SpikeChain
	dc.w	$77A0
	dc.l	Art_KamaKama
	dc.w	$7E40
	dc.l	Art_Ga
	dc.w	$8420

PLC_Section3:
	dc.w	$C
	dc.l	Art_GoalPost
	dc.w	$6000
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_OneWayBarrier
	dc.w	$6E20
	dc.l	Art_FireShoot
	dc.w	$6F20
	dc.l	Art_RetractBlock
	dc.w	$73E0
	dc.l	Art_Teleporter
	dc.w	$75E0
	dc.l	Art_Pocket
	dc.w	$75E0
	dc.l	Art_SpikeChain
	dc.w	$77A0
	dc.l	Art_KamaKama
	dc.w	$7E40
	dc.l	Art_Ga
	dc.w	$8420

PLC_Update0:
	dc.w	1
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0

PLC_Update1:
	dc.w	1
	dc.l	Art_RobotTransportB
	dc.w	$67C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0

PLC_Update2:
	dc.w	0
	dc.l	Art_Hologram
	dc.w	$67C0

PLC_Update3:
	dc.w	2
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0

PLC_Animals:
	dc.w	0
	dc.l	Art_Animals
	dc.w	$F2E0

PLC_Projector:
	dc.w	0
	dc.l	Art_HologramAnimals
	dc.w	$F2E0

	else

PLC_Section0:
	dc.w	$C
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	if CC_VARIANT=2
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	else
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	endif
	dc.l	Art_OneWayBarrier
	dc.w	$6E20
	dc.l	Art_FireShoot
	dc.w	$6F20
	dc.l	Art_RetractBlock
	dc.w	$73E0
	dc.l	Art_Teleporter
	dc.w	$75E0
	dc.l	Art_Pocket
	dc.w	$75E0
	dc.l	Art_SpikeChain
	dc.w	$77A0
	dc.l	Art_Animals
	dc.w	$7B40
	dc.l	Art_KamaKama
	dc.w	$7E40
	dc.l	Art_Ga
	dc.w	$8420

	endif

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
