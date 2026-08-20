; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Collision Chaos Act 1 Present scrolling metadata
; ------------------------------------------------------------------------------

; This bounded source slice is recovered from the tracked origin/test history
; (src/r3/scroll_1a.asm). It is deliberately kept separate from a future full
; Scroll (Act 1 Present).asm until the remaining R31A engine and data graph is
; ported into the current level architecture.

CollisionChaosCamBounds:
	dc.w	4, 0, $2E97, 0, $510, $60

CollisionChaosStartPosition:
	dc.w	$60, $3EC

CollisionChaosSpecialChunks:
	dc.b	$7F, $7F, $7F, $7F
	even
