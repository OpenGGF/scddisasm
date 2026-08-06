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

.Sprite0:
	dc.b	$B
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprite1:
	dc.b	$B
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Sprite2:
	dc.b	$C
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprite3:
	dc.b	$C
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Sprite4:
	dc.b	$D
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprite5:
	dc.b	$D
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Sprite6:
	dc.b	$E
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprite7:
	dc.b	$E
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Sprite8:
	dc.b	$F
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprite9:
	dc.b	$F
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Spritea:
	dc.b	$10
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Spriteb:
	dc.b	$10
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Spritec:
	dc.b	$11
	dc.b	$A3, 5, 8, $22, $A3
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprited:
	dc.b	$11
	dc.b	$A3, 5, 8, $22, $A3
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Spritee:
	dc.b	$12
	dc.b	$99, 5, 8, $22, $99
	dc.b	$A3, 5, 8, $22, $A3
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Spritef:
	dc.b	$12
	dc.b	$99, 5, 8, $22, $99
	dc.b	$A3, 5, 8, $22, $A3
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

.Sprite10:
	dc.b	$13
	dc.b	$8F, 5, 8, $22, $8F
	dc.b	$99, 5, 8, $22, $99
	dc.b	$A3, 5, 8, $22, $A3
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, $F, $E8
	dc.b	$E8, $E, 0, $12, $E0
	dc.b	$E0, 8, 8, $F, 0
	dc.b	$E8, $E, 8, $12, 0
	dc.b	$18, 8, $10, $F, $E8
	dc.b	0, $E, $10, $12, $E0
	dc.b	$18, 8, $18, $F, 0
	dc.b	0, $E, $18, $12, 0

.Sprite11:
	dc.b	$13
	dc.b	$8F, 5, 8, $22, $8F
	dc.b	$99, 5, 8, $22, $99
	dc.b	$A3, 5, 8, $22, $A3
	dc.b	$AD, 5, 8, $22, $AD
	dc.b	$B7, 5, 8, $22, $B7
	dc.b	$C1, 5, 8, $22, $C1
	dc.b	$CB, 5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0

; ------------------------------------------------------------------------------
