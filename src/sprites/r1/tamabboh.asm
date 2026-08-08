; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites1:
	dc.w	.Sprite01-.Sprites1
	dc.w	.Sprite1-.Sprites1
	dc.w	.Sprite2-.Sprites1

.Sprite01:
	dc.b	3
	dc.b	$F1, $D, 0, 0, $F0
	dc.b	1, $C, 0, 8, $F0
	dc.b	9, 8, 0, $C, $F8
	even

.Sprites2:
	dc.w	.Sprite02-.Sprites2
	dc.w	.Sprite1-.Sprites2
	dc.w	.Sprite2-.Sprites2

.Sprite02:
	dc.b	1
	dc.b	$F0, $F, 0, $2B, $F0

.Sprite1:
	dc.b	3
	dc.b	$F2, $D, 0, 0, $F0
	dc.b	2, $C, 0, $F, $F0
	dc.b	$A, 8, 0, $13, $F8

.Sprite2:
	dc.b	2
	dc.b	$F0, 8, 0, $16, $F7
	dc.b	$F8, $E, 0, $19, $EF

; ------------------------------------------------------------------------------
