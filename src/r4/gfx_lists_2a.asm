; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	ResultsGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SignpostGfxList-GfxLists
	dc.w	word_20FC32-GfxLists

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEntry CheckpointGfx, $D960
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry WaterSurfaceGfx, $5000
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry TonboGfx, $82C0
	gfxEntry DoorGfxA, $8800
	gfxEntry BlockGfxA, $8D40
	gfxEntry BubbleNumbersGfx, $9140
	gfxEntry SwitchGfx, $A140
	gfxEntry SpringGfx, $A400
	gfxEntry HudGfx, $AD00
	gfxEntry MonitorTimeGfx, $B500
	gfxEntry ExplosionGfx, $D000
	gfxEntry PointsGfx, $D8C0
	gfxEntry FlowerGfx, $DAE0
	gfxEntry RingGfx, $F5C0
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

SectionGfxInitList0:
	gfxStart
	gfxEntry ShootGfx, $6300
	gfxEntry ElectricBeamGfxA, $6600
	gfxEntry SwingGfxAB, $6800
	gfxEntry WoodBlockGfx, $6A00
	gfxEntry SlopeElevatorGfxA, $6B80
	gfxEntry CollapseFloorGfxA, $6C80
	gfxEntry ChainGfx, $6D00
	gfxEntry SpikeBallGfx, $6E00
	gfxEntry TurbineGfxA, $7000
	gfxEntry SpikesV4Gfx, $7400
	gfxEntry AmenboGfx, $7600
	gfxEntry TagaTagaGfx, $7A00
	gfxEntry YagoGfx, $7E00
	gfxEntry AnimalsGfx, $8A00
	gfxEntry BreakPoleGfxAB, $5F00
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry ShootGfx, $6300
	gfxEntry ElectricBeamGfxA, $6600
	gfxEntry SwingGfxAB, $6800
	gfxEntry WoodBlockGfx, $6A00
	gfxEntry SlopeElevatorGfxA, $6B80
	gfxEntry CollapseFloorGfxA, $6C80
	gfxEntry ChainGfx, $6D00
	gfxEntry SpikeBallGfx, $6E00
	gfxEntry TurbineGfxA, $7000
	gfxEntry SpikesV4Gfx, $7400
	gfxEntry AmenboGfx, $7600
	gfxEntry TagaTagaGfx, $7A00
	gfxEntry YagoGfx, $7E00
	gfxEntry RobotTransportGfxA, $8A00
	gfxEntry BreakPoleGfxAB, $5F00
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry AnimalsGfx, $8A00
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry RobotTransportGfxA, $8A00
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

word_20FC32:
	gfxStart
	gfxEntry GoalGfx, $9E40
	gfxEnd

; ------------------------------------------------------------------------------
