; ------------------------------------------------------------------------------

LoadPalette:
	; PaletteTable records contain a source pointer, CRAM destination, and count-minus-one.
	lea	PaletteTable,a1
	lsl.w	#3,d0
	adda.w	d0,a1
	movea.l	(a1)+,a2
	movea.w	(a1)+,a3
	move.w	(a1)+,d7

LoadPaletteCopy:
	move.l	(a2)+,(a3)+
	dbf	d7,LoadPaletteCopy
	rts

; ------------------------------------------------------------------------------
