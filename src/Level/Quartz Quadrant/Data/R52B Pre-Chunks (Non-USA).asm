; ------------------------------------------------------------------------------
; R52B-specific non-USA pre-chunk prefix; R52A provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$009F R52B-specific regional pre-chunk records
; +$00A0-+$06C3 shared R52A regional pre-chunk data
; ------------------------------------------------------------------------------

	dc.b	$00, $23, $23, $5C, $B5, $00, $00, $23, $29, $60, $D0, $00, $00, $22, $ED, $E6
	dc.b	$D8, $C0, $00, $23, $37, $32, $DA, $E0, $00, $23, $2E, $48, $F5, $C0, $00, $0D
	dc.b	$00, $22, $F8, $FC, $59, $80, $00, $23, $E1, $AE, $68, $40, $00, $23, $DF, $B6
	dc.b	$6A, $00, $00, $23, $DF, $14, $6B, $00, $00, $23, $ED, $9A, $72, $00, $00, $23
	dc.b	$E9, $04, $76, $C0, $00, $23, $E7, $4E, $7F, $C0, $00, $23, $E3, $B4, $82, $80
	dc.b	$00, $23, $E0, $3C, $89, $60, $00, $23, $DD, $88, $8D, $60, $00, $23, $F1, $FA
	dc.b	$90, $E0, $00, $23, $F4, $5E, $94, $E0, $00, $23, $D6, $18, $97, $40, $00, $23
	dc.b	$F0, $AE, $9A, $40, $00, $00, $00, $23, $00, $98, $78, $80, $00, $00, $00, $23
	dc.b	$C5, $1E, $4B, $40, $00, $00, $00, $23, $CB, $90, $4B, $40, $00, $02, $00, $22
	dc.b	$FA, $BC, $87, $80, $00, $22, $F4, $F2, $91, $00, $00, $20, $B8, $46, $7D, $E0

	; The remaining pre-chunk stream is byte-identical to R52A.
	include "Level/Quartz Quadrant/Data/R52A Pre-Chunks (Non-USA).asm"

; ------------------------------------------------------------------------------
