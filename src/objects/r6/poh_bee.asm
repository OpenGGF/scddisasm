; ------------------------------------------------------------------------------

PohBeeObject:
	tst.b	obj.subtype(a0)
	bmi.w	PohBeeMissileObject
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	PohBeeRoutineTable(pc,d0.w),d0
	jsr	PohBeeRoutineTable(pc,d0.w)
	lea	PohBeeAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Poh-Bee parent routine pointers.
PohBeeRoutineTable:
	dc.w	PohBeeObject_1_Routine0-*
	dc.w	PohBeeObject_1_Routine2-PohBeeRoutineTable
	dc.w	PohBeeObject_1_Routine4-PohBeeRoutineTable
	dc.w	PohBeeObject_1_Routine6-PohBeeRoutineTable
	dc.w	PohBeeObject_1_Routine8-PohBeeRoutineTable
	dc.w	PohBeeObject_1_RoutineA-PohBeeRoutineTable
	dc.w	PohBeeObject_1_RoutineC-PohBeeRoutineTable
	dc.w	PohBeeObject_1_RoutineE-PohBeeRoutineTable
	dc.w	PohBeeObject_1_Routine10-PohBeeRoutineTable
	dc.w	PohBeeObject_1_Routine12-PohBeeRoutineTable

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$A457,obj.sprite_tile(a0)
	move.b	#$31,obj.collide_type(a0)
	move.w	#$FFF8,obj.var_30(a0)
	lea	PohBeeSprites1(pc),a1
	move.l	#-$10000,d0
	tst.b	obj.subtype(a0)
	beq.s	PohBeeSelectSpriteSet
	lea	PohBeeSprites2(pc),a1
	move.l	#-$8000,d0

PohBeeSelectSpriteSet:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_2c(a0)

PohBeeObject_1_Routine2:
	addq.b	#2,obj.routine(a0)
	move.w	#$200,d0
	tst.b	obj.subtype(a0)
	beq.s	PohBeeSetInitialDelay
	move.w	#$400,d0

PohBeeSetInitialDelay:
	move.w	d0,obj.var_2a(a0)

PohBeeObject_1_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	tst.b	obj.subtype(a0)
	bne.s	PohBeeAdvanceFlightTimer
	tst.w	obj.var_32(a0)
	beq.s	PohBeeCheckPlayerProximity
	subq.w	#1,obj.var_32(a0)
	bra.s	PohBeeAdvanceFlightTimer

; ------------------------------------------------------------------------------

PohBeeCheckPlayerProximity:
	lea	player_object,a1
	bsr.s	PohBeeCheckTurnaround
	beq.s	PohBeeAdvanceFlightTimer
	move.b	#$C,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

PohBeeAdvanceFlightTimer:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohBeeFlightReturn
	move.b	#6,obj.routine(a0)

PohBeeFlightReturn:
	rts

; ------------------------------------------------------------------------------

; Check the player corridor and reverse the parent flight direction if needed.
PohBeeCheckTurnaround:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	PohBeeNoTurnaround
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	spl	d1
	subi.w	#-$78,d0
	subi.w	#$F0,d0
	bcc.s	PohBeeNoTurnaround
	btst	#0,obj.sprite_flags(a0)
	sne	d2
	eor.b	d1,d2
	beq.s	PohBeeTurnaroundReturn
	neg.l	obj.var_2c(a0)
	neg.w	obj.var_30(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

PohBeeTurnaroundReturn:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

PohBeeNoTurnaround:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine6:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)

PohBeeObject_1_Routine8:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohBeePatrolReturn
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	neg.l	obj.var_2c(a0)
	neg.w	obj.var_30(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

PohBeePatrolReturn:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_RoutineA:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohBeeDiveReturn
	move.b	#2,obj.routine(a0)

PohBeeDiveReturn:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_RoutineC:
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)

PohBeeObject_1_RoutineE:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohBeeRecoverReturn
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	move.b	#1,obj.anim_id(a0)
	move.b	#$32,obj.collide_type(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	obj.var_30(a0),d0
	add.w	d0,obj.x(a0)
	addq.w	#4,obj.y(a0)

PohBeeRecoverReturn:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine10:
	subq.w	#1,obj.var_2a(a0)
	bpl.w	PohBeeFireReturn
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	jsr	SpawnObject
	bne.w	PohBeeFireReturn
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	#PohMissileSprite,obj.sprite_data(a1)
	move.b	#1,obj.sprite_layer(a1)
	move.b	#$10,obj.height(a1)
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$B3,obj.collide_type(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$17,obj.y(a1)
	move.l	#$20000,obj.var_30(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	#7,d0
	move.l	#$20000,d1
	btst	#0,obj.sprite_flags(a0)
	bne.s	PohBeeStoreMissileVelocity
	neg.w	d0
	neg.l	d1

PohBeeStoreMissileVelocity:
	add.w	d0,obj.x(a1)
	move.l	d1,obj.var_2c(a1)
	tst.b	obj.sprite_flags(a0)
	bpl.s	PohBeeFireReturn
	move.w	#$A0,d0
	jsr	PlayFmSound

PohBeeFireReturn:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_1_Routine12:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohBeeReturnToPatrol
	move.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_32(a0)
	move.b	#0,obj.anim_id(a0)
	move.b	#$31,obj.collide_type(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.w	obj.var_30(a0),d0
	sub.w	d0,obj.x(a0)
	subq.w	#4,obj.y(a0)

PohBeeReturnToPatrol:
	rts

; ------------------------------------------------------------------------------

PohBeeAnims:
	include	"anims/r6/poh_bee.asm"
	even

PohBeeSprites1:
	include	"sprites/r6/poh_bee_1.asm"
	even

PohBeeSprites2:
	include	"sprites/r6/poh_bee_2.asm"
	even

; ------------------------------------------------------------------------------

PohBeeMissileObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	PohMissileRoutineTable(pc,d0.w),d0
	jsr	PohMissileRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Poh-Bee missile routine pointers.
PohMissileRoutineTable:
	dc.w	PohBeeObject_0_Routine0-*
	dc.w	PohBeeObject_0_Routine2-PohMissileRoutineTable
	dc.w	PohBeeObject_0_Routine4-PohMissileRoutineTable
	dc.w	PohBeeObject_0_Routine6-PohMissileRoutineTable

; ------------------------------------------------------------------------------

PohBeeObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.w	#3,obj.var_2a(a0)

PohBeeObject_0_Routine2:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohMissileWaitReturn
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.w	#$A,obj.var_2a(a0)

PohMissileWaitReturn:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_0_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	subq.w	#1,obj.var_2a(a0)
	bpl.s	PohMissileMoveReturn
	addq.b	#2,obj.routine(a0)

PohMissileMoveReturn:
	rts

; ------------------------------------------------------------------------------

PohBeeObject_0_Routine6:
	tst.b	obj.sprite_flags(a0)
	bmi.s	PohMissileAnimate
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PohMissileAnimate:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	lea	PohMissileAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

PohMissileAnims:
	include	"anims/r6/poh_missile.asm"
	even

PohMissileSprite:
	include	"sprites/r6/poh_missile.asm"
	even

; ------------------------------------------------------------------------------
