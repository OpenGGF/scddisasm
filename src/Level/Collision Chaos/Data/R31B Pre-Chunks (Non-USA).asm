; ------------------------------------------------------------------------------
; R31B-specific non-USA pre-chunk prefix; R31C provides the shared stream.
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0007 R31B-specific regional pre-chunk record
; +$0008-+$0CD3 shared R31C non-USA pre-chunk data
; ------------------------------------------------------------------------------

	dc.b	0, $A, $33, $72, $20, 2, 0, 8

	; The remaining pre-chunk stream is byte-identical to R31C.
	include "Level/Collision Chaos/Data/R31C Pre-Chunks (Non-USA).asm"

; ------------------------------------------------------------------------------
