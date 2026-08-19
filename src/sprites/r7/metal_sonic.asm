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
	dc.w	.Sprite11-.Sprites
	dc.w	.Sprite12-.Sprites
	dc.w	.Sprite13-.Sprites
	dc.w	.Sprite14-.Sprites
	dc.w	.Sprite15-.Sprites
	dc.w	.Sprite16-.Sprites
	dc.w	.Sprite17-.Sprites

.Sprite0:
	dc.b	3
	dc.b	$EC, $B, 0, 0, $F4
	dc.b	$C, $C, 0, $C, $EC
	dc.b	$C, 0, 0, $10, $C
	even

.Sprite1:
	dc.b	3
	dc.b	$EC, $F, 0, $11, $EC
	dc.b	$C, $C, 0, $C, $EC
	dc.b	$C, 0, 0, $10, $C
	even

.Sprite2:
	dc.b	3
	dc.b	$EC, $F, 0, $21, $EC
	dc.b	$C, $C, 0, $C, $EC
	dc.b	$C, 0, 0, $10, $C
	even

.Sprite3:
	dc.b	2
	dc.b	$EC, $F, 0, $31, $EC
	dc.b	$C, $C, 0, $41, $F4
	even

.Sprite4:
	dc.b	3
	dc.b	$EC, $F, 0, $BF, $EC
	dc.b	$C, $C, 0, $C, $EC
	dc.b	$C, 0, 0, $10, $C
	even

.Sprite5:
	dc.b	2
	dc.b	$EC, $D, 0, $CF, $EC
	dc.b	$FC, $E, 0, $D7, $F4
	even

.Sprite6:
	dc.b	2
	dc.b	$F0, $F, 0, $E3, $F0
	dc.b	$10, $C, 0, $F3, $F0
	even

.Sprite7:
	dc.b	3
	dc.b	$F0, $F, 0, $E3, $F0
	dc.b	$10, $C, 0, $F3, $F0
	dc.b	4, 5, 1, $5F, $F0
	even

.Sprite8:
	dc.b	3
	dc.b	$F0, $F, 0, $E3, $F0
	dc.b	$10, $C, 0, $F3, $F0
	dc.b	4, 5, 1, $63, $F0
	even

.Sprite9:
	dc.b	2
	dc.b	$E8, $F, 0, $45, $EC
	dc.b	8, 9, 0, $55, $F4
	even

.SpriteA:
	dc.b	3
	dc.b	$E8, $F, 0, $45, $EC
	dc.b	8, 9, 0, $55, $F4
	dc.b	$FC, 5, 1, $63, $F0
	even

.SpriteB:
	dc.b	3
	dc.b	$E8, $F, 0, $45, $EC
	dc.b	8, 9, 0, $55, $F4
	dc.b	$F8, $A, 1, $67, $EC
	even

.SpriteC:
	dc.b	2
	dc.b	$E8, $F, 0, $5B, $EC
	dc.b	8, 9, 0, $6B, $F4
	even

.SpriteD:
	dc.b	3
	dc.b	$E8, $F, 0, $5B, $EC
	dc.b	8, 9, 0, $6B, $F4
	dc.b	$F8, $A, 1, $67, $EC
	even

.SpriteE:
	dc.b	3
	dc.b	$E8, $F, 0, $5B, $EC
	dc.b	8, 9, 0, $6B, $F4
	dc.b	$F4, $F, 1, $70, $E8
	even

.SpriteF:
	dc.b	2
	dc.b	$E8, $E, 0, $71, $EC
	dc.b	0, $E, 0, $7D, $F4
	even

.Sprite10:
	dc.b	3
	dc.b	$F8, 5, 1, $5F, $FC
	dc.b	$E8, $E, 0, $71, $EC
	dc.b	0, $E, 0, $7D, $F4
	even

.Sprite11:
	dc.b	3
	dc.b	$F8, 5, 1, $63, $FC
	dc.b	$E8, $E, 0, $71, $EC
	dc.b	0, $E, 0, $7D, $F4
	even

.Sprite12:
	dc.b	2
	dc.b	$FC, 5, 0, $F7, $E8
	dc.b	$F4, $E, 0, $FB, $F8
	even

.Sprite13:
	dc.b	2
	dc.b	$F4, $F, 1, $19, $E8
	dc.b	$F4, 7, 1, $29, 8
	even

.Sprite14:
	dc.b	2
	dc.b	$F4, $F, 1, $31, $E8
	dc.b	$F4, 7, 1, $41, 8
	even

.Sprite15:
	dc.b	2
	dc.b	$E8, $F, 1, $49, $F0
	dc.b	8, 9, 1, $59, $F0
	even

.Sprite16:
	dc.b	2
	dc.b	$EC, $E, 0, $89, $EC
	dc.b	4, $D, 0, $95, $F4
	even

.Sprite17:
	dc.b	3
	dc.b	$E8, $D, 0, $9D, $EC
	dc.b	$E8, 1, 0, $A5, $C
	dc.b	$F8, $F, 0, $A7, $F4

; ------------------------------------------------------------------------------
