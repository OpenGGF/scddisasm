
; ------------------------------------------------------------------------------
; R61C Padding 3 bridge prefix; R61CD Padding 3 Prefix Tail.asm provides the shared suffix.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$002A prefix-specific packed records
; +$002B-+$02C3 shared R61CD Padding 3 Prefix Tail.asm data
; ------------------------------------------------------------------------------
	dc.b	$FE, $F0, $DC, $3F, $78, $D6, $9C, $72, $6C, $5F, $64, $53, $B1, $55, $FC, $31
	dc.b	$E1, $F9, $DF, $D8, $BC, $5E, $EB, $C5, $C2, $F1, $52, $88, $88, $B4, $E4, $21
	dc.b	$C9, $B1, $10, $C6, $D8, $AA, $16, $C5, $57, $62, $AA

	; The remaining suffix is byte-identical to R61CD Padding 3 Prefix Tail.asm.
	include "Level/Wacky Workbench/Data/R61CD Padding 3 Prefix Tail.asm"

; ------------------------------------------------------------------------------
