; ------------------------------------------------------------------------------

SnakeBlocksObject:
	tst.b	obj.subtype(a0)
	bmi.w	SnakeBlocksChildUpdate
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SnakeBlocksControllerRoutineTable(pc,d0.w),d0
	jsr	SnakeBlocksControllerRoutineTable(pc,d0.w)
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Controller routine pointers for the two Snake Blocks states.
SnakeBlocksControllerRoutineTable:
	dc.w	SnakeBlocksObject_1_Routine0-*
	dc.w	SnakeBlocksObject_1_Routine2-SnakeBlocksControllerRoutineTable

; ------------------------------------------------------------------------------

SnakeBlocksObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$3A8,obj.sprite_tile(a0)
	move.l	#SnakeBlocksSprites,obj.sprite_data(a0)
	move.w	a0,obj.var_2a(a0)
	st	obj.var_34(a0)
	move.w	#0,obj.var_32(a0)

SnakeBlocksObject_1_Routine2:
	tst.b	obj.var_34(a0)
	beq.s	SnakeBlocksReturn
	sf	obj.var_34(a0)
	lea	SnakeBlocksMotionPatternSets(pc),a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.w	obj.var_32(a0),d0
	adda.w	(a1,d0.w),a1
	move.l	a1,obj.var_2c(a0)
	addq.w	#2,obj.var_32(a0)
	cmpi.w	#8,obj.var_32(a0)
	blt.s	SnakeBlocksAdvanceAnimationSequence
	clr.w	obj.var_32(a0)

SnakeBlocksAdvanceAnimationSequence:
	bsr.w	SnakeBlocksSpawnChild
	beq.s	SnakeBlocksReturn
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SnakeBlocksReturn:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksChildUpdate:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2A,obj.id(a1)
	bne.w	SnakeBlocksDelete
	move.b	obj.subtype_2(a0),d0
	cmp.b	obj.subtype_2(a1),d0
	bne.w	SnakeBlocksDelete
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	SnakeBlocksChildRoutineTable(pc,d0.w),d0
	jsr	SnakeBlocksChildRoutineTable(pc,d0.w)
	lea	player_object,a1
	jsr	SolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

; Child routine pointers for the moving block sequence.
SnakeBlocksChildRoutineTable:
	dc.w	SnakeBlocksObject_0_Routine0-*
	dc.w	SnakeBlocksObject_0_Routine2-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_Routine4-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_Routine6-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_Routine8-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_RoutineA-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_RoutineC-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_RoutineE-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_Routine10-SnakeBlocksChildRoutineTable
	dc.w	SnakeBlocksObject_0_Routine12-SnakeBlocksChildRoutineTable

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.w	#$3F,obj.var_30(a0)
	move.l	#0,obj.var_38(a0)
	move.l	#0,obj.var_3c(a0)
	movea.l	obj.var_2c(a0),a1
	move.b	-1(a1),d0
	bne.s	SnakeBlocksSetPositiveXMotion
	move.l	#-$8000,obj.var_3c(a0)

SnakeBlocksSetPositiveXMotion:
	subq.b	#1,d0
	bne.s	SnakeBlocksSetPositiveYMotion
	move.l	#$8000,obj.var_38(a0)

SnakeBlocksSetPositiveYMotion:
	subq.b	#1,d0
	bne.s	SnakeBlocksSetNegativeXMotion
	move.l	#$8000,obj.var_3c(a0)

SnakeBlocksSetNegativeXMotion:
	subq.b	#1,d0
	bne.s	SnakeBlocksConfigureSubtypeMotion
	move.l	#-$8000,obj.var_38(a0)

SnakeBlocksConfigureSubtypeMotion:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#2,obj.subtype(a1)
	bne.s	SnakeBlocksObject_0_Routine2
	moveq	#1,d0
	tst.w	obj.var_3c(a0)
	bpl.s	SnakeBlocksSetVerticalVelocity
	moveq	#-1,d0

SnakeBlocksSetVerticalVelocity:
	move.w	d0,obj.var_34(a0)
	move.w	d0,obj.y_speed(a0)

SnakeBlocksObject_0_Routine2:
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.y(a0)
	subq.w	#1,obj.var_30(a0)
	bpl.s	SnakeBlocksMotionReturn
	addq.b	#2,obj.routine(a0)

SnakeBlocksMotionReturn:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	clr.w	obj.y_speed(a0)
	move.w	#$1E,d0
	cmpi.b	#2,obj.subtype(a1)
	bne.s	SnakeBlocksPauseDuration
	move.w	#0,d0

SnakeBlocksPauseDuration:
	move.w	d0,obj.var_30(a0)

SnakeBlocksObject_0_Routine6:
	subq.w	#1,obj.var_30(a0)
	bpl.s	SnakeBlocksPauseReturn
	addq.b	#2,obj.routine(a0)
	bsr.w	SnakeBlocksSpawnChild
	beq.s	SnakeBlocksPauseReturn
	addq.b	#2,obj.routine(a0)
	movea.w	obj.var_2a(a0),a1
	st	obj.var_34(a1)

SnakeBlocksPauseReturn:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine8:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.w	#$3F,obj.var_30(a0)
	move.w	obj.var_34(a0),obj.y_speed(a0)
	neg.w	obj.y_speed(a0)

SnakeBlocksObject_0_RoutineC:
	move.l	obj.var_38(a0),d0
	sub.l	d0,obj.x(a0)
	move.l	obj.var_3c(a0),d0
	sub.l	d0,obj.y(a0)
	subq.w	#1,obj.var_30(a0)
	bpl.s	SnakeBlocksReverseMotionReturn
	addq.b	#2,obj.routine(a0)

