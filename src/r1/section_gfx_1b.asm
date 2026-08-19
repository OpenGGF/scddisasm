; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CF22:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CF2A
	addq.b	#2,d1
	bra.s	loc_20CF22

; ------------------------------------------------------------------------------

loc_20CF2A:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CF46:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CF4E
	addq.b	#2,d1
	bra.s	loc_20CF46

; ------------------------------------------------------------------------------

loc_20CF4E:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20CF58
	rts

; ------------------------------------------------------------------------------

loc_20CF58:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$1100
	dc.w	$1A00
	dc.w	$2000
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	9
	dc.w	$A
	dc.w	$B
	dc.w	$C

SectionGfxInitLists:
	dc.w	2
	dc.w	6
	dc.w	7
	dc.w	8

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
	dc.w	$2396

@SpriteTiles_2:
	dc.w	$243F

@SpriteTiles_4:
	dc.w	$23ED

@SpriteTiles_6:
	dc.w	$2000

@SpriteTiles_8:
	dc.w	$2403

@SpriteTiles_A:
	dc.w	$4334

@SpriteTiles_14:
	dc.w	$320

@SpriteTiles_E:
	dc.w	$381

@SpriteTiles_12:
	dc.w	$4000

@SpriteTiles_10:
	dc.w	$4000

@SpriteTiles_C:
	dc.w	$372

@SpriteTiles_16:
	dc.w	$346

@SpriteTiles_18:
	dc.w	$8328

@SpriteTiles_1A:
	dc.w	0

@SpriteTiles_1C:
	dc.w	0

@SpriteTiles_1E:
	dc.w	$490

@SpriteTiles_20:
	dc.w	$39E

@SpriteTiles_22:
	dc.w	0

; ------------------------------------------------------------------------------
