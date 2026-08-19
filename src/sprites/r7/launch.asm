; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$FC, 4, 0, 0, $F8
	even

.Sprite1:
	dc.b	1
	dc.b	$F8, 5, 0, 2, $F8
	even

.Sprite2:
	dc.b	2
	dc.b	$F4, $E, 0, 6, $E0
	dc.b	$F4, $E, 8, 6, 0
	even

.Sprite3:
	dc.b	2
	dc.b	$E0, $B, 0, $12, $F4
	dc.b	0, $B, $10, $12, $F4
	even

.Sprite4:
	dc.b	7
	dc.b	$E4, $A, 0, $1E, 4
	dc.b	$EC, 0, 0, $27, $FC
	dc.b	$F4, 5, 0, $28, $F4
	dc.b	$FC, 0, 0, $2C, $EC
	dc.b	$FC, 0, 0, $2D, 4
	dc.b	4, 0, 0, $2E, $FC
	dc.b	4, $A, 0, $2F, $E4

; ------------------------------------------------------------------------------
