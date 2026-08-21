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
	dc.b	2
	dc.b	0, 0, 0, 0, $F8
	dc.b	0, 0, 0, 3, 0
	even

.Sprite1:
	dc.b	2
	dc.b	0, 0, 0, 1, $F8
	dc.b	0, 0, 0, 3, 0
	even

.Sprite2:
	dc.b	2
	dc.b	0, 0, 0, 2, $F8
	dc.b	0, 0, 0, 3, 0
	even

.Sprite3:
	dc.b	2
	dc.b	0, 0, 0, 4, $F8
	dc.b	0, 0, 0, 3, 0
	even

.Sprite4:
	dc.b	1
	dc.b	0, 0, 0, 4, $FC
	even

.Sprite5:
	dc.b	3
	dc.b	0, 0, 0, 0, $F4
	dc.b	0, 0, 0, 3, $FC
	dc.b	0, 0, 0, 3, 4

; ------------------------------------------------------------------------------
