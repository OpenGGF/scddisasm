; ------------------------------------------------------------------------------

PrizeSwitchObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EE26(pc,d0.w),d0
	jsr	off_20EE26(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20EE26:
	dc.w	PrizeSwitchObject_0_Routine0-*
	dc.w	PrizeSwitchObject_0_Routine2-off_20EE26
	dc.w	PrizeSwitchObject_0_Routine4-off_20EE26

; ------------------------------------------------------------------------------

PrizeSwitchObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$50A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20F236,obj.sprite_data(a0)
	move.b	#$E,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	tst.b	obj.var_34(a0)
	bne.w	locret_20EEBA
	move.w	obj.x(a0),d0
	move.w	d0,obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.w	a0,obj.var_3a(a0)
	moveq	#1,d1
	moveq	#4,d2

loc_20EE74:
	jsr	SpawnObject
	bne.s	loc_20EEB4
	move.b	#$3F,obj.id(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	a0,obj.var_3a(a1)
	move.b	d1,obj.var_34(a1)
	moveq	#0,d0
	move.b	d1,d0
	add.b	d0,d0
	add.b	d0,d0
	lea	word_20EEBC(pc,d0.w),a2
	move.w	(a2)+,d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	move.w	(a2)+,d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a1)
	move.w	d0,obj.var_32(a1)

loc_20EEB4:
	addq.b	#1,d1
	dbf	d2,loc_20EE74

locret_20EEBA:
	rts

; ------------------------------------------------------------------------------

word_20EEBC:
	dc.w	0, 0
	dc.w	-$40, $40
	dc.w	-$80, $80
	dc.w	$40, -$40
	dc.w	$60, -$80
	dc.w	$80, -$80

; ------------------------------------------------------------------------------

PrizeSwitchObject_0_Routine2:
	jsr	sub_20EF3A
	movea.w	obj.var_3a(a0),a1
	move.w	obj.var_3c(a1),d0
	bne.s	loc_20EEE6
	rts

; ------------------------------------------------------------------------------

loc_20EEE6:
	tst.b	obj.var_2e(a0)
	bne.s	loc_20EEFC
	move.w	#$BF,d0
	jsr	PlayFmSound
	move.b	#$FF,obj.var_2e(a0)

loc_20EEFC:
	addi.b	#$10,obj.var_2f(a0)
	bcc.s	locret_20EF1C
	addq.b	#2,obj.routine(a0)
	lea	(player_object).w,a1
	jsr	GetOffObject
	clr.w	obj.var_38(a0)
	move.b	#2,obj.sprite_frame(a0)

locret_20EF1C:
	rts

; ------------------------------------------------------------------------------

PrizeSwitchObject_0_Routine4:
	movea.w	obj.var_3a(a0),a1
	moveq	#0,d0
	move.b	obj.var_35(a1),d0
	add.b	d0,d0
	move.w	off_20EF32(pc,d0.w),d0
	jmp	off_20EF32(pc,d0.w)

; ------------------------------------------------------------------------------

off_20EF32:
	dc.w	PrizeSwitchObject_1_Routine0-*
	dc.w	PrizeSwitchObject_1_Routine2-off_20EF32
	dc.w	PrizeSwitchObject_1_Routine4-off_20EF32
	dc.w	PrizeSwitchObject_1_Routine6-off_20EF32

; ------------------------------------------------------------------------------

sub_20EF3A:
	move.b	obj.var_31(a0),obj.var_30(a0)
	lea	(player_object).w,a1
	jsr	BottomSolidObject
	sne	obj.var_31(a0)
	beq.s	loc_20EF6C
	tst.w	obj.y_speed(a1)
	bmi.s	loc_20EF6C
	tst.b	obj.var_2e(a0)
	bne.s	loc_20EF6C
	movea.w	obj.var_3a(a0),a1
	move.w	a0,obj.var_3c(a1)
	bsr.s	sub_20EFA4
	move.b	obj.var_35(a0),obj.var_35(a1)

