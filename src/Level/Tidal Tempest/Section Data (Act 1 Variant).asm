; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Tidal Tempest Act 1 section PLC data
; -------------------------------------------------------------------------

	if TT_VARIANT=0

SectionRanges:
	dc.w	$1280
	dc.w	$1500
	dc.w	-1

SectionUpdatePLCs:
	dc.w	5
	dc.w	6
	dc.w	5

SectionInitPLCs:
	dc.w	2
	dc.w	4
	dc.w	2

	elseif TT_VARIANT=1

SectionRanges:
	dc.w	$680
	dc.w	$A80
	dc.w	$1280
	dc.w	$1680
	dc.w	-1

SectionUpdatePLCs:
	dc.w	6
	dc.w	7
	dc.w	6
	dc.w	8
	dc.w	6

SectionInitPLCs:
	dc.w	2
	dc.w	4
	dc.w	2
	dc.w	5
	dc.w	2

	else

SectionRanges:
	dc.w	-1

SectionUpdatePLCs:
	dc.w	2

SectionInitPLCs:
	dc.w	2

	endif
