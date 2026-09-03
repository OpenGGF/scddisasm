; ------------------------------------------------------------------------------
; R32D source-level padding 1
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$002F unique prefix; +$0030-+$0E59 shared R32C Padding 1 tail
; ------------------------------------------------------------------------------

	dc.b	$77, $A0, 0, $23, $6F, $78, $7B, $40, 0, $21, $DE, $3E, $7E
	dc.b	$40, 0, $23, $4C, $14, $84, $20
	dcb.b	3,0
	dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
	dc.b	$22, $F4, $F2, $91
	dcb.b	2,0
	dc.b	$20, $DA, $72, $7D, $E0
; Complete shared R32C Padding 1 tail.
R32DRetainedSharedPadding1:
	include	"Level/Collision Chaos/Data/R32C Padding 1.asm"
