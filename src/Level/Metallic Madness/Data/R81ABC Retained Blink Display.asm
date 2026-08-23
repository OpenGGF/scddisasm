; -------------------------------------------------------------------------
; Retained R81A/R81B/R81C mapping records and blink/display helper
; -------------------------------------------------------------------------

R81ABC_RetainedBlinkMappings:
	dc.w	$0240, $FE00, $0006, $0010
	dc.w	$0220, $FE00, $0000, $0012
	dc.w	$0200, $FE00, $0006, $0014
	dc.w	$01E0, $FE00, $000A, $0010

R81ABC_RetainedBlinkDisplay:
	bsr.w	$20CE2E
	eori.b	#1,$34(a0)
	beq.s	.Display
	jsr	$2038DA
.Display:
	jmp	$2077DA

; -------------------------------------------------------------------------
