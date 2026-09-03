; ------------------------------------------------------------------------------
; R32D-specific Padding3 prefix; R32C provides the shared suffix.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$006B R32D-specific retained prefix records
; +$006C-+$26F9 shared R32C Padding3 data
; ------------------------------------------------------------------------------

	dc.b	$D, 0, $2C, $E0, $F8, $D, 0, $34, 0, 8, $D, 0, $3C, $E0, 8
	dc.b	$D, 8, $3C, 0, $18, $C, 0, $20, $E0, $18, $C, 8, $20, 0, $20
	dc.b	7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20
	dc.b	$E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5
	dc.b	0, $64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8
	dc.b	1, $F8, 5, 8, $5C, $F8

	; The remaining retained stream is byte-identical to R32C Padding3.
	include "Level/Collision Chaos/Data/R32C Padding 3.asm"

; ------------------------------------------------------------------------------
