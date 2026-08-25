; -----------------------------------------------------------------------------
; Japan/Europe DEMO82A StageChunks correction.
; -----------------------------------------------------------------------------
; The shared R82A chunk asset differs at this short demo-only sequence.

	dc.b	$60, $12, $60, $35, $60, $35, $60, $13, $40, $C7, $40, $C7, $40, $C7
	incbin	"maps/r82a/chunks.bin",$BA7C,$12
	dc.b	$42, $2D, $40, $94, $40, $94, $4A, $2D
	incbin	"maps/r82a/chunks.bin",$BA96,$18
	dc.b	$42, $2C, $40, $49, $40, $4B, $4A, $2C
	incbin	"maps/r82a/chunks.bin",$BAB6,$18
	dc.b	$42, $2C, $41, $F9, $41, $F9, $4A, $2C
	incbin	"maps/r82a/chunks.bin",$BAD6,$18
	dc.b	$42, $2C, $40, $4E, $40, $4E, $4A, $2C
	incbin	"maps/r82a/chunks.bin",$BAF6,$18
	dc.b	$42, $2C, $40, $C6, $48, $C6, $4A, $2C
	incbin	"maps/r82a/chunks.bin",$BB16,$18
	dc.b	$62, $2E, $60, $49, $60, $4B, $6A, $2E
