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
	dc.w	SectionGfxInitList4-GfxLists
	dc.w	SectionGfxInitList5-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList2-GfxLists
	dc.w	SectionGfxUpdateList3-GfxLists
	dc.w	SectionGfxUpdateList4-GfxLists
	dc.w	SectionGfxUpdateList5-GfxLists
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
	gfxEntry DoorGfx, $67C0
	gfxEntry BlockGfx, $6940
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry CheckpointGfx, $9000
	gfxEntry Spring45Gfx, $9200
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
	gfxEntry SpikesGfx, $6400
	gfxEntry SpringWheelGfx, $6500
	gfxEntry BoulderGfx, $6B80
	gfxEntry SpinDiscGfx, $6E00
	gfxEntry LogInsideGfxCD, $6FE0
	gfxEntry SceneryGfxCD, $71E0
	gfxEntry MosquiGfx, $7260
	gfxEntry SpringboardGfx, $7B80
	gfxEntry PataBataGfx, $7E40
	gfxEntry TamabbohGfx, $84C0
	gfxEntry AnimalsGfx, $8C20
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry SpringWheelGfx, $6500
	gfxEntry BoulderGfx, $6B80
	gfxEntry SpinDiscGfx, $6E00
	gfxEntry LogInsideGfxCD, $6FE0
	gfxEntry SceneryGfxCD, $71E0
	gfxEntry MosquiGfx, $7260
	gfxEntry AntonGfx, $7B80
	gfxEntry PataBataGfx, $7E40
	gfxEntry TamabbohGfx, $84C0
	gfxEntry AnimalsGfx, $8C20
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry SpringWheelGfx, $6500
	gfxEntry BoulderGfx, $6B80
	gfxEntry SpinDiscGfx, $6E00
	gfxEntry SwingGfx, $6FE0
	gfxEntry SplashGfx, $7260
	gfxEntry PataBataGfx, $7E40
	gfxEntry TamabbohGfx, $84C0
	gfxEntry AnimalsGfx, $8C20
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry SpringWheelGfx, $6500
	gfxEntry BoulderGfx, $6B80
	gfxEntry SpinDiscGfx, $6E00
	gfxEntry SwingGfx, $6FE0
	gfxEntry MosquiGfx, $7260
	gfxEntry AntonGfx, $7B80
	gfxEntry PataBataGfx, $7E40
	gfxEntry TamabbohGfx, $84C0
	gfxEntry AnimalsGfx, $8C20
	gfxEnd

SectionGfxInitList4:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry SpringWheelGfx, $6500
	gfxEntry BoulderGfx, $6B80
	gfxEntry SpinDiscGfx, $6E00
	gfxEntry SwingGfx, $6FE0
	gfxEntry MosquiGfx, $7260
	gfxEntry AntonGfx, $7B80
	gfxEntry TagaTageGfx, $7E40
	gfxEntry TamabbohGfx, $84C0
	gfxEntry AnimalsGfx, $8C20
	gfxEnd

SectionGfxInitList5:
	gfxStart
	gfxEntry SpikesGfx, $6400
	gfxEntry SpringWheelGfx, $6500
	gfxEntry BoulderGfx, $6B80
	gfxEntry SpinDiscGfx, $6E00
	gfxEntry PataBataGfx, $6FE0
	gfxEntry SpringboardGfx, $7B80
	gfxEntry TagaTageGfx, $7E40
	gfxEntry TamabbohGfx, $84C0
	gfxEntry AnimalsGfx, $8C20
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry MosquiGfx, $7260
	gfxEntry SpringboardGfx, $7B80
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry LogInsideGfxCD, $6FE0
	gfxEntry SceneryGfxCD, $71E0
	gfxEntry MosquiGfx, $7260
	gfxEntry AntonGfx, $7B80
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry SwingGfx, $6FE0
	gfxEntry SplashGfx, $7260
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry MosquiGfx, $7260
	gfxEntry AntonGfx, $7B80
	gfxEntry PataBataGfx, $7E40
	gfxEnd

SectionGfxUpdateList4:
	gfxStart
	gfxEntry SwingGfx, $6FE0
	gfxEntry MosquiGfx, $7260
	gfxEntry AntonGfx, $7B80
	gfxEntry TagaTageGfx, $7E40
	gfxEnd

SectionGfxUpdateList5:
	gfxStart
	gfxEntry PataBataGfx, $6FE0
	gfxEntry SpringboardGfx, $7B80
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