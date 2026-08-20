; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 object layout
; -------------------------------------------------------------------------

	; The layout fragment is a self-contained tracked-history data source. Its
	; first table is byte-identical to the historical StageObjectMaps table, so
	; ObjectLayouts can use it without importing the old engine.
ObjectLayouts:
	include	"r3/stage_object_maps_1.asm"
