; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites
	dc.w	.Sprites-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$E0, $F, 0, 0, $F0
	dc.b	0, $F, 0, $10, $F0
	dc.b	0

.Sprite4:
	dc.b	2
	dc.b	$F0, $F, 0, $20, $E0
	dc.b	$F0, $F, 0, $30, 0
	dc.b	0

; ------------------------------------------------------------------------------
