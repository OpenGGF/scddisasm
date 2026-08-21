; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Stardust Speedway R7 historical-graph compatibility aliases
; -------------------------------------------------------------------------

	include	"Level/Wacky Workbench/R6 Compatibility.asm"

bg_water_deform	EQU	updateHUDBonus+2

r7DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	r6DebugObject \id, \layer, \sprites, \tile, \subtype, \flags, \subtype_2, \frame
	endm
