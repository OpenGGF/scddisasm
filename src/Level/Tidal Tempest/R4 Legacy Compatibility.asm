; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Tidal Tempest R4 historical-graph compatibility aliases
; -------------------------------------------------------------------------
;
; The recovered R42/R43 sources use the same legacy object and RAM ABI as
; the recovered R3 graph.  Keep the shared aliases in one layer so these
; variants can use the original source order without adapting each routine.
; -------------------------------------------------------------------------

	include	"Level/Collision Chaos/R3 Compatibility.asm"

r4DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	r6DebugObject \id, \layer, \sprites, \tile, \subtype, \flags, \subtype_2, \frame
	endm
