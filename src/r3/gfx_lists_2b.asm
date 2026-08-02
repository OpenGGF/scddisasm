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
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxInitList2-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
	dc.w	SectionGfxUpdateList2-GfxLists
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
	gfxEntry AnimalGfx, $F2E0
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry TentouGfx, $8D40
	gfxEntry TentouBombGfx, $92A0
	gfxEntry FlipperGfx, $93A0
	gfxEntry BumperGfx, $99C0
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
	gfxEntry GoalGfx, $6000
	gfxEntry SpikesGfx, $63C0
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfx, $6BC0
	gfxEntry RobotGeneratorGfx, $6D40
	gfxEntry GlassShatterGfx, $7160
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry TeleporterGfx, $75E0
	gfxEntry PointsPocketGfx, $75E0
	gfxEntry SpikeBallGfx, $77A0
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry GoalGfx, $6000
	gfxEntry SpikesGfx, $63C0
	gfxEntry ProjectorGfx, $67C0
	gfxEntry GlassShatterGfx, $7160
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry TeleporterGfx, $75E0
	gfxEntry PointsPocketGfx, $75E0
	gfxEntry SpikeBallGfx, $77A0
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry GoalGfx, $6000
	gfxEntry SpikesGfx, $63C0
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfx, $6BC0
	gfxEntry RotatePlatformGfx, $6D40
	gfxEntry GlassShatterGfx, $7160
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry TeleporterGfx, $75E0
	gfxEntry PointsPocketGfx, $75E0
	gfxEntry SpikeBallGfx, $77A0
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfx, $6BC0
	gfxEntry RobotGeneratorGfx, $6D40
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry ProjectorGfx, $67C0
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfx, $6BC0
	gfxEntry RotatePlatformGfx, $6D40
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry AnimalGfx, $F2E0
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry ProjectorAnimalGfx, $F2E0
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