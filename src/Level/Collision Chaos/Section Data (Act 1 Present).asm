; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present section data
; -------------------------------------------------------------------------

SectionRanges:
	dc.w	$4A0
	dc.w	$1000
	dc.w	$1800
	dc.w	-1

; These IDs are the historical R31A section PLCs. They line up with the
; current PLCLists index rather than requiring a second graphics queue table.
SectionUpdatePLCs:
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$A

SectionInitPLCs:
	dc.w	2
	dc.w	4
	dc.w	5
	dc.w	6
