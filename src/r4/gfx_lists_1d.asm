; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
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

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry WaterSurfaceGfx, $5000
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry DoorGfxD, $8800
	gfxEntry AnimalsGfx, $8A00
	gfxEntry BlockGfxD, $8D40
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

SectionGfxInitList0:
	gfxStart
	gfxEntry BreakPoleGfxD, $5F00
	gfxEntry SwingGfxD, $6800
	gfxEntry SlopeElevatorGfxD, $6B80
	gfxEntry PrizePointsGfx, $6DC0
	gfxEntry SpikeBallGfx, $6E00
	gfxEntry TurbineGfxD, $7000
	gfxEntry SpikesV4Gfx, $7400
	gfxEntry AmenboGfx, $7600
	gfxEntry TagaTagaGfx, $7A00
	gfxEntry YagoGfx, $7E00
	gfxEntry TonboGfx, $82C0
	gfxEntry GoalGfx, $9E40
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

; ------------------------------------------------------------------------------