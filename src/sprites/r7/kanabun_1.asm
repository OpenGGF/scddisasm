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
	dc.w	.Sprite7-.Sprites

.Sprite0:
	dc.b	1
	dc.b	$F0, $F, $80, 0, $F0

.Sprite1:
	dc.b	9
	dc.b	$F0, 0, $80, $10, $F0
	dc.b	$F0, 0, $80, $11, $F8
	dc.b	$F0, 0, $80, $12, 0
	dc.b	$F8, 5, $80, $13, $F0
	dc.b	$F8, 0, $80, $17, 0
	dc.b	$F8, 0, $80, $18, 8
	dc.b	0, 4, $80, $19, 0
	dc.b	8, 0, $80, $1B, $F8
	dc.b	8, 0, $90, $12, 0

.Sprite2:
	dc.b	6
	dc.b	$F4, 8, $80, $1C, $F4
	dc.b	$FC, 4, $80, $1F, $F4
	dc.b	$FC, 0, $80, $21, 4
	dc.b	4, 0, $80, $22, $F4
	dc.b	4, 0, $80, $23, $FC
	dc.b	4, 0, $80, $24, 4

.Sprite3:
	dc.b	7
	dc.b	$F4, 0, $80, $25, $F4
	dc.b	$F4, 4, $80, $26, $FC
	dc.b	$FC, 4, $80, $28, $F4
	dc.b	$FC, 4, $80, $2A, 4
	dc.b	4, 0, $80, $2C, $F4
	dc.b	4, 4, $80, $2D, $FC
	dc.b	$C, 4, $80, $2F, $FC

.Sprite4:
	dc.b	6
	dc.b	$F4, 8, 0, $1C, $F4
	dc.b	$FC, 4, 0, $1F, $F4
	dc.b	$FC, 0, 0, $21, 4
	dc.b	4, 0, 0, $22, $F4
	dc.b	4, 0, 0, $23, $FC
	dc.b	4, 0, 0, $24, 4

.Sprite5:
	dc.b	7
	dc.b	$F4, 0, 0, $25, $F4
	dc.b	$F4, 4, 0, $26, $FC
	dc.b	$FC, 4, 0, $28, $F4
	dc.b	$FC, 4, 0, $2A, 4
	dc.b	4, 0, 0, $2C, $F4
	dc.b	4, 4, 0, $2D, $FC
	dc.b	$C, 4, 0, $2F, $FC

.Sprite6:
	dc.b	4
	dc.b	$F4, 9, 0, $31, $F4
	dc.b	4, 0, 0, $37, $F4
	dc.b	4, 0, 0, $38, $FC
	dc.b	4, 0, 0, $39, 4

.Sprite7:
	dc.b	4
	dc.b	$F4, 5, 0, $3A, $F4
	dc.b	$FC, 0, 0, $3E, 4
	dc.b	4, 0, 0, $3F, $F4
	dc.b	4, 0, 0, $40, $FC

; ------------------------------------------------------------------------------
