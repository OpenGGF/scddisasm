; ------------------------------------------------------------------------------

BumperObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d1
	jmp	.Routines(pc,d1.w)

; ------------------------------------------------------------------------------

.Routines:
	dc.w	BumperObject_0_Routine0-.Routines
	dc.w	BumperObject_0_Routine2-.Routines

; ------------------------------------------------------------------------------

BumperObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#Spr_20B466,obj.sprite_data(a0)
	move.w	#$4CE,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$D7,obj.collide_type(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.w	#5,obj.var_34(a0)

.CheckRange1:
	moveq	#0,d0
	move.b	obj.subtype(a0),d6
	btst	#1,d6
	beq.s	.CheckRange0
	addi.w	#$40,d0

.CheckRange0:
	btst	#0,d6
	beq.s	.CheckDirection
	addi.w	#$20,d0

.CheckDirection:
	move.w	d0,obj.var_30(a0)
	lsr.w	#1,d0
	move.w	d0,obj.var_2e(a0)
	beq.s	BumperObject_0_Routine2
	move.l	#$10000,obj.var_2a(a0)
	btst	#6,d6
	bne.s	BumperObject_0_Routine2
	neg.l	obj.var_2a(a0)

BumperObject_0_Routine2:
	move.l	obj.var_2a(a0),d0
	beq.s	.CheckCollide
	lea	obj.x(a0),a1
	tst.w	obj.subtype(a0)
	bmi.s	.Move
	lea	obj.y(a0),a1

.Move:
	add.l	d0,(a1)
	addi.w	#-1,obj.var_2e(a0)
	bne.s	.CheckCollide
	move.w	obj.var_30(a0),obj.var_2e(a0)
	neg.l	obj.var_2a(a0)

.CheckCollide:
	tst.b	obj.collide_status(a0)
	beq.w	.Animate
	tst.w	obj.var_34(a0)
	beq.s	.PlaySound
	subq.w	#1,obj.var_34(a0)
	moveq	#$A,d0
	bsr.w	AddPoints
	moveq	#0,d1
	bsr.w	SpawnPoints

.PlaySound:
	tst.b	obj.sprite_flags(a0)
	bpl.s	.NoSound
	move.w	#$7F,d0
	jsr	SubCpuCommand

.NoSound:
	lea	(player_object).w,a1
	clr.b	obj.collide_status(a0)
	move.w	obj.x(a0),d1
	move.w	obj.y(a0),d2
	sub.w	obj.x(a1),d1
	sub.w	obj.y(a1),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#$F900,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a1)
	muls.w	#$F900,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	clr.b	obj.var_3c(a1)
	move.b	#1,obj.anim_id(a0)
	lea	(object_states).l,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	.Animate
	cmpi.b	#$8A,2(a2,d0.w)
	bcc.s	.Animate
	addq.b	#1,2(a2,d0.w)

