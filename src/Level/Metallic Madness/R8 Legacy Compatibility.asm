; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Metallic Madness R8 compatibility aliases
; -------------------------------------------------------------------------

	include	"Level/Wacky Workbench/R6 Compatibility.asm"

r8DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	r6DebugObject \id, \layer, \sprites, \tile, \subtype, \flags, \subtype_2, \frame
	endm
