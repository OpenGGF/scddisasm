; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.VSprites:
	dc.w	.VSprite0-.VSprites
	dc.w	.VSprite1-.VSprites
	dc.w	.VSprite2-.VSprites

.HSprites:
	dc.w	.HSprite0-.HSprites
	dc.w	.HSprite1-.HSprites
	dc.w	.HSprite2-.HSprites

.VSprite0:
	dc.b	2
	dc.b	$F8, $C, 0, 0, $F0
	dc.b	0, $C, 0, 4, $F0
	even

.VSprite1:
	dc.b	1
	dc.b	0, $C, 0, 0, $F0
	even

.VSprite2:
	dc.b	3
	dc.b	$E0, $C, 0, 0, $F0
	dc.b	$E8, 6, 0, 8, $F8
	dc.b	0, $C, 0, $E, $F0
	even

.HSprite0:
	dc.b	2
	dc.b	$F0, 3, 0, $12, 0
	dc.b	$F0, 3, 0, $16, $F8
	even

.HSprite1:
	dc.b	1
	dc.b	$F0, 3, 0, $12, $F8
	even

.HSprite2:
	dc.b	3
	dc.b	$F0, 3, 0, $12, $18
	dc.b	$F8, 9, 0, $1A, 0
	dc.b	$F0, 3, 0, $20, $F8

; ------------------------------------------------------------------------------
