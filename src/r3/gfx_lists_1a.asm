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
	dc.w	IntroGfxList-GfxLists
	dc.w	word_20FCD0-GfxLists
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
	gfxEntry GoalGfx, $6000
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry TentouGfx, $8D40
	gfxEntry SpikeBombGfx, $92A0
	gfxEntry FlipperGfx, $93A0
	gfxEntry BumperGfx, $99C0
	gfxEntry Spring45Gfx, $9E40
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
	gfxEntry SpikesGfx2, $63C0
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry SpikesGfx1, $63C0
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfxAB, $6BC0
	gfxEntry OneWayBarrierGfx, $6E20
	gfxEntry FireShootGfx, $6F20
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry PointsPocketGfxA, $75E0
	gfxEntry SpikeChainGfx, $77A0
	gfxEntry AnimalsGfx, $7B40
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxInitList2:
	gfxStart
	gfxEntry SpikesGfx1, $63C0
	gfxEntry RobotTransporterGfxA, $67C0
	gfxEntry BouncePlatformGfxAB, $6BC0
	gfxEntry OneWayBarrierGfx, $6E20
	gfxEntry FireShootGfx, $6F20
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry PointsPocketGfxA, $75E0
	gfxEntry SpikeChainGfx, $77A0
	gfxEntry AnimalsGfx, $7B40
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxInitList3:
	gfxStart
	gfxEntry SpikesGfx1, $63C0
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfxAB, $6BC0
	gfxEntry OneWayBarrierGfx, $6E20
	gfxEntry FireShootGfx, $6F20
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry PointsPocketGfxA, $75E0
	gfxEntry SpikeChainGfx, $77A0
	gfxEntry AnimalsGfx, $7B40
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry SpikesGfx2, $63C0
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry SpikesGfx1, $63C0
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEntry BouncePlatformGfxAB, $6BC0
	gfxEntry OneWayBarrierGfx, $6E20
	gfxEntry FireShootGfx, $6F20
	gfxEntry RetractBlockGfx, $73E0
	gfxEntry PointsPocketGfxA, $75E0
	gfxEntry SpikeChainGfx, $77A0
	gfxEntry AnimalsGfx, $7B40
	gfxEntry KamaKamaGfx, $7E40
	gfxEntry GaGfx, $8420
	gfxEnd

SectionGfxUpdateList2:
	gfxStart
	gfxEntry RobotTransporterGfxA, $67C0
	gfxEnd

SectionGfxUpdateList3:
	gfxStart
	gfxEntry BlockGfx, $67C0
	gfxEntry MetalPlatformGfx, $69C0
	gfxEnd

IntroGfxList:
	gfxStart
	gfxEntry AmyRoseGfx, $6BC0
	gfxEntry MetalSonicGfx, $7A00
	gfxEnd

word_20FCD0:
	gfxStart
	gfxEntry TentouGfx, $8D40
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