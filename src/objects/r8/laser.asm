; ------------------------------------------------------------------------------

LaserObject:
	lea	(player_object).w,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B478(pc,d0.w),d0
	jsr	off_20B478(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B478:
	dc.w	LaserObject_0_Routine0-*
	dc.w	LaserObject_0_Routine2-off_20B478
	dc.w	LaserObject_0_Routine4-off_20B478
	dc.w	LaserObject_0_Routine6-off_20B478
	dc.w	LaserObject_0_Routine8-off_20B478

; ------------------------------------------------------------------------------

LaserObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$3E0,obj.sprite_tile(a0)
	move.l	#Spr_23C15C,obj.sprite_data(a0)
	move.b	#1,obj.sprite_frame(a0)
	tst.b	obj.subtype(a0)
	beq.s	loc_20B4B4
	move.b	#2,obj.sprite_frame(a0)
	move.l	#Spr_23C186,obj.sprite_data(a0)

loc_20B4B4:
	move.b	#1,obj.var_2a(a0)

LaserObject_0_Routine2:
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_20B530
	jsr	SpawnObjectAfter
	bne.s	locret_20B530
	move.b	#$1D,obj.id(a1)
	move.b	#4,obj.routine(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#2,obj.sprite_layer(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	andi.w	#$FFF0,obj.y(a1)
	move.b	#4,obj.height(a1)
	move.b	#$1E,obj.var_2a(a0)
	move.w	#$C5,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20B524
	move.b	#$1E,obj.var_2a(a0)
	move.w	#$BC,d0

loc_20B524:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20B530
	jsr	PlayFmSound

locret_20B530:
	rts

; ------------------------------------------------------------------------------

LaserObject_0_Routine4:
	move.w	obj.y(a0),d0
	addq.w	#4,d0
	move.w	d0,d1
	move.w	d0,obj.y(a0)
	andi.b	#$F,d1
	bne.s	loc_20B556
	addq.b	#1,obj.anim_id(a0)
	cmpi.b	#7,obj.anim_id(a0)
	bcs.s	loc_20B556
	move.b	#7,obj.anim_id(a0)

loc_20B556:
	lea	(Ani_21DA00).l,a1
	jsr	AnimateObject
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20B5AC
	addq.b	#2,obj.routine(a0)
	jsr	SpawnObjectAfter
	bne.s	loc_20B5AC
	move.b	#$1D,obj.id(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#8,obj.routine(a1)
	move.b	#8,obj.anim_id(a1)
	move.l	a1,obj.var_2c(a0)

loc_20B5AC:
	bra.w	loc_20B60A

; ------------------------------------------------------------------------------

LaserObject_0_Routine6:
	move.w	obj.y(a0),d0
	addq.w	#4,d0
	move.w	d0,d1
	andi.w	#$F,d1
	bne.s	loc_20B5CE
	subi.w	#$10,d0
	move.b	obj.anim_id(a0),d1
	subq.b	#1,d1
	bmi.s	loc_20B5E2
	move.b	d1,obj.anim_id(a0)

loc_20B5CE:
	move.w	d0,obj.y(a0)
	lea	(Ani_21DA00).l,a1
	jsr	AnimateObject
	bra.w	loc_20B60A

; ------------------------------------------------------------------------------

loc_20B5E2:
	movea.l	obj.var_2c(a0),a1
	move.b	#1,$2A(a1)
	jmp	DeleteObject

; ------------------------------------------------------------------------------

LaserObject_0_Routine8:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20B5FE
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20B5FE:
	lea	(Ani_21DA00).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20B60A:
	cmpi.b	#$2B,obj.anim_id(a6)
	beq.s	locret_20B620
	tst.b	obj.subtype(a0)
	bne.s	loc_20B622
	tst.b	(shrunk_player).l
	beq.s	loc_20B62A

locret_20B620:
	rts

; ------------------------------------------------------------------------------

loc_20B622:
	tst.b	(shrunk_player).l
	beq.s	locret_20B620

loc_20B62A:
	tst.b	(debug_mode).l
	bne.w	locret_20B6DC
	move.b	obj.width(a6),d1
	ext.w	d1
	addq.w	#4,d1
	move.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	add.w	d1,d0
	bmi.w	locret_20B6DC
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.w	locret_20B6DC
	move.w	obj.height(a6),d1
	ext.w	d1
	move.w	obj.y(a6),d2
	add.w	d1,d2
	moveq	#0,d0
	move.b	obj.anim_id(a0),d0
	move.b	byte_20B6DE(pc,d0.w),d0
	ext.w	d0
	add.w	obj.y(a0),d0
	cmp.w	d2,d0
	bcc.s	locret_20B6DC
	move.w	obj.y(a6),d2
	sub.w	d1,d2
	move.w	obj.y(a0),d0
	addq.w	#4,d0
	cmp.w	d0,d2
	bcc.s	locret_20B6DC
	move.b	#4,obj.routine(a6)
	bset	#1,obj.flags(a6)
	move.w	#$FC00,obj.y_speed(a6)
	move.w	#$FE00,obj.x_speed(a6)
	move.w	obj.x(a6),d0
	cmp.w	obj.x(a0),d0
	bcs.s	loc_20B6A8
	neg.w	obj.x_speed(a6)

loc_20B6A8:
	move.w	#0,obj.ground_speed(a6)
	move.b	#$38,obj.anim_id(a6)
	move.b	#$A,obj.height(a6)
	move.b	#5,obj.width(a6)
	eori.b	#1,(shrunk_player).l
	tst.b	(shrunk_player).l
	bne.s	locret_20B6DC
	move.b	#$13,obj.height(a6)
	move.b	#9,obj.width(a6)

locret_20B6DC:
	rts

; ------------------------------------------------------------------------------

byte_20B6DE:
	dc.b	$F4
	dc.b	$E4
	dc.b	$D4
	dc.b	$C4
	dc.b	$B4
	dc.b	$A4
	dc.b	$94
	dc.b	$84

; ------------------------------------------------------------------------------