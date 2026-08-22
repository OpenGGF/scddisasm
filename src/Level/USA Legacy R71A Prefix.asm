; -------------------------------------------------------------------------
; USA Stardust Speedway Act 1 Present legacy prefix before the shared
; animation/data records.
; -------------------------------------------------------------------------

USA_R7_R71A_LegacyPrefix:
	; The first routine is the historical stage-animation helper.  Its
	; absolute RAM operands remain in the original stage ABI.
	dc.w	$4E75, $7007, $4E75, $4A28, $0038, $671E, $5328, $0038
	dc.w	$303C, $FFFE, $0828, $0000, $0038, $6706, $4440, $303C
	dc.w	$FFFC, $D178, $F72E, $D178, $F726, $4E75, $123C, $0080
	dc.w	$6004, $123C, $0000, $4BF8, $F7B7, $7005, $1AC1, $51C8
