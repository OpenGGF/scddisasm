; ------------------------------------------------------------------------------

InitSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CB88:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CB90
	addq.b	#2,d1
	bra.s	loc_20CB88

; ------------------------------------------------------------------------------

loc_20CB90:
	move.b	d1,gfx_section_id
	move.w	SectionGfxInitLists(pc,d1.w),d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	lea	SectionGfxRanges(pc),a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0

loc_20CBAC:
	cmp.w	(a1)+,d0
	bcs.s	loc_20CBB4
	addq.b	#2,d1
	bra.s	loc_20CBAC

; ------------------------------------------------------------------------------

loc_20CBB4:
	cmp.b	gfx_section_id,d1
	bne.s	loc_20CBBE
	rts

; ------------------------------------------------------------------------------

loc_20CBBE:
	move.b	d1,gfx_section_id
	move.w	SectionGfxUpdateLists(pc,d1.w),d0
	jmp	InitGfxQueue

; ------------------------------------------------------------------------------

SectionGfxRanges:
	dc.w	$B00
	dc.w	$1500
	dc.w	$1800
	dc.w	$1C00
	dc.w	$FFFF

SectionGfxUpdateLists:
	dc.w	$A
	dc.w	$B
	dc.w	$C
	dc.w	$D
	dc.w	$E

SectionGfxInitLists:
	dc.w	2
	dc.w	6
	dc.w	7
	dc.w	8
	dc.w	9

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
	dc.w	$23EA

@SpriteTiles_2:
	dc.w	$23EA

@SpriteTiles_4:
	dc.w	$2399

@SpriteTiles_6:
	dc.w	$241E

@SpriteTiles_8:
	dc.w	$23AF

@SpriteTiles_A:
	dc.w	$434C

@SpriteTiles_14:
	dc.w	$330

@SpriteTiles_E:
	dc.w	$41E

@SpriteTiles_12:
	dc.w	$4000

@SpriteTiles_10:
	dc.w	$4000

@SpriteTiles_C:
	dc.w	$372

@SpriteTiles_16:
	dc.w	$35E

@SpriteTiles_18:
	dc.w	$8340

@SpriteTiles_1A:
	dc.w	0

@SpriteTiles_1C:
	dc.w	$338

@SpriteTiles_1E:
	dc.w	$490

@SpriteTiles_20:
	dc.w	0

@SpriteTiles_22:
	dc.w	$46C

; ------------------------------------------------------------------------------
