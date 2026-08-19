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
	dc.b	$FC, 0, 0, $B7, $FC
	even

.Sprite1:
	dc.b	1
	dc.b	$FC, 0, 0, $B8, $FC
	even

.Sprite2:
	dc.b	1
	dc.b	$FC, 0, 0, $B9, $FC
	even

.Sprite3:
	dc.b	1
	dc.b	$FC, 0, 0, $BA, $FC
	even

.Sprite4:
	dc.b	1
	dc.b	$F8, 5, 0, $BB, $F8

; ------------------------------------------------------------------------------
