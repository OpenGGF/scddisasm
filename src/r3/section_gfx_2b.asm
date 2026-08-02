; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20BB4E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BB56
	addq.b	#2,d1
	bra.s	loc_20BB4E

; ------------------------------------------------------------------------------

loc_20BB56:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20BB72:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BB7A
	addq.b	#2,d1
	bra.s	loc_20BB72

; ------------------------------------------------------------------------------

loc_20BB7A:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20BB84
	rts

; ------------------------------------------------------------------------------

loc_20BB84:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1000
	dc.w	$1700
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	8
	dc.w	9
	dc.w	$A

SectionGfxInitLists:
	dc.w	2
	dc.w	6
	dc.w	7

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	cmpi.b	#$F,d0
	bne.s	locret_20BBB2
	move.w	#$4F2,obj.sprite_tile(a0)

locret_20BBB2:
	rts

; ------------------------------------------------------------------------------