; ------------------------------------------------------------------------------
; R52D USA source-owned data between the active graphics lists and Padding1.
; Length: $8E bytes. The final section-list record continues at the start of
; the Padding1 source.
; ------------------------------------------------------------------------------
USA_R52D_LegacyMainGfxTail0:
	dc.l	$0023F5A4
	dc.w	$90E0
	dc.l	$0023F758
	dc.w	$94E0
	dc.l	$0023F3F2
	dc.w	$9A40

USA_R52D_LegacySingleGfxList0:
	dc.w	$0000
	dc.l	$0023DD50
	dc.w	$76C0

USA_R52D_LegacySingleGfxList1:
	dc.w	$0000
	dc.l	$0023EC48
	dc.w	$76C0

USA_R52D_LegacyResultsGfxList:
	dc.w	$0000
	dc.l	$00230098
	dc.w	$7880

USA_R52D_LegacySingleGfxList2:
	dc.w	$0000
	dc.l	$0023C176
	dc.w	$4160

USA_R52D_LegacySingleGfxList3:
	dc.w	$0000
	dc.l	$0023CA96
	dc.w	$4140

USA_R52D_LegacySignpostGfxList:
	dc.w	$0002
	dc.l	$0022FABC
	dc.w	$8780
	dc.l	$0022F4F2
	dc.w	$9100
	dc.l	$0020B6AE
	dc.w	$7DE0

USA_R52D_LegacySingleGfxList4:
	dc.w	$0000
	dc.l	$0023D9E0
	dc.w	$9740

USA_R52D_LegacySingleGfxList5:
	dc.w	$0000
	dc.l	$0023DB9E
	dc.w	$9740

USA_R52D_LegacyMainGfxTail1:
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

USA_R52D_LegacySectionGfxList:
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
