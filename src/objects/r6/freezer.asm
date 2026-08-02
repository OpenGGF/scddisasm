; ------------------------------------------------------------------------------

FreezerObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208974(pc,d0.w),d0
	jsr	off_208974(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_208974:
	dc.w	FreezerObject_0_Routine0-*
	dc.w	FreezerObject_0_Routine2-off_208974
	dc.w	FreezerObject_0_Routine4-off_208974
	dc.w	FreezerObject_0_Routine6-off_208974
	dc.w	FreezerObject_0_Routine8-off_208974
	dc.w	FreezerObject_0_RoutineA-off_208974
	dc.w	FreezerObject_0_RoutineC-off_208974

; ------------------------------------------------------------------------------

FreezerObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$310,obj.sprite_tile(a0)
	move.l	#Spr_208D94,obj.sprite_data(a0)
	move.b	#$78,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

FreezerObject_0_Routine2:
	tst.b	obj.var_2a(a0)
	beq.s	locret_2089EE
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_2089EE
	jsr	SpawnObject
	bne.s	locret_2089EE
	move.l	a0,obj.var_2a(a1)
	move.b	#5,obj.id(a1)
	move.b	#3,obj.sprite_layer(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$24,obj.y(a1)
	move.b	#4,obj.routine(a1)

locret_2089EE:
	rts

; ------------------------------------------------------------------------------

FreezerObject_0_Routine4:
	bsr.w	sub_208CA0
	lea	(Ani_208D18).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

FreezerObject_0_Routine6:
	movea.l	obj.var_2a(a0),a1
	move.b	#$78,$2A(a1)
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FreezerObject_0_Routine8:
	addi.w	#$38,obj.y_speed(a0)
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_208A4A
	move.w	#$92,d0
	jsr	SubCpuCommand
	move.b	#$F,obj.var_30(a0)
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)

loc_208A4A:
	movea.l	obj.var_2a(a0),a1
	move.l	obj.y(a0),$C(a1)
	rts

; ------------------------------------------------------------------------------

FreezerObject_0_RoutineA:
	movea.l	obj.var_2a(a0),a1
	tst.b	obj.var_30(a0)
	beq.s	loc_208AAE
	subq.b	#1,obj.var_30(a0)
	move.b	(p1_joy_tap).w,d0
	andi.b	#$70,d0
	beq.s	locret_208AE4
	bclr	#0,obj.var_2c(a1)
	bclr	#6,obj.var_2c(a1)
	move.w	#$F980,obj.y_speed(a1)
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)
	bset	#2,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)
	move.w	#$92,d0
	jsr	PlayFmSound
	bra.s	loc_208ACA

; ------------------------------------------------------------------------------

loc_208AAE:
	movea.l	a0,a3
	movea.l	a0,a2
	movea.l	obj.var_2a(a0),a0
	bclr	#0,obj.var_2c(a0)
	bclr	#6,obj.var_2c(a0)
	jsr	HurtPlayer
	movea.l	a3,a0

loc_208ACA:
	addq.b	#2,obj.routine(a0)
	move.b	#$A,obj.sprite_frame(a0)
	move.b	#$14,obj.var_30(a0)
	move.b	#2,obj.var_31(a0)
	bsr.w	sub_208B88

locret_208AE4:
	rts

; ------------------------------------------------------------------------------

FreezerObject_0_RoutineC:
	subq.b	#1,obj.var_30(a0)
	bne.s	loc_208B10
	cmpi.b	#$B,obj.sprite_frame(a0)
	beq.s	loc_208B0A
	moveq	#0,d0
	move.b	obj.var_31(a0),d0
	add.w	d0,d0
	move.w	off_208B22(pc,d0.w),d0
	lea	off_208B22(pc,d0.w),a3
	moveq	#3,d6
	bsr.w	loc_208B90

