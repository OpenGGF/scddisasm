; ------------------------------------------------------------------------------

KabasiraObject:
	move.b	obj.subtype_2(a0),d0
	bpl.s	loc_20D440
	addq.b	#1,d0
	beq.s	loc_20D42E
	bra.w	loc_20D66E

; ------------------------------------------------------------------------------

loc_20D42E:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$22,obj.id(a1)
	beq.s	loc_20D446

loc_20D43A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D440:
	jsr	DestroyInGoodFuture

loc_20D446:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D46A(pc,d0.w),d0
	jsr	off_20D46A(pc,d0.w)
	lea	Ani_20D6DE(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D46A:
	dc.w	KabasiraObject_0_Routine0-*
	dc.w	KabasiraObject_0_Routine2-off_20D46A

; ------------------------------------------------------------------------------

KabasiraObject_0_Routine0:
	move.b	#$31,obj.collide_type(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	move.w	#$8000,obj.var_2c(a0)
	move.w	#$8000,obj.var_30(a0)
	move.w	#$200,d0
	move.w	#$100,d1
	moveq	#4,d2
	tst.b	obj.subtype(a0)
	beq.s	loc_20D4A6
	move.w	#$100,d0
	move.w	#$80,d1
	moveq	#0,d2

loc_20D4A6:
	move.w	d0,obj.var_36(a0)
	move.w	d1,obj.var_38(a0)
	move.b	d2,obj.anim_id(a0)
	movea.w	a0,a1
	bsr.s	sub_20D532
	moveq	#2,d6
	move.w	#$1000,d5
	move.w	#$800,d4
	tst.b	obj.subtype(a0)
	beq.s	loc_20D4CE
	move.w	#$2000,d5
	move.w	#$1000,d4

loc_20D4CE:
	moveq	#0,d3
	moveq	#0,d2
	moveq	#0,d1

loc_20D4D4:
	jsr	SpawnObjectAfter
	bne.w	loc_20D43A
	move.w	a0,obj.var_3e(a1)
	addq.b	#1,d1
	move.b	d1,d0
	add.b	obj.anim_id(a0),d0
	move.b	d0,obj.anim_id(a1)
	sub.w	d5,d3
	sub.w	d4,d2
	move.w	d3,obj.var_32(a1)
	move.w	d2,obj.var_34(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.l	obj.var_2a(a0),obj.var_2a(a1)
	move.l	obj.var_2e(a0),obj.var_2e(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_38(a0),obj.var_38(a1)
	bsr.s	sub_20D532
	dbf	d6,loc_20D4D4
	rts

; ------------------------------------------------------------------------------

sub_20D532:
	move.b	#2,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#$C,obj.width(a1)
	move.b	#$C,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	#$23C6,obj.sprite_tile(a1)
	move.l	#Spr_20DBA4,obj.sprite_data(a1)
	rts

; ------------------------------------------------------------------------------

KabasiraObject_0_Routine2:
	tst.b	obj.subtype(a0)
	bne.w	loc_20D604
	tst.b	obj.subtype_2(a0)
	bmi.w	loc_20D604
	tst.w	obj.var_3a(a0)
	beq.s	loc_20D584
	subq.w	#1,obj.var_3a(a0)
	bra.w	loc_20D604

; ------------------------------------------------------------------------------

loc_20D584:
	lea	(player_object).w,a2
	bsr.w	sub_20D646
	bcc.w	loc_20D604
	move.w	#$F0,obj.var_3a(a0)
	jsr	SpawnObject
	bne.s	loc_20D604
	move.b	#8,obj.anim_id(a1)
	move.b	#$FE,obj.subtype_2(a1)
	move.b	#$F1,obj.collide_type(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	bsr.w	sub_20D532
	move.w	d5,d1
	move.w	d6,d2
	jsr	Atan2
	jsr	SineCosine
	swap	d1
	swap	d0
	asr.l	#7,d1
	asr.l	#7,d0
	move.l	d0,obj.var_2e(a1)
	move.l	d1,obj.var_2a(a1)
	bpl.s	loc_20D5F4
	bchg	#0,obj.sprite_flags(a1)
	bchg	#0,obj.flags(a1)

loc_20D5F4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20D604
	move.w	#$A0,d0
	jsr	PlayFmSound

loc_20D604:
	move.w	obj.var_32(a0),d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.var_32(a0)
	lsr.w	#8,d0
	jsr	SineCosine
	swap	d0
	asr.l	#4,d0
	add.l	obj.var_2a(a0),d0
	move.l	d0,obj.x(a0)
	move.w	obj.var_34(a0),d0
	add.w	obj.var_38(a0),d0
	move.w	d0,obj.var_34(a0)
	lsr.w	#8,d0
	jsr	SineCosine
	swap	d1
	asr.l	#2,d1
	add.l	obj.var_2e(a0),d1
	move.l	d1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D646:
	move.w	obj.y(a2),d0
	sub.w	obj.y(a0),d0
	move.w	d0,d6
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	locret_20D66C
	move.w	obj.x(a2),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d5
	subi.w	#-$78,d0
	subi.w	#$F0,d0

locret_20D66C:
	rts

; ------------------------------------------------------------------------------

loc_20D66E:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	tst.b	obj.collide_status(a0)
	beq.s	loc_20D6B0
	move.w	obj.x(a0),d5
	move.w	obj.y(a0),d6
	jsr	DeleteObject
	move.w	d5,obj.x(a0)
	move.w	d6,obj.y(a0)
	move.b	#$18,obj.id(a0)
	move.b	#1,obj.routine_2(a0)
	move.w	#$9E,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

loc_20D6B0:
	lea	(player_object).w,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bpl.s	loc_20D6C0
	neg.w	d0

loc_20D6C0:
	cmpi.w	#$E0,d0
	bgt.w	loc_20D43A
	lea	Ani_20D6DE(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

Ani_20D6DE:
	dc.w	@Ani_20D6DE_0-*
	dc.w	@Ani_20D6DE_1-Ani_20D6DE
	dc.w	@Ani_20D6DE_2-Ani_20D6DE
	dc.w	@Ani_20D6DE_3-Ani_20D6DE
	dc.w	@Ani_20D6DE_4-Ani_20D6DE
	dc.w	@Ani_20D6DE_5-Ani_20D6DE
	dc.w	@Ani_20D6DE_6-Ani_20D6DE
	dc.w	@Ani_20D6DE_7-Ani_20D6DE
	dc.w	@Ani_20D6DE_8-Ani_20D6DE

@Ani_20D6DE_0:
	dc.b	$F
	dc.b	4, 5, 6, 7, 8, 9, $A, $B
	dc.b	$A, $B, 0, 1, 2, 3, 4, 5
	dc.b	$FF

@Ani_20D6DE_1:
	dc.b	0
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	6, $C, 6, $C, 6, $C, 6, $C
	dc.b	6, $C, 6, $C, 6, $C, 6, $C
	dc.b	7, $C, 7, $C, 7, $C, 7, $C
	dc.b	7, $C, 7, $C, 7, $C, 7, $C
	dc.b	8, $C, 8, $C, 8, $C, 8, $C
	dc.b	8, $C, 8, $C, 8, $C, 8, $C
	dc.b	9, $C, 9, $C, 9, $C, 9, $C
	dc.b	9, $C, 9, $C, 9, $C, 9, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	0, $C, 0, $C, 0, $C, 0, $C
	dc.b	0, $C, 0, $C, 0, $C, 0, $C
	dc.b	1, $C, 1, $C, 1, $C, 1, $C
	dc.b	1, $C, 1, $C, 1, $C, 1, $C
	dc.b	2, $C, 2, $C, 2, $C, 2, $C
	dc.b	2, $C, 2, $C, 2, $C, 2, $C
	dc.b	3, $C, 3, $C, 3, $C, 3, $C
	dc.b	3, $C, 3, $C, 3, $C, 3, $C
	dc.b	$FF

@Ani_20D6DE_2:
	dc.b	0
	dc.b	2, $C, $C, $C, 2, $C, $C, $C
	dc.b	2, $C, $C, $C, 2, $C, $C, $C
	dc.b	3, $C, $C, $C, 3, $C, $C, $C
	dc.b	3, $C, $C, $C, 3, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	6, $C, $C, $C, 6, $C, $C, $C
	dc.b	6, $C, $C, $C, 6, $C, $C, $C
	dc.b	7, $C, $C, $C, 7, $C, $C, $C
	dc.b	7, $C, $C, $C, 7, $C, $C, $C
	dc.b	8, $C, $C, $C, 8, $C, $C, $C
	dc.b	8, $C, $C, $C, 8, $C, $C, $C
	dc.b	9, $C, $C, $C, 9, $C, $C, $C
	dc.b	9, $C, $C, $C, 9, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	0, $C, $C, $C, 0, $C, $C, $C
	dc.b	0, $C, $C, $C, 0, $C, $C, $C
	dc.b	1, $C, $C, $C, 1, $C, $C, $C
	dc.b	1, $C, $C, $C, 1, $C, $C, $C
	dc.b	$FF

@Ani_20D6DE_3:
	dc.b	0
	dc.b	0, $C, $C, $C, $C, $C, $C, $C
	dc.b	0, $C, $C, $C, $C, $C, $C, $C
	dc.b	1, $C, $C, $C, $C, $C, $C, $C
	dc.b	1, $C, $C, $C, $C, $C, $C, $C
	dc.b	2, $C, $C, $C, $C, $C, $C, $C
	dc.b	2, $C, $C, $C, $C, $C, $C, $C
	dc.b	3, $C, $C, $C, $C, $C, $C, $C
	dc.b	3, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	6, $C, $C, $C, $C, $C, $C, $C
	dc.b	6, $C, $C, $C, $C, $C, $C, $C
	dc.b	7, $C, $C, $C, $C, $C, $C, $C
	dc.b	7, $C, $C, $C, $C, $C, $C, $C
	dc.b	8, $C, $C, $C, $C, $C, $C, $C
	dc.b	8, $C, $C, $C, $C, $C, $C, $C
	dc.b	9, $C, $C, $C, $C, $C, $C, $C
	dc.b	9, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$FF

@Ani_20D6DE_4:
	dc.b	7
	dc.b	4, 5, 6, 7, 8, 9, $A, $B
	dc.b	$A, $B, 0, 1, 2, 3, 4, 5
	dc.b	$FF

@Ani_20D6DE_5:
	dc.b	0
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	5, $C, 5, $C, 5, $C, 5, $C
	dc.b	6, $C, 6, $C, 6, $C, 6, $C
	dc.b	7, $C, 7, $C, 7, $C, 7, $C
	dc.b	8, $C, 8, $C, 8, $C, 8, $C
	dc.b	9, $C, 9, $C, 9, $C, 9, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	$A, $C, $A, $C, $A, $C, $A, $C
	dc.b	$B, $C, $B, $C, $B, $C, $B, $C
	dc.b	0, $C, 0, $C, 0, $C, 0, $C
	dc.b	1, $C, 1, $C, 1, $C, 1, $C
	dc.b	2, $C, 2, $C, 2, $C, 2, $C
	dc.b	3, $C, 3, $C, 3, $C, 3, $C
	dc.b	4, $C, 4, $C, 4, $C, 4, $C
	dc.b	$FF

@Ani_20D6DE_6:
	dc.b	0
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	4, $C, $C, $C, 4, $C, $C, $C
	dc.b	5, $C, $C, $C, 5, $C, $C, $C
	dc.b	6, $C, $C, $C, 6, $C, $C, $C
	dc.b	7, $C, $C, $C, 7, $C, $C, $C
	dc.b	8, $C, $C, $C, 8, $C, $C, $C
	dc.b	9, $C, $C, $C, 9, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	$A, $C, $C, $C, $A, $C, $C, $C
	dc.b	$B, $C, $C, $C, $B, $C, $C, $C
	dc.b	0, $C, $C, $C, 0, $C, $C, $C
	dc.b	1, $C, $C, $C, 1, $C, $C, $C
	dc.b	2, $C, $C, $C, 2, $C, $C, $C
	dc.b	3, $C, $C, $C, 3, $C, $C, $C
	dc.b	$FF

@Ani_20D6DE_7:
	dc.b	0
	dc.b	3, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	4, $C, $C, $C, $C, $C, $C, $C
	dc.b	5, $C, $C, $C, $C, $C, $C, $C
	dc.b	6, $C, $C, $C, $C, $C, $C, $C
	dc.b	7, $C, $C, $C, $C, $C, $C, $C
	dc.b	8, $C, $C, $C, $C, $C, $C, $C
	dc.b	9, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	$A, $C, $C, $C, $C, $C, $C, $C
	dc.b	$B, $C, $C, $C, $C, $C, $C, $C
	dc.b	0, $C, $C, $C, $C, $C, $C, $C
	dc.b	1, $C, $C, $C, $C, $C, $C, $C
	dc.b	2, $C, $C, $C, $C, $C, $C, $C
	dc.b	$FF

@Ani_20D6DE_8:
	dc.b	0
	dc.b	$D, $C
	dc.b	$FF

Spr_20DBA4:
	dc.w	@Spr_20DBA4_0-*
	dc.w	@Spr_20DBA4_1-Spr_20DBA4
	dc.w	@Spr_20DBA4_2-Spr_20DBA4
	dc.w	@Spr_20DBA4_3-Spr_20DBA4
	dc.w	@Spr_20DBA4_4-Spr_20DBA4
	dc.w	@Spr_20DBA4_5-Spr_20DBA4
	dc.w	@Spr_20DBA4_6-Spr_20DBA4
	dc.w	@Spr_20DBA4_7-Spr_20DBA4
	dc.w	@Spr_20DBA4_8-Spr_20DBA4
	dc.w	@Spr_20DBA4_9-Spr_20DBA4
	dc.w	@Spr_20DBA4_A-Spr_20DBA4
	dc.w	@Spr_20DBA4_B-Spr_20DBA4
	dc.w	@Spr_20DBA4_C-Spr_20DBA4
	dc.w	@Spr_20DBA4_D-Spr_20DBA4

@Spr_20DBA4_0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$FA, 4, 0, $18, $F8

@Spr_20DBA4_1:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$FA, 4, $10, $18, $F8

@Spr_20DBA4_2:
	dc.b	2
	dc.b	$F8, 5, 0, 4, $F8
	dc.b	$FA, 8, 0, $1C, $F4

@Spr_20DBA4_3:
	dc.b	2
	dc.b	$F8, 5, 0, 4, $F8
	dc.b	$FA, 8, 0, $1F, $F4

@Spr_20DBA4_4:
	dc.b	2
	dc.b	$FB, 0, 0, $22, $F6
	dc.b	$F8, 5, 0, 8, $F8

@Spr_20DBA4_5:
	dc.b	2
	dc.b	$FB, 0, $10, $22, $F6
	dc.b	$F8, 5, 0, 8, $F8

@Spr_20DBA4_6:
	dc.b	2
	dc.b	$FA, 8, 0, $1C, $F4
	dc.b	$F8, 5, 0, $C, $F8

@Spr_20DBA4_7:
	dc.b	2
	dc.b	$FA, 8, 0, $1F, $F4
	dc.b	$F8, 5, 0, $C, $F8

@Spr_20DBA4_8:
	dc.b	2
	dc.b	$FA, 4, 0, $18, $F8
	dc.b	$F8, 5, 0, $10, $F8

@Spr_20DBA4_9:
	dc.b	2
	dc.b	$FA, 4, $10, $18, $F8
	dc.b	$F8, 5, 0, $10, $F8

@Spr_20DBA4_A:
	dc.b	2
	dc.b	$FB, 0, 0, $1A, $FF
	dc.b	$F8, 5, 0, $14, $F8

@Spr_20DBA4_B:
	dc.b	2
	dc.b	$FB, 0, 0, $1B, $FF
	dc.b	$F8, 5, 0, $14, $F8

@Spr_20DBA4_C:
	dc.b	0

@Spr_20DBA4_D:
	dc.b	2
	dc.b	$FB, 0, $80, $22, $F6
	dc.b	$F8, 5, $80, 8, $F8

; ------------------------------------------------------------------------------