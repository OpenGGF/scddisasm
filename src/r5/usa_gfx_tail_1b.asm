; ------------------------------------------------------------------------------
; R5B USA graphics data retained between the logical PLC lists and Padding1.
;
; The first sequence is an uncounted tail of the legacy main graphics list. The
; second sequence is the legacy section list, including pointers into compressed
; art blocks. These are expressed as assembly data rather than copied binaries.
; ------------------------------------------------------------------------------

USA_R5B_LegacyMainGfxTail:
	dc.l	TitleCardTextGfx
	dc.w	$7A00
	dc.l	Spring45Gfx
	dc.w	$9E40
	dc.l	SpringGfx
	dc.w	$A400
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

USA_R5B_LegacySectionGfxList:
	dc.w	$000D
	dc.l	GoalGfx
	dc.w	$5980
	dc.l	BreakWallGfxB+$60
	dc.w	$6840
	dc.l	HologramGfx+$268
	dc.w	$6A00
	dc.l	HologramGfx+$1C6
	dc.w	$6B00
	dc.l	SasoriGfx+$154
	dc.w	$7200
	dc.l	KumoKumoGfx+$20E
	dc.w	$76C0
	dc.l	KumoKumoGfx+$58
	dc.w	$7FC0
	dc.l	SpikesHV4Gfx
	dc.w	$8280
	dc.l	HologramGfx+$2EE
	dc.w	$8960
	dc.l	HologramGfx+$3A
	dc.w	$8D60
	dc.l	NoroNoroGfx+$11E
	dc.w	$90E0
	dc.l	NoroNoroGfx+$382
	dc.w	$94E0
	dc.l	ConveyorCtrlGfxB+$E6
	dc.w	$9740
	dc.l	NoroNoroGfx-$2E
	dc.w	$9A40
	dc.b	$00, $00, $00, $23