SnakeBlocksReverseMotionReturn:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_RoutineE:
	addq.b	#2,obj.routine(a0)
	clr.w	obj.y_speed(a0)
	move.w	#$1E,d0
	cmpi.b	#2,obj.subtype(a1)
	bne.s	SnakeBlocksReversePauseDuration
	move.w	#0,d0

SnakeBlocksReversePauseDuration:
	move.w	d0,obj.var_30(a0)

SnakeBlocksObject_0_Routine10:
	subq.w	#1,obj.var_30(a0)
	bpl.s	SnakeBlocksReversePauseReturn
	movea.w	obj.var_36(a0),a1
	tst.b	obj.subtype(a1)
	bpl.s	SnakeBlocksAdvanceParent
	addq.b	#2,obj.routine(a1)

SnakeBlocksAdvanceParent:
	addq.b	#2,obj.routine(a0)

SnakeBlocksReversePauseReturn:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine12:
	lea	player_object,a1
	jsr	SolidObject
	beq.s	SnakeBlocksDeleteChild
	jsr	GetOffObject

SnakeBlocksDeleteChild:
	addq.l	#4,sp

SnakeBlocksDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SnakeBlocksSpawnChild:
	movea.l	obj.var_2c(a0),a6
	tst.b	(a6)+
	bmi.s	SnakeBlocksSpawnReturn
	jsr	SpawnObject
	bne.s	SnakeBlocksSpawnReturn
	movea.l	a0,a2
	movea.l	a1,a3
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.b	#$FF,obj.subtype(a1)
	move.w	a0,obj.var_36(a1)
	move.l	a6,obj.var_2c(a1)
	addq.b	#1,obj.sprite_layer(a1)
	clr.b	obj.routine(a1)

SnakeBlocksSpawnReturn:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksSprites:
	include	"sprites/r6/snake_blocks.asm"
	even

; Subtype-indexed motion pattern pointers.
SnakeBlocksMotionPatternSets:
	dc.w	SnakeBlocksMotionPatternSet0-*
	dc.w	SnakeBlocksMotionPatternSet1-SnakeBlocksMotionPatternSets
	dc.w	SnakeBlocksMotionPatternSet2-SnakeBlocksMotionPatternSets
	dc.w	SnakeBlocksSubtype2PauseDurations-SnakeBlocksMotionPatternSets
	dc.w	SnakeBlocksMotionPatternSet3-SnakeBlocksMotionPatternSets

SnakeBlocksMotionPatternSet0:
	dc.w	SnakeBlocksMotionPatternSet0Entry0-*
	dc.w	SnakeBlocksMotionPatternSet0Entry1-SnakeBlocksMotionPatternSet0
	dc.w	SnakeBlocksMotionPatternSet0Entry2-SnakeBlocksMotionPatternSet0
	dc.w	SnakeBlocksMotionPatternSet0Entry3-SnakeBlocksMotionPatternSet0

; Pause durations used by the subtype-two pattern.
SnakeBlocksSubtype2PauseDurations:
	dc.w	$14
	dc.w	$10
	dc.w	$C
	dc.w	8

SnakeBlocksMotionPatternSet0Entry0:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	$FF

SnakeBlocksMotionPatternSet0Entry1:
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	$FF

SnakeBlocksMotionPatternSet0Entry2:
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	$FF

SnakeBlocksMotionPatternSet0Entry3:
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	$FF

SnakeBlocksMotionPatternSet1:
	dc.w	SnakeBlocksMotionPatternSet1Entry0-*
	dc.w	SnakeBlocksMotionPatternSet1Entry1-SnakeBlocksMotionPatternSet1
	dc.w	SnakeBlocksMotionPatternSet1Entry2-SnakeBlocksMotionPatternSet1
	dc.w	SnakeBlocksMotionPatternSet1Entry3-SnakeBlocksMotionPatternSet1

SnakeBlocksMotionPatternSet1Entry0:
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	$FF

SnakeBlocksMotionPatternSet1Entry1:
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	$FF

SnakeBlocksMotionPatternSet1Entry2:
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	$FF

SnakeBlocksMotionPatternSet1Entry3:
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	$FF

SnakeBlocksMotionPatternSet2:
	dc.w	SnakeBlocksMotionPatternSet2Entry0-*
	dc.w	SnakeBlocksMotionPatternSet2Entry1-SnakeBlocksMotionPatternSet2
	dc.w	SnakeBlocksMotionPatternSet2Entry0-SnakeBlocksMotionPatternSet2
	dc.w	SnakeBlocksMotionPatternSet2Entry1-SnakeBlocksMotionPatternSet2

SnakeBlocksMotionPatternSet2Entry0:
	dc.b	0
	dc.b	0
	dc.b	$FF

SnakeBlocksMotionPatternSet2Entry1:
	dc.b	2
	dc.b	2
	dc.b	$FF

SnakeBlocksMotionPatternSet3:
	dc.w	SnakeBlocksMotionPatternSet3Entry0-*
	dc.w	SnakeBlocksMotionPatternSet3Entry1-SnakeBlocksMotionPatternSet3
	dc.w	SnakeBlocksMotionPatternSet3Entry2-SnakeBlocksMotionPatternSet3
	dc.w	SnakeBlocksMotionPatternSet3Entry3-SnakeBlocksMotionPatternSet3

SnakeBlocksMotionPatternSet3Entry0:
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	$FF

SnakeBlocksMotionPatternSet3Entry1:
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	$FF

SnakeBlocksMotionPatternSet3Entry2:
	dc.b	3
	dc.b	0
	dc.b	3
	dc.b	$FF

SnakeBlocksMotionPatternSet3Entry3:
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	$FF

; ------------------------------------------------------------------------------
