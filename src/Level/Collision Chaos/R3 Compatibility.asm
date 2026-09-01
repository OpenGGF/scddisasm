; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R3 compatibility aliases
; -------------------------------------------------------------------------
;
; Collision Chaos Act 3 retains the legacy object ABI used by the recovered
; R3 sources.  Its RAM and service names match the compatibility layer used
; by the recovered Quartz Quadrant and Wacky Workbench graphs.
;
; The shared R5 compatibility file evaluates the Quartz Quadrant variant in
; one legacy hook even when that family is not being assembled.
QQ_VARIANT		EQU	0

	include	"Level/Wacky Workbench/R6 Compatibility.asm"

; R3-only scratch bytes occupy otherwise unnamed slots in the common RAM
; layout.  These offsets match the recovered global-variable table.
bg_water_deform		EQU	updateHUDBonus+2
r3_no_bumper		EQU	debugBlock+2

; The semantic palette fade engine uses the later queue-service name. The
; recovered R3 graphs retain the byte-identical historical implementation.
ProcessPLCs		EQU	AdvanceGfxQueue

; The historical R3 debug table uses the original macro name.  The shared
; compatibility layer keeps the same eight-byte table layout under the
; names used by the later recovered graphs.

r3DebugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	r6DebugObject \id, \layer, \sprites, \tile, \subtype, \flags, \subtype_2, \frame
	endm
