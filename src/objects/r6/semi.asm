; ------------------------------------------------------------------------------

SemiObject:
	tst.b	obj.subtype_2(a0)
	bmi.w	SemiBombObject
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SemiRoutineTable(pc,d0.w),d0
	jsr	SemiRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Semi parent routine pointers.
SemiRoutineTable:
	dc.w	SemiObject_1_Routine0-*
	dc.w	SemiObject_1_Routine2-SemiRoutineTable
	dc.w	SemiObject_1_Routine4-SemiRoutineTable
	dc.w	SemiObject_1_Routine6-SemiRoutineTable
	dc.w	SemiObject_1_Routine8-SemiRoutineTable
	dc.w	SemiObject_1_RoutineA-SemiRoutineTable
	dc.w	SemiObject_1_RoutineC-SemiRoutineTable

; ------------------------------------------------------------------------------

SemiObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$13,obj.width(a0)
	move.b	#$13,obj.width_2(a0)
	move.w	#$A4A8,obj.sprite_tile(a0)
	move.b	#$36,obj.collide_type(a0)
	move.b	obj.subtype_2(a0),obj.var_33(a0)
	lea	SemiSprites1(pc),a1
	tst.b	obj.subtype(a0)
	beq.s	SemiSelectSpriteSet
	lea	SemiSprites2(pc),a1

SemiSelectSpriteSet:
	move.l	a1,obj.sprite_data(a0)

SemiObject_1_Routine2:
	subq.w	#1,obj.var_32(a0)
	bpl.s	SemiWaitReturn
	addq.b	#2,obj.routine(a0)

SemiWaitReturn:
	rts

; ------------------------------------------------------------------------------

SemiObject_1_Routine4:
	lea	player_object,a1
	bsr.s	SemiCheckPlayerOffset
	bcc.s	SemiApproachReturn
	addq.b	#2,obj.routine(a0)

SemiApproachReturn:
	rts

; ------------------------------------------------------------------------------

; Check whether the player is inside the Semi's launch corridor.
SemiCheckPlayerOffset:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	SemiOffsetCheckReturn
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,obj.var_34(a0)
	subi.w	#-$78,d0
	subi.w	#$F0,d0

SemiOffsetCheckReturn:
	rts

; ------------------------------------------------------------------------------

SemiObject_1_Routine6:
	addq.b	#2,obj.routine(a0)
	move.l	#$10000,d0
	move.l	#-$8000,d1
	move.w	#$60,d2
	tst.b	obj.subtype(a0)
	beq.s	SemiSelectMotionProfile
	move.l	#$C000,d0
	move.l	#$6000,d1
	move.w	#$2A,d2

SemiSelectMotionProfile:
	tst.w	obj.var_34(a0)
	bmi.s	SemiStoreMotionProfile
	neg.l	d0

SemiStoreMotionProfile:
	move.l	d0,obj.var_2a(a0)
	move.l	d1,obj.var_2e(a0)
	move.w	d2,obj.var_32(a0)

SemiObject_1_Routine8:
	subq.w	#1,obj.var_32(a0)
	bpl.s	SemiLaunchMoveAndAnimate
	addq.b	#2,obj.routine(a0)

SemiLaunchMoveAndAnimate:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	lea	SemiAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SemiObject_1_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.w	#0,obj.var_32(a0)
	move.l	#$10000,d0
	tst.b	obj.subtype(a0)
	beq.s	SemiStoreReturnSpeed
	move.l	#$C000,d0

SemiStoreReturnSpeed:
	tst.w	obj.var_34(a0)
	bmi.s	SemiStoreHorizontalSpeed
	neg.l	d0

SemiStoreHorizontalSpeed:
	move.l	d0,obj.var_2a(a0)

SemiObject_1_RoutineC:
	tst.b	obj.subtype(a0)
	bne.s	SemiMoveAndAnimate
	andi.w	#$3F,obj.var_32(a0)
	bne.s	SemiSpawnChildReturn
	lea	player_object,a1
	bsr.w	SemiCheckPlayerOffset
	bcc.s	SemiSpawnChildReturn
	jsr	SpawnObject
	bne.s	SemiSpawnChildReturn
	move.b	obj.id(a0),obj.id(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.l	obj.y(a0),obj.y(a1)
	addi.w	#$A,obj.y(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)

SemiSpawnChildReturn:
	addq.w	#1,obj.var_32(a0)

SemiMoveAndAnimate:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	lea	SemiAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SemiAnims:
	include	"anims/r6/semi.asm"
	even

SemiSprites1:
	include	"sprites/r6/semi_1.asm"
	even

SemiSprites2:
	include	"sprites/r6/semi_2.asm"
	even

; ------------------------------------------------------------------------------

SemiBombObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SemiBombRoutineTable(pc,d0.w),d0
	jsr	SemiBombRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Semi bomb routine pointers.
SemiBombRoutineTable:
	dc.w	SemiObject_0_Routine0-*
	dc.w	SemiObject_0_Routine2-SemiBombRoutineTable
	dc.w	SemiObject_0_Routine4-SemiBombRoutineTable
	dc.w	SemiObject_0_Routine6-SemiBombRoutineTable
	dc.w	SemiObject_0_Routine8-SemiBombRoutineTable

; ------------------------------------------------------------------------------

SemiObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#$B7,obj.collide_type(a0)
	move.b	#6,obj.height(a0)
	move.b	#6,obj.width(a0)
	move.b	#6,obj.width_2(a0)
	move.w	#$84C8,obj.sprite_tile(a0)
	move.l	#SemiBombSprites,obj.sprite_data(a0)
	move.l	#$8000,obj.var_2e(a0)

SemiObject_0_Routine2:
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$4000,obj.var_2e(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	SemiBombLandingReturn
	addq.b	#2,obj.routine(a0)
	add.w	d1,obj.y(a0)
	move.w	#$78,obj.var_32(a0)

SemiBombLandingReturn:
	rts

; ------------------------------------------------------------------------------

SemiObject_0_Routine4:
	subq.w	#1,obj.var_32(a0)
	bpl.s	SemiBombWaitReturn
	addq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_32(a0)

SemiBombWaitReturn:
	rts

; ------------------------------------------------------------------------------

SemiObject_0_Routine6:
	subq.w	#1,obj.var_32(a0)
	bpl.s	SemiBombAnimationReturn
	addq.b	#2,obj.routine(a0)

SemiBombAnimationReturn:
	lea	SemiBombAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SemiObject_0_Routine8:
	move.b	#$18,obj.id(a0)
	move.b	#0,obj.routine(a0)
	move.b	#1,obj.routine_2(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	SemiBombSoundReturn
	move.w	#$9E,d0
	jsr	PlayFmSound

SemiBombSoundReturn:
	rts

; ------------------------------------------------------------------------------

SemiBombAnims:
	include	"anims/r6/semi_bomb.asm"
	even

SemiBombSprites:
	include	"sprites/r6/semi_bomb.asm"
	even

; ------------------------------------------------------------------------------
