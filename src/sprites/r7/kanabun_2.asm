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
	dc.b	$F0, $F, $80, $41, $F0

.Sprite1:
	dc.b	7
	dc.b	$F0, 0, $80, $10, $F0
	dc.b	$F0, 4, $80, $51, $F8
	dc.b	$F8, 8, $80, $53, $F0
	dc.b	$F8, 0, $80, $18, 8
	dc.b	0, 4, $80, $56, $F0
	dc.b	0, 4, $80, $19, 0
	dc.b	8, 4, $80, $58, $F8

.Sprite2:
	dc.b	6
	dc.b	$F4, 8, $80, $5A, $F4
	dc.b	$FC, 4, $80, $5D, $F4
	dc.b	$FC, 0, $80, $21, 4
	dc.b	4, 0, $80, $5F, $F4
	dc.b	4, 0, $80, $23, $FC
	dc.b	4, 0, $80, $60, 4

.Sprite3:
	dc.b	7
	dc.b	$F4, 0, $80, $25, $F4
	dc.b	$F4, 4, $80, $61, $FC
	dc.b	$FC, 4, $80, $63, $F4
	dc.b	$FC, 4, $80, $2A, 4
	dc.b	4, 0, $80, $2C, $F4
	dc.b	4, 4, $80, $65, $FC
	dc.b	$C, 4, $80, $2F, $FC

.Sprite4:
	dc.b	6
	dc.b	$F4, 8, 0, $5A, $F4
	dc.b	$FC, 4, 0, $5D, $F4
	dc.b	$FC, 0, 0, $21, 4
	dc.b	4, 0, 0, $5F, $F4
	dc.b	4, 0, 0, $23, $FC
	dc.b	4, 0, 0, $60, 4

.Sprite5:
	dc.b	7
	dc.b	$F4, 0, 0, $25, $F4
	dc.b	$F4, 4, 0, $61, $FC
	dc.b	$FC, 4, 0, $63, $F4
	dc.b	$FC, 4, 0, $2A, 4
	dc.b	4, 0, 0, $2C, $F4
	dc.b	4, 4, 0, $65, $FC
	dc.b	$C, 4, 0, $2F, $FC

.Sprite6:
	dc.b	4
	dc.b	$F4, 9, 0, $67, $F4
	dc.b	4, 0, 0, $6D, $F4
	dc.b	4, 0, 0, $38, $FC
	dc.b	4, 0, 0, $6E, 4

.Sprite7:
	dc.b	4
	dc.b	$F4, 5, 0, $6F, $F4
	dc.b	$FC, 0, 0, $3E, 4
	dc.b	4, 0, 0, $3F, $F4
	dc.b	4, 0, 0, $73, $FC

; ------------------------------------------------------------------------------
