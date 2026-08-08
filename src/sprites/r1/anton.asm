; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites

.Sprite0:
	dc.b	5
	dc.b	$ED, 5, 0, 0, $F4
	dc.b	$FD, 8, 0, 4, $F4
	dc.b	5, 4, 0, 7, $FC
	dc.b	4, 5, 0, 9, $F8
	dc.b	$FC, 0, 0, $11, $E
	even

.Sprite1:
	dc.b	5
	dc.b	$EC, 5, 0, 0, $F4
	dc.b	$FC, 8, 0, 4, $F4
	dc.b	4, 4, 0, 7, $FC
	dc.b	4, 5, 0, $D, $F8
	dc.b	$FB, 0, 0, $11, $12
	even

.Sprite2:
	dc.b	5
	dc.b	$ED, 5, 0, $12, $F4
	dc.b	$FD, 8, 0, 4, $F4
	dc.b	5, 4, 0, 7, $FC
	dc.b	4, 5, 0, 9, $F8
	dc.b	$FC, 0, 0, $11, $E
	even

.Sprite3:
	dc.b	5
	dc.b	$EC, 5, 0, $12, $F4
	dc.b	$FC, 8, 0, 4, $F4
	dc.b	4, 4, 0, 7, $FC
	dc.b	4, 5, 0, $D, $F8
	dc.b	$FB, 0, 0, $11, $12

; ------------------------------------------------------------------------------
