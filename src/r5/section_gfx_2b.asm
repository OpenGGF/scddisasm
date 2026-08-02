; ------------------------------------------------------------------------------

InitSectionGfx:
	move.b	(time_zone).l,d0
	andi.b	#3,d0
	beq.s	loc_20C1FE
	moveq	#2,d0
	jmp	AddGfxQueue

loc_20C1FE:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C20A:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C212
	addq.b	#2,d1
	bra.s	loc_20C20A

; ------------------------------------------------------------------------------

loc_20C212:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	move.b	(time_zone).l,d0
	andi.b	#3,d0
	beq.s	loc_20C230
	rts

loc_20C230:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20C23C:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C244
	addq.b	#2,d1
	bra.s	loc_20C23C

; ------------------------------------------------------------------------------

loc_20C244:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20C24E
	rts

; ------------------------------------------------------------------------------

loc_20C24E:
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