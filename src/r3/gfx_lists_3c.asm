; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	word_20F728-GfxLists
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
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	ResultsGfxList-GfxLists

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry HudGfx, $AD00
	gfxEntry MonitorTimeGfx, $B500
	gfxEntry ExplosionGfx, $D000
	gfxEntry PointsGfx, $D8C0
	gfxEntry FlowerGfx, $DAE0
	gfxEntry RingGfx, $F5C0
	gfxEnd

SectionGfxInitList0:
	gfxStart
	gfxEntry EggmanGfx, $63C0
	gfxEntry SpikesHV4Gfx, $7F80
	gfxEntry TeleporterGfx, $8380
	gfxEntry GlassBreakGfxC, $8540
	gfxEntry BossDrainBlockGfxC, $87C0
	gfxEntry BouncePlatformGfxC, $8CC0
	gfxEntry BossBarrierGfx, $8E80
	gfxEntry BossBombLaunchGfx, $8F80
	gfxEntry FlipperGfx, $93A0
	gfxEntry BumperGfx, $99C0
	gfxEntry Spring45Gfx, $9E40
	gfxEntry SpringGfx, $A400
	gfxEnd

word_20F728:
	gfxStart
	gfxEntry EggmanEscapeGfx, $7F80
	gfxEntry CapsuleGfx, $9020
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

; ------------------------------------------------------------------------------