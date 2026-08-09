; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite2-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$E0, 3, 0, 0, $FC
	dc.b	0, 3, 0, 4, $FC
	even

.Sprite1:
	dc.b	2
	dc.b	$E0, $B, 0, 8, $FC
	dc.b	$F0, $B, 0, $14, $14
	even

.Sprite2:
	dc.b	2
	dc.b	$E0, $C, 0, $20, $FC
	dc.b	$E0, $C, 0, $24, $1C

; ------------------------------------------------------------------------------
