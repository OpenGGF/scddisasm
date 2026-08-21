; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite0-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite2-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite4-.Sprites
	dc.w	.Sprite6-.Sprites
	dc.w	.Sprite6-.Sprites

.Sprite0:
	dc.b	6
	dc.b	$F8, $D, 0, 0, $A0
	dc.b	$F8, $D, 0, 0, $E0
	dc.b	$F8, $D, 0, 0, $20
	dc.b	$F8, $D, 0, 8, $C0
	dc.b	$F8, $D, 0, 8, 0
	dc.b	$F8, $D, 0, 8, $40
	even

.Sprite2:
	dc.b	6
	dc.b	$F8, $D, 0, 8, $A0
	dc.b	$F8, $D, 0, 8, $E0
	dc.b	$F8, $D, 0, 8, $20
	dc.b	$F8, $D, 0, $10, $C0
	dc.b	$F8, $D, 0, $10, 0
	dc.b	$F8, $D, 0, $10, $40
	even

.Sprite4:
	dc.b	6
	dc.b	$F8, $D, 0, $10, $A0
	dc.b	$F8, $D, 0, $10, $E0
	dc.b	$F8, $D, 0, $10, $20
	dc.b	$F8, $D, 0, 8, $C0
	dc.b	$F8, $D, 0, 8, 0
	dc.b	$F8, $D, 0, 8, $40
	even

.Sprite6:
	dc.b	6
	dc.b	$F8, $D, 0, 8, $A0
	dc.b	$F8, $D, 0, 8, $E0
	dc.b	$F8, $D, 0, 8, $20
	dc.b	$F8, $D, 0, 0, $C0
	dc.b	$F8, $D, 0, 0, 0
	dc.b	$F8, $D, 0, 0, $40

; ------------------------------------------------------------------------------
