; ------------------------------------------------------------------------------

AntonObject:
	jsr	(DestroyInGoodFuture).l
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B2E6(pc,d0.w),d0
	jsr	off_20B2E6(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2e(a0),d0
	jmp	(CheckObjectDespawn2).l

; ------------------------------------------------------------------------------

off_20B2E6:
	dc.w	AntonObject_0_Routine0-*
	dc.w	AntonObject_0_Routine2-off_20B2E6
	dc.w	AntonObject_0_Routine4-off_20B2E6

; ------------------------------------------------------------------------------

AntonObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#AntonSprites,obj.sprite_data(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$13,obj.height(a0)
	move.b	#$29,obj.collide_type(a0)
	move.w	obj.x(a0),obj.var_2e(a0)
	moveq	#2,d0
	jsr	(SetObjectSpriteTile).l
	tst.b	obj.subtype(a0)
	bne.s	loc_20B336
	move.l	#-$10000,d0
	moveq	#0,d1
	bra.s	loc_20B33E

; ------------------------------------------------------------------------------

loc_20B336:
	move.l	#-$8000,d0
	moveq	#1,d1

loc_20B33E:
	move.l	d0,obj.var_2a(a0)
	move.b	d1,obj.anim_id(a0)

AntonObject_0_Routine2:
	move.l	#$10000,d0
	add.l	d0,obj.y(a0)
	jsr	(CheckBlockDown).l
	tst.w	d1
	bpl.s	locret_20B35E
	addq.b	#2,obj.routine(a0)

locret_20B35E:
	rts

; ------------------------------------------------------------------------------

AntonObject_0_Routine4:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2e(a0),d0
	bpl.s	loc_20B374
	neg.w	d0

loc_20B374:
	cmpi.w	#$80,d0
	bge.s	loc_20B39A
	jsr	(CheckBlockDown).l
	cmpi.w	#$FFF9,d1
	blt.s	loc_20B39A
	cmpi.w	#7,d1
	bgt.s	loc_20B39A
	add.w	d1,obj.y(a0)
	lea	AntonAnims(pc),a1
	jmp	(AnimateObject).l

; ------------------------------------------------------------------------------

loc_20B39A:
	neg.l	obj.var_2a(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bra.s	AntonObject_0_Routine4

; ------------------------------------------------------------------------------

AntonAnims:
	dc.w	@AntonSprite_0-*
	dc.w	@AntonSprite_1-AntonAnims

@AntonSprite_0:
	dc.b	3
	dc.b	0, 1
	dc.b	$FF

@AntonSprite_1:
	dc.b	7
	dc.b	2, 3
	dc.b	$FF

AntonSprites:
	dc.w	@AntonAnim_0-*
	dc.w	@AntonAnim_1-AntonSprites
	dc.w	@AntonAnim_2-AntonSprites
	dc.w	@AntonAnim_3-AntonSprites

@AntonAnim_0:
	dc.b	5
	dc.b	$ED, 5, 0, 0, $F4
	dc.b	$FD, 8, 0, 4, $F4
	dc.b	5, 4, 0, 7, $FC
	dc.b	4, 5, 0, 9, $F8
	dc.b	$FC, 0, 0, $11, $E

@AntonAnim_1:
	dc.b	5
	dc.b	$EC, 5, 0, 0, $F4
	dc.b	$FC, 8, 0, 4, $F4
	dc.b	4, 4, 0, 7, $FC
	dc.b	4, 5, 0, $D, $F8
	dc.b	$FB, 0, 0, $11, $12

@AntonAnim_2:
	dc.b	5
	dc.b	$ED, 5, 0, $12, $F4
	dc.b	$FD, 8, 0, 4, $F4
	dc.b	5, 4, 0, 7, $FC
	dc.b	4, 5, 0, 9, $F8
	dc.b	$FC, 0, 0, $11, $E

@AntonAnim_3:
	dc.b	5
	dc.b	$EC, 5, 0, $12, $F4
	dc.b	$FC, 8, 0, 4, $F4
	dc.b	4, 4, 0, 7, $FC
	dc.b	4, 5, 0, $D, $F8
	dc.b	$FB, 0, 0, $11, $12

; ------------------------------------------------------------------------------