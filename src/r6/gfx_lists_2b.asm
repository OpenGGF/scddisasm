; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	AnimalsGfxList-GfxLists
	dc.w	ProjectorGfxList-GfxLists
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
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry BataPyonGfx, $8700
	gfxEntry PohBeeGfx, $8AE0
	gfxEntry MinomusiGfx, $9100
	gfxEntry SemiGfx, $9500
	gfxEntry SpikeBombGfx, $9900
	gfxEntry AnimalsGfx, $9A00
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
	gfxEntry GoalGfx, $4F00
	gfxEntry RobotTransporterGfxB, $5D00
	gfxEntry HologramGfx, $6000
	gfxEntry PistonGfx, $6800
	gfxEntry ElectricOrbB, $6B00
	gfxEntry PlatformGfxB, $6D40
	gfxEntry SwitchGfx, $7340
	gfxEntry DoorGfx, $7400
	gfxEntry SnakeBlockGfx, $7500
	gfxEntry SeesawGfx, $7700
	gfxEntry BouncePlatformGfx, $7D00
	gfxEntry SpikeChainGfx, $7F00
	gfxEntry LaunchGfx, $8000
	gfxEntry TubeDoorGfx, $8200
	gfxEntry CrusherGfxABD, $9D00
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry AnimalsGfx, $9A00
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry HologramAnimalsGfx, $9A00
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