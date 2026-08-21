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
	dc.b	$EC, 9, 0, 0, $E8
	dc.b	$EC, 9, 8, 0, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	even

.Sprite1:
	dc.b	4
	dc.b	$EC, 9, 0, 6, $E8
	dc.b	$EC, 9, 8, 6, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	even

.Sprite2:
	dc.b	4
	dc.b	$EC, 9, 0, 0, $E8
	dc.b	$EC, 9, 8, 0, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	even

.Sprite3:
	dc.b	4
	dc.b	$EC, 9, 0, 6, $E8
	dc.b	$EC, 9, 8, 6, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	even

.Sprite4:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	even

.Sprite5:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	even

.Sprite6:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	; Unused
	dc.b	$DC, 5, 0, $4C, 8
	even

.Sprite7:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	; Unused
	dc.b	$DC, 5, 0, $50, 8
	even

.Sprite8:
	dc.b	4
	dc.b	$DC, $F, 0, $18, $E4
	dc.b	$FC, $C, 0, $28, $E4
	dc.b	$DC, 7, 0, $2C, 4
	dc.b	$FC, 4, 8, $29, 4
	even

.Sprite9:
	dc.b	2
	dc.b	$E4, $F, 0, $34, $E8
	dc.b	$E4, 7, 0, $44, 8
	even

.SpriteA:
	dc.b	2
	dc.b	$E4, $F, 8, $3C, $E8
	dc.b	$E4, 7, 8, $34, 8
	even

.SpriteB:
	dc.b	4
	dc.b	$DC, $F, 0, 0, $E0
	dc.b	$DC, $F, 0, $10, 0
	dc.b	$FC, $D, 0, $20, $E0
	dc.b	$FC, $D, 0, $28, 0
	even

.SpriteC:
	dc.b	4
	dc.b	$E0, $F, 0, $30, $E0
	dc.b	$E0, 7, 0, $40, 0
	dc.b	0, $E, 0, $48, $E0
	dc.b	0, 6, 0, $54, 0
	even

.SpriteD:
	dc.b	4
	dc.b	$DE, $F, 0, $5A, $E0
	dc.b	$DE, $B, 0, $6A, 0
	dc.b	$FE, $E, 0, $76, $E0
	dc.b	$FE, $A, 0, $82, 0
	even

.SpriteE:
	dc.b	5
	dc.b	$CC, 5, 0, $8B, $E8
	dc.b	$DC, $F, 0, 0, $E0
	dc.b	$DC, $F, 0, $10, 0
	dc.b	$FC, $D, 0, $20, $E0
	dc.b	$FC, $D, 0, $28, 0
	even

.SpriteF:
	dc.b	5
	dc.b	$D0, 5, 0, $8B, $E8
	dc.b	$E0, $F, 0, $30, $E0
	dc.b	$E0, 7, 0, $40, 0
	dc.b	0, $E, 0, $48, $E0
	dc.b	0, 6, 0, $54, 0
	even

.Sprite10:
	dc.b	5
	dc.b	$CE, 5, 0, $8F, $E8
	dc.b	$DE, $F, 0, $5A, $E0
	dc.b	$DE, $B, 0, $6A, 0
	dc.b	$FE, $E, 0, $76, $E0
	dc.b	$FE, $A, 0, $82, 0

; ------------------------------------------------------------------------------
