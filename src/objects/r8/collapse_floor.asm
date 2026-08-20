; ------------------------------------------------------------------------------

CollapseFloorObject:
	tst.b	obj.subtype_2(a0)
	bne.w	loc_20C7E6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C66A(pc,d0.w),d0
	jmp	off_20C66A(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C66A:
	dc.w	CollapseFloorObject_1_Routine0-*
	dc.w	CollapseFloorObject_1_Routine2-off_20C66A
	dc.w	CollapseFloorObject_1_Routine4-off_20C66A
	dc.w	CollapseFloorObject_1_Routine6-off_20C66A
	dc.w	CollapseFloorObject_1_Routine8-off_20C66A

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.l	#CollapseFloorSprites,obj.sprite_data(a0)
	move.b	#$11,obj.height(a0)
	move.w	#$44D8,d0
	cmpi.b	#2,act
	bne.s	loc_20C69A
	move.w	#$437A,d0

loc_20C69A:
	move.w	d0,obj.sprite_tile(a0)
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20C6A6
	neg.b	d0

loc_20C6A6:
	move.b	d0,d1
	subq.b	#1,d0
	move.b	d0,obj.sprite_frame(a0)
	lsl.b	#3,d1
	move.b	d1,obj.width(a0)
	move.b	d1,obj.width_2(a0)
	moveq	#3,d0
	moveq	#2,d1
	tst.b	obj.subtype(a0)
	bpl.s	loc_20C6C6
	moveq	#1,d0
	moveq	#8,d1

loc_20C6C6:
	move.b	d0,obj.sprite_layer(a0)
	move.b	d1,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine2:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	loc_20C702
	addq.b	#2,obj.routine(a0)
	clr.b	obj.state_id(a0)
	move.w	#8,obj.var_2a(a0)
	moveq	#8,d0
	tst.w	player_object+obj.x_speed
	bpl.s	loc_20C6F4
	neg.w	d0

loc_20C6F4:
	move.w	d0,obj.var_2c(a0)
	move.w	#$A3,d0
	jsr	PlayFmSound

loc_20C702:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine4:
	lea	player_object,a1
	jsr	TopSolidObject
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20C722
	addq.b	#2,obj.routine(a0)

loc_20C722:
	jmp	DrawObject

; ------------------------------------------------------------------------------

CollapseFloorObject_1_Routine6:
	movem.l	(a0),a2-a5
	moveq	#-1,d1
	moveq	#8,d2
	moveq	#0,d3
	move.b	obj.subtype(a0),d3
	subq.w	#1,d3
	asl.w	#3,d3
	tst.w	obj.var_2c(a0)
	bmi.s	loc_20C742
	neg.w	d3

loc_20C742:
	jsr	SpawnObject
	bne.w	loc_20C788
	movem.l	a2-a5,(a1)
	move.b	d1,obj.subtype_2(a1)
	sub.w	d2,obj.y(a1)
	add.w	d3,obj.x(a1)
	move.w	#4,obj.var_2a(a1)
	move.b	#8,obj.sprite_frame(a1)
	jsr	SpawnObject
	bne.w	loc_20C788
	movem.l	a2-a5,(a1)
	move.b	d1,obj.subtype_2(a1)
	add.w	d2,obj.y(a1)
	add.w	d3,obj.x(a1)
	move.b	#9,obj.sprite_frame(a1)

loc_20C788:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	loc_20C79A
	jsr	GetOffObject

loc_20C79A:
	subq.b	#1,obj.subtype(a0)
	ble.w	loc_20C848
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

CollapseFloorObject_1_Routine8:
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20C7E6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C7F4(pc,d0.w),d0
	jmp	off_20C7F4(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C7F4:
	dc.w	CollapseFloorObject_0_Routine0-*
	dc.w	CollapseFloorObject_0_Routine2-off_20C7F4
	dc.w	CollapseFloorObject_0_Routine4-off_20C7F4

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#$8080308,obj.height(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine2:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20C816
	addq.b	#2,obj.routine(a0)

loc_20C816:
	jmp	DrawObject

; ------------------------------------------------------------------------------

CollapseFloorObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20C848
	move.l	obj.var_2c(a0),d0
	addi.l	#$4000,d0
	cmpi.l	#$160000,d0
	ble.s	loc_20C83A
	move.l	#$160000,d0

loc_20C83A:
	move.l	d0,obj.var_2c(a0)
	add.l	d0,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20C848:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

CollapseFloorSprites:
	include	"src/sprites/r8/collapse_floor.asm"
	even

; ------------------------------------------------------------------------------
