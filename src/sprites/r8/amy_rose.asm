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

.Sprite0:
	dc.b	2
	dc.b	$EC, $F, 0, 0, $F0
	dc.b	$C, $C, 0, $10, $F0
	even

.Sprite1:
	dc.b	2
	dc.b	$EC, $F, 0, $14, $F0
	dc.b	$C, $C, 0, $24, $F0
	even

.Sprite2:
	dc.b	2
	dc.b	$EC, $E, 0, $28, $F0
	dc.b	4, 9, 0, $34, $F0
	even

.Sprite3:
	dc.b	2
	dc.b	$EC, $F, 0, $3A, $F0
	dc.b	$C, $C, 0, $4A, $F0
	even

.Sprite4:
	dc.b	2
	dc.b	$EC, $F, 0, $4E, $F0
	dc.b	$C, $C, 0, $5E, $F0
	even

.Sprite5:
	dc.b	2
	dc.b	$EC, $E, 0, $62, $F0
	dc.b	4, 9, 0, $6E, $F0
	even

.Sprite6:
	dc.b	2
	dc.b	$EC, $E, 0, $74, $F0
	dc.b	4, 9, 0, $80, $F0
	even

.Sprite7:
	dc.b	2
	dc.b	$EC, $A, 0, $86, $F8
	dc.b	4, $D, 0, $8F, $F0

; ------------------------------------------------------------------------------
