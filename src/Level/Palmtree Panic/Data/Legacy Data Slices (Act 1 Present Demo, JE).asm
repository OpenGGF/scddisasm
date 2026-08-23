; ------------------------------------------------------------------------------
; Bounded slices of the Japan/Europe DEMO11A legacy graphics records retained
; by later level files. R11A_DEMO_JE_SLICE selects the historical byte range.
; ------------------------------------------------------------------------------

	if R11A_DEMO_JE_SLICE=1	; $14C, $76 bytes (R72A)
	dc.w	$213A, $A400, $0023, $34BC, $AD00, $0023, $235C, $B500
	dc.w	$0023, $2960, $D000, $0022, $EDE6, $D8C0, $0023, $3732
	dc.w	$DAE0, $0023, $2E48, $F5C0, $000B, $0023, $3B22, $6000
	dc.w	$0023, $3F3E, $6700, $0023, $40E2, $69A0, $0023, $B626
	dc.w	$6CC0, $0023, $CDC8, $6EC0, $0023, $D004, $70C0, $0023
	dc.w	$CADC, $71C0, $0023, $B9E6, $72C0, $0022, $F8FC, $75C0
	dc.w	$0023, $D59E, $78C0, $0023, $C440, $7D20, $0023, $D0C4
	dc.w	$8BA0, $0000, $0023
	elseif R11A_DEMO_JE_SLICE=2	; $15A, $68 bytes (R72C)
	dc.w	$B500, $0023, $2960, $D000, $0022, $EDE6, $D8C0, $0023
	dc.w	$3732, $DAE0, $0023, $2E48, $F5C0, $000B, $0023, $3B22
	dc.w	$6000, $0023, $3F3E, $6700, $0023, $40E2, $69A0, $0023
	dc.w	$B626, $6CC0, $0023, $CDC8, $6EC0, $0023, $D004, $70C0
	dc.w	$0023, $CADC, $71C0, $0023, $B9E6, $72C0, $0022, $F8FC
	dc.w	$75C0, $0023, $D59E, $78C0, $0023, $C440, $7D20, $0023
	dc.w	$D0C4, $8BA0, $0000, $0023
	elseif R11A_DEMO_JE_SLICE=3	; $1AC, $16 bytes (USA R72D)
	dc.w	$0023, $D59E, $78C0, $0023, $C440, $7D20, $0023, $D0C4
	dc.w	$8BA0, $0000, $0023
	elseif R11A_DEMO_JE_SLICE=4	; $14A, $78 bytes (non-USA R72D)
	dc.w	$0023, $213A, $A400, $0023, $34BC, $AD00, $0023, $235C
	dc.w	$B500, $0023, $2960, $D000, $0022, $EDE6, $D8C0, $0023
	dc.w	$3732, $DAE0, $0023, $2E48, $F5C0, $000B, $0023, $3B22
	dc.w	$6000, $0023, $3F3E, $6700, $0023, $40E2, $69A0, $0023
	dc.w	$B626, $6CC0, $0023, $CDC8, $6EC0, $0023, $D004, $70C0
	dc.w	$0023, $CADC, $71C0, $0023, $B9E6, $72C0, $0022, $F8FC
	dc.w	$75C0, $0023, $D59E, $78C0, $0023, $C440, $7D20, $0023
	dc.w	$D0C4, $8BA0, $0000, $0023
	elseif R11A_DEMO_JE_SLICE=5	; $134, $12 bytes (R62D)
	dc.w	$7880, $0002, $0022, $FABC, $8780, $0022, $F4F2, $9100
	dc.w	$0020
	else
	inform 3,"Invalid R11A_DEMO_JE_SLICE"
	endif