loc_20EF6C:
	lea	(player_object).w,a1
	cmpi.w	#$FF,obj.var_30(a0)
	bne.s	loc_20EF8A
	addq.w	#8,obj.y(a1)
	addq.w	#4,obj.y(a0)
	move.b	#1,obj.sprite_frame(a0)
	subq.b	#4,obj.height(a0)

loc_20EF8A:
	cmpi.w	#$FF00,obj.var_30(a0)
	bne.s	locret_20EFA2
	subq.w	#8,obj.y(a1)
	subq.w	#4,obj.y(a0)
	clr.b	obj.sprite_frame(a0)
	addq.b	#4,obj.height(a0)

locret_20EFA2:
	rts

; ------------------------------------------------------------------------------

sub_20EFA4:
	moveq	#0,d0
	move.b	obj.var_34(a0),d0
	mulu.w	#6,d0
	move.b	(time_seconds).l,d1
	andi.w	#$FF,d1
	divu.w	#10,d1
	andi.w	#7,d1
	add.w	d1,d0
	move.b	byte_20EFCA(pc,d0.w),obj.var_35(a0)
	rts

; ------------------------------------------------------------------------------

byte_20EFCA:
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	0
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------

PrizeSwitchObject_1_Routine0:
	tst.b	obj.var_38(a0)
	bne.s	loc_20F034
	movea.w	obj.var_3a(a0),a1
	movea.w	obj.var_3c(a1),a2
	cmpa.w	a0,a2
	beq.s	loc_20F02E
	cmpi.b	#4,obj.var_34(a0)
	beq.s	loc_20F02E
	jsr	SpawnObject
	bne.s	loc_20F02E
	move.b	#$22,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.y(a1)

loc_20F02E:
	addq.b	#1,obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F034:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PrizeSwitchObject_1_Routine4:
	movea.w	obj.var_3a(a0),a1
	movea.w	obj.var_3c(a1),a2
	cmpa.w	a0,a2
	beq.s	loc_20F07A
	addq.b	#4,obj.var_39(a0)
	bcc.s	locret_20F078
	jsr	SpawnObject
	bne.s	loc_20F06C
	move.b	#$20,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.var_32(a0),obj.y(a1)
	move.b	#2,obj.subtype(a1)

loc_20F06C:
	addq.b	#1,obj.var_38(a0)
	cmpi.b	#2,obj.var_38(a0)
	bcc.s	loc_20F080

locret_20F078:
	rts

; ------------------------------------------------------------------------------

loc_20F07A:
	addq.b	#1,obj.var_38(a0)
	bcc.s	locret_20F078

loc_20F080:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PrizeSwitchObject_1_Routine6:
	movea.w	obj.var_3a(a0),a1
	cmpa.w	a0,a1
	bne.s	loc_20F0A6
	addi.b	#$10,obj.var_38(a0)
	bcc.s	locret_20F0A4
	cmpi.b	#$15,obj.var_39(a0)
	bcc.s	loc_20F0A6
	bsr.s	sub_20F0AC
	addq.b	#1,obj.var_39(a0)

locret_20F0A4:
	rts

; ------------------------------------------------------------------------------

loc_20F0A6:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20F0AC:
	jsr	SpawnObject
	bne.s	locret_20F0DA
	move.b	#$40,obj.id(a1)
	move.w	obj.y(a0),d0
	subi.w	#$180,d0
	move.w	d0,obj.y(a1)
	moveq	#0,d0
	move.b	obj.var_39(a0),d0
	move.b	byte_20F0DC(pc,d0.w),d0
	ext.w	d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)

locret_20F0DA:
	rts

; ------------------------------------------------------------------------------

byte_20F0DC:
	dc.b	-$20
	dc.b	0
	dc.b	$20
	dc.b	$40
	dc.b	$60
	dc.b	$7F
	dc.b	$60
	dc.b	$40
	dc.b	$20
	dc.b	0
	dc.b	-$20
	dc.b	-$20
	dc.b	0
	dc.b	$20
	dc.b	$40
	dc.b	$60
	dc.b	$7F
	dc.b	$60
	dc.b	$40
	dc.b	$20
	dc.b	0
	dc.b	-$20

; ------------------------------------------------------------------------------

