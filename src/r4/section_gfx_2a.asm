; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20BF54:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BF5C
	addq.b	#2,d1
	bra.s	loc_20BF54

; ------------------------------------------------------------------------------

loc_20BF5C:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20BF78:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BF80
	addq.b	#2,d1
	bra.s	loc_20BF78

; ------------------------------------------------------------------------------

loc_20BF80:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20BF8A
	rts

; ------------------------------------------------------------------------------

loc_20BF8A:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1180
	dc.w	$1580
	dc.w	-1

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
