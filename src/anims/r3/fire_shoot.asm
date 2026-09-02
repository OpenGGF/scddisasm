; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Fire-shooter animation scripts. Each record is a frame delay, mapping-frame
; sequence, and $FF restart command.

.Anims:
	dc.w	.Flame-.Anims
	dc.w	.ProjectileLeft-.Anims
	dc.w	.ProjectileRight-.Anims
	dc.w	.BurnoutLeft-.Anims
	dc.w	.BurnoutRight-.Anims

.Flame:
	dc.b	2
	dc.b	1, 2
	dc.b	$FF
	even

.ProjectileLeft:
	dc.b	2
	dc.b	3, 5
	dc.b	$FF
	even

.ProjectileRight:
	dc.b	2
	dc.b	4, 5
	dc.b	$FF
	even

.BurnoutLeft:
	dc.b	0
	dc.b	3, 6, 5, 6
	dc.b	$FF
	even

.BurnoutRight:
	dc.b	0
	dc.b	4, 6, 5, 6
	dc.b	$FF

; ------------------------------------------------------------------------------
