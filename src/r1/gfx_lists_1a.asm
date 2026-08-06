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
	gfxEntry SpikesGfx, $6400
	gfxEntry DoorGfx, $6500
	gfxEntry BlockGfx, $6680
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry Spring45Gfx, $9200
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
	gfxEntry BoulderGfx, $6E80
	gfxEntry AnimalsGfx, $7100
	gfxEntry MosquiGfx, $7400
	gfxEntry AntonGfx, $8120
	gfxEntry Plant3d, $8480
	gfxEntry Booster3dGfx, $8820
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry BoulderGfx, $6E80
	gfxEntry AnimalsGfx, $7100
	gfxEntry PataBataGfx, $7600
	gfxEntry AntonGfx, $8120
	gfxEntry TamabbohGfx, $8500
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry BoulderGfx, $6E80
	gfxEntry AnimalsGfx, $7100
	gfxEntry PlayerHoleGfx, $7400
	gfxEntry PataBataGfx, $7600
	gfxEntry TunnelSplashGfx, $7C80
	gfxEntry SpinDiscGfx, $8120
	gfxEntry LogInsideGfxAB, $8300
	gfxEntry TamabbohGfx, $8500
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry AntonGfx, $6E00
	gfxEntry AnimalsGfx, $7100
	gfxEntry MosquiGfx, $7400
	gfxEntry SpinDiscGfx, $8120
	gfxEntry Plant3d, $8480
	gfxEntry Booster3dGfx, $8820
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxInitList4:
	gfxStart
	gfxEntry AmyRoseGfx, $6E00
	gfxEntry RobotTransporterGfxA, $8120
	gfxEntry Plant3d, $8480
	gfxEntry Booster3dGfx, $8820
	gfxEntry GoalGfx, $9EE0
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry BoulderGfx, $6E80
	gfxEntry AnimalsGfx, $7100
	gfxEntry MosquiGfx, $7400
	gfxEntry AntonGfx, $8120
	gfxEntry Plant3d, $8480
	gfxEntry Booster3dGfx, $8820
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry PataBataGfx, $7600
	gfxEntry AntonGfx, $8120
	gfxEntry TamabbohGfx, $8500
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry BoulderGfx, $6E80
	gfxEntry PlayerHoleGfx, $7400
	gfxEntry PataBataGfx, $7600
	gfxEntry TunnelSplashGfx, $7C80
	gfxEntry SpinDiscGfx, $8120
	gfxEntry LogInsideGfxAB, $8300
	gfxEntry TamabbohGfx, $8500
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry AntonGfx, $6E00
	gfxEntry AnimalsGfx, $7100
	gfxEntry MosquiGfx, $7400
	gfxEntry SpinDiscGfx, $8120
	gfxEntry Plant3d, $8480
	gfxEntry Booster3dGfx, $8820
	gfxEnd

SectionGfxUpdateList4:
	gfxStart
	gfxEntry AmyRoseGfx, $6E00
	gfxEntry RobotTransporterGfxA, $8120
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