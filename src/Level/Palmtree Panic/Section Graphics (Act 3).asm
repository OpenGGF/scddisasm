; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 3 section graphics functions
; -------------------------------------------------------------------------

InitSectionGfx:

UpdateSectionGfx:
	rts

LoadSectionArt EQU InitSectionGfx
UpdateSectionArt EQU UpdateSectionGfx

	include	"Level/Object Tile ID Set.asm"
	include	"Level/Palmtree Panic/Object Tile IDs (Act 3).asm"
