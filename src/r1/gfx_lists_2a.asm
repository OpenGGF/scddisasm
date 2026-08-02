; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 5, 5

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxInitList2-GfxLists
	dc.w	SectionGfxInitList3-GfxLists
	dc.w	SectionGfxInitList4-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList2-GfxLists
	dc.w	SectionGfxUpdateList3-GfxLists
	dc.w	SectionGfxUpdateList4-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	ResultsGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SignpostGfxList-GfxLists

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEntry CheckpointGfx, $D960
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry SpikesGfx, $6600
	gfxEntry SpringWheelGfx, $6700
	gfxEntry DoorGfx, $69C0
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry PlatformGfx, $97C0
	gfxEntry GoalGfx, $9EE0
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
	gfxEntry FloatBlockGfx, $6B40
	gfxEntry BoulderGfx, $6D80
	gfxEntry SpinDiscGfx, $7000
	gfxEntry AnimalGfx, $71E0
	gfxEntry PataBataGfx, $74E0
	gfxEntry SpringboardGfx, $7B60
	gfxEntry LogShadowGfx, $7E00
	gfxEntry AntonGfx, $8000
	gfxEntry SwingGfx, $8300
	gfxEntry TamabbohGfx, $8580
	gfxEntry DSpringGfx, $9200
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry FloatBlockGfx, $6B40
	gfxEntry BoulderGfx, $6D80
	gfxEntry SpinDiscGfx, $7000
	gfxEntry AnimalGfx, $71E0
	gfxEntry MosquiGfx, $74E0
	gfxEntry LogShadowGfx, $7E00
	gfxEntry AntonGfx, $8000
	gfxEntry SwingGfx, $8300
	gfxEntry TamabbohGfx, $8580
	gfxEntry DSpringGfx, $9200
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry FloatBlockGfx, $6B40
	gfxEntry BoulderGfx, $6D80
	gfxEntry SpinDiscGfx, $7000
	gfxEntry AnimalGfx, $71E0
	gfxEntry SplashGfx, $74E0
	gfxEntry RobotGeneratorDecayGfx, $8000
	gfxEntry SwingGfx, $8300
	gfxEntry TamabbohGfx, $8580
	gfxEntry DSpringGfx, $9200
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry FloatBlockGfx, $6B40
	gfxEntry BoulderGfx, $6D80
	gfxEntry SpinDiscGfx, $7000
	gfxEntry AnimalGfx, $71E0
	gfxEntry PataBataGfx, $74E0
	gfxEntry AntonGfx, $7B60
	gfxEntry RobotGeneratorDecayGfx, $8000
	gfxEntry SwingGfx, $8300
	gfxEntry TamabbohGfx, $8580
	gfxEntry DSpringGfx, $9200
	gfxEnd

SectionGfxInitList4:
	gfxStart
	gfxEntry FloatBlockGfx, $6B40
	gfxEntry BoulderGfx, $6D80
	gfxEntry SpinDiscGfx, $7000
	gfxEntry AnimalGfx, $71E0
	gfxEntry PataBataGfx, $74E0
	gfxEntry TagaTagaGfx, $7B60
	gfxEntry SwingGfx, $8300
	gfxEntry TamabbohGfx, $8580
	gfxEntry DSpringGfx, $9200
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry SpinDiscGfx, $7000
	gfxEntry AnimalGfx, $71E0
	gfxEntry PataBataGfx, $74E0
	gfxEntry SpringboardGfx, $7B60
	gfxEntry DSpringGfx, $9200
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry MosquiGfx, $74E0
	gfxEntry LogShadowGfx, $7E00
	gfxEntry AntonGfx, $8000
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry SplashGfx, $74E0
	gfxEntry RobotGeneratorDecayGfx, $8000
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry PataBataGfx, $74E0
	gfxEntry AntonGfx, $7B60
	gfxEntry RobotGeneratorDecayGfx, $8000
	gfxEnd

SectionGfxUpdateList4:
	gfxStart
	gfxEntry TagaTagaGfx, $7B60
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