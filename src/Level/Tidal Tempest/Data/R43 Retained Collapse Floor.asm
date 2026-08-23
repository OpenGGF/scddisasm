; -------------------------------------------------------------------------
; Discarded CollapseFloor object retained in the R43 historical data layout
; -------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject:
	tst.b	obj.subtype_2(a0)
	bne.w	R43RetainedCollapseFloor_loc_20F38A
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	R43RetainedCollapseFloor_off_20F254(pc,d0.w),d0
	jmp	R43RetainedCollapseFloor_off_20F254(pc,d0.w)

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_off_20F254:
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_1_Routine0-*
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_1_Routine2-R43RetainedCollapseFloor_off_20F254
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_1_Routine4-R43RetainedCollapseFloor_off_20F254
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_1_Routine6-R43RetainedCollapseFloor_off_20F254

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.w	#$4364,obj.sprite_tile(a0)
	move.l	#R43RetainedCollapseFloor_CollapseFloorSprites,obj.sprite_data(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$11,obj.height(a0)
	move.b	obj.subtype(a0),d0
	move.b	d0,d1
	subq.b	#1,d0
	move.b	d0,obj.sprite_frame(a0)
	lsl.b	#3,d1
	move.b	d1,obj.width(a0)
	move.b	d1,obj.width_2(a0)

R43RetainedCollapseFloor_CollapseFloorObject_1_Routine2:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	R43RetainedCollapseFloor_loc_20F2C8
	addq.b	#2,obj.routine(a0)
	clr.b	obj.state_id(a0)
	move.w	#8,obj.var_2a(a0)
	moveq	#8,d0
	tst.w	player_object+obj.x_speed
	bpl.s	R43RetainedCollapseFloor_loc_20F2BA
	neg.w	d0

R43RetainedCollapseFloor_loc_20F2BA:
	move.w	d0,obj.var_2c(a0)
	move.w	#$A3,d0
	jsr	PlayFmSound

R43RetainedCollapseFloor_loc_20F2C8:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject_1_Routine4:
	lea	player_object,a1
	jsr	TopSolidObject
	subq.w	#1,obj.var_2a(a0)
	bpl.s	R43RetainedCollapseFloor_loc_20F2E8
	addq.b	#2,obj.routine(a0)

R43RetainedCollapseFloor_loc_20F2E8:
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject_1_Routine6:
	movem.l	(a0),a2-a5
	moveq	#$FFFFFFFF,d1
	moveq	#8,d2
	moveq	#0,d3
	move.b	obj.subtype(a0),d3
	subq.w	#1,d3
	asl.w	#3,d3
	tst.w	obj.var_2c(a0)
	bmi.s	R43RetainedCollapseFloor_loc_20F308
	neg.w	d3

R43RetainedCollapseFloor_loc_20F308:
	jsr	SpawnObject
	bne.w	R43RetainedCollapseFloor_loc_20F342
	movem.l	a2-a5,(a1)
	move.b	d1,obj.subtype_2(a1)
	sub.w	d2,obj.y(a1)
	add.w	d3,obj.x(a1)
	move.w	#4,obj.var_2a(a1)
	jsr	SpawnObject
	bne.w	R43RetainedCollapseFloor_loc_20F342
	movem.l	a2-a5,(a1)
	move.b	d1,obj.subtype_2(a1)
	add.w	d2,obj.y(a1)
	add.w	d3,obj.x(a1)

R43RetainedCollapseFloor_loc_20F342:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	R43RetainedCollapseFloor_loc_20F354
	jsr	GetOffObject

R43RetainedCollapseFloor_loc_20F354:
	subq.b	#1,obj.subtype(a0)
	ble.w	R43RetainedCollapseFloor_loc_20F3F2
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

R43RetainedCollapseFloor_loc_20F38A:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	R43RetainedCollapseFloor_off_20F398(pc,d0.w),d0
	jmp	R43RetainedCollapseFloor_off_20F398(pc,d0.w)

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_off_20F398:
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_0_Routine0-*
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_0_Routine2-R43RetainedCollapseFloor_off_20F398
	dc.w	R43RetainedCollapseFloor_CollapseFloorObject_0_Routine4-R43RetainedCollapseFloor_off_20F398

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#8,obj.sprite_frame(a0)
	move.l	#$8080308,obj.height(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject_0_Routine2:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	R43RetainedCollapseFloor_loc_20F3C0
	addq.b	#2,obj.routine(a0)

R43RetainedCollapseFloor_loc_20F3C0:
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	R43RetainedCollapseFloor_loc_20F3F2
	move.l	obj.var_2c(a0),d0
	addi.l	#$4000,d0
	cmpi.l	#$160000,d0
	ble.s	R43RetainedCollapseFloor_loc_20F3E4
	move.l	#$160000,d0

R43RetainedCollapseFloor_loc_20F3E4:
	move.l	d0,obj.var_2c(a0)
	add.l	d0,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_loc_20F3F2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

R43RetainedCollapseFloor_CollapseFloorSprites:
	include	"sprites/r4/collapse_floor.asm"
	even

; ------------------------------------------------------------------------------
