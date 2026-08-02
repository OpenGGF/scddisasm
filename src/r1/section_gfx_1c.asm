; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20CA94:
	cmp.w	(a1)+,d0
	bcs.s	loc2_20CA9C
	addq.b	#2,d1
	bra.s	loc_20CA94

; ------------------------------------------------------------------------------

loc2_20CA9C:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	(AddGfxQueue).l

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(scroll_fg_x).w,d0

loc_20CAB8:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CAC0
	addq.b	#2,d1
	bra.s	loc_20CAB8

; ------------------------------------------------------------------------------

loc_20CAC0:
	cmp.b	(gfx_section_id).l,d1
	bne.s	loc_20CACA
	rts

; ------------------------------------------------------------------------------

loc_20CACA:
	move.b	d1,(gfx_section_id).l
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	(InitGfxQueue).l

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$700
	dc.w	$1100
	dc.w	$1A00
	dc.w	-1

SectionGfxUpdateLists:
	dc.w	7
	dc.w	8
	dc.w	9
	dc.w	$A

SectionGfxInitLists:
	dc.w	2
	dc.w	4
	dc.w	5
	dc.w	6

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	lea	(ObjectSpriteTiles).l,a1
	add.w	d0,d0
	move.w	ObjectSpriteTiles(pc,d0.w),d4
	lea	ObjectSpriteTiles(pc,d4.w),a2
	moveq	#0,d1
	move.b	obj.subtype_2(a0),d1
	add.w	d1,d1
	move.w	(a2,d1.w),d5
	move.w	d5,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------

ObjectSpriteTiles:
	dc.w	@SpriteTiles_0-*
	dc.w	@SpriteTiles_2-ObjectSpriteTiles
	dc.w	@SpriteTiles_4-ObjectSpriteTiles
	dc.w	@SpriteTiles_6-ObjectSpriteTiles
	dc.w	@SpriteTiles_8-ObjectSpriteTiles
	dc.w	@SpriteTiles_A-ObjectSpriteTiles
	dc.w	@SpriteTiles_C-ObjectSpriteTiles
	dc.w	@SpriteTiles_E-ObjectSpriteTiles
	dc.w	@SpriteTiles_10-ObjectSpriteTiles
	dc.w	@SpriteTiles_10-ObjectSpriteTiles
	dc.w	@SpriteTiles_14-ObjectSpriteTiles
	dc.w	@SpriteTiles_16-ObjectSpriteTiles
	dc.w	@SpriteTiles_18-ObjectSpriteTiles
	dc.w	@SpriteTiles_1A-ObjectSpriteTiles
	dc.w	@SpriteTiles_1C-ObjectSpriteTiles
	dc.w	@SpriteTiles_1E-ObjectSpriteTiles
	dc.w	@SpriteTiles_20-ObjectSpriteTiles
	dc.w	@SpriteTiles_10-ObjectSpriteTiles

@SpriteTiles_0:
	dc.w	$23D0

@SpriteTiles_2:
	dc.w	$239C

@SpriteTiles_4:
	dc.w	$2386

@SpriteTiles_6:
	dc.w	$2419

@SpriteTiles_8:
	dc.w	$23D0

@SpriteTiles_A:
	dc.w	$4334

@SpriteTiles_14:
	dc.w	$320

@SpriteTiles_E:
	dc.w	$35A

@SpriteTiles_C:
	dc.w	$377

@SpriteTiles_16:
	dc.w	$346

@SpriteTiles_18:
	dc.w	$8328

@SpriteTiles_1A:
	dc.w	0

@SpriteTiles_1C:
	dc.w	$36F

@SpriteTiles_1E:
	dc.w	$490

@SpriteTiles_20:
	dc.w	$40B

@SpriteTiles_10:
	dc.w	0

; ------------------------------------------------------------------------------