; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20D34E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20D356
	addq.b	#2,d1
	bra.s	loc_20D34E

; ------------------------------------------------------------------------------

loc_20D356:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20D372:
	cmp.w	(a1)+,d0
	bcs.s	loc_20D37A
	addq.b	#2,d1
	bra.s	loc_20D372

; ------------------------------------------------------------------------------

loc_20D37A:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20D384
	rts

; ------------------------------------------------------------------------------

loc_20D384:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1F00
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
