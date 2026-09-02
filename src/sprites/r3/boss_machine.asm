; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

.Sprites:
	dc.w	.CompleteNormal-.Sprites
	dc.w	.CompleteFlash-.Sprites
	dc.w	.UpperRemovedNormal-.Sprites
	dc.w	.UpperRemovedFlash-.Sprites
	dc.w	.SideAssembliesDamagedNormal-.Sprites
	dc.w	.SideAssembliesDamagedFlash-.Sprites
	dc.w	.BareHull-.Sprites

; Damage flashing toggles bit 0 of the frame index, selecting each normal/flash
; pair. Frames start with a piece count followed by five-byte sprite pieces:
; signed Y, size, attributes/tile high, tile low, and signed X.
.CompleteNormal:
	dc.b	9
	dc.b	$E0, 9, $20, $80, $E8
	dc.b	$E0, 9, $28, $80, 0
	dc.b	$D0, $D, 0, $D6, $F0
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.CompleteFlash:
	dc.b	9
	dc.b	$E0, 9, $20, $80, $E8
	dc.b	$E0, 9, $28, $80, 0
	dc.b	$D0, $D, 0, $D6, $F0
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.UpperRemovedNormal:
	dc.b	6
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.UpperRemovedFlash:
	dc.b	6
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

.SideAssembliesDamagedNormal:
	dc.b	6
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $E, $20, $74, $D0
	dc.b	$E0, $E, $28, $74, $10

.SideAssembliesDamagedFlash:
	dc.b	6
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $E, $20, $74, $D0
	dc.b	$E0, $E, $28, $74, $10

.BareHull:
	dc.b	4
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20

; ------------------------------------------------------------------------------
