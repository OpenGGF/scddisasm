; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CC3A:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CC42
	addq.b	#2,d1
	bra.s	loc_20CC3A

; ------------------------------------------------------------------------------

loc_20CC42:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CC5E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CC66
	addq.b	#2,d1
	bra.s	loc_20CC5E

; ------------------------------------------------------------------------------

loc_20CC66:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20CC70
	rts

; ------------------------------------------------------------------------------

loc_20CC70:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$300
	dc.w	$600
	dc.w	$1500
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$A

SectionGfxInitLists:
	dc.w	2
	dc.w	4
	dc.w	5
	dc.w	6

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	move.w	#$4EA,d1
	cmpi.b	#$E,d0
	beq.s	loc_20CCA6
	move.w	#$4F2,d1

loc_20CCA6:
	move.w	d1,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------
