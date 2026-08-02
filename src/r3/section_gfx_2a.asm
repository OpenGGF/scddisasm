; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C794:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C79C
	addq.b	#2,d1
	bra.s	loc_20C794

; ------------------------------------------------------------------------------

loc_20C79C:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C7B8:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C7C0
	addq.b	#2,d1
	bra.s	loc_20C7B8

; ------------------------------------------------------------------------------

loc_20C7C0:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20C7CA
	rts

; ------------------------------------------------------------------------------

loc_20C7CA:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1400
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	5
	dc.w	6

SectionGfxInitLists:
	dc.w	2
	dc.w	4

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	cmpi.b	#$F,d0
	bne.s	locret_20C7F2
	move.w	#$4F2,obj.sprite_tile(a0)

locret_20C7F2:
	rts

; ------------------------------------------------------------------------------