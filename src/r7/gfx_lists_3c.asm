; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-GfxLists
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	AmyRoseGfxList-GfxLists
	dc.w	word_20F5F0-GfxLists
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
	gfxEntry MeshGfxC, $5F00
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry Spring45Gfx, $9E40
	gfxEntry SpikesGfx, $9F80
	gfxEntry BlockGfxC, $A180
	gfxEntry LampGfxC, $A380
	gfxEntry HudGfx, $AD00
	gfxEntry MonitorTimeGfx, $B500
	gfxEntry ExplosionGfx, $D000
	gfxEntry PointsGfx, $D8C0
	gfxEntry FlowerGfx, $DAE0
	gfxEntry RingGfx, $F5C0
	gfxEnd

SectionGfxInitList0:
	gfxStart
	gfxEntry EggmanGfx, $6000
	gfxEntry MetalSonicGfx, $6F80
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $5E40
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry CapsuleGfx, $9020
	gfxEnd

AmyRoseGfxList:
	gfxStart
	gfxEntry AmyRoseGfx, $7960
	gfxEnd

word_20F5F0:
	gfxStart
	gfxEntry EggmanGfx, $6400
	gfxEnd

; ------------------------------------------------------------------------------