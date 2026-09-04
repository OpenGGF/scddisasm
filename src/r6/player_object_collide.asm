; ------------------------------------------------------------------------------

PlayerObjectCollide:
	btst	#6,obj.var_2c(a0)
	beq.s	PlayerObjectCollideSetupBounds
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideSetupBounds:
	nop
	move.w	obj.x(a0),d2
	move.w	obj.y(a0),d3
	subq.w	#8,d2
	moveq	#0,d5
	move.b	obj.height(a0),d5
	subq.b	#3,d5
	sub.w	d5,d3
	cmpi.b	#$39,obj.sprite_frame(a0)
	bne.s	PlayerObjectCollideScanObjects
	addi.w	#$C,d3
	moveq	#$A,d5

PlayerObjectCollideScanObjects:
	move.w	#$10,d4
	add.w	d5,d5
	lea	object_spawn_pool,a1
	move.w	#$5F,d6

PlayerObjectCollideObjectLoop:
	tst.b	obj.sprite_flags(a1)
	bpl.s	PlayerObjectCollideNextObject
	move.b	obj.collide_type(a1),d0
	bne.s	PlayerObjectCollideCheckOverlap

PlayerObjectCollideNextObject:
	lea	obj.struct_len(a1),a1
	dbf	d6,PlayerObjectCollideObjectLoop
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideCheckOverlap:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	PlayerObjectCollideHitboxTable,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	PlayerObjectCollideCheckHorizontalRange
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	PlayerObjectCollideCheckVerticalRange
	bra.w	PlayerObjectCollideNextObject

; ------------------------------------------------------------------------------

PlayerObjectCollideCheckHorizontalRange:
	cmp.w	d4,d0
	bhi.w	PlayerObjectCollideNextObject

PlayerObjectCollideCheckVerticalRange:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	PlayerObjectCollideCheckVerticalRangeUpper
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	PlayerObjectCollideDispatch
	bra.w	PlayerObjectCollideNextObject

; ------------------------------------------------------------------------------

PlayerObjectCollideCheckVerticalRangeUpper:
	cmp.w	d5,d0
	bhi.w	PlayerObjectCollideNextObject

PlayerObjectCollideDispatch:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	PlayerObjectCollideEnemy
	cmpi.b	#$C0,d1
	beq.w	PlayerObjectCollideSpecial
	tst.b	d1
	bmi.w	PlayerObjectCollideHurtCheck
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	PlayerObjectCollideBounceType
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	PlayerObjectCollideIgnoreType
	addq.b	#2,obj.routine(a1)

PlayerObjectCollideIgnoreType:
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideBounceType:
	tst.w	obj.y_speed(a0)
	bpl.s	PlayerObjectCollideBounceTypeGround
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	PlayerObjectCollideBounceReturn
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	PlayerObjectCollideBounceReturn
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideBounceTypeGround:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	PlayerObjectCollideBounceReturn
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

PlayerObjectCollideBounceReturn:
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideEnemy:
	tst.b	warping
	bne.s	PlayerObjectCollideEnemyInvincible
	tst.b	invincible
	bne.s	PlayerObjectCollideEnemyInvincible
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	PlayerObjectCollideHurtCheck

PlayerObjectCollideEnemyInvincible:
	tst.b	obj.collide_status(a1)
	beq.s	PlayerObjectCollideDefeatEnemy
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	PlayerObjectCollideEnemyInvincibleReturn
	bset	#7,obj.flags(a1)

PlayerObjectCollideEnemyInvincibleReturn:
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideDefeatEnemy:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	score_chain,d0
	addq.w	#2,score_chain
	cmpi.w	#6,d0
	bcs.s	PlayerObjectCollideScoreIndex
	moveq	#6,d0

PlayerObjectCollideScoreIndex:
	move.w	d0,explode.points(a1)
	move.w	PlayerObjectCollideScoreTable(pc,d0.w),d0
	cmpi.w	#$20,score_chain
	bcs.s	PlayerObjectCollideAwardScore
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

PlayerObjectCollideAwardScore:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	PlayerObjectCollideBounceVerticalUp
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	PlayerObjectCollideBounceVerticalDown
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideBounceVerticalUp:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideBounceVerticalDown:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideScoreTable:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

PlayerObjectCollideHurtCheck:
	tst.b	warping
	bne.s	PlayerObjectCollideHurtReturn
	tst.b	invincible
	beq.s	CheckHurtPlayer

PlayerObjectCollideHurtReturn:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

CheckHurtPlayer:
	nop
	tst.w	obj.var_30(a0)
	bne.s	PlayerObjectCollideHurtReturn
	movea.l	a1,a2

HurtPlayer:
	clr.b	obj.var_2a(a0)
	andi.b	#$E7,obj.var_2c(a0)
	clr.w	explode.points(a0)
	tst.b	shield
	bne.s	PlayerObjectCollideHurtWithShield
	tst.w	rings
	beq.w	PlayerObjectCollideNoRings
	jsr	SpawnObject
	bne.s	PlayerObjectCollideHurtWithShield
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

PlayerObjectCollideHurtWithShield:
	bclr	#0,shield
	bne.s	PlayerObjectCollideHurtLaunch
	move.b	#0,combine_ring

PlayerObjectCollideHurtLaunch:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	PlayerObjectCollideHurtAdjustDirection
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

