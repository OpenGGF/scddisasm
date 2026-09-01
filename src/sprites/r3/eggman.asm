; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.OperatingNeutral-.Sprites
	dc.w	.OperatingLeft-.Sprites
	dc.w	.OperatingRight-.Sprites
	dc.w	.OperatingBoth-.Sprites
	dc.w	.Reeling1-.Sprites
	dc.w	.Reeling2-.Sprites
	dc.w	.Defeated-.Sprites
	dc.w	.FinalPhase-.Sprites
	dc.w	.Escape1-.Sprites
	dc.w	.Escape2-.Sprites

; Each frame starts with a piece count followed by five-byte sprite pieces:
; signed Y, size, attributes/tile high, tile low, and signed X.
.OperatingNeutral:
	dc.b	4
	dc.b	$C8, 9, 0, 0, $E8
	dc.b	$C8, 9, 8, 0, 0
	dc.b	$D8, 8, 0, $C, $E8
	dc.b	$D8, 8, 0, $F, 0

.OperatingLeft:
	dc.b	4
	dc.b	$C8, 9, 0, 6, $E8
	dc.b	$C8, 9, 8, 6, 0
	dc.b	$D8, 8, 0, $C, $E8
	dc.b	$D8, 8, 0, $F, 0

.OperatingRight:
	dc.b	4
	dc.b	$C8, 9, 0, 0, $E8
	dc.b	$C8, 9, 8, 0, 0
	dc.b	$D8, 8, 0, $12, $E8
	dc.b	$D8, 8, 0, $15, 0

.OperatingBoth:
	dc.b	4
	dc.b	$C8, 9, 0, 6, $E8
	dc.b	$C8, 9, 8, 6, 0
	dc.b	$D8, 8, 0, $12, $E8
	dc.b	$D8, 8, 0, $15, 0

.Reeling1:
	dc.b	4
	dc.b	$C0, $F, 0, $18, $E0
	dc.b	$C0, $B, 0, $28, 0
	dc.b	$E0, $B, 0, $4C, $E8
	dc.b	$E0, $B, 0, $58, 0

.Reeling2:
	dc.b	4
	dc.b	$C0, $F, 8, $18, 0
	dc.b	$C0, $B, 8, $28, $E8
	dc.b	$E0, $B, 0, $34, $E8
	dc.b	$E0, $B, 0, $40, 0

.Defeated:
	dc.b	8
	dc.b	$C8, 9, 0, 8, $E8
	dc.b	$C8, 9, 8, 8, 0
	dc.b	$D8, 8, 0, $E, $E8
	dc.b	$D8, 8, 0, $11, 0
	dc.b	$E0, 8, 0, $1A, $E8
	dc.b	$E0, 8, 0, $1D, 0
	dc.b	$E8, $A, 0, $20, $E8
	dc.b	$E8, $A, 8, $20, 0

.FinalPhase:
	dc.b	8
	dc.b	$C8, 9, 0, $14, $E8
	dc.b	$C8, 9, 8, $14, 0
	dc.b	$D8, 8, 0, $E, $E8
	dc.b	$D8, 8, 0, $11, 0
	dc.b	$E0, 8, 0, $1A, $E8
	dc.b	$E0, 8, 0, $1D, 0
	dc.b	$E8, $A, 0, $20, $E8
	dc.b	$E8, $A, 8, $20, 0

.Escape1:
	dc.b	9
	dc.b	$C8, 5, 0, 0, $18
	dc.b	$F0, 5, 0, $68, 5
	dc.b	$F8, 5, 0, $70, $20
	dc.b	$C8, $F, 0, $29, 0
	dc.b	$C8, $F, 0, $39, $20
	dc.b	$C8, 3, 0, $49, $40
	dc.b	$E8, $E, 0, $4D, 0
	dc.b	$E8, $E, 0, $59, $20
	dc.b	$E8, 2, 0, $65, $40

.Escape2:
	dc.b	9
	dc.b	$C8, 5, 0, 4, $18
	dc.b	$F0, 5, 0, $6C, 5
	dc.b	$F8, 5, 0, $74, $20
	dc.b	$C8, $F, 0, $29, 0
	dc.b	$C8, $F, 0, $39, $20
	dc.b	$C8, 3, 0, $49, $40
	dc.b	$E8, $E, 0, $4D, 0
	dc.b	$E8, $E, 0, $59, $20
	dc.b	$E8, 2, 0, $65, $40

; ------------------------------------------------------------------------------
