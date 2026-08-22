; ------------------------------------------------------------------------------
; R5D USA graphics data retained between the logical PLC lists and Padding1.
;
; These are the legacy PLC records that follow the active lists. They are kept
; as individual records so their original pointer and VRAM layout is explicit.
; ------------------------------------------------------------------------------

USA_R5D_LegacyGfxTail:
	; Uncounted tail of the legacy graphics list.
	dc.l	$0023F5A4
	dc.w	$90E0
	dc.l	$0023F758
	dc.w	$94E0
	dc.l	$0023F3F2
	dc.w	$9A40

	; Single-entry legacy lists.
	dc.w	$0000
	dc.l	$0023EC48
	dc.w	$76C0
	dc.w	$0000
	dc.l	$0023DD50
	dc.w	$76C0
	dc.w	$0000
	dc.l	$00230098
	dc.w	$7880
	dc.w	$0000
	dc.l	$0023C176
	dc.w	$4160
	dc.w	$0000
	dc.l	$0023CA96
	dc.w	$4140

	; Legacy signpost list.
	dc.w	$0002
	dc.l	$0022FABC
	dc.w	$8780
	dc.l	$0022F4F2
	dc.w	$9100
	dc.l	$0020B8BC
	dc.w	$7DE0

	; Two single-entry lists precede the uncounted main-list tail.
	dc.w	$0000
	dc.l	$0023D9E0
	dc.w	$9740
	dc.w	$0000
	dc.l	$0023DB9E
	dc.w	$9740

USA_R5D_LegacyMainGfxTail:
	dc.l	$002339E4
	dc.w	$7A00
	dc.l	$00231E2E
	dc.w	$9E40
	dc.l	$0023213A
	dc.w	$A400
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
	; RingGfx's pointer continues in the regional Padding1 source.
	dc.b	$00, $23
