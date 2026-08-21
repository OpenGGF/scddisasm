; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite1-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite3-.Sprites
	dc.w	.Sprite4-.Sprites

.Sprite0:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	even

.Sprite1:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F8, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	even

.Sprite2:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$E8, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	even

.Sprite3:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$F8, $A, 8, 0, 0
	even

.Sprite4:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$E8, $A, 8, 0, 0

; ------------------------------------------------------------------------------
