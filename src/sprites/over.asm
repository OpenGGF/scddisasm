; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.GameOverSprites:
	dc.w	.GameOverSprite0-.GameOverSprites
	dc.w	.GameOverSprite1-.GameOverSprites

.TimeOverSprites:
	dc.w	.TimeOverSprite0-.TimeOverSprites
	dc.w	.TimeOverSprite1-.TimeOverSprites
	
.GameOverSprite0:
	dc.b	2
	dc.b	$F8, $D, 0, 0, $B8
	dc.b	$F8, $D, 0, 8, $D8
	even

.GameOverSprite1:
	dc.b	2
	dc.b	$F8, $D, 0, $10, 8
	dc.b	$F8, $D, 0, $18, $28
	even

.TimeOverSprite0:
	dc.b	2
	dc.b	$F8, $D, 0, 0, $BC
	dc.b	$F8, 9, 0, 8, $DC
	even

.TimeOverSprite1:
	dc.b	2
	dc.b	$F8, $D, 0, $E, 4
	dc.b	$F8, $D, 0, $16, $24

; ------------------------------------------------------------------------------
