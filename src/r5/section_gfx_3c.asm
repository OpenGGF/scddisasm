; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C85A:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C862
	addq.b	#2,d1
	bra.s	loc_20C85A

; ------------------------------------------------------------------------------

loc_20C862:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C87E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C886
	addq.b	#2,d1
	bra.s	loc_20C87E

; ------------------------------------------------------------------------------

loc_20C886:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20C890
	rts

; ------------------------------------------------------------------------------

loc_20C890:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1800
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	5
	dc.w	6
	dc.w	5

SectionGfxInitLists:
	dc.w	2
	dc.w	4
	dc.w	2

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	rts

; ------------------------------------------------------------------------------
