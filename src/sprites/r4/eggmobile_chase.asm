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

.Sprite0:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $4F, 4
	even

.Sprite1:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $53, 4
	even

.Sprite2:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$14, 5, 0, $57, $EC
	even

.Sprite3:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$14, 5, 0, $5B, $EC
	even

.Sprite4:
	dc.b	8
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $4F, 4
	dc.b	$14, 5, 0, $57, $EC
	even

.Sprite5:
	dc.b	8
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $53, 4
	dc.b	$14, 5, 0, $5B, $EC
	even

.Sprite6:
	dc.b	7
	dc.b	$E4, $F, 0, $67, $DC
	dc.b	$E4, $F, 0, $77, $FC
	dc.b	$E4, 3, 0, $87, $1C
	dc.b	4, $E, 0, $8B, $DC
	dc.b	4, $E, 0, $97, $FC
	dc.b	4, 2, 0, $A3, $1C
	dc.b	$1C, 5, 0, $4F, 4
	even

.Sprite7:
	dc.b	7
	dc.b	$E4, $F, 0, $67, $DC
	dc.b	$E4, $F, 0, $77, $FC
	dc.b	$E4, 3, 0, $87, $1C
	dc.b	4, $E, 0, $8B, $DC
	dc.b	4, $E, 0, $97, $FC
	dc.b	4, 2, 0, $A3, $1C
	dc.b	$14, 5, 0, $57, $EC
	even

.Sprite8:
	dc.b	8
	dc.b	$E4, $F, 0, $67, $DC
	dc.b	$E4, $F, 0, $77, $FC
	dc.b	$E4, 3, 0, $87, $1C
	dc.b	4, $E, 0, $8B, $DC
	dc.b	4, $E, 0, $97, $FC
	dc.b	4, 2, 0, $A3, $1C
	dc.b	$1C, 5, 0, $4F, 4
	dc.b	$14, 5, 0, $57, $EC

; ------------------------------------------------------------------------------
