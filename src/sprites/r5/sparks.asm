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
	dc.b	0, 4, 1, 7, 0
	even

.Sprite1:
	dc.b	1
	dc.b	0, 4, 1, 9, 0
	even

.Sprite2:
	dc.b	1
	dc.b	0, 4, 1, $B, 0
	even

.Sprite3:
	dc.b	1
	dc.b	0, 4, 1, $D, 0
	even

.Sprite4:
	dc.b	1
	dc.b	0, 4, 1, $F, 0

; ------------------------------------------------------------------------------
