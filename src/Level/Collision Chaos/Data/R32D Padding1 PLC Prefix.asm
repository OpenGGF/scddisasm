; ------------------------------------------------------------------------------
; R32D retained PLC records before the shared R32C Padding 1 stream.
; ------------------------------------------------------------------------------

; The preceding source pointer is outside this retained Act 1 Present tail;
; its destination word is retained here.
R32DRetainedAct1PresentSectionPLCTail:
	dc.w	$77A0
	dc.l	$00236F78		; animals
	dc.w	$7B40
	dc.l	$0021DE3E		; KamaKama
	dc.w	$7E40
	dc.l	$00234C14		; metal platform
	dc.w	$8420

; Single-entry Results PLC.
R32DRetainedAct1PresentResultsPLC:
	dc.w	0
	dc.l	$00230098		; Results art
	dc.w	$7880

; Three-entry Signpost PLC.
R32DRetainedAct1PresentSignpostPLC:
	dc.w	2
	dc.l	$0022FABC		; signpost
	dc.w	$8780
	dc.l	$0022F4F2		; big ring
	dc.w	$9100
	dc.l	$0020DA72		; big-ring flash
	dc.w	$7DE0
