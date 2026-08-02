; ------------------------------------------------------------------------------

BuzzsawObject:
	tst.b	obj.subtype_2(a0)
	bne.w	loc_20CBDC
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CA0E(pc,d0.w),d0
	jsr	off_20CA0E(pc,d0.w)
	lea	Ani_20CC18(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20CA0E:
	dc.w	BuzzsawObject_0_Routine0-*
	dc.w	BuzzsawObject_0_Routine2-off_20CA0E
	dc.w	BuzzsawObject_0_Routine4-off_20CA0E
	dc.w	BuzzsawObject_0_Routine6-off_20CA0E
	dc.w	BuzzsawObject_0_Routine8-off_20CA0E

; ------------------------------------------------------------------------------

BuzzsawObject_0_Routine0:
	move.w	obj.x(a0),obj.var_36(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4316,obj.sprite_tile(a0)
	move.l	#Spr_23EBF2,obj.sprite_data(a0)
	move.b	#$A9,obj.collide_type(a0)
	move.b	#$50,obj.width_2(a0)
	move.b	#$50,obj.height(a0)
	move.l	#$10000,obj.var_2c(a0)
	move.l	#$10000,obj.var_30(a0)
	btst	#0,obj.subtype(a0)
	beq.s	loc_20CA72
	neg.l	obj.var_2c(a0)
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

loc_20CA72:
	btst	#1,obj.subtype(a0)
	beq.s	loc_20CA8A
	neg.l	obj.var_30(a0)
	bset	#1,obj.sprite_flags(a0)
	bset	#1,obj.flags(a0)

loc_20CA8A:
	move.w	#$3C,obj.var_2a(a0)
	move.b	#8,obj.routine(a0)
	tst.b	obj.subtype(a0)
	bpl.s	loc_20CAA8
	move.b	#9,obj.anim_id(a0)
	move.b	#4,obj.routine(a0)

loc_20CAA8:
	jsr	SpawnObject
	bne.w	loc_20CC12
	move.w	a1,obj.var_3a(a0)
	move.w	a0,obj.var_2a(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	tst.b	obj.subtype(a0)
	bpl.s	BuzzsawObject_0_Routine2
	moveq	#$50,d0
	moveq	#$50,d1
	btst	#0,obj.subtype(a0)
	beq.s	loc_20CB02
	neg.w	d0

loc_20CB02:
	btst	#1,obj.subtype(a0)
	beq.s	loc_20CB0C
	neg.w	d1

loc_20CB0C:
	sub.w	d0,obj.x(a1)
	sub.w	d1,obj.y(a1)

BuzzsawObject_0_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20CB38
	addq.b	#1,obj.anim_id(a0)
	move.w	#9,obj.var_2a(a0)
	addi.w	#-1,obj.var_34(a0)
	bne.s	loc_20CB38
	addq.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_2a(a0)

loc_20CB38:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	bra.w	loc_20CBBC

; ------------------------------------------------------------------------------

BuzzsawObject_0_Routine4:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20CB64
	addq.b	#2,obj.routine(a0)
	move.w	#9,obj.var_34(a0)
	move.w	#1,obj.var_2a(a0)

loc_20CB64:
	bra.w	loc_20CBBC

; ------------------------------------------------------------------------------

BuzzsawObject_0_Routine6:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20CB8E
	addi.b	#-1,obj.anim_id(a0)
	move.w	#9,obj.var_2a(a0)
	addi.w	#-1,obj.var_34(a0)
	bne.s	loc_20CB8E
	addq.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_2a(a0)

loc_20CB8E:
	move.l	obj.var_2c(a0),d0
	sub.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	sub.l	d0,obj.y(a0)
	bra.w	loc_20CBBC

; ------------------------------------------------------------------------------

BuzzsawObject_0_Routine8:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20CBBC
	addi.b	#-6,obj.routine(a0)
	move.w	#9,obj.var_34(a0)
	move.w	#1,obj.var_2a(a0)

loc_20CBBC:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20CBDA
	addq.w	#1,obj.var_38(a0)
	move.w	obj.var_38(a0),d0
	andi.w	#$1F,d0
	bne.s	locret_20CBDA
	move.w	#$B1,d0
	jsr	PlayFmSound

locret_20CBDA:
	rts

; ------------------------------------------------------------------------------

loc_20CBDC:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$27,obj.id(a1)
	bne.s	loc_20CC12
	tst.b	obj.routine(a0)
	bne.s	loc_20CC0C
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#Spr_20CC50,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)

loc_20CC0C:
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20CC12:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Ani_20CC18:
	dc.w	@Ani_20CC18_0-*
	dc.w	@Ani_20CC18_1-Ani_20CC18
	dc.w	@Ani_20CC18_2-Ani_20CC18
	dc.w	@Ani_20CC18_3-Ani_20CC18
	dc.w	@Ani_20CC18_4-Ani_20CC18
	dc.w	@Ani_20CC18_5-Ani_20CC18
	dc.w	@Ani_20CC18_6-Ani_20CC18
	dc.w	@Ani_20CC18_7-Ani_20CC18
	dc.w	@Ani_20CC18_8-Ani_20CC18
	dc.w	@Ani_20CC18_8-Ani_20CC18
@Ani_20CC18_0:
	dc.b	1
	dc.b	0, 1
	dc.b	$FF
@Ani_20CC18_1:
	dc.b	1
	dc.b	2, 3
	dc.b	$FF
@Ani_20CC18_2:
	dc.b	1
	dc.b	4, 5
	dc.b	$FF
@Ani_20CC18_3:
	dc.b	1
	dc.b	6, 7
	dc.b	$FF
@Ani_20CC18_4:
	dc.b	1
	dc.b	8, 9
	dc.b	$FF
@Ani_20CC18_5:
	dc.b	1
	dc.b	$A, $B
	dc.b	$FF
@Ani_20CC18_6:
	dc.b	1
	dc.b	$C, $D
	dc.b	$FF
@Ani_20CC18_7:
	dc.b	1
	dc.b	$E, $F
	dc.b	$FF
@Ani_20CC18_8:
	dc.b	1
	dc.b	$10, $11
	dc.b	$FF
Spr_20CC50:
	dc.w	@Spr_20CC50_0-*
@Spr_20CC50_0:
	dc.b	3
	dc.b	$F0, 5, 8, $22, $F0
	dc.b	$E6, 5, 8, $22, $E6
	dc.b	$DC, 5, 8, $22, $DC

; ------------------------------------------------------------------------------