loc_208B0A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_208B10:
	move.w	obj.x_speed(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

off_208B22:
	dc.w	byte_208B28-*
	dc.w	byte_208B48-off_208B22
	dc.w	byte_208B68-off_208B22

byte_208B28:
	dc.b	0, 0, $A, $B, 0, 0, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, 0, 0
	dc.b	0, 0, $A, $B, 0, 0, 1, 0
	dc.b	0, 0, $A, $B, 0, $FF, 0, 0

byte_208B48:
	dc.b	0, 0, $A, $B, 0, $FF, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, $FF, 0
	dc.b	0, 0, $A, $B, 0, 0, 1, 0
	dc.b	0, 0, 1, $B, 0, $FF, 0, 0

byte_208B68:
	dc.b	0, 0, $A, $B, 0, $FF, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, $FF, 0
	dc.b	0, 0, $A, $B, 0, 1, 1, 0
	dc.b	0, 0, $A, $B, 0, $FF, 1, 0

; ------------------------------------------------------------------------------

sub_208B88:
	moveq	#5,d6
	lea	(byte_208C10).l,a3

loc_208B90:
	moveq	#0,d1

loc_208B92:
	jsr	SpawnObject
	bne.s	locret_208C0E
	move.b	#5,obj.id(a1)
	move.b	#$C,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	#$2E1,obj.sprite_tile(a1)
	move.l	#Spr_208D94,obj.sprite_data(a1)
	move.b	(a3,d1.w),d2
	ext.w	d2
	add.w	d2,obj.x(a1)
	move.b	1(a3,d1.w),d2
	ext.w	d2
	add.w	d2,obj.y(a1)
	move.b	2(a3,d1.w),obj.var_30(a1)
	move.b	3(a3,d1.w),obj.sprite_frame(a1)
	move.b	4(a3,d1.w),d2
	or.b	d2,obj.sprite_flags(a1)
	move.b	5(a3,d1.w),d2
	ext.w	d2
	move.w	d2,obj.x_speed(a1)
	move.b	6(a3,d1.w),d2
	ext.w	d2
	move.w	d2,obj.y_speed(a1)
	move.b	7(a3,d1.w),obj.var_31(a1)
	addq.w	#8,d1
	dbf	d6,loc_208B92

locret_208C0E:
	rts

; ------------------------------------------------------------------------------

byte_208C10:
	dc.b	$F0, $F4, $A, 9, 0, $FF, $FF, 0
	dc.b	$F0, $C, $A, 9, 2, $FF, 1, 0
	dc.b	$10, $F4, $A, 9, 1, 1, $FF, 0
	dc.b	$10, $C, $A, 9, 3, 1, 1, 0
	dc.b	0, $F0, $F, $A, 1, 0, $FF, 1
	dc.b	0, $10, $F, $A, 3, 0, 1, 1

; ------------------------------------------------------------------------------

loc_208C40:
	movea.l	a1,a2
	jsr	SpawnObject
	bne.s	locret_208C9E
	bset	#0,obj.var_2c(a2)
	bset	#6,obj.var_2c(a2)
	move.l	a2,obj.var_2a(a1)
	move.b	#5,obj.id(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a2),obj.x(a1)
	move.w	obj.y(a2),obj.y(a1)
	move.w	#$2E1,obj.sprite_tile(a1)
	move.l	#Spr_208D94,obj.sprite_data(a1)
	move.b	#$18,obj.width(a1)
	move.b	#$18,obj.width_2(a1)
	move.b	#$18,obj.height(a1)
	move.b	#8,obj.sprite_frame(a1)
	move.b	#8,obj.routine(a1)

locret_208C9E:
	rts

; ------------------------------------------------------------------------------

sub_208CA0:
	cmpi.b	#1,obj.anim_id(a0)
	bne.s	locret_208CB8
	lea	(player_object).w,a1
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.s	locret_208CB8
	bsr.s	sub_208CBA
	bne.s	loc_208C40

locret_208CB8:
	rts

; ------------------------------------------------------------------------------

sub_208CBA:
	tst.b	(invincible).l
	bne.s	loc_208D14
	tst.b	(warping).l
	bne.s	loc_208D14
	cmpi.b	#4,obj.routine(a1)
	bcc.s	loc_208D14
	tst.b	obj.var_2c(a1)
	bne.s	loc_208D14
	move.b	obj.width(a1),d1
	ext.w	d1
	addi.w	#$10,d1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	loc_208D14
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_208D14
	move.b	obj.height(a1),d1
	ext.w	d1
	addi.w	#$20,d1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	add.w	d1,d0
	bmi.s	loc_208D14
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_208D14
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_208D14:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

Ani_208D18:
	dc.w	@Ani_208D18_0-*
	dc.w	@Ani_208D18_1-Ani_208D18
	dc.w	@Ani_208D18_2-Ani_208D18

@Ani_208D18_0:
	dc.b	1
	dc.b	3, 7, 6, 7
	dc.b	$FD, 1
	dc.b	0

@Ani_208D18_1:
	dc.b	1
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 4, 7, 5, 7, 1, 7
	dc.b	2, 7, 7, 4, 7, 7, 5
	dc.b	$FD, 2

@Ani_208D18_2:
	dc.b	7
	dc.b	7, 7, 2, 7, 7, 7, 5, 7
	dc.b	7, 7, 7, 2, 7, 7, 7, 7
	dc.b	5
	dc.b	$FC
	dc.b	0

Spr_208D94:
	dc.w	@Spr_208D94_0-*
	dc.w	@Spr_208D94_1-Spr_208D94
	dc.w	@Spr_208D94_2-Spr_208D94
	dc.w	@Spr_208D94_3-Spr_208D94
	dc.w	@Spr_208D94_4-Spr_208D94
	dc.w	@Spr_208D94_5-Spr_208D94
	dc.w	@Spr_208D94_6-Spr_208D94
	dc.w	@Spr_208D94_7-Spr_208D94
	dc.w	@Spr_208D94_8-Spr_208D94
	dc.w	@Spr_208D94_9-Spr_208D94
	dc.w	@Spr_208D94_A-Spr_208D94
	dc.w	@Spr_208D94_B-Spr_208D94

@Spr_208D94_0:
	dc.b	2
	dc.b	$F8, $D, 0, 0, $E0
	dc.b	$F8, $D, 8, 0, 0
	dc.b	0

@Spr_208D94_1:
	dc.b	4
	dc.b	$E0, $D, 0, 8, $F0
	dc.b	$F0, $D, 0, 8, $F0
	dc.b	0, $E, 0, $10, $F0
	dc.b	$18, 4, 0, $1C, $F8
	dc.b	0

@Spr_208D94_2:
	dc.b	4
	dc.b	$D8, $D, 0, 8, $F0
	dc.b	$E8, $D, 0, 8, $F0
	dc.b	$F8, $E, 0, $10, $F0
	dc.b	$10, 4, 0, $1C, $F8
	dc.b	0

@Spr_208D94_3:
	dc.b	2
	dc.b	$E0, $E, 0, $10, $F0
	dc.b	$F8, 4, 0, $1C, $F8
	dc.b	0

@Spr_208D94_4:
	dc.b	4
	dc.b	$E0, $D, 8, 8, $F0
	dc.b	$F0, $D, 8, 8, $F0
	dc.b	0, $E, 8, $10, $F0
	dc.b	$18, 4, 8, $1C, $F8
	dc.b	0

@Spr_208D94_5:
	dc.b	4
	dc.b	$D8, $D, 8, 8, $F0
	dc.b	$E8, $D, 8, 8, $F0
	dc.b	$F8, $E, 8, $10, $F0
	dc.b	$10, 4, 8, $1C, $F8
	dc.b	0

@Spr_208D94_6:
	dc.b	2
	dc.b	$E0, $E, 8, $10, $F0
	dc.b	$F8, 4, 8, $1C, $F8
	dc.b	0

@Spr_208D94_7:
	dc.b	$FF
	dc.b	0

@Spr_208D94_8:
	dc.b	4
	dc.b	$E8, $F, 0, 0, $E8
	dc.b	$E8, 7, 0, $10, 8
	dc.b	8, $D, 0, $18, $E8
	dc.b	8, 5, 0, $20, 8
	dc.b	0

@Spr_208D94_9:
	dc.b	1
	dc.b	$F4, 6, 0, $24, $F8

@Spr_208D94_A:
	dc.b	1
	dc.b	$F8, 5, 0, $2A, $F8

@Spr_208D94_B:
	dc.b	1
	dc.b	$FC, 0, 0, $2E, $FC

; ------------------------------------------------------------------------------