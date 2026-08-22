; ------------------------------------------------------------------------------
; USA-specific R53C source-owned data before StageChunks.
; The trailing table is shared with the USA R42C graphics data.
; ------------------------------------------------------------------------------

	; Continuation of the preceding graphics table, followed by the R42C table.
	dc.w	$4E42, $8780, $0023, $4878, $9100, $0020, $B268, $7DE0
	dc.w	$0023, $4E42, $8780, $0023, $4878, $9100, $0020, $B27A
	dc.w	$7DE0
	include	"r4/usa_padding_2c.asm"
