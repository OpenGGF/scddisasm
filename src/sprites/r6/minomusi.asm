; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites1:
	dc.w	.Sprite0-.Sprites1
	dc.w	.Sprite1-.Sprites1
	dc.w	.Sprite2-.Sprites1
	dc.w	.Sprite3-.Sprites1
	dc.w	.Sprite4-.Sprites1
	dc.w	.Sprite5-.Sprites1
	dc.w	.Sprite6-.Sprites1
	dc.w	.Sprite7-.Sprites1
	dc.w	.Sprite8-.Sprites1
	dc.w	.Sprite19-.Sprites1
	dc.w	.Sprite1a-.Sprites1
	dc.w	.Sprite1b-.Sprites1

.Sprite19:
	dc.b	4
	dc.b	$F0, 0, 0, 0, $F8
	dc.b	$F0, 0, 8, 0, 0
	dc.b	$F8, 2, 0, 1, $F8
	dc.b	$F8, 2, 8, 1, 0

.Sprite1a:
	dc.b	3
	dc.b	$F0, 3, 0, 4, $F4
	dc.b	$F0, 3, 0, 8, $FC
	dc.b	$F0, 3, 8, 4, 4

.Sprite1b:
	dc.b	5
	dc.b	$F0, 0, 0, 0, $F8
	dc.b	$F0, 0, 8, 0, 0
	dc.b	$F8, 2, 0, $C, $F0
	dc.b	$F8, 6, 0, $F, $F8
	dc.b	$F8, 2, 8, $C, 8
	even

.Sprites2:
	dc.w	.Sprite0-.Sprites2
	dc.w	.Sprite1-.Sprites2
	dc.w	.Sprite2-.Sprites2
	dc.w	.Sprite3-.Sprites2
	dc.w	.Sprite4-.Sprites2
	dc.w	.Sprite5-.Sprites2
	dc.w	.Sprite6-.Sprites2
	dc.w	.Sprite7-.Sprites2
	dc.w	.Sprite8-.Sprites2
	dc.w	.Sprite29-.Sprites2
	dc.w	.Sprite2a-.Sprites2

.Sprite29:
	dc.b	2
	dc.b	$F0, 4, 0, $16, $F8
	dc.b	$F8, 6, 0, $18, $F8

.Sprite2a:
	dc.b	2
	dc.b	$F0, 4, 8, $16, $F8
	dc.b	$F8, 6, 0, $18, $F8

.Sprite0:
	dc.b	0

.Sprite1:
	dc.b	2
	dc.b	$F4, 0, 0, $15, $FC
	dc.b	$FC, 0, 0, $15, $FC

.Sprite2:
	dc.b	3
	dc.b	$F0, 0, 0, $15, $FC
	dc.b	$F8, 0, 0, $15, $FC
	dc.b	0, 0, 0, $15, $FC

.Sprite3:
	dc.b	4
	dc.b	$EC, 0, 0, $15, $FC
	dc.b	$F4, 0, 0, $15, $FC
	dc.b	$FC, 0, 0, $15, $FC
	dc.b	4, 0, 0, $15, $FC

.Sprite4:
	dc.b	5
	dc.b	$E8, 0, 0, $15, $FC
	dc.b	$F0, 0, 0, $15, $FC
	dc.b	$F8, 0, 0, $15, $FC
	dc.b	0, 0, 0, $15, $FC
	dc.b	8, 0, 0, $15, $FC

.Sprite5:
	dc.b	6
	dc.b	$E4, 0, 0, $15, $FC
	dc.b	$EC, 0, 0, $15, $FC
	dc.b	$F4, 0, 0, $15, $FC
	dc.b	$FC, 0, 0, $15, $FC
	dc.b	4, 0, 0, $15, $FC
	dc.b	$C, 0, 0, $15, $FC

.Sprite6:
	dc.b	7
	dc.b	$E0, 0, 0, $15, $FC
	dc.b	$E8, 0, 0, $15, $FC
	dc.b	$F0, 0, 0, $15, $FC
	dc.b	$F8, 0, 0, $15, $FC
	dc.b	0, 0, 0, $15, $FC
	dc.b	8, 0, 0, $15, $FC
	dc.b	$10, 0, 0, $15, $FC

.Sprite7:
	dc.b	8
	dc.b	$DC, 0, 0, $15, $FC
	dc.b	$E4, 0, 0, $15, $FC
	dc.b	$EC, 0, 0, $15, $FC
	dc.b	$F4, 0, 0, $15, $FC
	dc.b	$FC, 0, 0, $15, $FC
	dc.b	4, 0, 0, $15, $FC
	dc.b	$C, 0, 0, $15, $FC
	dc.b	$14, 0, 0, $15, $FC

.Sprite8:
	dc.b	9
	dc.b	$D8, 0, 0, $15, $FC
	dc.b	$E0, 0, 0, $15, $FC
	dc.b	$E8, 0, 0, $15, $FC
	dc.b	$F0, 0, 0, $15, $FC
	dc.b	$F8, 0, 0, $15, $FC
	dc.b	0, 0, 0, $15, $FC
	dc.b	8, 0, 0, $15, $FC
	dc.b	$10, 0, 0, $15, $FC
	dc.b	$18, 0, 0, $15, $FC

; ------------------------------------------------------------------------------
