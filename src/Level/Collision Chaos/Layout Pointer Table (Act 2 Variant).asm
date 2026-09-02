; -------------------------------------------------------------------------
; Collision Chaos Act 2 layout pointer table
; -------------------------------------------------------------------------
; Each section supplies four foreground/background/null triplets. The same
; twelve slots are used by all three section indices selected by the loader.

	rept	3
	dc.w	StageMapFg-StageMaps, StageMapBg-StageMaps, StageMapNull-StageMaps
	dc.w	StageMapGHZ2-StageMaps, StageMapSharedNull-StageMaps, StageMapGHZ2Null-StageMaps
	dc.w	StageMapGHZ3-StageMaps, StageMapSharedNull-StageMaps, StageMapSharedNull-StageMaps
	dc.w	StageMapFinalRowNull-StageMaps, StageMapFinalRowNull-StageMaps, StageMapFinalRowNull-StageMaps
	endr
