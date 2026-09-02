; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Fire-shooter mappings. Nonempty frames contain five-byte sprite pieces after
; the piece count. Both final table entries select the shared empty frame.

.Sprites:
	dc.w	.Emitter-.Sprites
	dc.w	.FlameA-.Sprites
	dc.w	.FlameB-.Sprites
	dc.w	.ProjectileLeft-.Sprites
	dc.w	.ProjectileRight-.Sprites
	dc.w	.Empty-.Sprites
	dc.w	.Empty-.Sprites

.Emitter:
	dc.b	1
	dc.b	$FC, $C, 0, $E, $F0
	even

.FlameA:
	dc.b	7
	dc.b	$EC, $C, 0, 0, $F0
	dc.b	$F4, 4, 0, 4, $F0
	dc.b	$F4, 4, 0, 6, 0
	dc.b	$FC, 5, 0, 8, $F0
	dc.b	$FC, 5, 8, 8, 0
	dc.b	$C, 4, 0, $C, $F0
	dc.b	$C, 4, 8, $C, 0
	even

.FlameB:
	dc.b	7
	dc.b	$EC, $C, 0, $12, $F0
	dc.b	$F4, 4, 0, 4, $F0
	dc.b	$F4, 4, 0, 6, 0
	dc.b	$FC, 5, 0, 8, $F0
	dc.b	$FC, 5, 8, 8, 0
	dc.b	$C, 4, 0, $C, $F0
	dc.b	$C, 4, 8, $C, 0
	even

.ProjectileLeft:
	dc.b	2
	dc.b	$F8, 4, 0, $16, $F8
	dc.b	0, 4, $10, $16, $F8
	even

.ProjectileRight:
	dc.b	2
	dc.b	$F8, 4, 8, $16, $F8
	dc.b	0, 4, $18, $16, $F8
	even

.Empty:
	dc.b	0
	; Ignored five-byte zero record retained as mapping-table tail padding.
	dc.b	0, 0, 0, 0, 0

; ------------------------------------------------------------------------------
