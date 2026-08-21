; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos Act 2 section PLC data
; -------------------------------------------------------------------------

	if CC2_VARIANT=0
	SectionRanges:
		dc.w	$1400
		dc.w	-1

	SectionUpdatePLCs:
		dc.w	5
		dc.w	6

	SectionInitPLCs:
		dc.w	2
		dc.w	4

	elseif CC2_VARIANT=1
	SectionRanges:
		dc.w	$1000
		dc.w	$1700
		dc.w	-1

	SectionUpdatePLCs:
		dc.w	8
		dc.w	9
		dc.w	$A

	SectionInitPLCs:
		dc.w	2
		dc.w	6
		dc.w	7

	else
	SectionRanges:
		dc.w	-1

	SectionUpdatePLCs:
		dc.w	2

	SectionInitPLCs:
		dc.w	2
	endif
