; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos Act 2 time-variant PLC lists
; -------------------------------------------------------------------------

StageDataIndex:
	if CC2_VARIANT=0
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 5, 5
	elseif CC2_VARIANT=2
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 7, 7
	else
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4
	endif

	if def(CC_LEGACY_GFX_LISTS_ABI)
		if CC_LEGACY_GFX_LISTS_ABI<>0
Art_Animals		EQU	AnimalsGfx
Art_BigRing		EQU	BigRingGfx
Art_Block		EQU	BlockGfx
Art_Bumper		EQU	BumperGfx
Art_Checkpoint		EQU	CheckpointGfx
Art_DiagonalSpring	EQU	Spring45Gfx
Art_Explosions		EQU	ExplosionGfx
Art_FireShoot		EQU	FireShootGfx
Art_Flipper		EQU	FlipperGfx
Art_Flower		EQU	FlowerGfx
Art_Ga			EQU	GaGfx
Art_GoalPost		EQU	GoalGfx
Art_HUD			EQU	HudGfx
Art_KamaKama		EQU	KamaKamaGfx
Art_MetalPlatform	EQU	MetalPlatformGfx
Art_MonitorTimePosts	EQU	MonitorTimeGfx
Art_OneWayBarrier	EQU	OneWayBarrierGfx
Art_Points		EQU	PointsGfx
Art_RetractBlock	EQU	RetractBlockGfx
Art_Results		EQU	ResultsGfx
Art_Rings		EQU	RingGfx
Art_RotatePlatform	EQU	RotatePlatformGfx
Art_Signpost		EQU	SignpostGfx
Art_SpikeBomb		EQU	SpikeBombGfx
Art_SpikeChain		EQU	SpikeChainGfx
Art_SpikesHV4		EQU	SpikesHV4Gfx
Art_Springs		EQU	SpringGfx
Art_Teleporter		EQU	TeleporterGfx
Art_Tentou		EQU	TentouGfx
Art_TitleCard		EQU	TitleCardGfx
Art_TitleCardText	EQU	TitleCardTextGfx
		if CC2_VARIANT=0
Art_BouncePlatform	EQU	BouncePlatformGfxAB
Art_GlassBreak		EQU	GlassBreakGfxA
Art_Pocket		EQU	PocketGfxA
Art_RobotTransportA	EQU	RobotTransportGfxA
		elseif CC2_VARIANT=1
Art_BouncePlatform	EQU	BouncePlatformGfxAB
Art_GlassBreak		EQU	GlassBreakGfxB
Art_Hologram		EQU	HologramGfx
Art_HologramAnimals	EQU	HologramAnimalsGfx
Art_Pocket		EQU	PocketGfxBC
Art_RobotTransportB	EQU	RobotTransportGfxB
		elseif CC2_VARIANT=2
Art_BouncePlatform	EQU	BouncePlatformGfxC
Art_GlassBreak		EQU	GlassBreakGfxC
Art_Pocket		EQU	PocketGfxBC
		else
Art_BouncePlatform	EQU	BouncePlatformGfxD
Art_GlassBreak		EQU	GlassBreakGfxD
Art_Pocket		EQU	PocketGfxD
		endif
		endif
	endif

PLCLists:
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Std-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Stage-PLCLists
	if CC2_VARIANT=0
		dc.w	PLC_Section1-PLCLists
		dc.w	PLC_Update0-PLCLists
		dc.w	PLC_Update1-PLCLists
	rept	9
		dc.w	PLC_Section0-PLCLists
	endr
	elseif CC2_VARIANT=1
		dc.w	PLC_Animals-PLCLists
		dc.w	PLC_Projector-PLCLists
		dc.w	PLC_Section1-PLCLists
		dc.w	PLC_Section2-PLCLists
		dc.w	PLC_Update0-PLCLists
		dc.w	PLC_Update1-PLCLists
		dc.w	PLC_Update2-PLCLists
	rept	5
		dc.w	PLC_Section0-PLCLists
	endr
	else
	rept	12
		dc.w	PLC_Section0-PLCLists
	endr
	endif
	dc.w	PLC_Results-PLCLists
	dc.w	PLC_Section0-PLCLists
	dc.w	PLC_Signpost-PLCLists

PLC_Stage:
	if CC2_VARIANT=0
		dc.w	1
		dc.l	StageGfx
		dc.w	0
		dc.l	Art_Checkpoint
		dc.w	$D960
	else
		dc.w	0
		dc.l	StageGfx
		dc.w	0
	endif

PLC_Std:
	if CC2_VARIANT=1
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

	if CC2_VARIANT=0

PLC_Section0:
	dc.w	$C
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_RobotTransportA
	dc.w	$6D40
	dc.l	Art_GlassBreak
	dc.w	$7160
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

PLC_Section1:
	dc.w	$C
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_RotatePlatform
	dc.w	$6D40
	dc.l	Art_GlassBreak
	dc.w	$7160
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

PLC_Update0:
	dc.w	0
	dc.l	Art_RobotTransportA
	dc.w	$6D40

PLC_Update1:
	dc.w	0
	dc.l	Art_RotatePlatform
	dc.w	$6D40

	elseif CC2_VARIANT=1

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
	dc.l	Art_RobotTransportB
	dc.w	$6D40
	dc.l	Art_GlassBreak
	dc.w	$7160
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
	dc.w	9
	dc.l	Art_GoalPost
	dc.w	$6000
	dc.l	Art_SpikesHV4
	dc.w	$63C0
	dc.l	Art_Hologram
	dc.w	$67C0
	dc.l	Art_GlassBreak
	dc.w	$7160
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
	dc.l	Art_RotatePlatform
	dc.w	$6D40
	dc.l	Art_GlassBreak
	dc.w	$7160
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
	dc.w	3
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_RobotTransportB
	dc.w	$6D40

PLC_Update1:
	dc.w	0
	dc.l	Art_Hologram
	dc.w	$67C0

PLC_Update2:
	dc.w	3
	dc.l	Art_Block
	dc.w	$67C0
	dc.l	Art_MetalPlatform
	dc.w	$69C0
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_RotatePlatform
	dc.w	$6D40

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
	dc.l	Art_BouncePlatform
	dc.w	$6BC0
	dc.l	Art_RotatePlatform
	dc.w	$6D40
	dc.l	Art_GlassBreak
	dc.w	$7160
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

	if def(CC_LEGACY_GFX_LISTS_ABI)
		if CC_LEGACY_GFX_LISTS_ABI<>0
GfxLists	EQU	PLCLists
		endif
	endif
