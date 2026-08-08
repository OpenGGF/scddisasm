; ------------------------------------------------------------------------------

KamaKamaObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D022(pc,d0.w),d0
	jsr	off_20D022(pc,d0.w)
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D022:
	dc.w	KamaKamaObject_0_Routine0-*
	dc.w	KamaKamaObject_0_Routine2-off_20D022
	dc.w	KamaKamaObject_0_Routine4-off_20D022
	dc.w	KamaKamaObject_0_Routine6-off_20D022
	dc.w	KamaKamaObject_0_Routine8-off_20D022
	dc.w	KamaKamaObject_0_RoutineA-off_20D022
	dc.w	KamaKamaObject_0_RoutineC-off_20D022

; ------------------------------------------------------------------------------

KamaKamaObject_0_Routine0:
	move.l	#KamaKamaSprites1,d1
	move.b	#1,d0
	move.b	obj.subtype(a0),obj.var_2e(a0)
	bpl.s	loc_20D04C
	move.l	#KamaKamaSprites2,d1
	move.b	#2,d0

loc_20D04C:
	move.b	d0,obj.sprite_frame(a0)
	move.l	d1,obj.sprite_data(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.w	#$23F2,obj.sprite_tile(a0)
	move.w	#$100,obj.y_speed(a0)
	move.b	#6,obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)

KamaKamaObject_0_Routine2:
	jsr	sub_20D1BC(pc)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20D094
	addq.b	#2,obj.routine(a0)

loc_20D094:
	lea	KamaKamaAnims(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

KamaKamaObject_0_Routine4:
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20D0F2
	bclr	#0,obj.sprite_flags(a0)
	bclr	#0,obj.flags(a0)
	lea	(player_object).w,a1
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bcc.s	loc_20D0D4
	neg.w	d0
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

loc_20D0D4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20D0F2
	move.w	obj.y(a0),d1
	sub.w	obj.y(a1),d1
	bcc.s	loc_20D0E6
	neg.w	d1

loc_20D0E6:
	cmpi.w	#$20,d1
	bcc.s	loc_20D0F2
	cmpi.w	#$60,d0
	bcs.s	loc_20D0FA

loc_20D0F2:
	move.b	#1,obj.anim_id(a0)
	bra.s	loc_20D094

; ------------------------------------------------------------------------------

loc_20D0FA:
	move.b	#2,obj.anim_id(a0)
	jsr	sub_20D1D6(pc)
	move.w	#$78,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)

KamaKamaObject_0_Routine6:
	subq.w	#1,obj.var_2c(a0)
	beq.s	loc_20D118
	bra.w	loc_20D094

; ------------------------------------------------------------------------------

loc_20D118:
	move.b	#3,obj.anim_id(a0)
	move.w	#$3C,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)

KamaKamaObject_0_Routine8:
	subq.w	#1,obj.var_2c(a0)
	beq.s	loc_20D132
	bra.w	loc_20D094

; ------------------------------------------------------------------------------

loc_20D132:
	addq.b	#2,obj.routine(a0)

KamaKamaObject_0_RoutineA:
	move.w	#$100,d0
	tst.b	obj.subtype(a0)
	bpl.s	loc_20D144
	move.w	#$80,d0

loc_20D144:
	move.b	#0,obj.anim_id(a0)
	btst	#0,obj.flags(a0)
	bne.s	loc_20D154
	neg.w	d0

loc_20D154:
	move.w	d0,obj.x_speed(a0)
	jsr	sub_20D1BC(pc)
	jsr	PlayerCheckBlockLeft
	tst.w	d1
	bmi.s	loc_20D18E
	jsr	PlayerCheckBlockRight
	tst.w	d1
	bmi.s	loc_20D18E
	jsr	CheckBlockDown
	tst.w	d1
	beq.s	loc_20D18A
	cmpi.w	#7,d1
	bpl.s	loc_20D18E
	cmpi.w	#-7,d1
	bmi.s	loc_20D18E
	add.w	d1,obj.y(a0)

loc_20D18A:
	bra.w	loc_20D094

; ------------------------------------------------------------------------------

loc_20D18E:
	move.w	#$48,obj.var_2c(a0)
	move.w	#3,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)

KamaKamaObject_0_RoutineC:
	subq.w	#1,obj.var_2c(a0)
	beq.s	loc_20D1A8
	bra.w	loc_20D094

; ------------------------------------------------------------------------------

loc_20D1A8:
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	subq.b	#2,obj.routine(a0)
	bra.w	loc_20D094

; ------------------------------------------------------------------------------

sub_20D1BC:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D1D6:
	tst.b	obj.subtype(a0)
	bpl.s	loc_20D1DE
	rts

; ------------------------------------------------------------------------------

loc_20D1DE:
	jsr	SpawnObject
	bne.s	loc_20D222
	move.b	#$25,obj.id(a1)
	move.w	a0,obj.var_30(a1)
	move.w	#$40,obj.var_2c(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	obj.sprite_flags(a0),obj.var_2e(a1)
	move.w	obj.y(a0),d0
	subq.w	#4,d0
	move.w	d0,obj.y(a1)
	move.w	obj.x(a0),d0
	moveq	#$11,d1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20D21C
	neg.w	d1

loc_20D21C:
	add.w	d1,d0
	move.w	d0,obj.x(a1)

loc_20D222:
	jsr	SpawnObject
	bne.s	locret_20D266
	move.b	#$25,obj.id(a1)
	move.w	a0,obj.var_30(a1)
	move.w	#$14,obj.var_2c(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	obj.sprite_flags(a0),obj.var_2e(a1)
	move.w	obj.y(a0),d0
	subq.w	#6,d0
	move.w	d0,obj.y(a1)
	move.w	obj.x(a0),d0
	moveq	#9,d1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20D260
	neg.w	d1

loc_20D260:
	add.w	d1,d0
	move.w	d0,obj.x(a1)

locret_20D266:
	rts

; ------------------------------------------------------------------------------

KamaKamaAnims:
	include	"src/anims/r3/kama_kama.asm"
	even

; ------------------------------------------------------------------------------

KamaSickleObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D2A6(pc,d0.w),d0
	jsr	off_20D2A6(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_32(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20D2A6:
	dc.w	KamaSickleObject_0_Routine0-*
	dc.w	KamaSickleObject_0_Routine2-off_20D2A6
	dc.w	KamaSickleObject_0_Routine4-off_20D2A6

; ------------------------------------------------------------------------------

KamaSickleObject_0_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#4,obj.width(a0)
	move.b	#4,obj.height(a0)
	move.w	#$23F2,obj.sprite_tile(a0)
	move.l	#Spr_20D3EC,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.w	#$300,d1
	btst	#0,obj.var_2e(a0)
	bne.s	loc_20D2F2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	neg.w	d1

loc_20D2F2:
	move.w	d1,obj.x_speed(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

KamaSickleObject_0_Routine2:
	subq.w	#1,obj.var_2c(a0)
	bne.s	loc_20D312
	addq.b	#2,obj.routine(a0)
	move.b	#$87,obj.collide_type(a0)
	move.b	#$3C,obj.var_34(a0)

loc_20D312:
	move.w	obj.var_30(a0),d0
	movea.w	d0,a1
	cmpi.b	#$24,0(a1)
	beq.s	loc_20D326
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D326:
	lea	KamaSickleAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

KamaSickleObject_0_Routine4:
	jsr	sub_20D1BC(pc)
	move.w	obj.var_2a(a0),d0
	add.w	d0,obj.y_speed(a0)
	cmpi.b	#0,obj.sprite_frame(a0)
	bne.s	loc_20D356
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20D356
	move.w	#$B9,d0
	jsr	PlayFmSound

loc_20D356:
	lea	(player_object).w,a1
	bsr.s	sub_20D378
	beq.s	loc_20D360
	bsr.s	sub_20D3B8

loc_20D360:
	subq.b	#1,obj.var_34(a0)
	bne.s	loc_20D36E
	addq.b	#1,obj.var_34(a0)
	clr.b	obj.collide_type(a0)

loc_20D36E:
	lea	KamaSickleAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

sub_20D378:
	tst.b	(invincible).l
	bne.s	loc_20D388
	btst	#2,obj.flags(a1)
	beq.s	loc_20D3B4

loc_20D388:
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	moveq	#$1C,d1
	add.w	d1,d0
	bmi.s	loc_20D3B4
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20D3B4
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	moveq	#$1C,d1
	add.w	d1,d0
	bmi.s	loc_20D3B4
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20D3B4
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20D3B4:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

sub_20D3B8:
	clr.b	obj.collide_type(a0)
	move.b	#1,obj.anim_id(a0)
	move.w	$10(a1),d0
	add.w	d0,obj.x_speed(a0)
	move.w	#$F800,obj.y_speed(a0)
	move.w	#$40,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

KamaSickleAnims:
	include	"src/anims/r3/kama_sickle.asm"
	even

Spr_20D3EC:
	dc.w	@Spr_20D3EC_0-*
	dc.w	@Spr_20D3EC_1-Spr_20D3EC
	dc.w	@Spr_20D3EC_2-Spr_20D3EC
	dc.w	@Spr_20D3EC_3-Spr_20D3EC
	dc.w	@Spr_20D3EC_4-Spr_20D3EC
	dc.w	@Spr_20D3EC_5-Spr_20D3EC

@Spr_20D3EC_0:
	dc.b	1
	dc.b	$F8, 5, 0, $19, $F8

@Spr_20D3EC_1:
	dc.b	1
	dc.b	$F8, 5, 0, $1D, $F8

@Spr_20D3EC_2:
	dc.b	1
	dc.b	$F8, 5, $10, $19, $F8

@Spr_20D3EC_3:
	dc.b	1
	dc.b	$F8, 5, $18, $19, $F8

@Spr_20D3EC_4:
	dc.b	1
	dc.b	$F8, 5, $18, $1D, $F8

@Spr_20D3EC_5:
	dc.b	1
	dc.b	$F8, 5, 8, $19, $F8

; ------------------------------------------------------------------------------