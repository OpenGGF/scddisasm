; ------------------------------------------------------------------------------
; USA DEMO43C overlay for the R43 graphics lists
;
; The preceding legacy source begins at the old object address, but DEMO43C
; retains the R43 graphics-list records through Padding1.  Re-emit this small
; source-owned tail after the legacy includes so the overlay remains explicit.
; ------------------------------------------------------------------------------

	org	Padding1-$62
	gfxEntry	MonitorTimeGfx, $B500
	gfxEntry	ExplosionGfx, $D000
	gfxEntry	PointsGfx, $D8C0
	gfxEntry	FlowerGfx, $DAE0
	gfxEntry	RingGfx, $F5C0
	gfxEnd

	gfxStart
	gfxEntry	BossChaseGfx, $63C0
	gfxEntry	SwingGfxC, $8000
	gfxEntry	TonboGfx, $82C0
	gfxEntry	DoorGfxC, $8800
	gfxEntry	AnimalsGfx, $8A00
	gfxEntry	BlockGfxC, $8D40
	gfxEntry	SwitchGfx, $A140
	gfxEnd

	gfxStart
	gfxEntry	BossBubbleGfx, $63C0
	gfxEnd

	gfxStart
	gfxEntry	ResultsGfx, $7880
	gfxEnd

	gfxStart
	gfxEntry	CapsuleGfx, $9020
	gfxEnd
