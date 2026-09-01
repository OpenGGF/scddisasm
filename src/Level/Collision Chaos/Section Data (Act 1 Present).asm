; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present section data
; -------------------------------------------------------------------------

	if CC_VARIANT<>0
	include	"Level/Collision Chaos/Section Data (Act 1 Variant).asm"
	else

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

	endif

	if def(R3_SEMANTIC_SECTION_ART)
		if R3_SEMANTIC_SECTION_ART<>0
; Collision Chaos uses this fixed tile ID for the shared boulder, tunnel-door,
; and spring object family after section art has been selected.
SetObjectTileID:
	move.w	#$4F2,oTile(a0)
	rts

InitSectionGfx		EQU	LoadSectionArt
UpdateSectionGfx	EQU	UpdateSectionArt
SectionGfxRanges	EQU	SectionRanges
SectionGfxUpdateLists	EQU	SectionUpdatePLCs
SectionGfxInitLists	EQU	SectionInitPLCs
SetObjectSpriteTile	EQU	SetObjectTileID
		endif
	endif
