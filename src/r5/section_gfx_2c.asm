; ------------------------------------------------------------------------------

InitSectionGfx:
	move.b	time_zone,d0
	andi.b	#3,d0
	beq.s	loc_20C11E
	moveq	#2,d0
	jmp	AddGfxQueue

loc_20C11E:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C12A:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C132
	addq.b	#2,d1
	bra.s	loc_20C12A

; ------------------------------------------------------------------------------

loc_20C132:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	move.b	time_zone,d0
	andi.b	#3,d0
	beq.s	loc_20C150
	rts

loc_20C150:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C15C:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C164
	addq.b	#2,d1
	bra.s	loc_20C15C

; ------------------------------------------------------------------------------

loc_20C164:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20C16E
	rts

; ------------------------------------------------------------------------------

loc_20C16E:
	move.b	d1,gfx_section_id
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
