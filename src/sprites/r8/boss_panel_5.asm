; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite1-.Sprites

.Sprite0:
	dc.b	3
	dc.b	$18, 5, 0, $B5, $F8
	dc.b	$E0, 7, 0, $40, $F8
	dc.b	0, 7, 0, $48, $F8
	even

.Sprite1:
	dc.b	3
	dc.b	$15, 5, 0, $B5, $EC
	dc.b	$E0, $F, 0, $50, $F8
	dc.b	0, $B, 0, $60, $F0
	even

.Sprite2:
	dc.b	4
	dc.b	$E, 5, 0, $B5, $E2
	dc.b	$E4, $F, 0, $6C, $FC
	dc.b	$FC, $B, 0, $7C, $E4
	dc.b	4, 0, 0, $88, $FC
	even

.Sprite3:
	dc.b	3
	dc.b	4, 5, 0, $B5, $DB
	dc.b	$E8, $F, 0, $89, 0
	dc.b	$F8, $E, 0, $99, $E0
	even

.Sprite4:
	dc.b	3
	dc.b	$F8, 5, 0, $B5, $D8
	dc.b	$F8, $D, 0, $A5, $E0
	dc.b	$F8, $D, 0, $AD, 0

; ------------------------------------------------------------------------------
