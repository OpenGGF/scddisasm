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
	dc.b	2
	dc.b	$F0, 5, 0, 0, $FC
	dc.b	$F8, 0, 0, 4, $F4
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$E0, 0, 0, 5, $F8
	dc.b	$E8, $E, 0, 6, $F0
	dc.b	0

.Sprite2:
	dc.b	1
	dc.b	$E0, $F, 0, $12, $F0

.Sprite3:
	dc.b	4
	dc.b	$D0, 6, 0, $22, $F8
	dc.b	$D8, 0, 0, $28, $F0
	dc.b	$E0, 0, 0, $29, 8
	dc.b	$E8, $E, 0, $2A, $F0
	dc.b	0

.Sprite4:
	dc.b	4
	dc.b	$C0, 0, 0, $36, $F8
	dc.b	$C8, 6, 0, $37, $F8
	dc.b	$D8, 0, 0, $3D, $F0
	dc.b	$E0, $F, 0, $3E, $F0
	dc.b	0

.Sprite5:
	dc.b	1
	dc.b	$F0, 9, 0, $4E, $F4

.Sprite6:
	dc.b	1
	dc.b	$F8, 4, 0, $54, $F8

; ------------------------------------------------------------------------------
