; ------------------------------------------------------------------------------

AnimalObject:
	jsr	CheckAnimalPrescence
	tst.b	obj.routine(a0)
	bmi.w	loc_20E45A
	bne.w	loc_20E4EA
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	lea	word_20E5C4(pc),a1
	moveq	#0,d0
	move.b	(act).l,d0
	asl.w	#2,d0
	add.b	(time_zone).l,d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.sprite_tile(a0)
	btst	#0,obj.subtype(a0)
	beq.s	loc_20E3E0
	addi.w	#$2000,obj.sprite_tile(a0)

loc_20E3E0:
	lea	off_20E574(pc),a1
	btst	#0,obj.subtype(a0)
	beq.s	loc_20E3F0
	lea	off_20E59C(pc),a1

loc_20E3F0:
	move.l	a1,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20E43E
	subq.b	#2,obj.routine(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	move.w	obj.x(a0),obj.var_38(a0)
	move.l	#$200,obj.var_34(a0)
	btst	#0,d0
	beq.s	locret_20E43C
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	neg.l	obj.var_34(a0)
	move.l	#$3000,obj.var_30(a0)

locret_20E43C:
	rts

; ------------------------------------------------------------------------------

loc_20E43E:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)
	move.l	#$10000,obj.var_2a(a0)
	move.l	#$100,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E45A:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$52,0(a1)
	bne.s	loc_20E46C
	tst.b	$3F(a1)
	beq.s	loc_20E472

loc_20E46C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E472:
	move.b	obj.var_32(a0),d0
	jsr	SineCosine
	swap	d1
	swap	d0
	asr.l	#3,d1
	asr.l	#4,d0
	addi.l	#$8000,d1
	addi.l	#$8000,d0
	swap	d1
	swap	d0
	add.w	obj.var_38(a0),d1
	add.w	obj.var_2e(a0),d0
	move.w	d1,obj.x(a0)
	move.w	d0,obj.y(a0)
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.var_30(a0)
	move.l	obj.var_30(a0),d0
	andi.l	#$7FFF,d0
	bne.s	loc_20E4DA
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	cmpi.b	#5,obj.sprite_layer(a0)
	beq.s	loc_20E4D4
	move.b	#5,obj.sprite_layer(a0)
	bra.s	loc_20E4DA

; ------------------------------------------------------------------------------

loc_20E4D4:
	move.b	#3,obj.sprite_layer(a0)

loc_20E4DA:
	lea	Ani_20E54E(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20E4EA:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.b	obj.var_32(a0),d0
	jsr	SineCosine
	swap	d0
	asr.l	#3,d0
	addi.l	#$8000,d0
	swap	d0
	add.w	obj.var_2e(a0),d0
	move.w	d0,obj.y(a0)
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.var_30(a0)
	bmi.s	loc_20E524
	cmpi.l	#$10000,obj.var_30(a0)
	blt.s	loc_20E538

loc_20E524:
	neg.l	obj.var_34(a0)
	neg.l	obj.var_2a(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

loc_20E538:
	lea	Ani_20E54E(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

Ani_20E54E:
	dc.w	@Ani_20E54E_0-*
	dc.w	@Ani_20E54E_1-Ani_20E54E

@Ani_20E54E_0:
	dc.b	0
	dc.b	0, 0, 2, 0, 0, 2, 1, 1
	dc.b	2, 1, 1, 2, 0, 0, 2, 2
	dc.b	0, 0, 2, 2, 1, 1, 2, 2
	dc.b	1, 1, 2, 2
	dc.b	$FF

@Ani_20E54E_1:
	dc.b	$13
	dc.b	0, 1
	dc.b	$FF

off_20E574:
	dc.w	byte_20E57A-*
	dc.w	byte_20E58A-off_20E574
	dc.w	byte_20E59A-off_20E574

byte_20E57A:
	dc.b	3
	dc.b	$F4, 4, 0, 0, $F8
	dc.b	$FC, 4, 0, 2, $F8
	dc.b	4, 4, $10, 0, $F8

byte_20E58A:
	dc.b	3
	dc.b	$F4, 4, 0, 4, $F8
	dc.b	$FC, 4, 0, 6, $F8
	dc.b	4, 4, $10, 4, $F8

byte_20E59A:
	dc.b	0
	dc.b	0

off_20E59C:
	dc.w	byte_20E5A2-*
	dc.w	byte_20E5B2-off_20E59C
	dc.w	byte_20E5C2-off_20E59C

byte_20E5A2:
	dc.b	3
	dc.b	$F4, 4, 0, 8, $F8
	dc.b	$FC, 4, 0, $A, $F8
	dc.b	4, 4, $10, 8, $F8

byte_20E5B2:
	dc.b	3
	dc.b	$F4, 4, 0, $C, $F8
	dc.b	$FC, 4, 0, $E, $F8
	dc.b	4, 4, $10, $C, $F8

byte_20E5C2:
	dc.b	0
	dc.b	0

word_20E5C4:
	dc.w	$450, $450, $450, 0
	dc.w	$450, $450, $450, 0
	dc.w	0, 0, $450

; ------------------------------------------------------------------------------