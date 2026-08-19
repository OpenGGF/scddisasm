; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CBFA:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CC02
	addq.b	#2,d1
	bra.s	loc_20CBFA

; ------------------------------------------------------------------------------

loc_20CC02:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CC1E:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CC26
	addq.b	#2,d1
	bra.s	loc_20CC1E

; ------------------------------------------------------------------------------

loc_20CC26:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20CC30
	rts

; ------------------------------------------------------------------------------

loc_20CC30:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$A00
	dc.w	$1500
	dc.w	$1800
	dc.w	$1D00
	dc.w	-1

SectionGfxUpdateLists:
	dc.w	8
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$C

SectionGfxInitLists:
	dc.w	2
	dc.w	4
	dc.w	5
	dc.w	6
	dc.w	7

; ------------------------------------------------------------------------------

SetObjectSpriteTile:
	lea	ObjectSpriteTiles,a1
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
	dc.w	@SpriteTiles_12-ObjectSpriteTiles
	dc.w	@SpriteTiles_14-ObjectSpriteTiles
	dc.w	@SpriteTiles_16-ObjectSpriteTiles
	dc.w	@SpriteTiles_18-ObjectSpriteTiles
	dc.w	@SpriteTiles_1A-ObjectSpriteTiles
	dc.w	@SpriteTiles_1C-ObjectSpriteTiles
	dc.w	@SpriteTiles_1E-ObjectSpriteTiles
	dc.w	@SpriteTiles_20-ObjectSpriteTiles
	dc.w	@SpriteTiles_22-ObjectSpriteTiles

@SpriteTiles_0:
	dc.w	$23A7

@SpriteTiles_2:
	dc.w	$23A7

@SpriteTiles_4:
	dc.w	$2400
	dc.w	$23DB

@SpriteTiles_6:
	dc.w	$23DB

@SpriteTiles_8:
	dc.w	$242C

@SpriteTiles_A:
	dc.w	$435A

@SpriteTiles_14:
	dc.w	$330

@SpriteTiles_E:
	dc.w	0

@SpriteTiles_12:
	dc.w	$4000

@SpriteTiles_10:
	dc.w	$4000

@SpriteTiles_C:
	dc.w	$380

@SpriteTiles_16:
	dc.w	$36C

@SpriteTiles_18:
	dc.w	$834E

@SpriteTiles_1A:
	dc.w	$3A7

@SpriteTiles_1C:
	dc.w	$338

@SpriteTiles_1E:
	dc.w	$490

@SpriteTiles_20:
	dc.w	0

@SpriteTiles_22:
	dc.w	$418

; ------------------------------------------------------------------------------
