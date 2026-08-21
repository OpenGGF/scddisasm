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
	dc.b	$FC, 4, $40, 0, $F8

.Sprite1:
	dc.b	2
	dc.b	$FC, 4, 0, 2, $F0
	dc.b	$FC, 4, 8, 2, 0

.Sprite2:
	dc.b	2
	dc.b	$FC, 4, 0, 2, $EC
	dc.b	$FC, 4, 8, 2, 4

.Sprite3:
	dc.b	2
	dc.b	$FC, 4, 0, 2, $E8
	dc.b	$FC, 4, 8, 2, 8

.Sprite4:
	dc.b	2
	dc.b	$FC, 4, 0, 2, $E4
	dc.b	$FC, 4, 8, 2, $C

.Sprite5:
	dc.b	0

; ------------------------------------------------------------------------------
