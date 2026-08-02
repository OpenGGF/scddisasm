; ------------------------------------------------------------------------------

InitSectionGfx:
	move.b	(time_zone).l,d0
	andi.b	#3,d0
	beq.s	loc_20C216
	moveq	#2,d0
	jmp	AddGfxQueue

loc_20C216:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C222:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C22A
	addq.b	#2,d1
	bra.s	loc_20C222

; ------------------------------------------------------------------------------

loc_20C22A:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	move.b	(time_zone).l,d0
	andi.b	#3,d0
	beq.s	loc_20C248
	rts

loc_20C248:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C254:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C25C
	addq.b	#2,d1
	bra.s	loc_20C254

; ------------------------------------------------------------------------------

loc_20C25C:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20C266
	rts

; ------------------------------------------------------------------------------

loc_20C266:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$400
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