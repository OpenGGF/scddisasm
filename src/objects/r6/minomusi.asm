; ------------------------------------------------------------------------------

MinomusiObject:
	tst.b	obj.subtype_2(a0)
	beq.s	MinomusiMainObject
	bmi.w	MinomusiDropChildObject
	bra.w	MinomusiChildObject

; ------------------------------------------------------------------------------

MinomusiMainObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	MinomusiRoutineTable(pc,d0.w),d0
	jsr	MinomusiRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Minomusi parent routine pointers.
MinomusiRoutineTable:
	dc.w	MinomusiObject_0_Routine0-*
	dc.w	MinomusiObject_0_Routine2-MinomusiRoutineTable
	dc.w	MinomusiObject_0_Routine4-MinomusiRoutineTable
	dc.w	MinomusiObject_0_Routine6-MinomusiRoutineTable
	dc.w	MinomusiObject_0_Routine8-MinomusiRoutineTable
	dc.w	MinomusiObject_0_RoutineA-MinomusiRoutineTable
	dc.w	MinomusiObject_0_RoutineC-MinomusiRoutineTable
	dc.w	MinomusiObject_0_RoutineE-MinomusiRoutineTable
	dc.w	MinomusiObject_0_Routine10-MinomusiRoutineTable

; ------------------------------------------------------------------------------

MinomusiObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$2488,obj.sprite_tile(a0)
	move.b	#$34,obj.collide_type(a0)
	addq.w	#8,obj.y(a0)
	move.w	obj.y(a0),obj.var_34(a0)
	move.w	obj.y(a0),obj.var_36(a0)
	addi.w	#$5F,obj.var_36(a0)
	lea	MinomusiSprites1(pc),a1
	tst.b	obj.subtype(a0)
	beq.s	MinomusiSelectSpriteSet
	lea	MinomusiSprites2(pc),a1

MinomusiSelectSpriteSet:
	move.l	a1,obj.sprite_data(a0)
	jsr	SpawnObjectAfter
	beq.s	MinomusiSpawnChildSetup
	jmp	DeleteObject

; ------------------------------------------------------------------------------

MinomusiSpawnChildSetup:
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.b	#$20,obj.height(a1)
	move.b	#1,obj.width(a1)
	move.b	#1,obj.width_2(a1)
	move.w	a0,obj.var_38(a1)

MinomusiObject_0_Routine2:
	addq.b	#2,obj.routine(a0)
	move.b	#9,obj.sprite_frame(a0)
	move.w	#$79,obj.var_2a(a0)

MinomusiObject_0_Routine4:
	subq.w	#1,obj.var_2a(a0)
	bne.s	MinomusiWaitReturn
	move.w	#$79,obj.var_2a(a0)
	move.b	#2,d6
	lea	player_object,a1
	bsr.w	MinomusiCheckPlayerOffset
	bcs.s	MinomusiSelectRiseDirection
	neg.b	d6

MinomusiSelectRiseDirection:
	add.b	d6,obj.routine(a0)

MinomusiWaitReturn:
	rts

; ------------------------------------------------------------------------------

; Check whether the player is inside Minomusi's launch corridor.
MinomusiCheckPlayerOffset:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#$28,d0
	subi.w	#$78,d0
	bcc.s	MinomusiOffsetCheckReturn
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$A8,d0
	subi.w	#$150,d0

MinomusiOffsetCheckReturn:
	rts

; ------------------------------------------------------------------------------

MinomusiObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.l	#$80000,obj.var_30(a0)

MinomusiObject_0_Routine8:
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_36(a0),d0
	sub.w	obj.y(a0),d0
	bgt.s	MinomusiRiseReturn
	add.w	d0,obj.y(a0)
	move.b	#$E,obj.routine(a0)

MinomusiRiseReturn:
	rts

; ------------------------------------------------------------------------------

MinomusiObject_0_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.l	#$70000,d0
	tst.b	obj.subtype(a0)
	beq.s	MinomusiSelectRiseVelocity
	move.l	#$20000,d0

MinomusiSelectRiseVelocity:
	move.l	d0,obj.var_30(a0)

MinomusiObject_0_RoutineC:
	move.l	obj.var_30(a0),d0
	sub.l	d0,obj.y(a0)
	move.w	obj.var_34(a0),d0
	sub.w	obj.y(a0),d0
	blt.s	MinomusiFallReturn
	add.w	d0,obj.y(a0)
	move.b	#2,obj.routine(a0)

MinomusiFallReturn:
	rts

; ------------------------------------------------------------------------------

MinomusiObject_0_RoutineE:
	addq.b	#2,obj.routine(a0)
	move.w	#$E6,d0
	move.w	#$FF,d1
	tst.b	obj.subtype(a0)
	beq.s	MinomusiSelectAnimationProfile
	move.w	#$3D,d0
	move.w	#$1FF,d1

MinomusiSelectAnimationProfile:
	move.w	d0,obj.var_2a(a0)
	move.w	d1,obj.anim_id(a0)

MinomusiObject_0_Routine10:
	subq.w	#1,obj.var_2a(a0)
	bne.s	MinomusiAnimate
	move.b	#$A,obj.routine(a0)

MinomusiAnimate:
	lea	MinomusiAnims(pc),a1
	jsr	AnimateObject
	tst.b	obj.subtype(a0)
	bne.w	MinomusiAnimationReturn
	cmpi.b	#$1E,obj.anim_index(a0)
	bne.w	MinomusiAnimationReturn
	jsr	SpawnObjectAfter
	bne.w	MinomusiAnimationReturn
	move.b	obj.id(a0),obj.id(a1)
	move.b	#1,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addq.w	#4,obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.b	obj.height(a0),obj.height(a1)
	move.b	obj.width(a0),obj.width(a1)
	move.b	obj.width_2(a0),obj.width_2(a1)
	move.w	a0,obj.var_38(a1)
	move.b	#$B5,obj.collide_type(a1)
	tst.b	obj.sprite_flags(a0)
	bpl.s	MinomusiAnimationReturn
	move.w	#$B7,d0
	jsr	PlayFmSound

MinomusiAnimationReturn:
	rts

; ------------------------------------------------------------------------------

MinomusiChildObject:
	movea.w	obj.var_38(a0),a1
	cmpi.b	#$33,obj.id(a1)
	bne.s	MinomusiDeleteChild
	cmpi.b	#1,obj.anim_index(a1)
	beq.s	MinomusiDeleteChild
	jmp	DrawObject

; ------------------------------------------------------------------------------

MinomusiDeleteChild:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

MinomusiDropChildObject:
	movea.w	obj.var_38(a0),a1
	cmpi.b	#$33,obj.id(a1)
	beq.s	MinomusiUpdateDropChild
	jmp	DeleteObject

; ------------------------------------------------------------------------------

MinomusiUpdateDropChild:
	move.w	obj.y(a1),d0
	sub.w	obj.var_34(a1),d0
	subi.w	#$18,d0
	asr.w	#3,d0
	bpl.s	MinomusiClampDropFrame
	moveq	#0,d0

MinomusiClampDropFrame:
	move.b	d0,obj.sprite_frame(a0)
	asl.w	#2,d0
	add.w	obj.var_34(a1),d0
	addi.w	#$10,d0
	move.w	d0,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

MinomusiAnims:
	include	"anims/r6/minomusi.asm"
	even

MinomusiSprites:
	include	"sprites/r6/minomusi.asm"
	even
MinomusiSprites1	equ .Sprites1
MinomusiSprites2	equ .Sprites2

; ------------------------------------------------------------------------------
