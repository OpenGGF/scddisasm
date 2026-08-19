; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite5-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F8, $D, 0, $5F, $F4
	even

.Sprite1:
	dc.b	1
	dc.b	$F8, 9, 0, $67, $FC
	even

.Sprite2:
	dc.b	2
	dc.b	$F8, 0, 0, $6D, $EC
	dc.b	$F8, $D, 0, $6E, $F4
	even

.Sprite3:
	dc.b	1
	dc.b	$F8, $D, $10, $5F, $F4
	even

.Sprite4:
	dc.b	1
	dc.b	$F8, 9, $10, $67, $FC
	even

.Sprite5:
	dc.b	2
	dc.b	0, 0, $10, $6D, $EC
	dc.b	$F8, $D, $10, $6E, $F4

; ------------------------------------------------------------------------------
