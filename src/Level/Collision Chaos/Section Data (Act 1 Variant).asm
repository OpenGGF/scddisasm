; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 time-variant section PLC data
; -------------------------------------------------------------------------

	if CC_VARIANT=1

SectionRanges:
	dc.w	$1000
	dc.w	$1800
	dc.w	$1E00
	dc.w	-1

SectionUpdatePLCs:
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$C

SectionInitPLCs:
	dc.w	2
	dc.w	6
	dc.w	7
	dc.w	8

	else

; R31C and R31D keep the initial section art resident and do not update it.
SectionRanges:
	dc.w	-1

SectionUpdatePLCs:
	dc.w	2

SectionInitPLCs:
	dc.w	2

	endif
