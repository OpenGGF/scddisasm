; ------------------------------------------------------------------------------

YagoObject:
	tst.b	obj.subtype(a0)
	beq.s	loc_20DEA2
	bra.w	loc_20E10C

; ------------------------------------------------------------------------------

loc_20DEA2:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DEB6(pc,d0.w),d0
	jmp	off_20DEB6(pc,d0.w)

; ------------------------------------------------------------------------------

off_20DEB6:
	dc.w	YagoObject_0_Routine0-*
	dc.w	YagoObject_0_Routine2-off_20DEB6
	dc.w	YagoObject_0_Routine4-off_20DEB6
	dc.w	YagoObject_0_Routine6-off_20DEB6
	dc.w	YagoObject_0_Routine8-off_20DEB6
	dc.w	YagoObject_0_RoutineA-off_20DEB6
	dc.w	YagoObject_0_RoutineC-off_20DEB6
	dc.w	YagoObject_0_RoutineE-off_20DEB6
	dc.w	YagoObject_0_Routine10-off_20DEB6

; ------------------------------------------------------------------------------

YagoObject_0_Routine0:
	move.w	obj.x(a0),obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$2F,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$23F0,obj.sprite_tile(a0)
	move.l	#YagoSprites1,obj.sprite_data(a0)

YagoObject_0_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	cmpi.w	#5,d1
	bmi.s	loc_20DF2E

loc_20DF12:
	lea	YagoAnims1,a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_3e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20DF2E:
	addq.b	#2,obj.routine(a0)
	move.l	#$500000,obj.var_2a(a0)
	move.l	#-$4000,obj.var_2e(a0)
	bra.s	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_Routine4:
	addi.l	#-$4000,obj.var_2a(a0)
	bmi.s	loc_20DFA4
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.x(a0)
	jsr	CheckBlockDown
	subq.w	#5,d1
	add.w	d1,obj.y(a0)
	moveq	#0,d3
	move.b	obj.width(a0),d3
	lea	CheckBlockRight,a1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20DF7C
	lea	CheckBlockLeft,a1

loc_20DF7C:
	jsr	(a1)
	cmpi.w	#5,d1
	bmi.s	loc_20DFA4
	move.w	obj.x(a0),d0
	sub.w	player_object+obj.x,d0
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20DF96
	neg.w	d0

