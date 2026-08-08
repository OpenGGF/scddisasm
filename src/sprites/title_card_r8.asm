; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

TitleCardSprites:
	dc.w	.Sprite0-*
	dc.w	.Sprite1-TitleCardSprites
	dc.w	.Sprite2-TitleCardSprites
	dc.w	.Sprite3-TitleCardSprites
	dc.w	.Sprite4-TitleCardSprites
	dc.w	.Sprite5-TitleCardSprites
	dc.w	.Sprite6-TitleCardSprites
	dc.w	.Sprite7-TitleCardSprites
	dc.w	.Sprite8-TitleCardSprites

.Sprite0:
	dc.b	6
	dc.b	$90, $F, 0, 0, $F0
	dc.b	$B0, $F, 0, 0, $F0
	dc.b	$D0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$10, $F, 0, 0, $F0
	dc.b	$30, $F, 0, 0, $F0
	even

.Sprite1:
	dc.b	2
	dc.b	$F8, 9, 0, $10, $E8
	dc.b	0, 8, 0, $16, 0
	even

.Sprite2:
	dc.b	2
	dc.b	$E8, 2, 0, $19, $FC
	dc.b	0, 2, 0, $1C, $FC
	even

.Sprite3:
	dc.b	5
	dc.b	$F8, $D, 0, $1F, $B0
	dc.b	$F8, $D, 0, $27, $D0
	dc.b	$F8, $D, 0, $2F, $F0
	dc.b	$F8, $D, 0, $37, $10
	dc.b	$F8, $D, 0, $3F, $30
	even

.Sprite4:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, $18, $47, 8
	dc.b	$E8, 4, 0, $4D, $F8
	dc.b	$F0, 7, 0, $4F, $F8
	dc.b	$10, 4, 0, $57, $F8
	even

.Sprite5:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, 0, $59, 8
	dc.b	$E8, 5, 0, $5F, $F8
	dc.b	$F8, 6, 0, $63, $F8
	dc.b	$10, 4, 0, $57, $F8
	even

.Sprite6:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, $18, $47, 8
	dc.b	$E8, 5, 0, $5F, $F8
	dc.b	$F8, 5, 0, $69, $F8
	dc.b	8, 5, $10, $5F, $F8
	even

.Sprite7:
	dc.b	6
	dc.b	$E8, $E, 0, $85, $14
	dc.b	$E8, $E, 0, $91, $34
	dc.b	$E8, 0, 0, $9D, $54
	dc.b	$F8, 0, 0, $9E, $54
	dc.b	$C8, $B, 0, $70, 0
	dc.b	$E8, $A, 0, $7C, 0
	even

.Sprite8:
	dc.b	4
	dc.b	0, $E, 0, $9F, $14
	dc.b	0, $E, 0, $AB, $34
	dc.b	0, $B, 0, $70, 0
	dc.b	$20, $A, 0, $7C, 0

; ------------------------------------------------------------------------------