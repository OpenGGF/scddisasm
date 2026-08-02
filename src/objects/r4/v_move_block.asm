; ------------------------------------------------------------------------------

VMoveBlockObject:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.b	d0,d0
	move.w	off_20C2A6(pc,d0.w),d0
	jmp	off_20C2A6(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C2A6:
	dc.w	VMoveBlockObject_0_Routine0-*
	dc.w	VMoveBlockObject_0_Routine0-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine4-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine6-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine8-off_20C2A6
	dc.w	VMoveBlockObject_0_RoutineA-off_20C2A6
	dc.w	VMoveBlockObject_0_RoutineC-off_20C2A6
	dc.w	VMoveBlockObject_0_RoutineE-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine10-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine12-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine14-off_20C2A6
	dc.w	VMoveBlockObject_0_Routine16-off_20C2A6

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine4:
	rts

; ------------------------------------------------------------------------------

sub_20C2C0:
	movem.l	d2-d3,-(sp)
	lea	(player_object).w,a1
	jsr	SolidObject
	movem.l	(sp)+,d2-d3
	rts

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine0:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C2F2(pc,d0.w),d0
	jsr	off_20C2F2(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C2F2:
	dc.w	VMoveBlockObject_1_Routine0-*
	dc.w	VMoveBlockObject_1_Routine2-off_20C2F2

; ------------------------------------------------------------------------------

VMoveBlockObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C3DE,obj.sprite_data(a0)
	move.w	obj.y(a0),d0
	addi.w	#$40,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20C36C
	move.w	obj.x(a0),obj.var_36(a0)
	moveq	#1,d1
	moveq	#5,d2

loc_20C33C:
	jsr	SpawnObject
	bne.s	loc_20C366
	move.b	#$23,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.b	d1,obj.var_3c(a1)

loc_20C366:
	addq.b	#1,d1
	dbf	d2,loc_20C33C

loc_20C36C:
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	lea	byte_20C386(pc,d0.w),a1
	move.b	(a1)+,obj.var_3a(a0)
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	bra.s	VMoveBlockObject_1_Routine2

; ------------------------------------------------------------------------------

byte_20C386:
	dc.b	$C0, 0
	dc.b	$A8, $E0
	dc.b	$90, $C0
	dc.b	$78, $A0
	dc.b	$D8, $20
	dc.b	$F0, $40
	dc.b	8, $60

; ------------------------------------------------------------------------------

VMoveBlockObject_1_Routine2:
	moveq	#6,d2
	moveq	#0,d3

loc_20C398:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_20C3A2
	bsr.w	sub_20C2C0

loc_20C3A2:
	move.l	obj.y(a0),-(sp)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	move.w	d0,d1
	asl.w	d2,d0
	asl.w	d3,d1
	add.w	d1,d0
	asr.w	#8,d0
	addq.b	#1,obj.var_3a(a0)
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	swap	d0
	sub.l	(sp)+,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	tst.w	obj.y_speed(a0)
	bmi.s	locret_20C3DC
	bsr.w	sub_20C2C0

locret_20C3DC:
	rts

; ------------------------------------------------------------------------------

Spr_20C3DE:
	dc.w	@Spr_20C3DE_0-*

@Spr_20C3DE_0:
	dc.b	4
	dc.b	$C0, $F, 0, 0, $F0
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	0, $F, 0, 0, $F0
	dc.b	$20, $F, 0, $10, $F0
	dc.b	0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C414(pc,d0.w),d0
	jsr	off_20C414(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C414:
	dc.w	VMoveBlockObject_3_Routine0-*
	dc.w	VMoveBlockObject_3_Routine2-off_20C414

; ------------------------------------------------------------------------------

VMoveBlockObject_3_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C462,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),d0
	subi.w	#$50,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$60,obj.height(a0)
	move.b	#$40,obj.var_3a(a0)

VMoveBlockObject_3_Routine2:
	moveq	#6,d2
	moveq	#4,d3
	bra.w	loc_20C398

; ------------------------------------------------------------------------------

Spr_20C462:
	dc.w	@Spr_20C462_0-*

@Spr_20C462_0:
	dc.b	$C
	dc.b	$A0, $F, 0, 0, $E0
	dc.b	$A0, $F, 0, $10, 0
	dc.b	$C0, $F, 0, $10, $E0
	dc.b	$C0, $F, 0, 0, 0
	dc.b	$E0, $F, 0, $10, $E0
	dc.b	$E0, $F, 0, 0, 0
	dc.b	0, $F, 0, 0, $E0
	dc.b	0, $F, 0, $10, 0
	dc.b	$20, $F, 0, $10, $E0
	dc.b	$20, $F, 0, 0, 0
	dc.b	$40, $F, 0, 0, $E0
	dc.b	$40, $F, 0, $10, 0
	dc.b	0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C4C0(pc,d0.w),d0
	jsr	off_20C4C0(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C4C0:
	dc.w	VMoveBlockObject_4_Routine0-*
	dc.w	VMoveBlockObject_4_Routine2-off_20C4C0

; ------------------------------------------------------------------------------

sub_20C4C4:
	move.b	#$23,obj.id(a1)
	move.b	#4,obj.subtype(a1)
	move.b	d0,obj.var_3c(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	obj.x(a0),d1
	move.w	d1,obj.x(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	rts

; ------------------------------------------------------------------------------

VMoveBlockObject_4_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C5CA,obj.sprite_data(a0)
	move.w	obj.y(a0),d0
	addi.w	#$30,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$12,obj.width_2(a0)
	move.b	#$30,obj.height(a0)
	move.b	#$C0,obj.var_3a(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20C532
	move.w	obj.x(a0),obj.var_36(a0)

loc_20C532:
	jsr	SpawnObject
	bne.s	loc_20C562
	move.b	#$22,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$40,obj.var_39(a1)
	move.b	#1,obj.subtype(a1)

loc_20C562:
	tst.b	obj.var_3c(a0)
	bne.s	VMoveBlockObject_4_Routine2
	jsr	SpawnObject
	bne.s	loc_20C57A
	moveq	#1,d0
	move.w	#-$50,d1
	bsr.w	sub_20C4C4

loc_20C57A:
	jsr	SpawnObject
	bne.s	VMoveBlockObject_4_Routine2
	moveq	#2,d0
	move.w	#$50,d1
	bsr.w	sub_20C4C4

VMoveBlockObject_4_Routine2:
	move.w	obj.y(a0),-(sp)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	move.w	d0,d1
	add.w	d0,d0
	add.w	d1,d0
	asr.w	#4,d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	addq.b	#1,obj.var_3a(a0)
	move.w	(sp)+,d1
	sub.w	d1,d0
	asl.w	#8,d0
	move.w	d0,obj.y_speed(a0)
	move.w	obj.var_34(a0),d1
	beq.s	loc_20C5C6
	movea.w	d1,a1
	move.w	d0,obj.y_speed(a1)

loc_20C5C6:
	bra.w	sub_20C2C0

; ------------------------------------------------------------------------------

Spr_20C5CA:
	dc.w	@Spr_20C5CA_0-*

@Spr_20C5CA_0:
	dc.b	3
	dc.b	$D0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$10, $F, 0, $10, $F0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_RoutineA:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C5FA(pc,d0.w),d0
	jsr	off_20C5FA(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C5FA:
	dc.w	VMoveBlockObject_5_Routine0-*
	dc.w	VMoveBlockObject_5_Routine2-off_20C5FA

; ------------------------------------------------------------------------------

sub_20C5FE:
	move.b	#$23,obj.id(a1)
	move.b	#5,obj.subtype(a1)
	move.b	d0,obj.var_3c(a1)
	move.b	d2,obj.var_3a(a1)
	add.w	obj.x(a0),d1
	move.w	d1,obj.x(a1)
	add.w	obj.y(a0),d3
	move.w	d3,obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	rts

; ------------------------------------------------------------------------------

VMoveBlockObject_5_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C6CA,obj.sprite_data(a0)
	move.w	obj.y(a0),d0
	addi.w	#$40,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#$41,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	VMoveBlockObject_5_Routine2
	move.w	obj.x(a0),d0
	move.w	d0,obj.var_36(a0)
	move.b	#0,obj.var_3a(a0)
	jsr	SpawnObject
	bne.s	loc_20C68E
	moveq	#1,d0
	move.w	#$20,d1
	move.w	#-$20,d3
	move.b	#$F0,d2
	bsr.w	sub_20C5FE

loc_20C68E:
	jsr	SpawnObject
	bne.s	loc_20C6A8
	moveq	#1,d0
	move.w	#$40,d1
	move.w	#-$40,d3
	move.b	#$E0,d2
	bsr.w	sub_20C5FE

loc_20C6A8:
	jsr	SpawnObject
	bne.s	VMoveBlockObject_5_Routine2
	moveq	#1,d0
	move.w	#$60,d1
	move.w	#-$60,d3
	move.b	#$D0,d2
	bsr.w	sub_20C5FE

VMoveBlockObject_5_Routine2:
	moveq	#6,d2
	moveq	#0,d3
	bra.w	loc_20C398

; ------------------------------------------------------------------------------

Spr_20C6CA:
	dc.w	@Spr_20C6CA_0-*

@Spr_20C6CA_0:
	dc.b	4
	dc.b	$C0, $F, 0, 0, $F0
	dc.b	$E0, $F, 0, 0, $F0
	dc.b	0, $F, 0, 0, $F0
	dc.b	$20, $F, 0, 0, $F0
	dc.b	0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_RoutineC:
	tst.b	obj.routine(a0)
	bne.w	loc_20C746
	addq.b	#2,obj.routine(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	moveq	#0,d1
	moveq	#6,d2

loc_20C6F8:
	jsr	SpawnObject
	bne.s	loc_20C730
	move.b	#$23,obj.id(a1)
	move.b	#9,obj.subtype(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$FF,obj.var_3d(a1)
	lea	byte_20C738(pc,d1.w),a2
	move.b	(a2)+,obj.var_3a(a1)
	move.b	(a2)+,d0
	ext.w	d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)

loc_20C730:
	addq.b	#2,d1
	dbf	d2,loc_20C6F8
	bra.s	loc_20C746

; ------------------------------------------------------------------------------

byte_20C738:
	dc.b	0, 0
	dc.b	$20, $E0
	dc.b	$40, $C0
	dc.b	$60, $A0
	dc.b	$20, $20
	dc.b	$40, $40
	dc.b	$60, $60

; ------------------------------------------------------------------------------

loc_20C746:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

VMoveBlockObject_0_RoutineE:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C76E(pc,d0.w),d0
	jsr	off_20C76E(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C76E:
	dc.w	VMoveBlockObject_6_Routine0-*
	dc.w	VMoveBlockObject_6_Routine2-off_20C76E

; ------------------------------------------------------------------------------

sub_20C772:
	move.b	#$23,obj.id(a1)
	move.b	#7,obj.subtype(a1)
	move.b	d0,obj.var_3c(a1)
	move.b	d2,obj.var_3a(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	obj.x(a0),d1
	move.w	d1,obj.x(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	rts

; ------------------------------------------------------------------------------

VMoveBlockObject_6_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C6CA,obj.sprite_data(a0)
	move.w	obj.y(a0),d0
	addi.w	#$40,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	VMoveBlockObject_6_Routine2
	move.w	obj.x(a0),d0
	addi.w	#$30,d0
	move.w	d0,obj.var_36(a0)
	move.b	#$C0,obj.var_3a(a0)
	jsr	SpawnObject
	bne.s	loc_20C800
	moveq	#1,d0
	move.w	#$20,d1
	move.b	#$E0,d2
	bsr.w	sub_20C772

loc_20C800:
	jsr	SpawnObject
	bne.s	loc_20C816
	moveq	#1,d0
	move.w	#$40,d1
	move.b	#0,d2
	bsr.w	sub_20C772

loc_20C816:
	jsr	SpawnObject
	bne.s	VMoveBlockObject_6_Routine2
	moveq	#1,d0
	move.w	#$60,d1
	move.b	#$20,d2
	bsr.w	sub_20C772

VMoveBlockObject_6_Routine2:
	moveq	#6,d2
	moveq	#0,d3
	bra.w	loc_20C398

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine10:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C86A(pc,d0.w),d0
	jsr	off_20C86A(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_34(a0),d0
	beq.s	loc_20C85A
	movea.w	d0,a1
	cmpi.b	#$23,obj.id(a1)
	bne.s	loc_20C864
	rts

; ------------------------------------------------------------------------------

loc_20C85A:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20C864:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

off_20C86A:
	dc.w	VMoveBlockObject_7_Routine0-*
	dc.w	VMoveBlockObject_7_Routine2-off_20C86A

; ------------------------------------------------------------------------------

VMoveBlockObject_7_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C974,obj.sprite_data(a0)
	move.w	obj.y(a0),d0
	subi.w	#$20,d0
	move.w	d0,obj.var_32(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$30,obj.height(a0)
	tst.b	obj.var_3d(a0)
	bne.s	loc_20C8B0
	move.w	obj.x(a0),obj.var_36(a0)

loc_20C8B0:
	tst.b	obj.var_3c(a0)
	bne.w	VMoveBlockObject_7_Routine2
	jsr	SpawnObject
	bne.w	VMoveBlockObject_7_Routine2
	move.b	#$23,obj.id(a1)
	move.b	#1,obj.var_3c(a1)
	move.b	#8,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	#$A0,d1
	add.w	obj.y(a0),d1
	move.w	d1,obj.y(a1)
	move.b	obj.var_3a(a0),obj.var_3a(a1)
	move.b	obj.var_3d(a0),obj.var_3d(a1)
	tst.b	obj.var_3d(a0)
	bne.s	VMoveBlockObject_7_Routine2
	moveq	#1,d1
	moveq	#1,d2

loc_20C902:
	jsr	SpawnObject
	bne.s	loc_20C93E
	move.b	#$23,obj.id(a1)
	move.b	#8,obj.subtype(a1)
	move.b	d1,obj.var_3d(a1)
	move.b	#$80,obj.var_3a(a1)
	moveq	#-$40,d0
	cmpi.b	#1,d1
	beq.s	loc_20C92A
	neg.w	d0

loc_20C92A:
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)

loc_20C93E:
	addq.b	#1,d1
	dbf	d2,loc_20C902

VMoveBlockObject_7_Routine2:
	move.w	obj.y(a0),-(sp)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	add.w	d0,d0
	asr.w	#4,d0
	addi.w	#$80,obj.var_3a(a0)
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	move.w	(sp)+,d1
	sub.w	d1,d0
	asl.w	#8,d0
	move.w	d0,obj.y_speed(a0)
	bra.w	sub_20C2C0

; ------------------------------------------------------------------------------

Spr_20C974:
	dc.w	@Spr_20C974_0-*

@Spr_20C974_0:
	dc.b	6
	dc.b	$D0, $F, 0, 0, $E0
	dc.b	$D0, $F, 0, $10, 0
	dc.b	$F0, $F, 0, $10, $E0
	dc.b	$F0, $F, 0, 0, 0
	dc.b	$10, $F, 0, 0, $E0
	dc.b	$10, $F, 0, $10, 0
	dc.b	0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine12:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C9CA(pc,d0.w),d0
	jsr	off_20C9CA(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_34(a0),d0
	beq.s	loc_20C9BA
	movea.w	d0,a1
	tst.b	0(a1)
	beq.s	loc_20C9C4
	rts

; ------------------------------------------------------------------------------

loc_20C9BA:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20C9C4:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

off_20C9CA:
	dc.w	VMoveBlockObject_8_Routine0-*
	dc.w	VMoveBlockObject_8_Routine2-off_20C9CA

; ------------------------------------------------------------------------------

VMoveBlockObject_8_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20CA56,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	locret_20CA4C
	jsr	SpawnObject
	bne.s	locret_20CA4C
	move.b	#$23,obj.id(a1)
	move.b	#1,obj.var_3c(a1)
	move.b	#9,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	#$80,d1
	move.b	obj.var_3a(a0),d0
	tst.b	obj.var_3d(a0)
	bpl.s	loc_20CA40
	move.w	#$A0,d1
	subi.b	#$80,d0

loc_20CA40:
	move.b	d0,obj.var_3a(a1)
	add.w	obj.y(a0),d1
	move.w	d1,obj.y(a1)

locret_20CA4C:
	rts

; ------------------------------------------------------------------------------

VMoveBlockObject_8_Routine2:
	moveq	#5,d2
	moveq	#0,d3
	bra.w	loc_20C398

; ------------------------------------------------------------------------------

Spr_20CA56:
	dc.w	@Spr_20CA56_0-*
	dc.w	@Spr_20CA56_1-Spr_20CA56

@Spr_20CA56_0:
	dc.b	2
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	0, $F, 0, $10, $F0
	dc.b	0

@Spr_20CA56_1:
	dc.b	6
	dc.b	$A0, $F, 0, $10, $F0
	dc.b	$C0, $F, 0, $10, $F0
	dc.b	$E0, $F, 0, 0, $F0
	dc.b	0, $F, 0, 0, $F0
	dc.b	$20, $F, 0, $10, $F0
	dc.b	$40, $F, 0, $10, $F0
	dc.b	0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine14:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CABA(pc,d0.w),d0
	jsr	off_20CABA(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_34(a0),d0
	beq.s	loc_20CAAA
	movea.w	d0,a1
	tst.b	obj.id(a1)
	beq.s	loc_20CAB4
	rts

; ------------------------------------------------------------------------------

loc_20CAAA:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20CAB4:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

off_20CABA:
	dc.w	VMoveBlockObject_9_Routine0-*
	dc.w	VMoveBlockObject_9_Routine2-off_20CABA

; ------------------------------------------------------------------------------

VMoveBlockObject_9_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20CB5C,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20CB40
	move.w	obj.x(a0),obj.var_36(a0)
	moveq	#1,d1
	moveq	#5,d2

loc_20CAFE:
	jsr	SpawnObject
	bne.s	loc_20CB3A
	move.b	#$23,obj.id(a1)
	move.b	#$A,obj.subtype(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.b	d1,obj.var_3c(a1)
	move.b	d1,d0
	add.b	d0,d0
	lea	byte_20CB42(pc,d0.w),a2
	move.b	(a2)+,obj.var_3a(a1)
	move.b	(a2)+,d0
	ext.w	d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)

loc_20CB3A:
	addq.b	#1,d1
	dbf	d2,loc_20CAFE

loc_20CB40:
	bra.s	VMoveBlockObject_9_Routine2

; ------------------------------------------------------------------------------

byte_20CB42:
	dc.b	0, 0
	dc.b	$E0, $E0
	dc.b	$C0, $C0
	dc.b	$A0, $A0
	dc.b	$E0, $20
	dc.b	$C0, $40
	dc.b	$A0, $60

; ------------------------------------------------------------------------------

VMoveBlockObject_9_Routine2:
	move.w	#$30,d2
	moveq	#5,d2
	moveq	#4,d3
	bra.w	loc_20C398

; ------------------------------------------------------------------------------

Spr_20CB5C:
	dc.w	@Spr_20CB5C_0-*

@Spr_20CB5C_0:
	dc.b	1
	dc.b	$F0, $F, 0, $10, $F0

; ------------------------------------------------------------------------------

VMoveBlockObject_0_Routine16:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CB98(pc,d0.w),d0
	jsr	off_20CB98(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_34(a0),d0
	beq.s	loc_20CB88
	movea.w	d0,a1
	tst.b	0(a1)
	beq.s	loc_20CB92
	rts

; ------------------------------------------------------------------------------

loc_20CB88:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20CB92:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

off_20CB98:
	dc.w	VMoveBlockObject_A_Routine0-*
	dc.w	VMoveBlockObject_A_Routine2-off_20CB98

; ------------------------------------------------------------------------------

VMoveBlockObject_A_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20CA56,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	clr.b	obj.sprite_frame(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20CC0A
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	moveq	#1,d1
	moveq	#4,d2

loc_20CBE0:
	jsr	SpawnObject
	bne.s	loc_20CC04
	move.b	#$23,obj.id(a1)
	move.b	#$B,obj.subtype(a1)
	move.b	d1,obj.var_3c(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.var_32(a1)

loc_20CC04:
	addq.b	#1,d1
	dbf	d2,loc_20CBE0

loc_20CC0A:
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	byte_20CC38(pc,d0.w),a1
	move.b	(a1)+,d0
	ext.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.b	(a1)+,d0
	ext.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	move.w	(a1)+,d0
	move.w	d0,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

byte_20CC38:
	dc.b	0, 0
	dc.w	$80
	dc.b	0, $80
	dc.w	$80
	dc.b	$B0, $20
	dc.w	-$100
	dc.b	$B0, $A0
	dc.w	-$100
	dc.b	$50, $20
	dc.w	-$100
	dc.b	$50, $A0
	dc.w	-$100

; ------------------------------------------------------------------------------

VMoveBlockObject_A_Routine2:
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	obj.y(a0),d0
	move.l	d0,obj.y(a0)
	bsr.s	sub_20CC66
	bra.w	sub_20C2C0

; ------------------------------------------------------------------------------

sub_20CC66:
	tst.w	obj.y_speed(a0)
	bpl.w	loc_20CC8C
	move.w	obj.var_32(a0),d0
	sub.w	obj.y(a0),d0
	bcs.s	locret_20CC8A
	cmpi.w	#$80,d0
	bcs.s	locret_20CC8A
	move.w	obj.var_32(a0),d0
	addi.w	#$80,d0
	move.w	d0,obj.y(a0)

locret_20CC8A:
	rts

; ------------------------------------------------------------------------------

loc_20CC8C:
	move.w	obj.y(a0),d0
	sub.w	obj.var_32(a0),d0
	bcs.s	locret_20CCA8
	cmpi.w	#$80,d0
	bcs.s	locret_20CCA8
	move.w	obj.var_32(a0),d0
	subi.w	#$80,d0
	move.w	d0,obj.y(a0)

locret_20CCA8:
	rts

; ------------------------------------------------------------------------------