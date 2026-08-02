; ------------------------------------------------------------------------------

DangoObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F218(pc,d0.w),d0
	jsr	off_20F218(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20F218:
	dc.w	DangoObject_0_Routine0-*
	dc.w	DangoObject_0_Routine2-off_20F218
	dc.w	DangoObject_0_Routine4-off_20F218
	dc.w	DangoObject_0_Routine6-off_20F218
	dc.w	DangoObject_0_Routine8-off_20F218
	dc.w	DangoObject_0_RoutineA-off_20F218
	dc.w	DangoObject_0_RoutineC-off_20F218
	dc.w	DangoObject_0_RoutineA-off_20F218
	dc.w	DangoObject_0_Routine10-off_20F218
	dc.w	DangoObject_0_Routine12-off_20F218
	dc.w	DangoObject_0_Routine14-off_20F218
	dc.w	DangoObject_0_Routine12-off_20F218
	dc.w	DangoObject_0_Routine18-off_20F218
	dc.w	DangoObject_0_RoutineA-off_20F218
	dc.w	DangoObject_0_Routine1C-off_20F218

; ------------------------------------------------------------------------------

DangoObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$E,obj.width(a0)
	move.b	#$E,obj.width_2(a0)
	move.b	#9,obj.height(a0)
	move.b	#$2C,obj.collide_type(a0)
	move.w	#$245D,d0
	tst.b	(time_zone).l
	bne.s	loc_20F26E
	move.w	#$23E9,d0

loc_20F26E:
	move.w	d0,obj.sprite_tile(a0)
	lea	off_20F4E4(pc),a1
	lea	off_20F48A(pc),a2
	tst.b	obj.subtype(a0)
	beq.s	loc_20F288
	lea	off_20F552(pc),a1
	lea	off_20F4B4(pc),a2

loc_20F288:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine2:
	addi.l	#$10000,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20F2AC
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)

locret_20F2AC:
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	move.l	#$6000,d0
	move.l	#$1000,d1
	bra.w	loc_20F426

; ------------------------------------------------------------------------------

DangoObject_0_Routine6:
	bsr.w	sub_20F43E
	beq.s	loc_20F308
	move.w	(player_object+obj.x).w,d0
	sub.w	obj.x(a0),d0
	spl	d1
	subi.w	#$FF80,d0
	subi.w	#$100,d0
	bcc.s	DangoObject_0_RoutineA
	move.w	(player_object+obj.y).w,d0
	sub.w	obj.y(a0),d0
	subi.w	#$FF80,d0
	subi.w	#$100,d0
	bcc.s	DangoObject_0_RoutineA
	btst	#0,obj.sprite_flags(a0)
	sne	d0
	eor.b	d1,d0
	bne.s	DangoObject_0_RoutineA
	addq.b	#2,obj.routine(a0)

