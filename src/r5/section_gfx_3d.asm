; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C936:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C93E
	addq.b	#2,d1
	bra.s	loc_20C936

; ------------------------------------------------------------------------------

loc_20C93E:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C95A:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C962
	addq.b	#2,d1
	bra.s	loc_20C95A

; ------------------------------------------------------------------------------

loc_20C962:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20C96C
	rts

; ------------------------------------------------------------------------------

loc_20C96C:
	move.b	d1,(gfx_section_id).l
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