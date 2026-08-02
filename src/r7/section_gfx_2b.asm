; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20D384:
	cmp.w	(a1)+,d0
	bcs.s	loc_20D38C
	addq.b	#2,d1
	bra.s	loc_20D384

; ------------------------------------------------------------------------------

loc_20D38C:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20D3A8:
	cmp.w	(a1)+,d0
	bcs.s	loc_20D3B0
	addq.b	#2,d1
	bra.s	loc_20D3A8

; ------------------------------------------------------------------------------

loc_20D3B0:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20D3BA
	rts

; ------------------------------------------------------------------------------

loc_20D3BA:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$2000
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	7
	dc.w	8

SectionGfxInitLists:
	dc.w	2
	dc.w	6

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	move.w	#$4F2,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------