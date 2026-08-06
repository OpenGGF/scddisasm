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
	gfxEntry GoalGfx, $47C0
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry DoorGfx, $8FC0
	gfxEntry SpikesV4Gfx, $9100
	gfxEntry CrusherGfx, $9300
	gfxEntry CollapseFloorGfx, $9B00
	gfxEntry Spring45Gfx, $9E40
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
	gfxEntry AnimalsGfx, $6000
	gfxEntry TwinWalkerGfx, $6300
	gfxEntry TrapDoorGfx, $6580
	gfxEntry TubeCoverGfx, $6780
	gfxEntry BigbomGfx, $6800
	gfxEntry LaserGfx, $7C00
	gfxEntry SpikeCrusherGfx, $8000
	gfxEntry MechaBuGfx, $89C0
	gfxEntry SwitchGfx, $9C80
	gfxEntry SpringWheelGfx, $9D40
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry RobotTransporterGfxB, $5FC0
	gfxEntry TwinWalkerGfx, $6300
	gfxEntry TrapDoorGfx, $6580
	gfxEntry TubeCoverGfx, $6780
	gfxEntry BigbomGfx, $6800
	gfxEntry LaserGfx, $7C00
	gfxEntry SpikeCrusherGfx, $8000
	gfxEntry DangoGfx, $85E0
	gfxEntry SwitchGfx, $9C80
	gfxEntry SpringWheelGfx, $9D40
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry AnimalsGfx, $6000
	gfxEntry TwinWalkerGfx, $6300
	gfxEntry TrapDoorGfx, $6580
	gfxEntry TubeCoverGfx, $6780
	gfxEntry BigbomGfx, $6800
	gfxEntry SeesawGfxABD, $7400
	gfxEntry RevolveDoorGfx, $8360
	gfxEntry MechaBuGfx, $89C0
	gfxEntry SwitchGfx, $9C80
	gfxEntry SpringWheelGfx, $9D40
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry AnimalsGfx, $6000
	gfxEntry TwinWalkerGfx, $6300
	gfxEntry TrapDoorGfx, $6580
	gfxEntry TubeCoverGfx, $6780
	gfxEntry BigbomGfx, $6800
	gfxEntry LaserGfx, $7C00
	gfxEntry SpikeCrusherGfx, $8000
	gfxEntry DangoGfx, $85E0
	gfxEntry SwitchGfx, $9C80
	gfxEntry SpringWheelGfx, $9D40
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry AnimalsGfx, $6000
	gfxEntry MechaBuGfx, $89C0
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry RobotTransporterGfxB, $5FC0
	gfxEntry LaserGfx, $7C00
	gfxEntry SpikeCrusherGfx, $8000
	gfxEntry DangoGfx, $85E0
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry AnimalsGfx, $6000
	gfxEntry RevolveDoorGfx, $8360
	gfxEntry SeesawGfxABD, $7400
	gfxEntry MechaBuGfx, $89C0
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry LaserGfx, $7C00
	gfxEntry SpikeCrusherGfx, $8000
	gfxEntry DangoGfx, $85E0
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

; ------------------------------------------------------------------------------