; ------------------------------------------------------------------------------

PlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	PlatformRoutineTable(pc,d0.w),d0
	jsr	PlatformRoutineTable(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

; Platform routine pointers.
PlatformRoutineTable:
	dc.w	PlatformObject_0_Routine0-*
	dc.w	PlatformObject_0_Routine2-PlatformRoutineTable

; ------------------------------------------------------------------------------

PlatformTopSolidCollision:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

PlatformObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$436A,obj.sprite_tile(a0)
	move.l	#PlatformSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$18,obj.width_2(a0)
	addq.b	#2,obj.routine(a0)

PlatformObject_0_Routine2:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	move.w	PlatformMotionTable(pc,d0.w),d0
	jmp	PlatformMotionTable(pc,d0.w)

; ------------------------------------------------------------------------------

; Platform vertical/horizontal motion pointers by subtype.
PlatformMotionTable:
	dc.w	PlatformObject_1_Routine0-*
	dc.w	PlatformObject_1_Routine2-PlatformMotionTable
	dc.w	PlatformObject_1_Routine4-PlatformMotionTable
	dc.w	PlatformObject_1_Routine6-PlatformMotionTable

; ------------------------------------------------------------------------------

PlatformObject_1_Routine4:
	bsr.w	PlatformCalculateOffset
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	bra.w	PlatformTopSolidCollision

; ------------------------------------------------------------------------------

PlatformObject_1_Routine6:
	bsr.w	PlatformCalculateOffset
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	bra.w	PlatformTopSolidCollision

; ------------------------------------------------------------------------------

PlatformObject_1_Routine0:
	move.l	obj.x(a0),-(sp)
	bsr.w	PlatformCalculateOffset
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.l	obj.x(a0),d0
	sub.l	(sp)+,d0
	lsr.l	#8,d0
	move.w	d0,obj.x_speed(a0)
	bra.w	PlatformTopSolidCollision

; ------------------------------------------------------------------------------

PlatformObject_1_Routine2:
	move.l	obj.x(a0),-(sp)
	bsr.w	PlatformCalculateOffset
	neg.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.l	obj.x(a0),d0
	sub.l	(sp)+,d0
	lsr.l	#8,d0
	move.w	d0,obj.x_speed(a0)
	bra.w	PlatformTopSolidCollision

; ------------------------------------------------------------------------------

PlatformCalculateOffset:
	move.w	stage_frames,d0
	andi.w	#$FF,d0
	jsr	SineCosine
	add.w	d0,d0
	add.w	d0,d0
	asr.w	#4,d0
	addq.b	#1,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

PlatformSprites:
	include	"sprites/r6/platform.asm"
	even

; ------------------------------------------------------------------------------
