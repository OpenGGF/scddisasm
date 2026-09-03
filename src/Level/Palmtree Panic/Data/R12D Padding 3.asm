; ------------------------------------------------------------------------------
; R12D-specific Padding3 prefix; R31C provides the shared suffix.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0025 R12D-specific retained prefix records
; +$0026-+$2683 shared R31C Padding3 data
; ------------------------------------------------------------------------------

	dc.b	$2D, $CE, $AE, $DC, $E5, $89, $76, $E7, $19, $39, $76, $E6, $5C, $B3, $97, $6E
	dc.b	$7D, $8E, $59, $CB, $B1, $EC, $72, $CE, $5E, $3B, $1C, $B3, $CF, $B1, $CB, $3C
	dc.b	$FB, $1C, $B5, $FB, $1F, $3E

	; The remaining retained stream is byte-identical to R31C Padding3.
	include "Level/Collision Chaos/Data/R31C Padding 3.asm"

; ------------------------------------------------------------------------------
