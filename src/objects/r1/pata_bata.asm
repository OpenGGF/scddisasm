; ------------------------------------------------------------------------------

PataBataObject:
	jsr	(DestroyInGoodFuture).l
	tst.b	obj.routine(a0)
	bne.w	loc_20B4B8
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$2A,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	move.w	obj.y(a0),obj.var_2c(a0)
	move.w	#$8000,obj.var_2e(a0)
	moveq	#1,d0
	jsr	(SetObjectSpriteTile).l
	tst.b	obj.subtype(a0)
	bne.s	loc_20B492
	move.l	#-$8000,d0
	move.w	#-$200,d1
	moveq	#3,d2
	moveq	#0,d3
	lea	PataBataSprites(pc),a1
	bra.s	loc_20B4A4

; ------------------------------------------------------------------------------

loc_20B492:
	move.l	#-$4000,d0
	move.w	#-$100,d1
	moveq	#4,d2
	moveq	#1,d3
	lea	PataBataDecaySprites(pc),a1

loc_20B4A4:
	move.l	d0,obj.var_30(a0)
	move.w	d1,obj.var_36(a0)
	move.w	d2,obj.var_38(a0)
	move.b	d3,obj.anim_id(a0)
	move.l	a1,obj.sprite_data(a0)

loc_20B4B8:
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.x(a0),d0
	sub.w	obj.var_2a(a0),d0
	bpl.s	loc_20B4CC
	neg.w	d0

loc_20B4CC:
	cmpi.w	#$80,d0
	blt.s	loc_20B4EE
	neg.l	obj.var_30(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.x(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	clr.w	obj.var_34(a0)

loc_20B4EE:
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.var_34(a0)
	move.b	obj.var_34(a0),d0
	jsr	(SineCosine).l
	swap	d0
	move.w	obj.var_38(a0),d1
	asr.l	d1,d0
	add.l	obj.var_2c(a0),d0
	move.l	d0,obj.y(a0)
	lea	PataBataAnims(pc),a1
	jsr	(AnimateObject).l
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	jmp	(CheckObjectDespawn2).l

; ------------------------------------------------------------------------------

PataBataAnims:
	include	"src/anims/r1/pata_bata.asm"
	even

PataBataSprites:
	dc.w	@PataBataSprites_0-*
	dc.w	@PataBataSprites_1-PataBataSprites
	dc.w	@PataBataSprites_2-PataBataSprites

@PataBataSprites_0:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 8, 0

@PataBataSprites_1:
	dc.b	2
	dc.b	$F8, $D, 0, $10, $F0
	dc.b	8, 0, 0, $18, 0

@PataBataSprites_2:
	dc.b	1
	dc.b	$F0, $F, 0, $19, $F0

PataBataDecaySprites:
	dc.w	@PataBataDecaySprites_0-*
	dc.w	@PataBataDecaySprites_1-PataBataDecaySprites
	dc.w	@PataBataDecaySprites_2-PataBataDecaySprites

@PataBataDecaySprites_0:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, $29, 0

@PataBataDecaySprites_1:
	dc.b	2
	dc.b	$F8, $D, 0, $10, $F0
	dc.b	8, 0, 0, $18, 0

@PataBataDecaySprites_2:
	dc.b	2
	dc.b	0, 0, 0, $31, 0
	dc.b	$F0, $F, 0, $19, $F0
	dc.b	0

; ------------------------------------------------------------------------------