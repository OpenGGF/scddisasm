; ------------------------------------------------------------------------------

TagaTagaObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BACC(pc,d0.w),d0
	jsr	off_20BACC(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20BACC:
	dc.w	TagaTagaObject_0_Routine0-*
	dc.w	TagaTagaObject_0_Routine2-off_20BACC
	dc.w	TagaTagaObject_0_Routine4-off_20BACC
	dc.w	TagaTagaObject_0_Routine6-off_20BACC
	dc.w	TagaTagaObject_0_Routine8-off_20BACC

; ------------------------------------------------------------------------------

TagaTagaObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$16,obj.height(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	move.w	obj.y(a0),obj.var_2c(a0)
	moveq	#3,d0
	jsr	SetObjectSpriteTile
	tst.b	obj.subtype(a0)
	bne.s	loc_20BB28
	lea	TagaTagaSprites1(pc),a1
	lea	TagaTagaAnims1(pc),a2
	move.l	#-$3C000,d0
	move.l	#$1000,d1
	bra.s	loc_20BB3C

; ------------------------------------------------------------------------------

loc_20BB28:
	lea	TagaTagaSprites2(pc),a1
	lea	TagaTagaAnims2(pc),a2
	move.l	#-$30000,d0
	move.l	#$1000,d1

loc_20BB3C:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_3c(a0)
	move.l	d0,obj.var_30(a0)
	move.l	d1,obj.var_38(a0)

TagaTagaObject_0_Routine2:
	addq.b	#2,obj.routine(a0)
	move.w	#$FF,obj.anim_id(a0)
	move.b	#0,obj.collide_type(a0)
	move.l	obj.var_2c(a0),obj.y(a0)

TagaTagaObject_0_Routine4:
	movea.l	obj.var_3c(a0),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

TagaTagaObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.w	#$1FF,obj.anim_id(a0)
	move.b	#$2E,obj.collide_type(a0)
	move.l	obj.var_2c(a0),obj.y(a0)
	move.l	obj.var_30(a0),obj.var_34(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	TagaTagaObject_0_Routine8
	move.w	#$A2,d0
	jsr	PlayFmSound

TagaTagaObject_0_Routine8:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.y(a0)
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.var_34(a0)
	move.w	obj.y(a0),d0
	cmp.w	obj.var_2c(a0),d0
	ble.s	loc_20BBC8
	move.b	#2,obj.routine(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20BBC8
	move.w	#$A2,d0
	jsr	PlayFmSound

loc_20BBC8:
	movea.l	obj.var_3c(a0),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

TagaTagaAnims1:
	include	"src/anims/r1/taga_taga_1.asm"
	even

TagaTagaAnims2:
	include	"src/anims/r1/taga_taga_2.asm"
	even

TagaTagaSprites:
	include	"src/sprites/r1/taga_taga.asm"
	even
TagaTagaSprites1	equ .Sprites1
TagaTagaSprites2	equ .Sprites2

; ------------------------------------------------------------------------------
