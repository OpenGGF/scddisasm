; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites1:
	dc.w	.Sprite0-.Sprites1
	dc.w	.Sprite1-.Sprites1
	dc.w	.Sprite21-.Sprites1
	dc.w	.Sprite31-.Sprites1

.Sprite21:
	dc.b	1
	dc.b	$F8, 5, 0, $F, $F8

.Sprite31:
	dc.b	1
	dc.b	$F4, $A, 0, $13, $F4
	even

.Sprites2:
	dc.w	.Sprite0-.Sprites2
	dc.w	.Sprite1-.Sprites2
	dc.w	.Sprite22-.Sprites2
	dc.w	.Sprite32-.Sprites2

.Sprite22:
	dc.b	1
	dc.b	$F8, 5, 0, $1C, $F8

.Sprite32:
	dc.b	1
	dc.b	$F4, $A, 0, $20, $F4

.Sprite0:
	dc.b	4
	dc.b	$F0, $E, 0, 0, $ED
	dc.b	8, 8, 0, $C, $F5
	dc.b	$EC, $C, 0, $29, $F4
	dc.b	$EC, 0, 0, $2D, $14

.Sprite1:
	dc.b	4
	dc.b	$F0, $E, 0, 0, $ED
	dc.b	8, 8, 0, $C, $F5
	dc.b	$EF, $C, 0, $2E, $F4
	dc.b	$EF, 0, 0, $32, $14

; ------------------------------------------------------------------------------
