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
	dc.b	$F0, $F, 0, 0, $F0

.Sprite1:
	dc.b	2
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0

.Sprite2:
	dc.b	3
	dc.b	$F0, $F, 0, 0, $D0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $10

.Sprite3:
	dc.b	4
	dc.b	$F0, $F, 0, 0, $C0
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0
	dc.b	$F0, $F, 0, 0, $20

.Sprite4:
	dc.b	0

; ------------------------------------------------------------------------------
