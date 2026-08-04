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
	dc.w	.Spritea-.Sprites
	dc.w	.Spriteb-.Sprites
	dc.w	.Spritec-.Sprites
	dc.w	.Sprited-.Sprites
	dc.w	.Spritee-.Sprites
	dc.w	.Spritef-.Sprites
	dc.w	.Sprite10-.Sprites
	dc.w	.Sprite11-.Sprites
	dc.w	.Sprite12-.Sprites
	dc.w	.Sprite13-.Sprites

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
	dc.b	$E9, 9, 0, 0, $F4
	dc.b	$F9, 8, 0, 6, $F4
	dc.b	1, 4, 0, 9, $FC
	dc.b	9, 8, 0, $B, $F4
	dc.b	0

.Sprite4:
	dc.b	4
	dc.b	$E9, 9, 0, 0, $F4
	dc.b	$F9, 8, 0, $E, $F4
	dc.b	1, 4, 0, $11, $FC
	dc.b	9, 8, 0, $13, $F4
	dc.b	0

.Sprite5:
	dc.b	2
	dc.b	$E9, 9, 0, 0, $F4
	dc.b	$F9, $A, 0, $16, $F4
	dc.b	0

.Sprite6:
	dc.b	3
	dc.b	$E8, $E, 0, $8C, $F0
	dc.b	0, 8, 0, $98, $F0
	dc.b	8, 4, 0, $9B, $F0

.Sprite7:
	dc.b	2
	dc.b	$E8, $A, 0, $9D, $F8
	dc.b	0, $D, 0, $A6, $F0
	dc.b	0

.Sprite8:
	dc.b	1
	dc.b	$F8, 5, 0, $80, $F8

.Sprite9:
	dc.b	1
	dc.b	$F8, 5, 0, $84, $F8

.Spritea:
	dc.b	1
	dc.b	$F8, 5, 0, $88, $F8

.Spriteb:
	dc.b	4
	dc.b	$EC, 8, 0, $1F, $F8
	dc.b	$F4, $C, 0, $22, $F5
	dc.b	$FC, 8, 0, $26, $F4
	dc.b	4, 9, 0, $32, $F4
	dc.b	0

.Spritec:
	dc.b	4
	dc.b	$EC, 8, 8, $1F, $F4
	dc.b	$F4, $C, 8, $22, $EB
	dc.b	$FC, 8, 8, $26, $F4
	dc.b	4, 9, 8, $32, $F4
	dc.b	0

.Sprited:
	dc.b	5
	dc.b	$F4, 4, 0, $38, $FE
	dc.b	$E8, 9, 0, 0, $F4
	dc.b	$F8, 8, 0, $E, $F4
	dc.b	0, 4, 0, $11, $FC
	dc.b	8, 8, 0, $13, $F4

.Spritee:
	dc.b	3
	dc.b	$F8, 4, 0, $38, $FE
	dc.b	$EC, $A, 0, $9D, $F8
	dc.b	4, $D, 0, $A6, $F0

.Spritef:
	dc.b	3
	dc.b	$F4, 4, 0, $38, $FE
	dc.b	$E8, $A, 0, $29, $F4
	dc.b	0, 9, 0, $32, $F4

.Sprite10:
	dc.b	3
	dc.b	$EC, $A, 0, $9D, $F8
	dc.b	4, $C, 0, $AE, $F0
	dc.b	$C, 8, 0, $B2, $F0

.Sprite11:
	dc.b	2
	dc.b	$EC, 9, 0, $62, $F4
	dc.b	$FC, $A, 0, $68, $F4
	dc.b	0

.Sprite12:
	dc.b	2
	dc.b	$EC, 9, 0, $71, $F4
	dc.b	$FC, $A, 0, $77, $F4
	dc.b	0

.Sprite13:
	dc.b	2
	dc.b	$EC, 9, 8, $71, $F4
	dc.b	$FC, $A, 8, $77, $F4
	dc.b	0

; ------------------------------------------------------------------------------
