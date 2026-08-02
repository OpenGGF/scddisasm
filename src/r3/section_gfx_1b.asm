; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20BD6C:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BD74
	addq.b	#2,d1
	bra.s	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BD74:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc2_20BD90:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BD98
	addq.b	#2,d1
	bra.s	loc2_20BD90

; ------------------------------------------------------------------------------

loc_20BD98:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20BDA2
	rts

; ------------------------------------------------------------------------------

loc_20BDA2:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1000
	dc.w	$1800
	dc.w	$1E00
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$C

SectionGfxInitLists:
	dc.w	2
	dc.w	6
	dc.w	7
	dc.w	8

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	cmpi.b	#$F,d0
	bne.s	locret_20BDD6
	move.w	#$4F2,obj.sprite_tile(a0)

locret_20BDD6:
	rts

; ------------------------------------------------------------------------------