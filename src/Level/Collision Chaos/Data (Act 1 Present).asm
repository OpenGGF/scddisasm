; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present data graph
; -------------------------------------------------------------------------
; The source layout follows origin/test:src/r3/data_1a.asm and
; origin/test:src/r3/gfx_lists_1a.asm. Only the Present map set and the
; stage assets already recovered under this architecture are wired here.

; -------------------------------------------------------------------------
; Stage data index
; -------------------------------------------------------------------------

LevelDataIndex:
	dc.l	$3000000|StageGfx			; R31A PLC 3 stage graphics
	dc.l	$2000000|LevelBlocks		; R31A PLC 2 blocks
	dc.l	LevelChunks
	dc.w	$81				; Collision Chaos music ID
	dc.b	4, 4				; Present palette IDs (source table)
	even

; The current PLC decoder needs an index even though this bounded entry point
; only loads the stage art. The remaining section/object art lists are deferred
; with the R31A object graph.
PLCLists:
	rept	19
	dc.w	PLCStage-PLCLists
	endr

PLCStage:
	dc.w	0				; One entry (DBF count)
	dc.l	StageGfx
	dc.w	0

; -------------------------------------------------------------------------
; R31A Present layout table
; -------------------------------------------------------------------------

LevelLayouts:
	dc.w	StageMapFg-LevelLayouts
	dc.w	StageMapBg-LevelLayouts
	dc.w	StageMapNull-LevelLayouts

StageMapNull:
	dc.b	0, 0, 0, 0
	even

; -------------------------------------------------------------------------
; Recovered source/data fragments
; -------------------------------------------------------------------------

	include	"Level/Collision Chaos/Graphics (Act 1 Present).asm"
	include	"Level/Collision Chaos/Blocks (Act 1 Present).asm"
	include	"Level/Collision Chaos/Chunks (Act 1 Present).asm"
	include	"Level/Collision Chaos/Foreground (Act 1 Present).asm"
	include	"Level/Collision Chaos/Background (Act 1 Present).asm"

LevelCollision:
	incbin	"Level/Collision Chaos/Data/Collision (Act 1 Present).bin"
	even
