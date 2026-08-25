; ------------------------------------------------------------------------------
; R52C USA source-owned data between the active graphics lists and Padding1.
; Length: $8E bytes. The final section-list record continues at the start of
; the Padding1 source.
; ------------------------------------------------------------------------------
USA_R52C_LegacyStageGfxList:
	; Two entries; the count is the legacy PLC count-minus-one field.
	dc.w	$0001
	dc.l	$00238FCE
	dc.w	$0000
	dc.l	$0023C176
	dc.w	$4160

USA_R52C_LegacyMainGfxList:
	dc.w	$000E
	dc.l	$0023D4CC
	dc.w	$6000
	dc.l	$0023D6A4
	dc.w	$6080
	dc.l	$0023D534
	dc.w	$F2E0
	dc.l	$0023E5E4
	dc.w	$6640
	dc.l	$00230DA2
	dc.w	$6C00
	dc.l	$002339E4
	dc.w	$7A00
	dc.l	$0023D9E0
	dc.w	$9740
	dc.l	$0023213A
	dc.w	$A400
	dc.l	$00231E2E
	dc.w	$9E40
	dc.l	$002334BC
	dc.w	$AD00
	dc.l	$0023235C
	dc.w	$B500
	dc.l	$00232960
	dc.w	$D000
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

USA_R52C_LegacySectionGfxList:
	dc.w	$000C
	dc.l	$0022F8FC
	dc.w	$5740
	dc.l	$0023E528
	dc.w	$6840
	dc.l	$0023E346
	dc.w	$6A00
	dc.l	$0023E2A4
	dc.w	$6B00
	dc.l	$0023F0DE
	dc.w	$7200
	dc.l	$0023DD50
