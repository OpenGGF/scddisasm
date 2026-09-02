; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; Signpost rotation faces plus the stationary goal-post frame. Each frame begins with a piece count, followed by five-byte pieces: Y, size/shape, tile high byte, tile low byte, X.
; Even-length frames retain one zero alignment byte where required.
; ------------------------------------------------------------------------------
.Map:
	dc.w	.RobotnikFace-.Map
	dc.w	.TurnA-.Map
	dc.w	.TurnB-.Map
	dc.w	.SonicFace-.Map
	dc.w	.TurnC-.Map
	dc.w	.GoalPost-.Map

.RobotnikFace:
	dc.b	4
	dc.b	$D4, $B, 0, 0, $E8
	dc.b	$D4, $B, 0, $C, 0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.TurnA:
	dc.b	3
	dc.b	$D4, $F, 0, $18, $F0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0

.TurnB:
	dc.b	3
	dc.b	$D4, 3, 0, $28, $FC
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0

.SonicFace:
	dc.b	4
	dc.b	$D4, $B, 0, $2C, $E8
	dc.b	$D4, $B, 0, $38, 0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0
	even

.TurnC:
	dc.b	3
	dc.b	$D4, $F, 8, $18, $F0
	dc.b	$F4, 5, 0, $44, $F8
	dc.b	4, $C, 0, $48, $F0

.GoalPost:
	dc.b	4
	dc.b	$E4, 2, 0, 0, $EC
	dc.b	$E4, $F, 0, 3, $F4
	dc.b	4, 1, 0, $13, $FC
	dc.b	$14, 8, 0, $15, $F4
	even
