; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Collision Chaos Act 1 Present scrolling metadata
; ------------------------------------------------------------------------------

; This bounded source slice was recovered from the historical R31A scrolling
; graph. It remains separate so data-only consumers can use the metadata without
; assembling the complete Scroll (Act 1 Present).asm implementation.

CollisionChaosCamBounds:
	dc.w	4, 0, $2E97, 0, $510, $60

CollisionChaosStartPosition:
	dc.w	$60, $3EC

CollisionChaosSpecialChunks:
	dc.b	$7F, $7F, $7F, $7F
	even
