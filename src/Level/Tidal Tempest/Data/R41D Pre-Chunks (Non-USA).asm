
; ------------------------------------------------------------------------------
; R41D-specific non-USA pre-chunk prefix; R41C provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0011 R41D-specific regional pre-chunk records
; +$0012-+$0A9F shared R41C regional pre-chunk data
; ------------------------------------------------------------------------------
	dc.b	$00, $23, $4E, $42, $87, $80, $00, $23, $48, $78, $91, $00, $00, $20, $B2, $88
	dc.b	$7D, $E0

	; The remaining pre-chunk stream is byte-identical to R41C.
	include "Level/Tidal Tempest/Data/R41C Pre-Chunks (Non-USA).asm"

; ------------------------------------------------------------------------------
