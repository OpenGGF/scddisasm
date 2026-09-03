; ------------------------------------------------------------------------------
; R33D-specific pre-chunk prefix; R33C provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0031 R33D-specific regional pre-chunk records
; +$0032-+$08F3 shared R33C regional pre-chunk data
; ------------------------------------------------------------------------------

	dc.b	$71, $28, $8F, $80, $00, $23, $47, $9A, $93, $A0, $00, $23, $4A, $00, $99, $C0
	dc.b	$00, $23, $1E, $2E, $9E, $40, $00, $23, $21, $3A, $A4, $00, $00, $01, $00, $23
	dc.b	$68, $32, $7F, $80, $00, $22, $EE, $4A, $90, $20, $00, $00, $00, $23, $00, $98
	dc.b	$78, $80

	; The remaining pre-chunk stream is byte-identical to R33C.
	include "Level/Collision Chaos/Data/R33C Pre-Chunks.asm"

; ------------------------------------------------------------------------------
