; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20CE1E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CE26
	addq.b	#2,d1
	bra.s	loc_20CE1E

; ------------------------------------------------------------------------------

loc_20CE26:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20CE42:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CE4A
	addq.b	#2,d1
	bra.s	loc_20CE42

; ------------------------------------------------------------------------------

loc_20CE4A:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20CE54
	rts

; ------------------------------------------------------------------------------

loc_20CE54:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1900
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	5
	dc.w	6

SectionGfxInitLists:
	dc.w	2
	dc.w	4

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	move.w	#$4F2,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------