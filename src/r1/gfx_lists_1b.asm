; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 5, 5

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	AnimalsGfxList-GfxLists
	dc.w	ProjectorGfxList-GfxLists
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxInitList2-GfxLists
	dc.w	SectionGfxInitList3-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList2-GfxLists
	dc.w	SectionGfxUpdateList3-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	ResultsGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SignpostGfxList-GfxLists

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry DoorGfx, $6500
	gfxEntry FloatBlockGfx, $6680
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry CheckpointGfx, $9000
	gfxEntry DSpringGfx, $9200
	gfxEntry PlatformGfx, $97C0
	gfxEntry AnimalGfx, $9EE0
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
	gfxEntry SpikesGfx, $6400
	gfxEntry BoulderGfx, $68C0
	gfxEntry GoalGfx, $6B40
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry SpringboardGfx, $7020
	gfxEntry MosquiGfx, $72C0
	gfxEntry AntonGfx, $7DA0
	gfxEntry TamabbohGfx, $8060
	gfxEntry PataBataGfx, $87E0
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry BoulderGfx, $68C0
	gfxEntry GoalGfx, $6B40
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry SpringboardGfx, $7020
	gfxEntry TunnelSplashGfx, $73C0
	gfxEntry PlayerHoleGfx, $7760
	gfxEntry LogShadowGfx, $7960
	gfxEntry SceneryGfx, $7B60
	gfxEntry AntonGfx, $7DA0
	gfxEntry ProjectorGfx, $8060
	gfxEntry PataBataGfx, $87E0
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry BoulderGfx, $68C0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry SpringboardGfx, $7020
	gfxEntry MosquiGfx, $72C0
	gfxEntry TamabbohGfx, $8060
	gfxEntry PataBataGfx, $87E0
	gfxEntry GoalGfx, $6B40
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry BoulderGfx, $68C0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry SpringboardGfx, $7020
	gfxEntry MosquiGfx, $72C0
	gfxEntry TamabbohGfx, $8060
	gfxEntry RobotGeneratorGfx, $87E0
	gfxEntry GoalGfx, $6B40
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry MosquiGfx, $72C0
	gfxEntry AntonGfx, $7DA0
	gfxEntry TamabbohGfx, $8060
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry TunnelSplashGfx, $73C0
	gfxEntry PlayerHoleGfx, $7760
	gfxEntry LogShadowGfx, $7960
	gfxEntry SceneryGfx, $7B60
	gfxEntry AntonGfx, $7DA0
	gfxEntry ProjectorGfx, $8060
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry MosquiGfx, $72C0
	gfxEntry TamabbohGfx, $8060
	gfxEntry PataBataGfx, $87E0
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry RobotGeneratorGfx, $87E0
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry AnimalGfx, $9EE0
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry ProjectorAnimalGfx, $9EE0
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