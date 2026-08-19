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
	dc.w	SectionGfxInitList4-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList2-GfxLists
	dc.w	SectionGfxUpdateList3-GfxLists
	dc.w	SectionGfxUpdateList4-GfxLists
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
	gfxEntry SpringWheelGfx, $6700
	gfxEntry DoorGfx, $6800
	gfxEntry BlockGfx, $6980
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry PlatformGfx, $97C0
	gfxEntry AnimalsGfx, $9EE0
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
	gfxEntry SpikesV2Gfx, $6600
	gfxEntry BoulderGfx, $6BC0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry GoalGfx, $7020
	gfxEntry AntonGfx, $7320
	gfxEntry TamabbohGfx, $75E0
	gfxEntry PataBataGfx, $7D40
	gfxEntry SpringboardGfx, $83C0
	gfxEntry LogInsideGfxAB, $8BC0
	gfxEntry SceneryGfxB, $8DC0
	gfxEntry CheckpointGfx, $9000
	gfxEntry Spring45Gfx, $9200
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry SpikesV2Gfx, $6600
	gfxEntry BoulderGfx, $6BC0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry GoalGfx, $7020
	gfxEntry AntonGfx, $7320
	gfxEntry TamabbohGfx, $75E0
	gfxEntry MosquiGfx, $7D40
	gfxEntry LogInsideGfxAB, $8BC0
	gfxEntry SceneryGfxB, $8DC0
	gfxEntry CheckpointGfx, $9000
	gfxEntry Spring45Gfx, $9200
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry SpikesV2Gfx, $6600
	gfxEntry BoulderGfx, $6BC0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry GoalGfx, $7020
	gfxEntry AntonGfx, $7320
	gfxEntry TamabbohGfx, $75E0
	gfxEntry MosquiGfx, $7D40
	gfxEntry RobotTransportGfxB, $8A80
	gfxEntry SwingGfx, $8D80
	gfxEntry CheckpointGfx, $9000
	gfxEntry Spring45Gfx, $9200
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry SpikesV2Gfx, $6600
	gfxEntry BoulderGfx, $6BC0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry GoalGfx, $7020
	gfxEntry AntonGfx, $7320
	gfxEntry TamabbohGfx, $75E0
	gfxEntry PataBataGfx, $7D40
	gfxEntry TagaTageGfx, $83C0
	gfxEntry RobotTransportGfxB, $8A80
	gfxEntry SwingGfx, $8D80
	gfxEntry CheckpointGfx, $9000
	gfxEntry Spring45Gfx, $9200
	gfxEnd

SectionGfxInitList4:
	gfxStart
	gfxEntry SpikesV2Gfx, $6600
	gfxEntry BoulderGfx, $6BC0
	gfxEntry SpinDiscGfx, $6E40
	gfxEntry GoalGfx, $7020
	gfxEntry AntonGfx, $7320
	gfxEntry HologramGfx, $75E0
	gfxEntry PataBataGfx, $7D40
	gfxEntry TagaTageGfx, $83C0
	gfxEntry CheckpointGfx, $9000
	gfxEntry Spring45Gfx, $9200
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry PataBataGfx, $7D40
	gfxEntry SpringboardGfx, $83C0
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry MosquiGfx, $7D40
	gfxEntry LogInsideGfxAB, $8BC0
	gfxEntry SceneryGfxB, $8DC0
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry MosquiGfx, $7D40
	gfxEntry RobotTransportGfxB, $8A80
	gfxEntry SwingGfx, $8D80
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry TamabbohGfx, $75E0
	gfxEntry PataBataGfx, $7D40
	gfxEntry TagaTageGfx, $83C0
	gfxEntry RobotTransportGfxB, $8A80
	gfxEntry SwingGfx, $8D80
	gfxEnd

SectionGfxUpdateList4:
	gfxStart
	gfxEntry HologramGfx, $75E0
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry AnimalsGfx, $9EE0
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry HologramAnimalsGfx, $9EE0
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
