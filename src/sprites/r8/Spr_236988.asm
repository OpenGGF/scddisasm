; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite1-.Sprites

.Sprite0:
	dc.b	2
	dc.b	$E0, 7, 0, $40, $F8
	dc.b	0, 7, 0, $48, $F8
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$E0, $F, 0, $50, $F8
	dc.b	0, $B, 0, $60, $F0
	dc.b	0

.Sprite2:
	dc.b	2
	dc.b	$E4, $F, 0, $6C, $FC
	dc.b	$FC, $B, 0, $7C, $E4
	dc.b	4
	dc.b	0
	dc.b	0
	dc.b	$88
	dc.b	$FC

.Sprite3:
	dc.b	2
	dc.b	$E8, $F, 0, $89, 0
	dc.b	$F8, $E, 0, $99, $E0
	dc.b	0

.Sprite4:
	dc.b	2
	dc.b	$F8, $D, 0, $A5, $E0
	dc.b	$F8, $D, 0, $AD, 0
	dc.b	0

; ------------------------------------------------------------------------------
