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
	dc.w	.Sprite6-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0

.Sprite1:
	dc.b	1
	dc.b	$F0, $F, 0, $10, $F0

.Sprite2:
	dc.b	2
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, $10, 0

.Sprite3:
	dc.b	2
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	0, $F, 0, 0, $F0

.Sprite4:
	dc.b	4
	dc.b	$E0, $F, 0, 0, $E0
	dc.b	$E0, $F, 0, $10, 0
	dc.b	0, $F, 0, $10, $E0
	dc.b	0, $F, 0, 0, 0

.Sprite5:
	dc.b	4
	dc.b	$F0, $F, 0, 0, $C0
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, $10, 0
	dc.b	$F0, $F, 0, $10, $20

.Sprite6:
	dc.b	4
	dc.b	$C0, $F, 0, $10, $F0
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	0, $F, 0, 0, $F0
	dc.b	$20, $F, 0, $10, $F0

; ------------------------------------------------------------------------------
