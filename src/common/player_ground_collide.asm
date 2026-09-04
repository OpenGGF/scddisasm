; ------------------------------------------------------------------------------

PlayerGroundCollide:
	btst	#3,obj.flags(a0)
	beq.s	PlayerGroundCollideCheckAngle
	moveq	#0,d0
	move.b	d0,collide_angle_1
	move.b	d0,collide_angle_2
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideCheckAngle:
	moveq	#3,d0
	move.b	d0,collide_angle_1
	move.b	d0,collide_angle_2
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	bpl.s	PlayerGroundCollideRoundPositive
	move.b	obj.angle(a0),d0
	bpl.s	PlayerGroundCollideRoundNegativeDone
	subq.b	#1,d0

PlayerGroundCollideRoundNegativeDone:
	addi.b	#$20,d0
	bra.s	PlayerGroundCollideSelectSurface

; ------------------------------------------------------------------------------

PlayerGroundCollideRoundPositive:
	move.b	obj.angle(a0),d0
	bpl.s	PlayerGroundCollideRoundPositiveDone
	addq.b	#1,d0

PlayerGroundCollideRoundPositiveDone:
	addi.b	#$1F,d0

; Dispatch to the floor, right-wall, ceiling, or left-wall probe.
PlayerGroundCollideSelectSurface:
	andi.b	#$C0,d0
	cmpi.b	#$40,d0
	beq.w	PlayerGroundCollideLeftWall
	cmpi.b	#$80,d0
	beq.w	PlayerGroundCollideCeiling
	cmpi.b	#$C0,d0
	beq.w	PlayerGroundCollideRightWall
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_1,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	neg.w	d0
	add.w	d0,d3
	lea	collide_angle_2,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	PlayerGroundCollideFloorDone
	bpl.s	PlayerGroundCollideFloorCorrection
	cmpi.w	#-$E,d1
	blt.s	PlayerGroundCollideTooSteepReject
	add.w	d1,obj.y(a0)

PlayerGroundCollideFloorDone:
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideFloorCorrection:
	cmpi.w	#$E,d1
	bgt.s	PlayerGroundCollideFloorSteep

PlayerGroundCollideFloorApply:
	add.w	d1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideFloorSteep:
	tst.b	obj.var_38(a0)
	bne.s	PlayerGroundCollideFloorApply
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideTooSteepReject:
	rts
	move.l	obj.x(a0),d2
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d2
	move.l	d2,obj.x(a0)
	move.w	#$38,d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideWallReject:
	rts
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	subi.w	#$38,d0
	move.w	d0,obj.y_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

	rts
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d2
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d2,obj.x(a0)
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

CheckGroundAngle:
	move.b	collide_angle_2,d2
	cmp.w	d0,d1
	ble.s	CheckGroundAngleUseSecond
	move.b	collide_angle_1,d2
	move.w	d0,d1

CheckGroundAngleUseSecond:
	btst	#0,d2
	bne.s	CheckGroundAnglePreserveObjectAngle
	move.b	d2,obj.angle(a0)
	rts

; ------------------------------------------------------------------------------

CheckGroundAnglePreserveObjectAngle:
	move.b	obj.angle(a0),d2
	addi.b	#$20,d2
	andi.b	#$C0,d2
	move.b	d2,obj.angle(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideRightWall:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	neg.w	d0
	add.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_1,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_2,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	PlayerGroundCollideRightWallDone
	bpl.s	PlayerGroundCollideRightWallCorrection
	cmpi.w	#-$E,d1
	blt.w	PlayerGroundCollideWallReject
	add.w	d1,obj.x(a0)

PlayerGroundCollideRightWallDone:
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideRightWallCorrection:
	cmpi.w	#$E,d1
	bgt.s	PlayerGroundCollideRightWallSteep

PlayerGroundCollideRightWallApply:
	add.w	d1,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideRightWallSteep:
	tst.b	obj.var_38(a0)
	bne.s	PlayerGroundCollideRightWallApply
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideCeiling:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	eori.w	#$F,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_1,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	eori.w	#$F,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	lea	collide_angle_2,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	PlayerGroundCollideCeilingDone
	bpl.s	PlayerGroundCollideCeilingCorrection
	cmpi.w	#-$E,d1
	blt.w	PlayerGroundCollideTooSteepReject
	sub.w	d1,obj.y(a0)

PlayerGroundCollideCeilingDone:
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideCeilingCorrection:
	cmpi.w	#$E,d1
	bgt.s	PlayerGroundCollideCeilingSteep

PlayerGroundCollideCeilingApply:
	sub.w	d1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideCeilingSteep:
	tst.b	obj.var_38(a0)
	bne.s	PlayerGroundCollideCeilingApply
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideLeftWall:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d3
	eori.w	#$F,d3
	lea	collide_angle_1,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d3
	eori.w	#$F,d3
	lea	collide_angle_2,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	PlayerGroundCollideLeftWallDone
	bpl.s	PlayerGroundCollideLeftWallCorrection
	cmpi.w	#-$E,d1
	blt.w	PlayerGroundCollideWallReject
	sub.w	d1,obj.x(a0)

PlayerGroundCollideLeftWallDone:
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideLeftWallCorrection:
	cmpi.w	#$E,d1
	bgt.s	PlayerGroundCollideLeftWallSteep

PlayerGroundCollideLeftWallApply:
	sub.w	d1,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

PlayerGroundCollideLeftWallSteep:
	tst.b	obj.var_38(a0)
	bne.s	PlayerGroundCollideLeftWallApply
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------
