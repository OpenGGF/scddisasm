; ------------------------------------------------------------------------------

MinomusiObject:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20E4A6
	bmi.w	loc_20E714
	bra.w	loc_20E6F4

; ------------------------------------------------------------------------------

loc_20E4A6:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E4C6(pc,d0.w),d0
	jsr	off_20E4C6(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20E4C6:
	dc.w	MinomusiObject_0_Routine0-*
	dc.w	MinomusiObject_0_Routine2-off_20E4C6
	dc.w	MinomusiObject_0_Routine4-off_20E4C6
	dc.w	MinomusiObject_0_Routine6-off_20E4C6
	dc.w	MinomusiObject_0_Routine8-off_20E4C6
	dc.w	MinomusiObject_0_RoutineA-off_20E4C6
	dc.w	MinomusiObject_0_RoutineC-off_20E4C6
	dc.w	MinomusiObject_0_RoutineE-off_20E4C6
	dc.w	MinomusiObject_0_Routine10-off_20E4C6

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
	beq.s	loc_20E52A
	lea	MinomusiSprites2(pc),a1

loc_20E52A:
	move.l	a1,obj.sprite_data(a0)
	jsr	SpawnObjectAfter
	beq.s	loc_20E53C
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E53C:
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
	bne.s	locret_20E5B6
	move.w	#$79,obj.var_2a(a0)
	move.b	#2,d6
	lea	player_object,a1
	bsr.w	sub_20E5B8
	bcs.s	loc_20E5B2
	neg.b	d6

loc_20E5B2:
	add.b	d6,obj.routine(a0)

locret_20E5B6:
	rts

; ------------------------------------------------------------------------------

sub_20E5B8:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#$28,d0
	subi.w	#$78,d0
	bcc.s	locret_20E5DA
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$A8,d0
	subi.w	#$150,d0

locret_20E5DA:
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
	bgt.s	locret_20E604
	add.w	d0,obj.y(a0)
	move.b	#$E,obj.routine(a0)

locret_20E604:
	rts

; ------------------------------------------------------------------------------

MinomusiObject_0_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.l	#$70000,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20E61C
	move.l	#$20000,d0

loc_20E61C:
	move.l	d0,obj.var_30(a0)

MinomusiObject_0_RoutineC:
	move.l	obj.var_30(a0),d0
	sub.l	d0,obj.y(a0)
	move.w	obj.var_34(a0),d0
	sub.w	obj.y(a0),d0
	blt.s	locret_20E63C
	add.w	d0,obj.y(a0)
	move.b	#2,obj.routine(a0)

locret_20E63C:
	rts

; ------------------------------------------------------------------------------

MinomusiObject_0_RoutineE:
	addq.b	#2,obj.routine(a0)
	move.w	#$E6,d0
	move.w	#$FF,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20E658
	move.w	#$3D,d0
	move.w	#$1FF,d1

loc_20E658:
	move.w	d0,obj.var_2a(a0)
	move.w	d1,obj.anim_id(a0)

MinomusiObject_0_Routine10:
	subq.w	#1,obj.var_2a(a0)
	bne.s	loc_20E66C
	move.b	#$A,obj.routine(a0)

loc_20E66C:
	lea	MinomusiAnims(pc),a1
	jsr	AnimateObject
	tst.b	obj.subtype(a0)
	bne.w	locret_20E6F2
	cmpi.b	#$1E,obj.anim_index(a0)
	bne.w	locret_20E6F2
	jsr	SpawnObjectAfter
	bne.w	locret_20E6F2
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
	bpl.s	locret_20E6F2
	move.w	#$B7,d0
	jsr	PlayFmSound

locret_20E6F2:
	rts

; ------------------------------------------------------------------------------

loc_20E6F4:
	movea.w	obj.var_38(a0),a1
	cmpi.b	#$33,obj.id(a1)
	bne.s	loc_20E70E
	cmpi.b	#1,obj.anim_index(a1)
	beq.s	loc_20E70E
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20E70E:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E714:
	movea.w	obj.var_38(a0),a1
	cmpi.b	#$33,obj.id(a1)
	beq.s	loc_20E726
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E726:
	move.w	obj.y(a1),d0
	sub.w	obj.var_34(a1),d0
	subi.w	#$18,d0
	asr.w	#3,d0
	bpl.s	loc_20E738
	moveq	#0,d0

loc_20E738:
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
