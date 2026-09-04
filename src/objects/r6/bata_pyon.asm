; ------------------------------------------------------------------------------

BataPyonObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	BataPyonRoutineTable(pc,d0.w),d0
	jsr	BataPyonRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Bata-pyon object routine pointers.
BataPyonRoutineTable:
	dc.w	BataPyonObject_0_Routine0-*
	dc.w	BataPyonObject_0_Routine2-BataPyonRoutineTable
	dc.w	BataPyonObject_0_Routine4-BataPyonRoutineTable
	dc.w	BataPyonObject_0_Routine6-BataPyonRoutineTable

; ------------------------------------------------------------------------------

BataPyonObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$2438,obj.sprite_tile(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.l	#$70000,obj.var_2e(a0)
	move.l	#CheckBlockLeft,obj.var_36(a0)
	move.w	#$FFF0,obj.var_34(a0)
	move.b	#1,obj.sprite_frame(a0)
	bsr.w	BataPyonUpdateCollisionProfile
	movea.l	#BataPyonSprites1,a1
	move.l	#-$A000,d0
	move.b	#7,d1
	tst.b	obj.subtype(a0)
	beq.s	BataPyonSelectSpriteSet
	movea.l	#BataPyonSprites2,a1
	move.l	#-$8000,d0
	move.b	#3,d1

BataPyonSelectSpriteSet:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_2a(a0)
	move.l	#$70000,obj.var_2e(a0)
	move.b	d1,obj.var_33(a0)
	move.b	d1,obj.var_32(a0)
	addq.b	#1,obj.var_32(a0)

BataPyonObject_0_Routine2:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	jsr	CheckBlockDown
	move.w	d1,obj.var_3e(a0)
	move.w	obj.var_34(a0),d3
	movea.l	obj.var_36(a0),a1
	jsr	(a1)
	tst.w	d1
	bpl.s	BataPyonFallingMotion
	tst.w	obj.var_3e(a0)
	bpl.w	BataPyonReverseDirection
	cmp.w	obj.var_3e(a0),d1
	ble.w	BataPyonReverseDirection
	bra.s	BataPyonStartBounce

; ------------------------------------------------------------------------------

BataPyonFallingMotion:
	tst.w	obj.var_3e(a0)
	bmi.s	BataPyonStartBounce
	addi.l	#$2000,obj.var_2e(a0)
	cmpi.l	#$70000,obj.var_2e(a0)
	blt.s	BataPyonFallReturn
	move.l	#$70000,obj.var_2e(a0)

BataPyonFallReturn:
	rts

; ------------------------------------------------------------------------------

BataPyonStartBounce:
	addq.b	#2,obj.routine(a0)
	move.w	obj.var_3e(a0),d0
	add.w	d0,obj.y(a0)
	move.w	#1,d0
	tst.b	obj.subtype(a0)
	beq.s	BataPyonSetBounceDuration
	move.w	#$14,d0

BataPyonSetBounceDuration:
	move.w	d0,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

BataPyonObject_0_Routine4:
	tst.b	obj.subtype(a0)
	beq.s	BataPyonAdvanceBounce
	move.w	#7,d6
	move.w	obj.var_3a(a0),d0
	cmpi.w	#6,d0
	beq.s	BataPyonApplyBounceMotion
	cmpi.w	#$B,d0
	beq.s	BataPyonReverseBounceDirection
	cmpi.w	#$F,d0
	beq.s	BataPyonApplyBounceMotion
	cmpi.w	#$12,d0
	bne.s	BataPyonAdvanceBounce

BataPyonReverseBounceDirection:
	neg.w	d6

BataPyonApplyBounceMotion:
	add.w	d6,obj.y(a0)
	bsr.w	BataPyonUpdateCollisionProfile

BataPyonAdvanceBounce:
	subq.w	#1,obj.var_3a(a0)
	bne.s	BataPyonBounceReturn
	addq.b	#2,obj.routine(a0)
	subq.w	#7,obj.y(a0)
	bsr.w	BataPyonUpdateCollisionProfile
	move.l	#-$60000,d0
	tst.b	obj.subtype(a0)
	beq.s	BataPyonStoreBounceVelocity
	move.l	#-$50000,d0

BataPyonStoreBounceVelocity:
	move.l	d0,obj.var_2e(a0)
	subq.b	#1,obj.var_32(a0)
	bmi.s	BataPyonReverseDirection

BataPyonBounceReturn:
	rts

; ------------------------------------------------------------------------------

BataPyonObject_0_Routine6:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	jsr	CheckBlockUp
	move.w	d1,obj.var_3e(a0)
	move.w	obj.var_34(a0),d3
	movea.l	obj.var_36(a0),a1
	jsr	(a1)
	tst.w	d1
	bpl.s	BataPyonRisingMotion
	tst.w	obj.var_3e(a0)
	bpl.s	BataPyonReverseDirection
	cmp.w	obj.var_3e(a0),d1
	ble.s	BataPyonReverseDirection
	bra.s	BataPyonImpactRecovery

; ------------------------------------------------------------------------------

BataPyonRisingMotion:
	tst.w	obj.var_3e(a0)
	bmi.s	BataPyonImpactRecovery
	addi.l	#$2000,obj.var_2e(a0)
	bpl.s	BataPyonResetBounceState
	rts

; ------------------------------------------------------------------------------

BataPyonImpactRecovery:
	move.w	obj.var_3e(a0),d0
	sub.w	d0,obj.y(a0)
	clr.l	obj.var_2e(a0)

BataPyonResetBounceState:
	subq.b	#4,obj.routine(a0)
	subi.w	#$B,obj.y(a0)
	bra.s	BataPyonUpdateCollisionProfile

; ------------------------------------------------------------------------------

BataPyonReverseDirection:
	move.b	obj.var_33(a0),obj.var_32(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	neg.l	obj.var_2a(a0)
	neg.w	obj.var_34(a0)
	lea	CheckBlockLeft,a1
	lea	CheckBlockRight,a2
	cmpa.l	obj.var_36(a0),a1
	bne.s	BataPyonStoreBlockCheckDirection
	exg	a1,a2

BataPyonStoreBlockCheckDirection:
	move.l	a1,obj.var_36(a0)
	rts

; ------------------------------------------------------------------------------

; Update collision dimensions for the current sprite orientation.
BataPyonUpdateCollisionProfile:
	tst.b	obj.sprite_frame(a0)
	beq.s	BataPyonSetAlternateProfile
	moveq	#0,d0
	moveq	#$13,d1
	moveq	#$2F,d2
	bra.s	BataPyonStoreCollisionProfile

; ------------------------------------------------------------------------------

BataPyonSetAlternateProfile:
	moveq	#1,d0
	moveq	#$1C,d1
	moveq	#$30,d2

BataPyonStoreCollisionProfile:
	move.b	d0,obj.sprite_frame(a0)
	move.b	d1,obj.height(a0)
	move.b	d2,obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

BataPyonSprites1:
	include	"sprites/r6/bata_pyon_1.asm"
	even

BataPyonSprites2:
	include	"sprites/r6/bata_pyon_2.asm"
	even

; ------------------------------------------------------------------------------
