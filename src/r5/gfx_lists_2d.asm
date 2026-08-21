; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
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
	dc.w	word_20F8BA-GfxLists
	dc.w	word_20F8C2-GfxLists
	dc.w	ResultsGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	SignpostGfxList-GfxLists

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEntry BgInsideGfxD, $4A80
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry BridgeGfxD, $6000
	gfxEntry PlatformGfxD, $6080
	gfxEntry ConveyorCtrlGfxD, $F2E0
	gfxEntry RockGfxD, $6640
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry SpringGfx, $A400
	gfxEntry Spring45Gfx, $9E40
	gfxEntry HudGfx, $AD00
	gfxEntry MonitorTimeGfx, $B500
	gfxEntry ExplosionGfx, $D000
	gfxEntry PointsGfx, $D8C0
	gfxEntry FlowerGfx, $DAE0
	gfxEntry RingGfx, $F5C0
	gfxEnd

SectionGfxInitList0:
	gfxStart
	gfxEntry GoalGfx, $5660
	gfxEntry StalactiteGfxD, $6840
	gfxEntry CollapseFloorGfxD, $6A00
	gfxEntry ChainGfx, $6B00
	gfxEntry NoroNoroGfx, $7200
	gfxEntry SasoriGfx, $76C0
	gfxEntry KemusiGfx, $7FC0
	gfxEntry KumoKumoGfx, $8280
	gfxEntry SpikesHV4Gfx, $8960
	gfxEntry BreakWallGfxD, $8D60
	gfxEntry SinePlatformGfxD, $90E0
	gfxEntry CrackFloorGfxD, $94E0
	gfxEntry AnimalsGfx, $9740
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

word_20F8BA:
	gfxStart
	gfxEntry BgInsideGfxD, $4A80
	gfxEnd

word_20F8C2:
	gfxStart
	gfxEntry BgOutsideGfxD, $4A80
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

; ------------------------------------------------------------------------------
