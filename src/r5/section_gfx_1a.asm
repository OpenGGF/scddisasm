; ------------------------------------------------------------------------------

InitSectionGfx:
	move.b	time_zone,d0
	andi.b	#3,d0
	beq.s	loc_20C502
	moveq	#2,d0
	jmp	AddGfxQueue

loc_20C502:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C50E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C516
	addq.b	#2,d1
	bra.s	loc_20C50E

; ------------------------------------------------------------------------------

loc_20C516:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	move.b	time_zone,d0
	andi.b	#3,d0
	beq.s	loc_20C534
	rts

loc_20C534:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C540:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C548
	addq.b	#2,d1
	bra.s	loc_20C540

; ------------------------------------------------------------------------------

loc_20C548:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20C552
	rts

; ------------------------------------------------------------------------------

loc_20C552:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$15E0
	dc.w	$1B00
	dc.w	$FFFF

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
	move.w	#$4F2,obj.sprite_tile(a0)
	rts
	
; ------------------------------------------------------------------------------
