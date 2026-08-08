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

.Sprite0:
	dc.b	2
	dc.b	$E8, $D, 0, 0, $E4
	dc.b	$E8, 1, 0, 8, 4
	even

.Sprite1:
	dc.b	3
	dc.b	$D8, 5, 8, $32, $E4
	dc.b	$E8, $D, 0, $A, $E4
	dc.b	$E8, 1, 0, $12, 4
	even

.Sprite2:
	dc.b	2
	dc.b	$E8, $D, 0, $14, $E4
	dc.b	$E8, 1, 0, $1C, 4
	even

.Sprite3:
	dc.b	2
	dc.b	$E8, $D, 0, $1E, $E4
	dc.b	$E8, 1, 0, $26, 4
	even

.Sprite4:
	dc.b	3
	dc.b	$D8, 5, 8, $36, $E4
	dc.b	$E8, $D, 0, $28, $E4
	dc.b	$E8, 1, 0, $30, 4
	even

.Sprite5:
	dc.b	2
	dc.b	$E8, $D, 0, $A, $E4
	dc.b	$E8, 1, 0, $12, 4
	even

.Sprite6:
	dc.b	2
	dc.b	$E8, $D, 0, $28, $E4
	dc.b	$E8, 1, 0, $30, 4
	even

.Sprite7:
	dc.b	4
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $52, $F0
	dc.b	8, 1, 0, $6D, $E4
	even

.Sprite8:
	dc.b	4
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $52, $F0
	dc.b	8, 0, 0, $6F, $E4
	even

.Sprite9:
	dc.b	5
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $5E, $E8
	dc.b	8, 2, 0, $6A, 8
	dc.b	8, 1, 0, $6D, $E4
	even

.SpriteA:
	dc.b	5
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $5E, $E8
	dc.b	8, 2, 0, $6A, 8
	dc.b	8, 0, 0, $6F, $E4

; ------------------------------------------------------------------------------
