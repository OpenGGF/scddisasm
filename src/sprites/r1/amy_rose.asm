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
	even

.Sprite1:
	dc.b	2
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, $A, 0, $3A, $F4
	even

.Sprite2:
	dc.b	2
	dc.b	$E8, $D, 0, $43, $F0
	dc.b	$F8, $E, 0, $56, $F0
	even

.Sprite3:
	dc.b	4
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, 6, $F4
	dc.b	0, 4, 0, 9, $FC
	dc.b	8, 8, 0, $B, $F4
	even

.Sprite4:
	dc.b	4
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, $E, $F4
	dc.b	0, 4, 0, $11, $FC
	dc.b	8, 8, 0, $13, $F4
	even

.Sprite5:
	dc.b	2
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, $A, 0, $16, $F4
	even

.Sprite6:
	dc.b	3
	dc.b	$E8, $E, 0, $6E, $F0
	dc.b	0, 8, 0, $7A, $F0
	dc.b	8, 4, 0, $7D, $F0
	even

.Sprite7:
	dc.b	2
	dc.b	$E8, $A, 0, $7F, $F8
	dc.b	0, $D, 0, $88, $F0
	even

.Sprite8:
	dc.b	1
	dc.b	$F8, 5, 0, $62, $F8
	even

.Sprite9:
	dc.b	1
	dc.b	$F8, 5, 0, $66, $F8
	even

.SpriteA:
	dc.b	1
	dc.b	$F8, 5, 0, $6A, $F8
	even

.SpriteB:
	dc.b	3
	dc.b	$E8, $A, 0, $1F, $F4
	dc.b	$F0, 0, 0, $28, $C
	dc.b	0, 9, 0, $32, $F4
	even

.SpriteC:
	dc.b	2
	dc.b	$E8, $A, 0, $29, $F4
	dc.b	0, 9, 0, $32, $F4
	even

.SpriteD:
	dc.b	5
	dc.b	$F4, 4, 0, $38, $FE
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, $E, $F4
	dc.b	0, 4, 0, $11, $FC
	dc.b	8, 8, 0, $13, $F4
	even

.SpriteE:
	dc.b	3
	dc.b	$F8, 4, 0, $38, $FE
	dc.b	$EC, $A, 0, $7F, $F8
	dc.b	4, $D, 0, $88, $F0
	even

.SpriteF:
	dc.b	3
	dc.b	$F4, 4, 0, $38, $FE
	dc.b	$E8, $A, 0, $29, $F4
	dc.b	0, 9, 0, $32, $F4
	even

.Sprite10:
	dc.b	3
	dc.b	$EC, $A, 0, $7F, $F8
	dc.b	4, $C, 0, $90, $F0
	dc.b	$C, 8, 0, $94, $F0
	
; ------------------------------------------------------------------------------
