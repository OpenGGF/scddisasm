; ------------------------------------------------------------------------------
; R52A USA data between the active graphics lists and Padding1 (0x9A bytes).
;
; This region is source-owned so the USA build does not read the original MMD.
; The leading legacy object record and trampoline are expressed as their
; original data/instruction forms; the following table remains packed data.
; ------------------------------------------------------------------------------
USA_R52A_LegacyObjectRecord:
	dc.w	$097C, $0001, $48B0

USA_R52A_LegacyFlowerJump:
	jmp	$2064C2.l

USA_R52A_LegacyMappingData:
	dc.b	$03, $23, $8E, $D2, $02, $23, $7C, $50, $00, $21
	dc.b	$00, $00, $00, $81, $04, $04, $00, $26, $00, $34, $00, $8A, $00, $26, $00, $8A
	dc.b	$00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A
	dc.b	$00, $8A, $00, $E2, $00, $EA, $00, $DA, $00, $8A, $00, $F2, $00, $01, $00, $23
	dc.b	$8E, $D2, $00, $00, $00, $23, $C4, $58, $4A, $80, $00, $0D, $00, $23, $D1, $20
	dc.b	$60, $00, $00, $23, $D2, $F0, $60, $80, $00, $23, $D1, $94, $F2, $E0, $00, $23
	dc.b	$E2, $A2, $66, $40, $00, $23, $0D, $A2, $6C, $00, $00, $23, $39, $E4, $7A, $00
	dc.b	$00, $23, $1E, $2E, $9E, $40, $00, $23, $21, $3A, $A4, $00, $00, $23, $34, $BC
	dc.b	$AD, $00, $00, $23, $23, $5C, $B5, $00, $00, $23, $29, $60, $D0, $00, $00, $22
	dc.b	$ED, $E6, $D8, $C0
