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
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	word_20FB42-GfxLists
	dc.w	word_20FB4A-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	word_20FB1E-GfxLists
	dc.w	word_20FB26-GfxLists
	dc.w	ResultsGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SignpostGfxList-GfxLists

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEntry InsideBgGfx, $4160
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry BridgeGfx, $6000
	gfxEntry PlatformGfx, $6080
	gfxEntry ConveyorControlGfx, $F2E0
	gfxEntry RockGfx, $6640
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry AnimalGfx, $9740
	gfxEntry DSpringGfx, $9E40
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
	gfxEntry GoalGfx, $5740
	gfxEntry StalactiteGfx, $6840
	gfxEntry CollapseFloorGfx, $6A00
	gfxEntry ChainGfx, $6B00
	gfxEntry NoroNoroGfx, $7200
	gfxEntry SasoriGfx, $76C0
	gfxEntry KemusiGfx, $7FC0
	gfxEntry KumoKumoGfx, $8280
	gfxEntry SpikesGfx, $8960
	gfxEntry BreakWallGfx, $8D60
	gfxEntry UnusedSinePlatformGfx, $90E0
	gfxEntry CrackedCollapseFloorGfx, $94E0
	gfxEntry RobotGeneratorGfx, $9A40
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry GoalGfx, $5740
	gfxEntry StalactiteGfx, $6840
	gfxEntry CollapseFloorGfx, $6A00
	gfxEntry ChainGfx, $6B00
	gfxEntry NoroNoroGfx, $7200
	gfxEntry ProjectorGfx, $76C0
	gfxEntry KemusiGfx, $7FC0
	gfxEntry KumoKumoGfx, $8280
	gfxEntry SpikesGfx, $8960
	gfxEntry BreakWallGfx, $8D60
	gfxEntry UnusedSinePlatformGfx, $90E0
	gfxEntry CrackedCollapseFloorGfx, $94E0
	gfxEntry RobotGeneratorGfx, $9A40
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry SasoriGfx, $76C0
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry ProjectorGfx, $76C0
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

word_20FB1E:
	gfxStart
	gfxEntry InsideBgGfx, $4160
	gfxEnd

word_20FB26:
	gfxStart
	gfxEntry OutsideBgGfx, $4140
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

word_20FB42:
	gfxStart
	gfxEntry AnimalGfx, $9740
	gfxEnd

word_20FB4A:
	gfxStart
	gfxEntry ProjectorAnimalGfx, $9740
	gfxEnd

; ------------------------------------------------------------------------------