PrizeSwitchObject_1_Routine2:
	tst.b	obj.var_38(a0)
	bne.s	loc_20F12C
	movea.w	obj.var_3a(a0),a1
	movea.w	obj.var_3c(a1),a2
	cmpa.w	a0,a2
	beq.s	loc_20F126
	moveq	#100,d0
	jsr	AddPoints
	jsr	SpawnObject
	bne.s	loc_20F126
	move.b	#$41,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_20F126:
	addq.b	#1,obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F12C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

RingPrizeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F140(pc,d0.w),d0
	jmp	off_20F140(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F140:
	dc.w	RingPrizeObject_0_Routine0-*
	dc.w	RingPrizeObject_0_Routine2-off_20F140
	dc.w	RingPrizeObject_0_Routine4-off_20F140
	dc.w	RingPrizeObject_0_Routine6-off_20F140
	dc.w	RingPrizeObject_0_Routine8-off_20F140

; ------------------------------------------------------------------------------

RingPrizeObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#8,obj.height(a0)
	move.b	#8,obj.width(a0)
	move.l	#RingSprites,obj.sprite_data(a0)
	move.w	#$A7AE,obj.sprite_tile(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$47,obj.collide_type(a0)
	move.b	#8,obj.width_2(a0)
	move.w	#$800,obj.var_38(a0)
	move.w	#$100,obj.y_speed(a0)
	move.b	#$FF,obj.var_3a(a0)
	move.b	#$30,obj.var_3b(a0)

RingPrizeObject_0_Routine2:
	jsr	MoveObject
	addi.w	#$18,obj.y_speed(a0)
	tst.b	obj.var_3b(a0)
	beq.s	loc_20F1B0
	subq.b	#1,obj.var_3b(a0)
	bne.s	loc_20F1CC

loc_20F1B0:
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20F1CC
	add.w	d1,obj.y(a0)
	move.w	obj.y_speed(a0),d0
	asr.w	#2,d0
	sub.w	d0,obj.y_speed(a0)
	neg.w	obj.y_speed(a0)

loc_20F1CC:
	move.w	obj.var_36(a0),d0
	add.w	obj.var_38(a0),d0
	move.w	d0,obj.var_36(a0)
	rol.w	#4,d0
	andi.b	#3,d0
	move.b	d0,obj.sprite_frame(a0)
	subq.w	#8,obj.var_38(a0)
	subq.b	#1,obj.var_3a(a0)
	beq.s	RingPrizeObject_0_Routine8
	move.w	(bottom_bound).w,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcs.s	RingPrizeObject_0_Routine8
	jmp	DrawObject

; ------------------------------------------------------------------------------

RingPrizeObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	move.b	#0,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	jsr	sub_208ACA

RingPrizeObject_0_Routine6:
	lea	(RingPrizeAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

RingPrizeObject_0_Routine8:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

RingPrizeAnims:
	include	"src/anims/r4/ring_prize.asm"
	even

Spr_20F236:
	dc.w	@Spr_20F236_0-*
	dc.w	@Spr_20F236_1-Spr_20F236
	dc.w	@Spr_20F236_2-Spr_20F236

@Spr_20F236_0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0
	dc.b	0

@Spr_20F236_1:
	dc.b	2
	dc.b	$FC, 4, 0, 4, $F0
	dc.b	$FC, 4, 8, 4, 0
	dc.b	0

@Spr_20F236_2:
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------

PointsPrizeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F26A(pc,d0.w),d0
	jsr	off_20F26A(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F26A:
	dc.w	PointsPrizeObject_0_Routine0-*
	dc.w	PointsPrizeObject_0_Routine2-off_20F26A

; ------------------------------------------------------------------------------

PointsPrizeObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#Spr_20F2B2,obj.sprite_data(a0)
	move.w	#$36E,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.w	#-$300,obj.y_speed(a0)

PointsPrizeObject_0_Routine2:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_20F2AC
	jsr	MoveObject
	addi.w	#$18,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F2AC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Spr_20F2B2:
	dc.w	@Spr_20F2B2_0-*

@Spr_20F2B2_0:
	dc.b	1
	dc.b	$FC, 4, 0, 0, $F8

; ------------------------------------------------------------------------------