PlayerObjectCollideHurtAdjustDirection:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	PlayerObjectCollideHurtFinish
	neg.w	obj.x_speed(a0)

PlayerObjectCollideHurtFinish:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#$78,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideNoRings:
	tst.w	debug_cheat
	bne.w	PlayerObjectCollideHurtWithShield

KillPlayer:
	tst.w	debug_mode
	bne.s	KillPlayerReturn
	move.b	#0,invincible
	move.b	#6,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$700,obj.y_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	move.w	obj.y(a0),obj.var_38(a0)
	move.b	#$18,obj.anim_id(a0)
	bset	#7,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.w	#$93,d0
	jsr	PlayFmSound

KillPlayerReturn:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideSpecial:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$1F,d1
	beq.w	PlayerObjectCollideIncrementStatus
	cmpi.b	#$23,d1
	beq.w	PlayerObjectCollideIncrementStatus
	cmpi.b	#$38,d1
	beq.w	PlayerObjectCollideSpecialStatus
	cmpi.b	#$3A,d1
	beq.w	PlayerObjectCollideSpecialStatus
	cmpi.b	#$3B,d1
	beq.w	PlayerObjectCollideSpecialStatus
	tst.b	boss_started
	beq.w	PlayerObjectCollideSpecialReturn
	cmpi.b	#1,boss_started
	beq.s	PlayerObjectCollideBossTypeRange
	cmpi.b	#4,boss_started
	beq.s	PlayerObjectCollideBossType4
	cmpi.b	#5,boss_started
	beq.s	PlayerObjectCollideBossType5

PlayerObjectCollideBossTypeRange:
	cmpi.b	#$3C,d1
	blt.s	PlayerObjectCollideSpecialReturn
	cmpi.b	#$3F,d1
	bgt.s	PlayerObjectCollideSpecialReturn
	bsr.w	PlayerObjectCollideEnemy
	tst.b	obj.collide_type(a1)
	bne.s	PlayerObjectCollideClearSpecialType
	addq.b	#3,obj.collide_status(a1)

PlayerObjectCollideClearSpecialType:
	clr.b	obj.collide_type(a1)
	bra.w	PlayerObjectCollideIncrementStatus

; ------------------------------------------------------------------------------

PlayerObjectCollideBossType4:
	cmpi.b	#$3F,d1
	beq.s	PlayerObjectCollideSpecialBounce
	cmpi.b	#$3E,d1
	beq.s	PlayerObjectCollideSpecialHurt
	bra.s	PlayerObjectCollideSpecialReturn

; ------------------------------------------------------------------------------

PlayerObjectCollideBossType5:
	cmpi.b	#$3D,d1
	beq.s	PlayerObjectCollideSpecialHurt

PlayerObjectCollideSpecialReturn:
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideIncrementStatus:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideSpecialHurt:
	bsr.w	PlayerObjectCollideHurtCheck
	bra.s	PlayerObjectCollideIncrementStatus

; ------------------------------------------------------------------------------

PlayerObjectCollideSpecialBounce:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	PlayerObjectCollideSpecialBounceReturn
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$400,obj.y_speed(a0)
	move.w	#$FE00,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	8(a1),d0
	bcs.s	PlayerObjectCollideSpecialBounceReturn
	neg.w	obj.x_speed(a0)

PlayerObjectCollideSpecialBounceReturn:
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideSpecialStatus:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	PlayerObjectCollideSpecialStatusReturn
	addq.b	#1,obj.collide_status(a1)

PlayerObjectCollideSpecialStatusReturn:
	rts

; ------------------------------------------------------------------------------

PlayerObjectCollideHitboxTable:
	dc.b	$14, $14
	dc.b	$12, $C
	dc.b	$10, $10
	dc.b	4, $10
	dc.b	$C, $12
	dc.b	$10, $10
	dc.b	6, 6
	dc.b	$18, $C
	dc.b	$C, $10
	dc.b	$10, $C
	dc.b	8, 8
	dc.b	$14, $10
	dc.b	$14, 8
	dc.b	$E, $E
	dc.b	$18, $18
	dc.b	$28, $10
	dc.b	$10, $18
	dc.b	8, $10
	dc.b	$20, $70
	dc.b	$40, $20
	dc.b	$80, $20
	dc.b	$20, $20
	dc.b	8, 8
	dc.b	4, 4
	dc.b	$20, 8
	dc.b	$C, $C
	dc.b	8, 4
	dc.b	$18, 4
	dc.b	$28, 4
	dc.b	4, 8
	dc.b	4, $18
	dc.b	4, $28
	dc.b	4, $20
	dc.b	$18, $18
	dc.b	$C, $18
	dc.b	$48, 8
	dc.b	8, $C
	dc.b	$10, 8
	dc.b	$20, $10
	dc.b	$20, $10
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	8, $13
	dc.b	8, $1C
	dc.b	$18, $C
	dc.b	$10, $10
	dc.b	4, 4
	dc.b	8, $10
	dc.b	$10, 5
	dc.b	$C, $C
	dc.b	8, 8
	dc.b	$1A, $1E
	dc.b	8, 8
	dc.b	$28, $24
	dc.b	$12, $11
	dc.b	$1E, $30
	dc.b	$3C, $20
	dc.b	$10, 8
	dc.b	2, $C

; ------------------------------------------------------------------------------
