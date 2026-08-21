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
	move.l	#BumperSprites,obj.sprite_data(a0)
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
	lea	player_object,a1
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
	lea	object_states,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	.Animate
	cmpi.b	#$8A,2(a2,d0.w)
	bcc.s	.Animate
	addq.b	#1,2(a2,d0.w)

.Animate:
	lea	BumperAnims,a1
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
	move.l	#FlipperSprites,obj.sprite_data(a0)
	move.w	#$49D,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

FlipperObject_0_Routine2:
	tst.b	obj.anim_id(a0)
	bne.s	.Animate
	lea	player_object,a1
	bsr.w	FlipperCheckPlayer

.Animate:
	lea	FlipperAnims,a1
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
	lea	FlipperTopSlope,a3
	tst.w	obj.y_speed(a1)
	bpl.s	.GetColumn
	lea	FlipperBottomSlope,a3

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

BumperAnims:
	include	"anims/r3/bumper.asm"
	even

BumperSprites:
	include	"sprites/r3/bumper.asm"
	even

FlipperAnims:
	include	"anims/r3/flipper.asm"
	even

FlipperSprites:
	include	"sprites/r3/flipper.asm"
	even

; ------------------------------------------------------------------------------
