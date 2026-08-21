; ------------------------------------------------------------------------------

CollapseFloorObject:
	tst.b	obj.subtype_2(a0)
	bne.w	loc_20F38A
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F254(pc,d0.w),d0
	jmp	off_20F254(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F254:
	dc.w	CollapseFloorObject_1_Routine0-*
	dc.w	CollapseFloorObject_1_Routine2-off_20F254
	dc.w	CollapseFloorObject_1_Routine4-off_20F254
	dc.w	CollapseFloorObject_1_Routine6-off_20F254

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.w	#$4364,obj.sprite_tile(a0)
	move.l	#CollapseFloorSprites,obj.sprite_data(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$11,obj.height(a0)
	move.b	obj.subtype(a0),d0
	move.b	d0,d1
	subq.b	#1,d0
	move.b	d0,obj.sprite_frame(a0)
	lsl.b	#3,d1
	move.b	d1,obj.width(a0)
	move.b	d1,obj.width_2(a0)

CollapseFloorObject_1_Routine2:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	loc_20F2C8
	addq.b	#2,obj.routine(a0)
	clr.b	obj.state_id(a0)
	move.w	#8,obj.var_2a(a0)
	moveq	#8,d0
	tst.w	player_object+obj.x_speed
	bpl.s	loc_20F2BA
	neg.w	d0

loc_20F2BA:
	move.w	d0,obj.var_2c(a0)
	move.w	#$A3,d0
	jsr	PlayFmSound

loc_20F2C8:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine4:
	lea	player_object,a1
	jsr	TopSolidObject
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20F2E8
	addq.b	#2,obj.routine(a0)

loc_20F2E8:
	jmp	DrawObject

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine6:
	movem.l	(a0),a2-a5
	moveq	#$FFFFFFFF,d1
	moveq	#8,d2
	moveq	#0,d3
	move.b	obj.subtype(a0),d3
	subq.w	#1,d3
	asl.w	#3,d3
	tst.w	obj.var_2c(a0)
	bmi.s	loc_20F308
	neg.w	d3

loc_20F308:
	jsr	SpawnObject
	bne.w	loc_20F342
	movem.l	a2-a5,(a1)
	move.b	d1,obj.subtype_2(a1)
	sub.w	d2,obj.y(a1)
	add.w	d3,obj.x(a1)
	move.w	#4,obj.var_2a(a1)
	jsr	SpawnObject
	bne.w	loc_20F342
	movem.l	a2-a5,(a1)
	move.b	d1,obj.subtype_2(a1)
	add.w	d2,obj.y(a1)
	add.w	d3,obj.x(a1)

loc_20F342:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	loc_20F354
	jsr	GetOffObject

loc_20F354:
	subq.b	#1,obj.subtype(a0)
	ble.w	loc_20F3F2
	subq.b	#2,obj.routine(a0)
	subq.b	#1,obj.sprite_frame(a0)
	subq.b	#8,obj.width(a0)
	subq.b	#8,obj.width_2(a0)
	move.w	#7,obj.var_2a(a0)
	move.w	obj.var_2c(a0),d0
	add.w	d0,obj.x(a0)
	lea	player_object,a1
	jsr	TopSolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F38A:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F398(pc,d0.w),d0
	jmp	off_20F398(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F398:
	dc.w	CollapseFloorObject_0_Routine0-*
	dc.w	CollapseFloorObject_0_Routine2-off_20F398
	dc.w	CollapseFloorObject_0_Routine4-off_20F398

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#8,obj.sprite_frame(a0)
	move.l	#$8080308,obj.height(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine2:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20F3C0
	addq.b	#2,obj.routine(a0)

loc_20F3C0:
	jmp	DrawObject

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20F3F2
	move.l	obj.var_2c(a0),d0
	addi.l	#$4000,d0
	cmpi.l	#$160000,d0
	ble.s	loc_20F3E4
	move.l	#$160000,d0

loc_20F3E4:
	move.l	d0,obj.var_2c(a0)
	add.l	d0,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F3F2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

CollapseFloorSprites:
	include	"sprites/r4/collapse_floor.asm"
	even

; ------------------------------------------------------------------------------