loc_20DF96:
	subi.w	#$10,d0
	subi.w	#$40,d0
	bcs.s	loc_20DFB2
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20DFA4:
	addq.b	#2,obj.routine(a0)
	move.w	#$1F,obj.var_32(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20DFB2:
	addq.b	#6,obj.routine(a0)
	move.w	#7,obj.var_32(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_Routine6:
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20DFCC
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20DFCC:
	addq.b	#2,obj.routine(a0)
	move.w	#$1F,obj.var_32(a0)
	move.l	#$500000,obj.var_2a(a0)
	neg.l	obj.var_2e(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_Routine8:
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20DFFE
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20DFFE:
	addi.b	#-4,obj.routine(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_RoutineA:
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20E014
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20E014:
	addq.b	#2,obj.routine(a0)
	move.w	#$1F,obj.var_32(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_RoutineC:
	addi.l	#$2000,obj.y(a0)
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20E036
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20E036:
	addq.b	#2,obj.routine(a0)
	move.l	#-$48000,obj.var_38(a0)
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20E04E
	neg.l	obj.var_38(a0)

loc_20E04E:
	move.l	#-$18000,obj.var_34(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_RoutineE:
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.x(a0)
	moveq	#0,d3
	move.b	obj.width(a0),d3
	lea	CheckBlockRight,a1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20E07C
	lea	CheckBlockLeft,a1

loc_20E07C:
	jsr	(a1)
	cmpi.w	#5,d1
	bmi.s	loc_20E014
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.y(a0)
	tst.l	obj.var_34(a0)
	bpl.s	loc_20E09A
	addi.l	#$2000,obj.var_34(a0)

loc_20E09A:
	jsr	CheckObjectDespawn
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

	move.b	#6,obj.routine(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoObject_0_Routine10:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	cmpi.w	#5,d1
	bmi.s	loc_20E0C6
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

loc_20E0C6:
	move.b	#6,obj.routine(a0)
	subq.w	#5,d1
	add.w	d1,obj.y(a0)
	move.w	#$1F,obj.var_32(a0)
	bra.w	loc_20DF12

; ------------------------------------------------------------------------------

YagoAnims1:
	include	"src/anims/r4/yago_1.asm"
	even

YagoSprites1:
	include	"src/sprites/r4/yago_1.asm"
	even

; ------------------------------------------------------------------------------

loc_20E10C:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E120(pc,d0.w),d0
	jmp	off_20E120(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E120:
	dc.w	YagoObject_1_Routine0-*
	dc.w	YagoObject_1_Routine2-off_20E120
	dc.w	YagoObject_1_Routine4-off_20E120
	dc.w	YagoObject_1_Routine6-off_20E120
	dc.w	YagoObject_1_Routine8-off_20E120
	dc.w	YagoObject_1_RoutineA-off_20E120
	dc.w	YagoObject_1_RoutineC-off_20E120
	dc.w	YagoObject_1_RoutineE-off_20E120
	dc.w	YagoObject_1_Routine10-off_20E120

; ------------------------------------------------------------------------------

YagoObject_1_Routine0:
	move.w	obj.x(a0),obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$2F,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$23F0,obj.sprite_tile(a0)
	move.l	#YagoSprites2,obj.sprite_data(a0)

YagoObject_1_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	cmpi.w	#5,d1
	bmi.s	loc_20E198

loc_20E17C:
	lea	YagoAnims2,a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_3e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20E198:
	addq.b	#2,obj.routine(a0)
	subq.w	#5,d1
	add.w	d1,obj.y(a0)
	move.l	#$500000,obj.var_2a(a0)
	move.l	#-$4000,obj.var_2e(a0)
	bra.s	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_Routine4:
	addi.l	#-$4000,obj.var_2a(a0)
	bmi.s	loc_20E214
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.x(a0)
	jsr	CheckBlockDown
	subq.w	#5,d1
	add.w	d1,obj.y(a0)
	moveq	#0,d3
	move.b	obj.width(a0),d3
	lea	CheckBlockRight,a1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20E1EC
	lea	CheckBlockLeft,a1

loc_20E1EC:
	jsr	(a1)
	cmpi.w	#5,d1
	bmi.s	loc_20E214
	move.w	obj.x(a0),d0
	sub.w	player_object+obj.x,d0
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20E206
	neg.w	d0

loc_20E206:
	subi.w	#$10,d0
	subi.w	#$40,d0
	bcs.s	loc_20E222
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E214:
	addq.b	#2,obj.routine(a0)
	move.w	#$1F,obj.var_32(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E222:
	addq.b	#6,obj.routine(a0)
	move.w	#7,obj.var_32(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_Routine6:
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20E23C
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E23C:
	addq.b	#2,obj.routine(a0)
	move.w	#$1F,obj.var_32(a0)
	move.l	#$500000,obj.var_2a(a0)
	neg.l	obj.var_2e(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_Routine8:
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20E26E
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E26E:
	addi.b	#-4,obj.routine(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_RoutineA:
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20E284
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E284:
	addq.b	#2,obj.routine(a0)
	move.w	#$1F,obj.var_32(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_RoutineC:
	addi.l	#$2800,obj.y(a0)
	addi.w	#-1,obj.var_32(a0)
	beq.s	loc_20E2A6
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E2A6:
	addq.b	#2,obj.routine(a0)
	move.l	#-$10000,obj.var_38(a0)
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20E2BE
	neg.l	obj.var_38(a0)

loc_20E2BE:
	move.l	#-$18000,obj.var_34(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_RoutineE:
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.x(a0)
	moveq	#0,d3
	move.b	obj.width(a0),d3
	lea	CheckBlockRight,a1
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20E2EC
	lea	CheckBlockLeft,a1

loc_20E2EC:
	jsr	(a1)
	tst.w	d1
	bmi.s	loc_20E316
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$1000,obj.var_34(a0)
	bmi.w	loc_20E17C
	jsr	CheckBlockDown
	cmpi.w	#5,d1
	bmi.s	loc_20E31E
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E316:
	addq.b	#2,obj.routine(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E31E:
	move.b	#4,obj.routine(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoObject_1_Routine10:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	cmpi.w	#5,d1
	bmi.s	loc_20E340
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

loc_20E340:
	move.b	#6,obj.routine(a0)
	subq.w	#5,d1
	add.w	d1,obj.y(a0)
	move.w	#$1F,obj.var_32(a0)
	bra.w	loc_20E17C

; ------------------------------------------------------------------------------

YagoAnims2:
	include	"src/anims/r4/yago_2.asm"
	even

YagoSprites2:
	include	"src/sprites/r4/yago_2.asm"
	even

; ------------------------------------------------------------------------------
