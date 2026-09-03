; ------------------------------------------------------------------------------
; R12D-specific pre-chunk prefix; R12C provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$002B R12D-specific regional pre-chunk records
; +$002C-+$0E09 shared R12C regional pre-chunk data
; ------------------------------------------------------------------------------

	dc.b	$7E, $40, $00, $01, $00, $23, $73, $78, $6F, $E0, $00, $23, $7D, $C6, $7B, $80
	dc.b	$00, $00, $00, $23, $28, $76, $78, $80, $00, $02, $00, $23, $22, $9A, $87, $80
	dc.b	$00, $23, $1C, $D0, $91, $00, $00, $20, $D7, $4E, $7D, $E0

	; The remaining pre-chunk stream is byte-identical to R12C.
	include "Level/Palmtree Panic/Data/R12C Pre-Chunks.asm"

; ------------------------------------------------------------------------------
