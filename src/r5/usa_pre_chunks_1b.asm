; USA R5B stage data before StageChunks ($4AE bytes).
; Its distinct $22-byte graphics prefix stays local; the shared retained
; suffix is emitted by USA Legacy R5 Shared PreChunk.asm.
	dc.b	$00, $98, $78, $80, $00, $00, $00, $23, $C5, $20, $4B, $40, $00, $00, $00, $23
	dc.b	$CB, $92, $4B, $40, $00, $02, $00, $22, $FA, $BC, $87, $80, $00, $22, $F4, $F2
	dc.b	$91, $00
	include	"r5/USA Legacy R5 Shared PreChunk.asm"
