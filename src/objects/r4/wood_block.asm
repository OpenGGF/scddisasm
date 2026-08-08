; ------------------------------------------------------------------------------

WoodBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EE0A(pc,d0.w),d0
	jsr	off_20EE0A(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20EE0A:
	dc.w	WoodBlockObject_0_Routine0-*
	dc.w	WoodBlockObject_0_Routine2-off_20EE0A
	dc.w	WoodBlockObject_0_Routine4-off_20EE0A
	dc.w	WoodBlockObject_0_Routine6-off_20EE0A
	dc.w	WoodBlockObject_0_Routine8-off_20EE0A

; ------------------------------------------------------------------------------

WoodBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$350,obj.sprite_tile(a0)
	move.l	#WoodBlockSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	cmpi.w	#$780,(target_water_y).w
	beq.s	WoodBlockObject_0_Routine2
	cmpi.w	#$5E0,(target_water_y).w
	beq.s	WoodBlockObject_0_Routine2
	jmp	DeleteObject

; ------------------------------------------------------------------------------

WoodBlockObject_0_Routine2:
	move.w	(water_y).w,obj.y(a0)
	move.w	(static_water_y).w,d0
	cmp.w	(target_water_y).w,d0
	bne.s	locret_20EE92
	cmpi.w	#$780,d0
	bne.s	loc_20EE7E
	move.b	#4,obj.routine(a0)
	bra.s	WoodBlockObject_0_Routine4

; ------------------------------------------------------------------------------

loc_20EE7E:
	cmpi.w	#$5E0,d0
	bne.s	loc_20EE8C
	move.b	#6,obj.routine(a0)
	bra.s	WoodBlockObject_0_Routine6

; ------------------------------------------------------------------------------

loc_20EE8C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20EE92:
	rts

; ------------------------------------------------------------------------------

WoodBlockObject_0_Routine4:
	move.w	(water_y).w,obj.y(a0)
	lea	(player_object).w,a1
	jsr	TopSolidObject
	beq.s	locret_20EEB6
	addq.b	#2,obj.routine(a0)
	move.w	obj.x(a1),obj.x(a0)
	move.w	#$5E0,(target_water_y).w

locret_20EEB6:
	rts

; ------------------------------------------------------------------------------

WoodBlockObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.w	(water_speed).w,d0
	neg.w	d0
	move.w	d0,obj.y_speed(a0)

WoodBlockObject_0_Routine8:
	move.w	(water_y).w,obj.y(a0)
	lea	(player_object).w,a1
	move.b	obj.x_speed(a1),d4
	ext.w	d4
	add.w	obj.x(a1),d4
	sub.w	obj.x(a0),d4
	beq.s	loc_20EF4A
	lea	(CheckBlockRight3).l,a6
	moveq	#1,d6
	moveq	#0,d5
	move.b	obj.width(a0),d5
	tst.w	d4
	bpl.s	loc_20EEFE
	lea	(CheckBlockLeft3).l,a6
	neg.w	d6
	neg.w	d5
	neg.w	d4

loc_20EEFE:
	move.l	a6,obj.var_2a(a0)
	move.w	d6,obj.var_2e(a0)
	move.w	d5,obj.var_30(a0)
	move.w	d4,obj.var_32(a0)
	move.w	obj.y(a0),obj.var_34(a0)
	addq.w	#7,obj.var_34(a0)

loc_20EF18:
	movea.l	obj.var_2a(a0),a6
	move.w	obj.x(a0),d3
	add.w	obj.var_30(a0),d3
	cmpa.l	#CheckBlockRight3,a6
	beq.s	loc_20EF30
	eori.w	#$F,d3

loc_20EF30:
	move.w	obj.var_34(a0),d2
	jsr	(a6)
	tst.w	d1
	bmi.s	loc_20EF4A
	subq.w	#1,obj.var_32(a0)
	ble.s	loc_20EF4A
	move.w	obj.var_2e(a0),d0
	add.w	d0,obj.x(a0)
	bra.s	loc_20EF18

; ------------------------------------------------------------------------------

loc_20EF4A:
	lea	(player_object).w,a1
	jsr	TopSolidObject
	beq.s	locret_20EF5C
	move.w	obj.x(a0),obj.x(a1)

locret_20EF5C:
	rts

; ------------------------------------------------------------------------------

WoodBlockSprites:
	include	"src/sprites/r4/wood_block.asm"
	even

; ------------------------------------------------------------------------------