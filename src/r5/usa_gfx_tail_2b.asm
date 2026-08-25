; ------------------------------------------------------------------------------
; R52B USA source-owned data between the active graphics lists and Padding1.
; Length: $8E bytes. These are the tail of the legacy graphics lists; the
; final signpost-list entry continues at the start of the Padding1 source.
; ------------------------------------------------------------------------------
USA_R52B_LegacyMainGfxTail:
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

USA_R52B_LegacySectionGfxList:
	dc.w	$000D
	dc.l	$0022F8FC
	dc.w	$5980
	dc.l	$0023E1AE
	dc.w	$6840
	dc.l	$0023DFB6
	dc.w	$6A00
	dc.l	$0023DF14
	dc.w	$6B00
	dc.l	$0023ED9A
	dc.w	$7200
	dc.l	$0023E904
	dc.w	$76C0
	dc.l	$0023E74E
	dc.w	$7FC0
	dc.l	$0023E3B4
	dc.w	$8280
	dc.l	$0023E03C
	dc.w	$8960
	dc.l	$0023DD88
	dc.w	$8D60
	dc.l	$0023F1FA
	dc.w	$90E0
	dc.l	$0023F45E
	dc.w	$94E0
	dc.l	$0023D618
	dc.w	$9740
	dc.l	$0023F0AE
	dc.w	$9A40

USA_R52B_LegacyResultsGfxList:
	dc.w	$0000
	dc.l	$00230098
	dc.w	$7880

USA_R52B_LegacySingleGfxList0:
	dc.w	$0000
	dc.l	$0023C51E
	dc.w	$4B40

USA_R52B_LegacySingleGfxList1:
	dc.w	$0000
	dc.l	$0023CB90
	dc.w	$4B40

USA_R52B_LegacySignpostGfxList:
	dc.w	$0002
	dc.l	$0022FABC
	dc.w	$8780
	dc.l	$0022F4F2
	dc.w	$9100
