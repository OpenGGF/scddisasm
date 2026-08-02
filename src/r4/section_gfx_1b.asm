; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C098:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C0A0
	addq.b	#2,d1
	bra.s	loc_20C098

; ------------------------------------------------------------------------------

loc_20C0A0:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C0BC:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C0C4
	addq.b	#2,d1
	bra.s	loc_20C0BC

; ------------------------------------------------------------------------------

loc_20C0C4:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20C0CE
	rts

; ------------------------------------------------------------------------------

loc_20C0CE:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$680
	dc.w	$A80
	dc.w	$1280
	dc.w	$1680
	dc.w	-1

SectionGfxUpdateLists:
	dc.w	6
	dc.w	7
	dc.w	6
	dc.w	8
	dc.w	6

SectionGfxInitLists:
	dc.w	2
	dc.w	4
	dc.w	2
	dc.w	5
	dc.w	2

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	rts

; ------------------------------------------------------------------------------