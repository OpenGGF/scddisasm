; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20BFFE:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C006
	addq.b	#2,d1
	bra.s	loc_20BFFE

; ------------------------------------------------------------------------------

loc_20C006:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C022:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C02A
	addq.b	#2,d1
	bra.s	loc_20C022

; ------------------------------------------------------------------------------

loc_20C02A:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20C034
	rts

; ------------------------------------------------------------------------------

loc_20C034:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1280
	dc.w	$1500
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