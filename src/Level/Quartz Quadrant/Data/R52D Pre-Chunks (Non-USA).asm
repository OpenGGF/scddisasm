; ------------------------------------------------------------------------------
; R52D-specific non-USA pre-chunk prefix; R52B provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$005D R52D-specific regional pre-chunk records
; +$005E-+$0721 shared R52B regional pre-chunk data
; ------------------------------------------------------------------------------
	dc.b	$00, $23, $F5, $A4, $90, $E0, $00, $23, $F7, $58, $94, $E0, $00, $23, $F3, $F2
	dc.b	$9A, $40, $00, $00, $00, $23, $DD, $50, $76, $C0, $00, $00, $00, $23, $EC, $48
	dc.b	$76, $C0, $00, $00, $00, $23, $00, $98, $78, $80, $00, $00, $00, $23, $C1, $76
	dc.b	$41, $60, $00, $00, $00, $23, $CA, $96, $41, $40, $00, $02, $00, $22, $FA, $BC
	dc.b	$87, $80, $00, $22, $F4, $F2, $91, $00, $00, $20, $B7, $3C, $7D, $E0, $00, $00
	dc.b	$00, $23, $D9, $E0, $97, $40, $00, $00, $00, $23, $DB, $9E, $97, $40

	; The remaining pre-chunk stream is byte-identical to R52B.
	include "Level/Quartz Quadrant/Data/R52B Pre-Chunks (Non-USA).asm"

; ------------------------------------------------------------------------------