.Animate:
	lea	(Ani_20B456).l,a1
	bsr.w	AnimateObject
	jsr	DrawObject
	move.w	obj.var_32(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

FlipperObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	.Routines(pc,d0.w),d0
	jmp	.Routines(pc,d0.w)

; ------------------------------------------------------------------------------

.Routines:
	dc.w	FlipperObject_0_Routine0-.Routines
	dc.w	FlipperObject_0_Routine2-.Routines

; ------------------------------------------------------------------------------

FlipperObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#Spr_20B4A6,obj.sprite_data(a0)
	move.w	#$49D,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

FlipperObject_0_Routine2:
	tst.b	obj.anim_id(a0)
	bne.s	.Animate
	lea	(player_object).w,a1
	bsr.w	FlipperCheckPlayer

.Animate:
	lea	(Ani_20B498).l,a1
	bsr.w	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

FlipperCheckPlayer:
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.w	.NoCollide
	move.w	obj.x(a1),d0
	moveq	#0,d1
	move.b	obj.width_2(a0),d1
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.w	.NoCollide
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.w	.NoCollide
	move.w	obj.x(a1),d0
	moveq	#0,d3
	move.b	obj.width_2(a0),d3
	move.w	obj.x(a0),d2
	sub.w	d3,d2
	sub.w	d2,d0
	btst	#0,obj.flags(a0)
	beq.s	.GetSlopeData
	move.w	#$40,d2
	sub.w	d0,d2
	move.w	d2,d0

.GetSlopeData:
	lea	(FlipperTopSlope).l,a3
	tst.w	obj.y_speed(a1)
	bpl.s	.GetColumn
	lea	(FlipperBottomSlope).l,a3

.GetColumn:
	move.b	(a3,d0.w),d0
	ext.w	d0
	add.w	obj.y(a0),d0
	move.w	d0,d1
	moveq	#0,d3
	move.b	obj.height(a1),d3
	tst.w	obj.y_speed(a1)
	bpl.s	.CheckCollide
	neg.w	d3

.CheckCollide:
	sub.w	d3,d1
	add.w	obj.y(a1),d3
	sub.w	d0,d3
	addq.w	#8,d3
	bmi.s	.NoCollide
	cmpi.w	#$10,d3
	bcc.s	.NoCollide
	move.w	d1,obj.y(a1)
	tst.w	obj.y_speed(a1)
	bmi.s	.HitBottom
	jsr	StandOnObject
	bra.s	.Collide

; ------------------------------------------------------------------------------

.HitBottom:
	move.w	#0,obj.y_speed(a1)
	move.w	obj.x_speed(a1),obj.ground_speed(a1)

.Collide:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

.NoCollide:
	jsr	GetOffObject
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

FlipperTopSlope:
	dc.b	$E, $D, $C, $B, $B, $A, $A, 9, 9, 8, 8, 7, 7, 6, 6, 5
	dc.b	5, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, $FF, $FF, $FE, $FE, $FD
	dc.b	$FD, $FC, $FC, $FB, $FB, $FA, $FA, $F9, $F9, $F8, $F8, $F7, $F7, $F6, $F6, $F5
	dc.b	$F5, $F5, $F4, $F4, $F4, $F4, $F4, $F4, $F5, $F5, $F6, $F6, $F7, $F8, $FA, $FC

FlipperBottomSlope:
	dc.b	$12, $13, $14, $14, $14, $14, $14, $14, $14, $13, $13, $13, $13, $13, $13, $13
	dc.b	$12, $12, $12, $12, $12, $12, $11, $11, $11, $11, $11, $11, $10, $10, $10, $10
	dc.b	$10, $10, $10, $F, $F, $F, $F, $F, $E, $E, $E, $E, $E, $E, $D, $D
	dc.b	$D, $D, $D, $D, $C, $C, $C, $C, $B, $B, $A, $A, 9, 8, 6, 4

Ani_20B456:
	dc.w	@Ani_20B456_0-*
	dc.w	@Ani_20B456_1-Ani_20B456
@Ani_20B456_0:
	dc.b	$F
	dc.b	0
	dc.b	$FF
	dc.b	0
@Ani_20B456_1:
	dc.b	4
	dc.b	1, 2, 1, 2
	dc.b	$FD, 0
	dc.b	0

Spr_20B466:
	dc.w	@Spr_20B466_0-*
	dc.w	@Spr_20B466_1-Spr_20B466
	dc.w	@Spr_20B466_2-Spr_20B466
@Spr_20B466_0:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0
@Spr_20B466_1:
	dc.b	1
	dc.b	$F4, $A, 0, $10, $F4
@Spr_20B466_2:
	dc.b	6
	dc.b	$EC, 4, 0, $19, $F0
	dc.b	$F4, $A, 0, $1B, $E8
	dc.b	$C, 4, $10, $19, $F0
	dc.b	$EC, 4, 8, $19, 0
	dc.b	$F4, $A, 8, $1B, 0
	dc.b	$C, 4, $18, $19, 0
	dc.b	0

Ani_20B498:
	dc.w	@Ani_20B498_0-*
	dc.w	@Ani_20B498_1-Ani_20B498
@Ani_20B498_0:
	dc.b	$F
	dc.b	0
	dc.b	$FF
	dc.b	0
@Ani_20B498_1:
	dc.b	1
	dc.b	1, 2, 1
	dc.b	$FD, 0

Spr_20B4A6:
	dc.w	@Spr_20B4A6_0-*
	dc.w	@Spr_20B4A6_1-Spr_20B4A6
	dc.w	@Spr_20B4A6_2-Spr_20B4A6
@Spr_20B4A6_0:
	dc.b	4
	dc.b	4, $D, 0, 0, $E0
	dc.b	$FC, 4, 0, 8, $F0
	dc.b	$F4, $E, 0, $A, 0
	dc.b	$C, 8, 0, $16, 0
	dc.b	0
@Spr_20B4A6_1:
	dc.b	2
	dc.b	$F4, $E, 0, $19, $E0
	dc.b	$F4, $E, 0, $25, 0
	dc.b	0
@Spr_20B4A6_2:
	dc.b	4
	dc.b	$EC, $D, $10, 0, $E0
	dc.b	$FC, 4, $10, 8, $F0
	dc.b	$F4, $E, $10, $A, 0
	dc.b	$EC, 8, $10, $16, 0
	dc.b	0

; ------------------------------------------------------------------------------