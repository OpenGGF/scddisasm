; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxInitList3-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList3-GfxLists
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

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry WaterSurfaceGfx, $5000
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry TonboGfx, $82C0
	gfxEntry DoorPastGfx, $8800
	gfxEntry BlockPastGfx, $8D40
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
	gfxEntry BreakPoleGfx, $5F00
	gfxEntry RotateBlockGfx, $6000
	gfxEntry TurbineGfx, $7000
	gfxEntry SpikesGfx, $7400
	gfxEntry AmenboGfx, $7600
	gfxEntry TagaTagaGfx, $7A00
	gfxEntry YagoGfx, $7E00
	gfxEntry AnimalGfx, $8A00
	gfxEntry GoalGfx, $9E40
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry BreakPoleGfx, $5F00
	gfxEntry RotateBlockGfx, $6000
	gfxEntry TurbineGfx, $7000
	gfxEntry SpikesGfx, $7400
	gfxEntry ProjectorGfx, $7600
	gfxEntry YagoGfx, $7E00
	gfxEntry AnimalGfx, $8A00
	gfxEntry GoalGfx, $9E40
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry BreakPoleGfx, $5F00
	gfxEntry RotateBlockGfx, $6000
	gfxEntry TurbineGfx, $7000
	gfxEntry SpikesGfx, $7400
	gfxEntry AmenboGfx, $7600
	gfxEntry TagaTagaGfx, $7A00
	gfxEntry YagoGfx, $7E00
	gfxEntry RobotGeneratorGfx, $8A00
	gfxEntry GoalGfx, $9E40
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry AmenboGfx, $7600
	gfxEntry TagaTagaGfx, $7A00
	gfxEntry AnimalGfx, $8A00
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry ProjectorGfx, $7600
	gfxEntry AnimalGfx, $8A00
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry RobotGeneratorGfx, $8A00
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

; ------------------------------------------------------------------------------