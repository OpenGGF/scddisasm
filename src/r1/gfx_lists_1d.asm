; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxInitList2-GfxLists
	dc.w	SectionGfxInitList3-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList2-GfxLists
	dc.w	SectionGfxUpdateList3-GfxLists
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
	gfxEntry SpikesGfx, $6400
	gfxEntry DoorGfx, $6500
	gfxEntry FloatBlockGfx, $6680
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry CheckpointGfx, $9000
	gfxEntry DSpringGfx, $9200
	gfxEntry PlatformGfx, $97C0
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
	gfxEntry BoulderGfx, $68C0
	gfxEntry SpringboardGfx, $6B40
	gfxEntry SpringWheelGfx, $6DE0
	gfxEntry SpinDiscGfx, $6EE0
	gfxEntry AntonGfx, $70C0
	gfxEntry PataBataGfx, $7380
	gfxEntry MosquiGfx, $7A00
	gfxEntry TagaTagaGfx, $8320
	gfxEntry AnimalGfx, $8C60
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry BoulderGfx, $68C0
	gfxEntry SpringboardGfx, $6B40
	gfxEntry SpringWheelGfx, $6DE0
	gfxEntry SpinDiscGfx, $6EE0
	gfxEntry AntonGfx, $70C0
	gfxEntry PataBataGfx, $7380
	gfxEntry TamabbohGfx, $7A00
	gfxEntry TagaTagaGfx, $8320
	gfxEntry AnimalGfx, $8C60
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry BoulderGfx, $68C0
	gfxEntry SpringboardGfx, $6B40
	gfxEntry SpringWheelGfx, $6DE0
	gfxEntry SpinDiscGfx, $6EE0
	gfxEntry AntonGfx, $70C0
	gfxEntry PataBataGfx, $7380
	gfxEntry TamabbohGfx, $7A00
	gfxEntry TunnelSplashGfx, $8160
	gfxEntry LogShadowDecayGfx, $8500
	gfxEntry SceneryGfxCD, $8700
	gfxEntry AnimalGfx, $8C60
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry BoulderGfx, $68C0
	gfxEntry SpringboardGfx, $6B40
	gfxEntry SpringWheelGfx, $6DE0
	gfxEntry SpinDiscGfx, $6EE0
	gfxEntry AntonGfx, $70C0
	gfxEntry PataBataGfx, $7380
	gfxEntry MosquiGfx, $7A00
	gfxEntry TagaTagaGfx, $8320
	gfxEntry AnimalGfx, $8C60
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry MosquiGfx, $7A00
	gfxEntry TagaTagaGfx, $8320
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry TamabbohGfx, $7A00
	gfxEntry TagaTagaGfx, $8320
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry TamabbohGfx, $7A00
	gfxEntry TunnelSplashGfx, $8160
	gfxEntry LogShadowDecayGfx, $8500
	gfxEntry SceneryGfxCD, $8700
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry MosquiGfx, $7A00
	gfxEntry TagaTagaGfx, $8320
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