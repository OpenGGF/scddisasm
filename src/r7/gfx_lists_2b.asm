; ------------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

GfxLists:
	dc.w	StageGfxList-GfxLists
	dc.w	MainGfxList-GfxLists
	dc.w	SectionGfxInitList0-GfxLists
	dc.w	StageGfxList-GfxLists
	dc.w	AnimalsGfxList-GfxLists
	dc.w	ProjectorGfxList-GfxLists
	dc.w	SectionGfxInitList1-GfxLists
	dc.w	SectionGfxUpdateList0-GfxLists
	dc.w	SectionGfxUpdateList1-GfxLists
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
	gfxEntry MeshGfxB, $5F00
	gfxEntry TitleCardGfx, $6C00
	gfxEntry TitleCardTextGfx, $7A00
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
	gfxEntry LaunchGfx, $6000
	gfxEntry SparksGfx, $6700
	gfxEntry PathSwapGfx, $69A0
	gfxEntry SwingGfx, $6CC0
	gfxEntry BlockGfxB, $6EC0
	gfxEntry SpikeBallGfx, $70C0
	gfxEntry SpikeLaunchGfx, $71C0
	gfxEntry AnimalsGfx, $72C0
	gfxEntry RobotTransporterGfxB, $75C0
	gfxEntry KabasiraGfx, $78C0
	gfxEntry KanabunGfx, $7D20
	gfxEntry HotaruGfx, $8BA0
	gfxEntry HologramGfx, $95E0
	gfxEnd

SectionGfxInitList1:
	gfxStart
	gfxEntry LaunchGfx, $6000
	gfxEntry SparksGfx, $6700
	gfxEntry PathSwapGfx, $69A0
	gfxEntry SwingGfx, $6CC0
	gfxEntry BlockGfxB, $6EC0
	gfxEntry SpikeBallGfx, $70C0
	gfxEntry SpikeLaunchGfx, $71C0
	gfxEntry AnimalsGfx, $72C0
	gfxEntry GoalGfx, $75C0
	gfxEntry KabasiraGfx, $78C0
	gfxEntry KanabunGfx, $7D20
	gfxEntry HotaruGfx, $8BA0
	gfxEntry HologramGfx, $95E0
	gfxEnd

SectionGfxUpdateList0:
	gfxStart
	gfxEntry RobotTransporterGfxB, $75C0
	gfxEnd

SectionGfxUpdateList1:
	gfxStart
	gfxEntry GoalGfx, $75C0
	gfxEnd

ResultsGfxList:
	gfxStart
	gfxEntry ResultsGfx, $7880
	gfxEnd

AnimalsGfxList:
	gfxStart
	gfxEntry AnimalsGfx, $72C0
	gfxEnd

ProjectorGfxList:
	gfxStart
	gfxEntry HologramAnimalsGfx, $72C0
	gfxEnd

SignpostGfxList:
	gfxStart
	gfxEntry SignpostGfx, $8780
	gfxEntry BigRingGfx, $9100
	gfxEntry BigRingFlashGfx, $7DE0
	gfxEnd

; ------------------------------------------------------------------------------