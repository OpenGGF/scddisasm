; ------------------------------------------------------------------------------

SemiObject:
	tst.b	obj.subtype_2(a0)
	bmi.w	loc_20E3B8
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E07A(pc,d0.w),d0
	jsr	off_20E07A(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20E07A:
	dc.w	SemiObject_1_Routine0-*
	dc.w	SemiObject_1_Routine2-off_20E07A
	dc.w	SemiObject_1_Routine4-off_20E07A
	dc.w	SemiObject_1_Routine6-off_20E07A
	dc.w	SemiObject_1_Routine8-off_20E07A
	dc.w	SemiObject_1_RoutineA-off_20E07A
	dc.w	SemiObject_1_RoutineC-off_20E07A

; ------------------------------------------------------------------------------

SemiObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$13,obj.width(a0)
	move.b	#$13,obj.width_2(a0)
	move.w	#$A4A8,obj.sprite_tile(a0)
	move.b	#$36,obj.collide_type(a0)
	move.b	obj.subtype_2(a0),obj.var_33(a0)
	lea	SemiSprites1(pc),a1
	tst.b	obj.subtype(a0)
	beq.s	loc_20E0CA
	lea	SemiSprites2(pc),a1

loc_20E0CA:
	move.l	a1,obj.sprite_data(a0)

SemiObject_1_Routine2:
	subq.w	#1,obj.var_32(a0)
	bpl.s	locret_20E0D8
	addq.b	#2,obj.routine(a0)

locret_20E0D8:
	rts

; ------------------------------------------------------------------------------

SemiObject_1_Routine4:
	lea	(player_object).w,a1
	bsr.s	sub_20E0E8
	bcc.s	locret_20E0E6
	addq.b	#2,obj.routine(a0)

locret_20E0E6:
	rts

; ------------------------------------------------------------------------------

sub_20E0E8:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	locret_20E10E
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,obj.var_34(a0)
	subi.w	#-$78,d0
	subi.w	#$F0,d0

locret_20E10E:
	rts

; ------------------------------------------------------------------------------

SemiObject_1_Routine6:
	addq.b	#2,obj.routine(a0)
	move.l	#$10000,d0
	move.l	#-$8000,d1
	move.w	#$60,d2
	tst.b	obj.subtype(a0)
	beq.s	loc_20E13A
	move.l	#$C000,d0
	move.l	#$6000,d1
	move.w	#$2A,d2

loc_20E13A:
	tst.w	obj.var_34(a0)
	bmi.s	loc_20E142
	neg.l	d0

loc_20E142:
	move.l	d0,obj.var_2a(a0)
	move.l	d1,obj.var_2e(a0)
	move.w	d2,obj.var_32(a0)

SemiObject_1_Routine8:
	subq.w	#1,obj.var_32(a0)
	bpl.s	loc_20E158
	addq.b	#2,obj.routine(a0)

loc_20E158:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	lea	SemiAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SemiObject_1_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.w	#0,obj.var_32(a0)
	move.l	#$10000,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20E18E
	move.l	#$C000,d0

loc_20E18E:
	tst.w	obj.var_34(a0)
	bmi.s	loc_20E196
	neg.l	d0

loc_20E196:
	move.l	d0,obj.var_2a(a0)

SemiObject_1_RoutineC:
	tst.b	obj.subtype(a0)
	bne.s	loc_20E1EC
	andi.w	#$3F,obj.var_32(a0)
	bne.s	loc_20E1E8
	lea	(player_object).w,a1
	bsr.w	sub_20E0E8
	bcc.s	loc_20E1E8
	jsr	SpawnObject
	bne.s	loc_20E1E8
	move.b	obj.id(a0),obj.id(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.l	obj.y(a0),obj.y(a1)
	addi.w	#$A,obj.y(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)

loc_20E1E8:
	addq.w	#1,obj.var_32(a0)

loc_20E1EC:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	lea	SemiAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SemiAnims:
	include	"src/anims/r6/semi.asm"
	even

SemiSprites1:
	include	"src/sprites/r6/semi_1.asm"
	even

SemiSprites2:
	include	"src/sprites/r6/semi_2.asm"
	even

; ------------------------------------------------------------------------------

loc_20E3B8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E3D2(pc,d0.w),d0
	jsr	off_20E3D2(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20E3D2:
	dc.w	SemiObject_0_Routine0-*
	dc.w	SemiObject_0_Routine2-off_20E3D2
	dc.w	SemiObject_0_Routine4-off_20E3D2
	dc.w	SemiObject_0_Routine6-off_20E3D2
	dc.w	SemiObject_0_Routine8-off_20E3D2

; ------------------------------------------------------------------------------

SemiObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#$B7,obj.collide_type(a0)
	move.b	#6,obj.height(a0)
	move.b	#6,obj.width(a0)
	move.b	#6,obj.width_2(a0)
	move.w	#$84C8,obj.sprite_tile(a0)
	move.l	#SemiBombSprites,obj.sprite_data(a0)
	move.l	#$8000,obj.var_2e(a0)

SemiObject_0_Routine2:
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$4000,obj.var_2e(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20E436
	addq.b	#2,obj.routine(a0)
	add.w	d1,obj.y(a0)
	move.w	#$78,obj.var_32(a0)

locret_20E436:
	rts

; ------------------------------------------------------------------------------

SemiObject_0_Routine4:
	subq.w	#1,obj.var_32(a0)
	bpl.s	locret_20E448
	addq.b	#2,obj.routine(a0)
	move.w	#$78,obj.var_32(a0)

locret_20E448:
	rts

; ------------------------------------------------------------------------------

SemiObject_0_Routine6:
	subq.w	#1,obj.var_32(a0)
	bpl.s	loc_20E454
	addq.b	#2,obj.routine(a0)

loc_20E454:
	lea	SemiBombAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SemiObject_0_Routine8:
	move.b	#$18,obj.id(a0)
	move.b	#0,obj.routine(a0)
	move.b	#1,obj.routine_2(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20E480
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20E480:
	rts

; ------------------------------------------------------------------------------

SemiBombAnims:
	include	"src/anims/r6/semi_bomb.asm"
	even

SemiBombSprites:
	include	"src/sprites/r6/semi_bomb.asm"
	even

; ------------------------------------------------------------------------------