DangoObject_0_RoutineA:
	movea.l	obj.var_2e(a0),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20F308:
	neg.l	obj.var_2a(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine8:
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_RoutineC:
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	subq.w	#6,obj.y(a0)
	move.b	#$10,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine10:
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	addq.w	#3,obj.y(a0)
	move.b	#$D,obj.height(a0)
	move.b	#$ED,obj.collide_type(a0)
	move.l	#0,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine14:
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	move.l	#$40000,d0
	move.l	#$10000,d1
	bra.w	loc_20F426

; ------------------------------------------------------------------------------

DangoObject_0_Routine12:
	tst.b	obj.collide_status(a0)
	bne.s	loc_20F38E
	bsr.w	sub_20F43E
	beq.s	loc_20F388
	movea.l	obj.var_2e(a0),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20F388:
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F38E:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d1
	move.w	obj.y(a0),d2
	sub.w	obj.x(a1),d1
	sub.w	obj.y(a1),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#$F900,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a1)
	muls.w	#$F900,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	clr.b	obj.var_3c(a1)
	clr.b	obj.collide_status(a0)
	neg.w	d1
	ext.l	d1
	asl.l	#8,d1
	move.l	d1,obj.var_2a(a0)
	move.b	#4,obj.anim_id(a0)
	move.b	#$16,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine18:
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	subq.w	#3,obj.y(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$2C,obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

DangoObject_0_Routine1C:
	move.b	#4,obj.routine(a0)
	move.b	#0,obj.anim_id(a0)
	addq.w	#6,obj.y(a0)
	move.b	#9,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F426:
	tst.b	obj.subtype(a0)
	beq.s	loc_20F42E
	move.l	d1,d0

loc_20F42E:
	btst	#0,obj.sprite_flags(a0)
	bne.s	loc_20F438
	neg.l	d0

loc_20F438:
	move.l	d0,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

sub_20F43E:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	moveq	#0,d3
	move.b	obj.width(a0),d3
	lea	(CheckBlockRight).l,a1
	tst.w	obj.var_2a(a0)
	bpl.s	loc_20F460
	neg.w	d3
	lea	(CheckBlockLeft).l,a1

loc_20F460:
	jsr	(a1)
	tst.w	d1
	bmi.s	loc_20F47E
	jsr	CheckBlockDown
	move.w	d1,d0
	addq.w	#7,d0
	subi.w	#$E,d0
	bcc.s	loc_20F47E
	add.w	d1,obj.y(a0)
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

loc_20F47E:
	move.l	obj.var_2a(a0),d0
	sub.l	d0,obj.x(a0)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

off_20F48A:
	dc.w	byte_20F496-*
	dc.w	byte_20F49A-off_20F48A
	dc.w	byte_20F49D-off_20F48A
	dc.w	byte_20F4A2-off_20F48A
	dc.w	byte_20F4AA-off_20F48A
	dc.w	byte_20F4AE-off_20F48A

byte_20F496:
	dc.b	9
	dc.b	0, 1
	dc.b	$FF

byte_20F49A:
	dc.b	0
	dc.b	0
	dc.b	$FC

byte_20F49D:
	dc.b	3
	dc.b	4, 4, 5
	dc.b	$FC

byte_20F4A2:
	dc.b	4
	dc.b	2, 3, 2, 3, 2, 3
	dc.b	$FC

byte_20F4AA:
	dc.b	4
	dc.b	2, 3
	dc.b	$FF

byte_20F4AE:
	dc.b	4
	dc.b	5, 4, 4, $FC
	dc.b	0

off_20F4B4:
	dc.w	byte_20F4C0-*
	dc.w	byte_20F4C4-off_20F4B4
	dc.w	byte_20F4C7-off_20F4B4
	dc.w	byte_20F4CC-off_20F4B4
	dc.w	byte_20F4DA-off_20F4B4
	dc.w	byte_20F4DE-off_20F4B4

byte_20F4C0:
	dc.b	$1D
	dc.b	0, 1
	dc.b	$FF

byte_20F4C4:
	dc.b	$3B
	dc.b	0
	dc.b	$FC

byte_20F4C7:
	dc.b	9
	dc.b	4, 4, 5
	dc.b	$FC

byte_20F4CC:
	dc.b	9
	dc.b	2, 3, 2, 3, 2, 3, 2, 3, 2, 3, 2, 3
	dc.b	$FC

byte_20F4DA:
	dc.b	9
	dc.b	2, 3
	dc.b	$FF

byte_20F4DE:
	dc.b	9
	dc.b	5, 4, 4, $FC
	dc.b	0

off_20F4E4:
	dc.w	byte_20F4F0-*
	dc.w	byte_20F519-off_20F4E4
	dc.w	byte_20F542-off_20F4E4
	dc.w	byte_20F5C0-off_20F4E4
	dc.w	byte_20F5D0-off_20F4E4
	dc.w	byte_20F5DB-off_20F4E4

byte_20F4F0:
	dc.b	8
	dc.b	$F4, 0, 0, 0, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, 2, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, 4, $F0
	dc.b	4, 0, 0, 8, $F0
	dc.b	4, 4, 0, 9, $F8
	dc.b	4, 0, 0, $B, 8

byte_20F519:
	dc.b	8
	dc.b	$F4, 0, 0, 0, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, 2, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, 4, $F0
	dc.b	4, 4, 0, $C, $F0
	dc.b	4, 0, 0, $E, 0
	dc.b	4, 0, 0, $F, 8

byte_20F542:
	dc.b	3
	dc.b	$F4, 4, 0, $35, $FB
	dc.b	$F0, $D, 0, $10, $F0
	dc.b	0, $D, $10, $10, $F0

off_20F552:
	dc.w	byte_20F55E-*
	dc.w	byte_20F587-off_20F552
	dc.w	byte_20F5B0-off_20F552
	dc.w	byte_20F5C0-off_20F552
	dc.w	byte_20F5D0-off_20F552
	dc.w	byte_20F5DB-off_20F552

byte_20F55E:
	dc.b	8
	dc.b	$F4, 0, 0, $37, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, $38, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, $39, $F0
	dc.b	4, 0, 0, 8, $F0
	dc.b	4, 4, 0, $3D, $F8
	dc.b	4, 0, 0, $B, 8

byte_20F587:
	dc.b	8
	dc.b	$F4, 0, 0, $37, $F0
	dc.b	$F4, 0, 0, 1, $F8
	dc.b	$F4, 0, 0, $38, 0
	dc.b	$F4, 0, 0, 3, 8
	dc.b	$FC, $C, 0, $39, $F0
	dc.b	4, 4, 0, $C, $F0
	dc.b	4, 0, 0, $3F, 0
	dc.b	4, 0, 0, $F, 8

byte_20F5B0:
	dc.b	3
	dc.b	$EF, 1, 0, $40, $F0
	dc.b	$FF, 1, $10, $40, $F0
	dc.b	$EF, $B, 0, $42, $F8

byte_20F5C0:
	dc.b	3
	dc.b	$F4, 4, 0, $35, $FC
	dc.b	$F0, $D, 0, $10, $F0
	dc.b	0, $D, $10, $10, $F0

byte_20F5D0:
	dc.b	2
	dc.b	$F0, 4, 0, $18, $F8
	dc.b	$F8, $E, 0, $1A, $F0

byte_20F5DB:
	dc.b	2
	dc.b	$F1, 8, 0, $26, $F0
	dc.b	$F9, $E, 0, $29, $F0

; ------------------------------------------------------------------------------