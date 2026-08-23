; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20BF10:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BF18
	addq.b	#2,d1
	bra.s	loc_20BF10

; ------------------------------------------------------------------------------

loc_20BF18:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20BF34:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BF3C
	addq.b	#2,d1
	bra.s	loc_20BF34

; ------------------------------------------------------------------------------

loc_20BF3C:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20BF46
	rts

; ------------------------------------------------------------------------------

loc_20BF46:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$4A0
	dc.w	$1000
	dc.w	$1800
	dc.w	-1

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
	move.w	#$4F2,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------
