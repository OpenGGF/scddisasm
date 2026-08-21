; ------------------------------------------------------------------------------

InitSectionGfx:
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
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20C180:
	cmp.w	(a1)+,d0
	bcs.s	loc_20C188
	addq.b	#2,d1
	bra.s	loc_20C180

; ------------------------------------------------------------------------------

loc_20C188:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20C192
	rts

; ------------------------------------------------------------------------------

loc_20C192:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$A80
	dc.w	$E80
	dc.w	$1000
	dc.w	$1F80
	dc.w	$FFFF

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
