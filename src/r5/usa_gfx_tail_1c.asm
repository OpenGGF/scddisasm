; ------------------------------------------------------------------------------
; R5C USA graphics data retained before the regional Padding1 slice.
;
; The binary contains a second, legacy PLC-list sequence after the active lists.
; The final section list continues into the source-owned Padding1 fragment.
; ------------------------------------------------------------------------------

USA_R5C_LegacyStageGfxList:
	gfxStart
	gfxEntry	StageGfx+$1F4, 0
	gfxEntry	BgInsideGfxC+$38, $4160
	gfxEnd

USA_R5C_LegacyMainGfxList:
	gfxStart
	gfxEntry	$0023D4CC, $6000
	gfxEntry	$0023D6A4, $6080
	gfxEntry	$0023D534, $F2E0
	gfxEntry	$0023E5E4, $6640
	gfxEntry	TitleCardGfx, $6C00
	gfxEntry	TitleCardTextGfx, $7A00
	gfxEntry	$0023D9E0, $9740
	gfxEntry	Spring45Gfx, $9E40
	gfxEntry	SpringGfx, $A400
	gfxEntry	HudGfx, $AD00
	gfxEntry	MonitorTimeGfx, $B500
	gfxEntry	ExplosionGfx, $D000
	gfxEntry	PointsGfx, $D8C0
	gfxEntry	FlowerGfx, $DAE0
	gfxEntry	RingGfx, $F5C0
	gfxEnd

USA_R5C_LegacySectionGfxList:
	dc.w	$000C
	dc.l	GoalGfx
	dc.w	$5740
	dc.l	$0023E528
	dc.w	$6840
	dc.l	$0023E346
	dc.w	$6A00
	dc.l	$0023E2A4
	dc.w	$6B00
	dc.l	$0023F0DE
	dc.w	$7200
	dc.l	$0023EC48
	dc.w	$76C0
