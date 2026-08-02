; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20BD0A:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BD12
	addq.b	#2,d1
	bra.s	loc_20BD0A

; ------------------------------------------------------------------------------

loc_20BD12:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20BD2E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20BD36
	addq.b	#2,d1
	bra.s	loc_20BD2E

; ------------------------------------------------------------------------------

loc_20BD36:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20BD40
	rts

; ------------------------------------------------------------------------------

loc_20BD40:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$700
	dc.w	$B00
	dc.w	$F00
	dc.w	$1400
	dc.w	$1820
	dc.w	$FFFF
SectionGfxUpdateLists:
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$C
	dc.w	$D
	dc.w	$E
SectionGfxInitLists:
	dc.w	2
	dc.w	4
	dc.w	5
	dc.w	6
	dc.w	7
	dc.w	8

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	move.w	#$4EA,d1
	cmpi.b	#$E,d0
	beq.s	loc_20BD82
	move.w	#$4F2,d1

loc_20BD82:
	move.w	d1,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------