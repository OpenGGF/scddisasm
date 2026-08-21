; ------------------------------------------------------------------------------

MechaBuObject:
	tst.b	obj.subtype_2(a0)
	bpl.s	loc_20C430
	bra.w	loc_20C554

; ------------------------------------------------------------------------------

loc_20C430:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C454(pc,d0.w),d0
	jsr	off_20C454(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_30(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C454:
	dc.w	MechaBuObject_0_Routine0-*
	dc.w	MechaBuObject_0_Routine2-off_20C454
	dc.w	MechaBuObject_0_Routine4-off_20C454

; ------------------------------------------------------------------------------

MechaBuObject_0_Routine0:
	move.w	obj.x(a0),obj.var_30(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$244E,obj.sprite_tile(a0)
	move.l	#MechaBuSprites,obj.sprite_data(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$E,obj.height(a0)
	move.b	#$2A,obj.collide_type(a0)
	move.l	#-$5000,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)
	jsr	SpawnObjectAfter
	beq.s	loc_20C4A6
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20C4A6:
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a0,obj.var_3e(a1)
	tst.b	obj.subtype_2(a0)
	beq.s	MechaBuObject_0_Routine2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	bset	#0,obj.sprite_flags(a1)
	bset	#0,obj.flags(a1)

MechaBuObject_0_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20C500
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)

locret_20C500:
	rts

; ------------------------------------------------------------------------------

MechaBuObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20C520
	addq.w	#1,obj.var_32(a0)
	move.w	obj.var_32(a0),d0
	andi.w	#$1F,d0
	bne.s	loc_20C520
	move.w	#$B1,d0
	jsr	PlayFmSound

loc_20C520:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	jsr	CheckBlockDown
	add.w	d1,obj.y(a0)
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	locret_20C544
	move.w	#$199,obj.var_2a(a0)
	neg.l	obj.var_2c(a0)

locret_20C544:
	rts

; ------------------------------------------------------------------------------

MechaBuSprites:
	include	"sprites/r8/mecha_bu.asm"
	even

; ------------------------------------------------------------------------------

loc_20C554:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C568(pc,d0.w),d0
	jsr	off_20C568(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C568:
	dc.w	MechaBuObject_1_Routine0-*
	dc.w	MechaBuObject_1_Routine2-off_20C568

; ------------------------------------------------------------------------------

MechaBuObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$244E,obj.sprite_tile(a0)
	move.l	#MechaBuSawSprites,obj.sprite_data(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$AB,obj.collide_type(a0)

MechaBuObject_1_Routine2:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$24,obj.id(a1)
	beq.s	loc_20C5AE
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20C5AE:
	tst.b	obj.subtype(a0)
	bne.s	loc_20C5C8
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	loc_20C5F2
	move.w	#60,obj.var_2a(a0)
	eori.b	#1,obj.anim_id(a0)

loc_20C5C8:
	move.w	#-$19,obj.var_2c(a0)
	move.w	#0,obj.var_2e(a0)
	tst.b	obj.anim_id(a0)
	beq.s	loc_20C5E6
	move.w	#-$13,obj.var_2c(a0)
	move.w	#-$F,obj.var_2e(a0)

loc_20C5E6:
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20C5F2
	neg.w	obj.var_2c(a0)

loc_20C5F2:
	move.w	obj.x(a1),d0
	move.w	obj.y(a1),d1
	add.w	obj.var_2c(a0),d0
	add.w	obj.var_2e(a0),d1
	move.w	d0,obj.x(a0)
	move.w	d1,obj.y(a0)
	lea	MechuBuSawAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

MechuBuSawAnims:
	include	"anims/r8/mecha_bu_saw.asm"
	even

MechaBuSawSprites:
	include	"sprites/r8/mecha_bu_saw.asm"
	even

; ------------------------------------------------------------------------------
