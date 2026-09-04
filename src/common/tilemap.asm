; ------------------------------------------------------------------------------

DrawTilemap:
	; Write a rectangular tilemap row-by-row to VDP_DATA.
	lea	VDP_DATA,a6
	move.l	#$800000,d4

DrawTilemapRowLoop:
	move.l	d0,4(a6)
	move.w	d1,d3

DrawTilemapColumnLoop:
	move.w	(a1)+,(a6)
	dbf	d3,DrawTilemapColumnLoop
	add.l	d4,d0
	dbf	d2,DrawTilemapRowLoop
	rts

; ------------------------------------------------------------------------------
