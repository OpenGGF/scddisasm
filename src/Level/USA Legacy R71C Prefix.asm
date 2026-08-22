; -------------------------------------------------------------------------
; USA Stardust Speedway Act 1 Good Future legacy prefix before the shared
; animation/data records.
; -------------------------------------------------------------------------

USA_R7_R71C_LegacyPrefix:
	; These words are the historical stage-specific animation helper/table
	; prefix.  The common R71 animation records follow immediately afterward.
	dc.w	$C0B2, $75C0, $0000, $0022, $F8FC, $75C0, $0000, $0023
	dc.w	$0098, $7880, $0000, $0023, $B956, $72C0, $0000, $0023
	dc.w	$BB06, $72C0, $0002, $0022, $FABC, $8780, $0022, $F4F2
	dc.w	$9100, $0020, $B5E2, $7DE0
