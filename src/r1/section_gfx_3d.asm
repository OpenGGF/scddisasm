; ------------------------------------------------------------------------------

InitSectionGfx:

; ------------------------------------------------------------------------------

UpdateSectionGfx:
	rts

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
	dc.w	$2000

@SpriteTiles_2:
	dc.w	$200C

@SpriteTiles_4:
	dc.w	$2000

@SpriteTiles_6:
	dc.w	$2000

@SpriteTiles_8:
	dc.w	$23E7

@SpriteTiles_A:
	dc.w	$4000

@SpriteTiles_14:
	dc.w	0

@SpriteTiles_E:
	dc.w	0

@SpriteTiles_C:
	dc.w	0

@SpriteTiles_16:
	dc.w	$4FE

@SpriteTiles_18:
	dc.w	$83AE

@SpriteTiles_1A:
	dc.w	0

@SpriteTiles_1C:
	dc.w	0

@SpriteTiles_1E:
	dc.w	0

@SpriteTiles_20:
	dc.w	0

@SpriteTiles_10:
	dc.w	0
	
; ------------------------------------------------------------------------------