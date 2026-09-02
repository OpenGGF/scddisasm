; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 3 PLC lists
;
; Each PLC begins with an entry-count-minus-one word followed by six-byte
; records containing an art pointer and its VRAM byte destination.
; -------------------------------------------------------------------------

StageDataIndex:
	stageData StageGfx, StageBlocks, StageChunks, 3, 2, $81, 4, 4

PLCLists:
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_Std-PLCLists
	dc.w	PLC_Boss-PLCLists
	dc.w	PLC_Stage-PLCLists
	dc.w	PLC_BossEscape-PLCLists
	rept	11
	dc.w	PLC_Boss-PLCLists
	endr
	dc.w	PLC_Results-PLCLists

PLC_Stage:
	dc.w	0
	dc.l	StageGfx
	dc.w	0

PLC_Std:
	if CC_VARIANT=3
	dc.w	8
	else
	dc.w	7
	endif
	dc.l	TitleCardGfx
	dc.w	$6C00
	dc.l	TitleCardTextGfx
	dc.w	$7A00
	if CC_VARIANT=3
	dc.l	SignpostGfx
	dc.w	$5800
	endif
	dc.l	HudGfx
	dc.w	$AD00
	dc.l	MonitorTimeGfx
	dc.w	$B500
	dc.l	ExplosionGfx
	dc.w	$D000
	dc.l	PointsGfx
	dc.w	$D8C0
	dc.l	FlowerGfx
	dc.w	$DAE0
	dc.l	RingGfx
	dc.w	$F5C0

PLC_Boss:
	dc.w	$B
	dc.l	EggmanGfx
	dc.w	$63C0
	dc.l	SpikesHV4Gfx
	dc.w	$7F80
	dc.l	TeleporterGfx
	dc.w	$8380
	if CC_VARIANT=2
	dc.l	GlassBreakGfxC
	dc.w	$8540
	dc.l	BossDrainBlockGfxC
	dc.w	$87C0
	dc.l	BouncePlatformGfxC
	else
	dc.l	GlassBreakGfxD
	dc.w	$8540
	dc.l	BossDrainBlockGfxD
	dc.w	$87C0
	dc.l	BouncePlatformGfxD
	endif
	dc.w	$8CC0
	dc.l	BossBarrierGfx
	dc.w	$8E80
	dc.l	BossBombLaunchGfx
	dc.w	$8F80
	dc.l	FlipperGfx
	dc.w	$93A0
	dc.l	BumperGfx
	dc.w	$99C0
	dc.l	Spring45Gfx
	dc.w	$9E40
	dc.l	SpringGfx
	dc.w	$A400

PLC_BossEscape:
	dc.w	1
	dc.l	EggmanEscapeGfx
	dc.w	$7F80
	dc.l	CapsuleGfx
	dc.w	$9020

PLC_Results:
	dc.w	0
	dc.l	ResultsGfx
	dc.w	$7880

	if def(CC_LEGACY_GFX_LISTS_ABI)
		if CC_LEGACY_GFX_LISTS_ABI<>0
GfxLists	EQU	PLCLists
		endif
	endif
