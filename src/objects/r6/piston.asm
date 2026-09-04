; ------------------------------------------------------------------------------

PistonObject:
	tst.b	obj.subtype(a0)
	bmi.w	PistonChildObject
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	PistonRoutineTable(pc,d0.w),d0
	jsr	PistonRoutineTable(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

; Piston parent routine pointers.
PistonRoutineTable:
	dc.w	PistonObject_0_Routine0-*
	dc.w	PistonObject_0_Routine2-PistonRoutineTable

; ------------------------------------------------------------------------------

PistonTopSolidCollision:
	lea	player_object,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

PistonObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$340,obj.sprite_tile(a0)
	move.l	#PistonSprites,obj.sprite_data(a0)
	move.b	#$28,obj.height(a0)
	move.b	#$20,obj.width_2(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	jsr	SpawnObject
	bne.s	PistonSpawnSecondChild
	move.w	#-$20,d0
	bsr.w	PistonInitializeChild

PistonSpawnSecondChild:
	jsr	SpawnObject
	bne.s	PistonObject_0_Routine2
	move.w	#$20,d0
	bsr.w	PistonInitializeChild

PistonObject_0_Routine2:
	jsr	PistonUpdateMotion(pc)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	tst.b	obj.var_3c(a0)
	beq.s	PistonCheckPlayerHandoff
	tst.b	obj.var_3a(a0)
	beq.s	PistonApplyTopCollision

PistonCheckPlayerHandoff:
	cmpi.b	#$21,obj.var_3b(a0)
	bcs.s	PistonApplyTopCollision
	lea	player_object,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

PistonApplyTopCollision:
	jmp	PistonTopSolidCollision(pc)

; ------------------------------------------------------------------------------

PistonUpdateMotion:
	tst.b	obj.var_3a(a0)
	beq.s	PistonAdvanceDelay
	subq.b	#1,obj.var_3a(a0)
	bne.s	PistonMotionReturn

PistonAdvanceDelay:
	tst.b	obj.var_3c(a0)
	beq.s	PistonExtend
	subq.b	#1,obj.var_3b(a0)
	bcc.s	PistonMotionReturn
	clr.b	obj.var_3b(a0)
	clr.b	obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

PistonExtend:
	addq.b	#8,obj.var_3b(a0)
	cmpi.b	#$50,obj.var_3b(a0)
	bcs.s	PistonMotionReturn
	move.b	#$50,obj.var_3b(a0)
	move.b	#1,obj.var_3c(a0)
	move.b	#$3C,obj.var_3a(a0)

PistonMotionReturn:
	rts

; ------------------------------------------------------------------------------

PistonInitializeChild:
	move.b	#$20,obj.id(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$FF,obj.subtype(a1)
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.l	#PistonSprites,obj.sprite_data(a1)
	move.b	#$28,obj.height(a1)
	move.b	#1,obj.sprite_frame(a1)
	rts

; ------------------------------------------------------------------------------

PistonChildObject:
	movea.w	obj.var_34(a0),a1
	cmpi.b	#$20,obj.id(a1)
	bne.s	PistonDeleteChild
	move.w	obj.y(a1),obj.y(a0)
	lea	player_object,a1
	jsr	SolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

PistonDeleteChild:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PistonSprites:
	include	"sprites/r6/piston.asm"
	even

; ------------------------------------------------------------------------------
