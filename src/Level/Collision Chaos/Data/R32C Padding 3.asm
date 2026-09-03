; ------------------------------------------------------------------------------
; R32C-specific Padding3 prefix; R31C provides the shared suffix.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0053 R32C-specific retained prefix records
; +$0054-+$268D shared R31C Padding3 data
; ------------------------------------------------------------------------------

	dc.b	$18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	6, 8, $D, 0, $44, $E0, 8, $D, 0, $4C, 0, $18, $C, 0, $20
	dc.b	$E0, $18, $C, 8, $20, 0, $20, 7, 0, $54, $F0, $20, 7, 8, $54
	dcb.b	2,0
	dc.b	1, $F8, 5, 0, $5C, $F8, 1, $F8, 5, 0, $60, $F8, 1, $F8, 5
	dc.b	0, $64, $F8, 1, $F8, 5, 8, $64, $F8, 1, $F8, 5, 8, $60, $F8
	dc.b	1, $F8, 5, 8, $5C, $F8

	; The remaining retained stream is byte-identical to the R31C suffix.
	include	"Level/Collision Chaos/Data/R31C Padding 3 Shared Suffix.asm"

; ------------------------------------------------------------------------------
