; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 5, 5

GfxLists:
	dc.w	StageGfxList-*
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	BossGfxList-GfxLists
	dc.w	AmyRoseGfxList-GfxLists
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
	gfxEnd

StageGfxList:
	gfxStart
	gfxEntry StageGfx, 0
	gfxEnd

MainGfxList:
	gfxStart
	gfxEntry AnimalsGfx, $6000
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
	gfxEntry DoorGfx, $8FC0
	gfxEntry SpikesV4Gfx, $9100
	gfxEntry CrusherGfx, $9300
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
	gfxEntry BuzzsawGfxC, $62C0
	gfxEntry RotatePlatformGfx, $6980
	gfxEntry SpringWheelGfx, $6E40
	gfxEntry CollapseFloorGfx, $6F40
	gfxEntry SwitchGfx, $70C0
	gfxEntry HotaruGfx, $7600
	gfxEntry BlockGfx, $7E00
	gfxEntry SpikeCrusherGfx, $8000
	gfxEntry RevolveDoorGfx, $8360
	gfxEntry SpikePoleGfx, $8800
	gfxEntry MechaBuGfx, $89C0
	gfxEntry BossDoorGfx, $F2E0
	gfxEnd

BossGfxList:
	gfxStart
	gfxEntry BossPanelsGfx1, $4400
	gfxEntry BossPanelsGfx2, $5B20
	gfxEntry BossPanelsGfx3, $77E0
	gfxEntry BossMachineGfx, $7BC0
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry CapsuleGfx, $9020
	gfxEnd

AmyRoseGfxList:
	gfxStart
	gfxEntry AmyRoseGfx, $4400
	gfxEnd

; ------------------------------------------------------------------------------