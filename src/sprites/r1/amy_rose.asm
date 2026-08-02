; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Amy Rose sprites (R1)
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
	dc.w	.Sprite8-.Sprites
	dc.w	.Sprite9-.Sprites
	dc.w	.SpriteA-.Sprites
	dc.w	.SpriteB-.Sprites
	dc.w	.SpriteC-.Sprites
	dc.w	.SpriteD-.Sprites
	dc.w	.SpriteE-.Sprites
	dc.w	.SpriteF-.Sprites
	dc.w	.Sprite10-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$E8, $D, 0, $43, $F0
	dc.b	$F8, $C, 0, $4B, $F0
	dc.b	0, 8, 0, $4F, $F0
	dc.b	8, $C, 0, $52, $F0
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, $A, 0, $3A, $F4
	dc.b	0

.Sprite2:
	dc.b	2
	dc.b	$E8, $D, 0, $43, $F0
	dc.b	$F8, $E, 0, $56, $F0
	dc.b	0

.Sprite3:
	dc.b	4
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, 6, $F4
	dc.b	0, 4, 0, 9, $FC
	dc.b	8, 8, 0, $B, $F4
	dc.b	0

.Sprite4:
	dc.b	4
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, $E, $F4
	dc.b	0, 4, 0, $11, $FC
	dc.b	8, 8, 0, $13, $F4
	dc.b	0

.Sprite5:
	dc.b	2
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, $A, 0, $16, $F4
	dc.b	0

.Sprite6:
	dc.b	3
	dc.b	$E8, $E, 0, $6E, $F0
	dc.b	0, 8, 0, $7A, $F0
	dc.b	8, 4, 0, $7D, $F0

.Sprite7:
	dc.b	2
	dc.b	$E8, $A, 0, $7F, $F8
	dc.b	0, $D, 0, $88, $F0
	dc.b	0

.Sprite8:
	dc.b	1
	dc.b	$F8, 5, 0, $62, $F8

.Sprite9:
	dc.b	1
	dc.b	$F8, 5, 0, $66, $F8

.SpriteA:
	dc.b	1
	dc.b	$F8, 5, 0, $6A, $F8

.SpriteB:
	dc.b	3
	dc.b	$E8, $A, 0, $1F, $F4
	dc.b	$F0, 0, 0, $28, $C
	dc.b	0, 9, 0, $32, $F4

.SpriteC:
	dc.b	2
	dc.b	$E8, $A, 0, $29, $F4
	dc.b	0, 9, 0, $32, $F4
	dc.b	0

.SpriteD:
	dc.b	5
	dc.b	$F4, 4, 0, $38, $FE
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, $E, $F4
	dc.b	0, 4, 0, $11, $FC
	dc.b	8, 8, 0, $13, $F4

.SpriteE:
	dc.b	3
	dc.b	$F8, 4, 0, $38, $FE
	dc.b	$EC, $A, 0, $7F, $F8
	dc.b	4, $D, 0, $88, $F0

.SpriteF:
	dc.b	3
	dc.b	$F4, 4, 0, $38, $FE
	dc.b	$E8, $A, 0, $29, $F4
	dc.b	0, 9, 0, $32, $F4

.Sprite10:
	dc.b	3
	dc.b	$EC, $A, 0, $7F, $F8
	dc.b	4, $C, 0, $90, $F0
	dc.b	$C, 8, 0, $94, $F0
	
; ------------------------------------------------------------------------------