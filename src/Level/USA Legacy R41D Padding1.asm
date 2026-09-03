
; ------------------------------------------------------------------------------
; USA R41D Padding 1 prefix; USA R41C provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0011 R41D-specific USA records
; +$0012-+$0AA5 shared USA R41C Padding 1 data
; ------------------------------------------------------------------------------
	dc.b	$00, $23, $4E, $42, $87, $80, $00, $23, $48, $78, $91, $00, $00, $20, $B2, $82
	dc.b	$7D, $E0

	; The remaining Padding 1 stream is byte-identical to USA R41C.
	include "Level/USA Legacy R41C Padding1.asm"

; ------------------------------------------------------------------------------
