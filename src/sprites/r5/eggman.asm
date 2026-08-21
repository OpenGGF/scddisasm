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

.Sprite0:
	dc.b	4
	dc.b	$E4, $D, 0, $77, $F0
	dc.b	$F4, $D, 0, $7F, $E8
	dc.b	$F4, 1, 0, $87, 8
	dc.b	4, $E, 0, $89, $F0
	even

.Sprite1:
	dc.b	4
	dc.b	$E4, $D, 0, $77, $F0
	dc.b	$F4, $D, 0, $95, $E8
	dc.b	$F4, 1, 0, $9D, 8
	dc.b	4, $E, 0, $89, $F0
	even

.Sprite2:
	dc.b	6
	dc.b	$F4, 9, 0, $54, $E8
	dc.b	$D0, 5, 1, $9C, 8
	dc.b	$E0, 9, 1, $1B, $E8
	dc.b	$E0, 9, 9, $1B, 0
	dc.b	$F0, $F, 1, $29, $E8
	dc.b	$F0, 7, 1, $39, 8
	even

.Sprite3:
	dc.b	5
	dc.b	$F4, 9, 0, $54, $E8
	dc.b	$D0, 5, 1, $A0, 8
	dc.b	$E0, $D, 1, $21, $F0
	dc.b	$F0, $F, 1, $29, $E8
	dc.b	$F0, 7, 1, $39, 8
	even

.Sprite4:
	dc.b	5
	dc.b	$F4, 9, 0, $54, $E8
	dc.b	$E0, 9, 1, $1B, $E8
	dc.b	$E0, 9, 9, $1B, 0
	dc.b	$F0, $F, 1, $29, $E8
	dc.b	$F0, 7, 1, $39, 8
	even

.Sprite5:
	dc.b	4
	dc.b	$F4, 9, 0, $54, $E8
	dc.b	$E0, $D, 1, $21, $F0
	dc.b	$F0, $F, 1, $29, $E8
	dc.b	$F0, 7, 1, $39, 8
	even

.Sprite6:
	dc.b	6
	dc.b	$D4, 5, 1, $9C, 8
	dc.b	$E4, $D, 1, $41, $F0
	dc.b	$F4, $D, 0, $7F, $E8
	dc.b	$F4, 1, 0, $87, 8
	dc.b	4, $E, 1, $49, $E8
	dc.b	4, 6, 1, $55, 8
	even

.Sprite7:
	dc.b	6
	dc.b	$D4, 5, 1, $A0, 8
	dc.b	$E4, $D, 1, $41, $F0
	dc.b	$F4, $D, 0, $7F, $E8
	dc.b	$F4, 1, 0, $87, 8
	dc.b	4, $E, 9, $49, $F8
	dc.b	4, 6, 9, $55, $E8
	even

.Sprite8:
	dc.b	5
	dc.b	$E4, $D, 1, $41, $F0
	dc.b	$F4, $D, 0, $7F, $E8
	dc.b	$F4, 1, 0, $87, 8
	dc.b	4, $E, 1, $49, $E8
	dc.b	4, 6, 1, $55, 8
	even

.Sprite9:
	dc.b	5
	dc.b	$E4, $D, 1, $41, $F0
	dc.b	$F4, $D, 0, $7F, $E8
	dc.b	$F4, 1, 0, $87, 8
	dc.b	4, $E, 9, $49, $F8
	dc.b	4, 6, 9, $55, $E8
	even

.SpriteA:
	dc.b	5
	dc.b	$CC, 5, 9, $9C, $E8
	dc.b	$DC, $F, 1, $5B, $E0
	dc.b	$DC, 7, 1, $6B, 0
	dc.b	$FC, $D, 1, $73, $E8
	dc.b	$FC, 9, 1, $7B, 8
	even

.SpriteB:
	dc.b	4
	dc.b	$D0, 5, 9, $9C, $E8
	dc.b	$E0, $F, 1, $5B, $E0
	dc.b	$E0, 7, 1, $6B, 0
	dc.b	0, $E, 1, $81, $F0
	even

.SpriteC:
	dc.b	5
	dc.b	$CE, 5, 9, $A0, $E8
	dc.b	$DE, $F, 1, $5B, $E0
	dc.b	$DE, 7, 1, $6B, 0
	dc.b	$FE, $E, 1, $8D, $F0
	dc.b	$FE, 2, 1, $99, $10
	even

.SpriteD:
	dc.b	4
	dc.b	$DC, $F, 1, $5B, $E0
	dc.b	$DC, 7, 1, $6B, 0
	dc.b	$FC, $D, 1, $73, $E8
	dc.b	$FC, 9, 1, $7B, 8
	even

.SpriteE:
	dc.b	3
	dc.b	$E0, $F, 1, $5B, $E0
	dc.b	$E0, 7, 1, $6B, 0
	dc.b	0, $E, 1, $81, $F0
	even

.SpriteF:
	dc.b	4
	dc.b	$DE, $F, 1, $5B, $E0
	dc.b	$DE, 7, 1, $6B, 0
	dc.b	$FE, $E, 1, $8D, $F0
	dc.b	$FE, 2, 1, $99, $10

; ------------------------------------------------------------------------------
