; ------------------------------------------------------------------------------

EggmanObject:
	bclr	#6,obj.var_2c(a0)
	tst.b	obj.var_2b(a0)
	beq.s	loc_20C3F8
	subq.b	#1,obj.var_2b(a0)
	bne.s	loc_20C3FC
	move.b	#0,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	bra.s	loc_20C3FC

; ------------------------------------------------------------------------------

loc_20C3F8:
	bsr.w	sub_20C7AA

loc_20C3FC:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C41E(pc,d0.w),d0
	jsr	off_20C41E(pc,d0.w)
	lea	(EggmanAnims).l,a1
	jsr	AnimateObject
	jsr	DrawObject
	rts

; ------------------------------------------------------------------------------

off_20C41E:
	dc.w	EggmanObject_0_Routine0-*
	dc.w	EggmanObject_0_Routine2-off_20C41E
	dc.w	EggmanObject_0_Routine4-off_20C41E
	dc.w	EggmanObject_0_Routine6-off_20C41E
	dc.w	EggmanObject_0_Routine8-off_20C41E
	dc.w	EggmanObject_0_RoutineA-off_20C41E
	dc.w	EggmanObject_0_RoutineC-off_20C41E
	dc.w	EggmanObject_0_RoutineE-off_20C41E
	dc.w	EggmanObject_0_Routine10-off_20C41E
	dc.w	EggmanObject_0_Routine12-off_20C41E
	dc.w	EggmanObject_0_Routine14-off_20C41E
	dc.w	EggmanObject_0_Routine16-off_20C41E
	dc.w	EggmanObject_0_Routine18-off_20C41E
	dc.w	EggmanObject_0_Routine1A-off_20C41E

; ------------------------------------------------------------------------------

EggmanObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$2C,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#EggmanSprites,obj.sprite_data(a0)
	move.b	#2,obj.collide_status(a0)
	bsr.w	sub_20CED2

EggmanObject_0_Routine2:
	move.w	#$9B0,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	lea	(player_object).w,a1
	move.w	obj.x(a1),d0
	subi.w	#$A0,d0
	cmp.w	(left_bound).w,d0
	blt.s	locret_20C4BC
	cmpi.w	#$A50,obj.x(a1)
	blt.s	loc_20C4B4
	move.w	#$67,d0
	jsr	SubCpuCommand
	move.b	#6,obj.routine(a0)
	move.w	#$9B0,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	move.w	#$9B0,d0

loc_20C4B4:
	move.w	d0,(left_bound).w
	move.w	d0,(target_left_bound).w

locret_20C4BC:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine6:
	bsr.w	sub_20C514
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$A,obj.var_2a(a0)
	bne.w	loc_20C4D6
	jsr	sub_20CEA2

loc_20C4D6:
	cmpi.b	#$14,obj.var_2a(a0)
	beq.s	loc_20C4E6
	cmpi.b	#$1E,obj.var_2a(a0)
	bcs.s	locret_20C512

loc_20C4E6:
	move.w	#$B6,d0
	jsr	PlayFmSound
	clr.b	obj.var_2a(a0)
	jsr	sub_20CEAE
	move.b	obj.var_2d(a0),obj.var_2d(a1)
	addq.b	#1,obj.var_2d(a0)
	cmpi.b	#$10,obj.var_2d(a0)
	bne.s	locret_20C512
	move.b	#8,obj.routine(a0)

locret_20C512:
	rts

; ------------------------------------------------------------------------------

sub_20C514:
	cmpi.w	#$520,obj.y(a0)
	bge.s	loc_20C526
	addi.l	#$4650,obj.y(a0)
	bra.s	locret_20C53A

; ------------------------------------------------------------------------------

loc_20C526:
	move.w	#$AB0,obj.x(a0)
	clr.w	obj.x+2(a0)
	move.w	#$520,obj.y(a0)
	clr.w	obj.y+2(a0)

locret_20C53A:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine8:
	bsr.s	sub_20C514
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$96,obj.var_2a(a0)
	bne.s	locret_20C554
	clr.b	obj.var_2a(a0)
	move.b	#$A,obj.routine(a0)

locret_20C554:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineA:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$96,obj.var_2a(a0)
	bne.s	locret_20C58A
	move.b	#$C,obj.routine(a0)
	move.w	#$60,obj.var_3c(a0)
	move.w	#$40,obj.x_speed(a0)
	move.w	#0,obj.var_34(a0)
	move.w	#$60,obj.var_38(a0)
	move.w	#0,obj.var_3a(a0)
	clr.b	obj.var_2a(a0)

locret_20C58A:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineC:
	bsr.w	sub_20C7E6
	addi.w	#$100,obj.var_34(a0)
	cmpi.w	#$800,obj.var_34(a0)
	bne.s	loc_20C5A4
	jsr	sub_20CEFA

loc_20C5A4:
	cmpi.w	#$8000,obj.var_34(a0)
	beq.s	loc_20C5C2
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.x(a0)
	move.w	obj.var_3a(a0),d0
	sub.w	d0,obj.y(a0)
	bsr.w	sub_20CE72
	rts

; ------------------------------------------------------------------------------

loc_20C5C2:
	clr.b	obj.var_2a(a0)
	move.b	#$10,obj.routine(a0)
	bset	#4,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineE:
	bsr.w	sub_20C7E6
	subi.w	#$100,obj.var_34(a0)
	cmpi.w	#$7800,obj.var_34(a0)
	bne.s	loc_20C5EC
	jsr	sub_20CEFA

loc_20C5EC:
	cmpi.w	#0,obj.var_34(a0)
	beq.s	loc_20C60A
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.x(a0)
	move.w	obj.var_3a(a0),d0
	sub.w	d0,obj.y(a0)
	bsr.w	sub_20CE72
	rts

; ------------------------------------------------------------------------------

loc_20C60A:
	clr.b	obj.var_2a(a0)
	move.b	#$10,obj.routine(a0)
	bset	#4,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine10:
	bclr	#4,obj.var_2c(a0)
	bclr	#5,obj.var_2c(a0)
	bsr.w	sub_20C7E6
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$30,obj.var_2a(a0)
	beq.s	loc_20C642
	cmpi.b	#$60,obj.var_2a(a0)
	beq.s	loc_20C660
	rts

; ------------------------------------------------------------------------------

loc_20C642:
	movea.w	obj.var_30(a0),a1
	bchg	#0,obj.sprite_flags(a1)
	bchg	#0,obj.flags(a1)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C660:
	clr.b	obj.var_2a(a0)
	btst	#0,obj.flags(a0)
	beq.s	loc_20C67A
	bset	#3,obj.var_2c(a0)
	move.b	#$E,obj.routine(a0)
	bra.s	loc_20C686

; ------------------------------------------------------------------------------

loc_20C67A:
	bclr	#3,obj.var_2c(a0)
	move.b	#$C,obj.routine(a0)

loc_20C686:
	moveq	#0,d0
	move.b	obj.var_33(a0),d0
	move.b	byte_20C6AC(pc,d0.w),d0
	bmi.s	locret_20C69E
	cmp.b	obj.var_2d(a0),d0
	blt.w	locret_20C69E
	bsr.s	sub_20C6A0
	bra.s	loc_20C686

; ------------------------------------------------------------------------------

locret_20C69E:
	rts

; ------------------------------------------------------------------------------

sub_20C6A0:
	addq.b	#1,obj.var_33(a0)
	move.b	#$16,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

byte_20C6AC:
	dc.b	$E
	dc.b	$C
	dc.b	$A
	dc.b	8
	dc.b	6
	dc.b	4
	dc.b	$FF
	dc.b	$FF

; ------------------------------------------------------------------------------

EggmanObject_0_Routine16:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$14,obj.var_2a(a0)
	beq.s	loc_20C6DC
	cmpi.b	#$15,obj.var_2a(a0)
	beq.s	loc_20C6EC
	cmpi.b	#$2D,obj.var_2a(a0)
	beq.s	loc_20C6D4
	bra.w	loc_20C6F2

; ------------------------------------------------------------------------------

loc_20C6D4:
	jsr	sub_20CEFA
	bra.s	loc_20C6F2

; ------------------------------------------------------------------------------

loc_20C6DC:
	bsr.w	loc_20C7C8
	clr.b	obj.var_32(a0)
	bset	#5,obj.var_2c(a0)
	bra.s	loc_20C6F2

; ------------------------------------------------------------------------------

loc_20C6EC:
	bclr	#5,obj.var_2c(a0)

loc_20C6F2:
	btst	#3,obj.var_2c(a0)
	bne.s	loc_20C70C
	subi.l	#$10000,obj.x(a0)
	cmpi.w	#$9F0,obj.x(a0)
	ble.s	loc_20C71E
	bra.s	locret_20C71C

; ------------------------------------------------------------------------------

loc_20C70C:
	addi.l	#$10000,obj.x(a0)
	cmpi.w	#$AB0,obj.x(a0)
	bge.s	loc_20C71E

locret_20C71C:
	rts

; ------------------------------------------------------------------------------

loc_20C71E:
	neg.l	obj.var_38(a0)
	addi.w	#-$8000,obj.var_34(a0)
	move.w	#$A50,obj.x(a0)
	clr.w	obj.x+2(a0)
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.x(a0)
	move.w	#$520,obj.y(a0)
	clr.w	obj.y+2(a0)
	clr.b	obj.var_2a(a0)
	move.b	#$10,obj.routine(a0)
	bset	#4,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine18:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine1A:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine4:
	lea	(word_202BA4+2).l,a1
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	addq.w	#6,(right_bound).w
	addq.w	#6,(target_right_bound).w
	cmp.w	(right_bound).w,d1
	ble.s	loc_20C77A
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

loc_20C77A:
	clr.b	(boss_started).w
	move.w	d1,(right_bound).w
	move.w	d1,(target_right_bound).w
	move.w	#$17,d0
	tst.b	(good_future).l
	beq.s	loc_20C796
	move.w	#$16,d0

loc_20C796:
	jsr	SubCpuCommand
	jsr	LoadCapsulePalette
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20C7AA:
	tst.b	obj.anim_id(a0)
	bne.s	locret_20C7C6
	lea	(player_object).w,a1
	tst.w	obj.var_30(a1)
	bne.w	loc_20C7C8
	cmpi.b	#6,$24(a1)
	beq.w	loc_20C7C8

locret_20C7C6:
	rts

; ------------------------------------------------------------------------------

loc_20C7C8:
	move.b	#$78,obj.var_2b(a0)
	move.b	#1,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	rts

; ------------------------------------------------------------------------------

sub_20C7E6:
	tst.b	obj.collide_type(a0)
	beq.s	loc_20C7EE
	rts

; ------------------------------------------------------------------------------

loc_20C7EE:
	move.b	#$3C,obj.collide_type(a0)
	cmpi.b	#1,obj.collide_status(a0)
	beq.s	loc_20C7FE
	rts

; ------------------------------------------------------------------------------

loc_20C7FE:
	clr.b	obj.var_2a(a0)
	move.b	#$12,obj.routine(a0)
	bset	#7,obj.var_2c(a0)
	move.b	#2,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	bra.w	*+4

; ------------------------------------------------------------------------------

EggmanObject_0_Routine12:
	moveq	#0,d0
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$3C,obj.var_2a(a0)
	bcc.s	loc_20C83A
	bsr.w	sub_20C928

loc_20C83A:
	cmpi.b	#$3C,obj.var_2a(a0)
	beq.s	loc_20C84C
	cmpi.b	#$3D,obj.var_2a(a0)
	beq.s	loc_20C874
	rts

; ------------------------------------------------------------------------------

loc_20C84C:
	move.b	#3,obj.anim_id(a0)
	move.b	#$FF,obj.var_2b(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	movea.w	obj.var_30(a0),a1
	move.b	#1,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C874:
	clr.b	obj.var_2a(a0)
	move.b	#$14,obj.routine(a0)
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	movea.w	obj.var_30(a0),a1
	bset	#0,obj.sprite_flags(a1)
	bset	#0,obj.flags(a1)
	moveq	#100,d0
	jsr	AddPoints
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine14:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$3C,obj.var_2a(a0)
	bcs.s	locret_20C8C0
	addi.l	#$1C000,obj.x(a0)
	cmpi.w	#$B30,obj.x(a0)
	bge.s	loc_20C8C2

locret_20C8C0:
	rts

; ------------------------------------------------------------------------------

loc_20C8C2:
	move.b	#4,obj.routine(a0)
	movea.w	obj.var_30(a0),a1
	jsr	DeleteOtherObject
	rts

; ------------------------------------------------------------------------------

EggMobileObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C8E8(pc,d0.w),d0
	jsr	off_20C8E8(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C8E8:
	dc.w	EggMobileObject_0_Routine0-*
	dc.w	EggMobileObject_0_Routine2-off_20C8E8

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$1C,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#EggMobileSprites,obj.sprite_data(a0)

EggMobileObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20C928:
	moveq	#0,d2
	move.b	obj.var_2a(a0),d2
	divu.w	#4,d2
	swap	d2
	tst.w	d2
	bne.s	locret_20C982
	clr.w	d2
	swap	d2
	divu.w	#10,d2
	swap	d2
	add.w	d2,d2
	add.w	d2,d2
	jsr	SpawnObject
	bne.s	locret_20C982
	st	obj.routine_2(a1)
	lea	(word_20C984).l,a2
	adda.w	d2,a2
	move.b	#$18,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,d0
	add.w	d0,obj.x(a1)
	move.w	(a2),d0
	add.w	d0,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20C982:
	rts

; ------------------------------------------------------------------------------

word_20C984:
	dc.w	-$30, -$10
	dc.w	$30, $10
	dc.w	-$10, -$10
	dc.w	$10, $10
	dc.w	-$20, 0
	dc.w	$30, -$10
	dc.w	-$30, $10
	dc.w	-$10, $10
	dc.w	$10, -$10
	dc.w	$20, 0

; ------------------------------------------------------------------------------

BossBubbleObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C9C0(pc,d0.w),d0
	jsr	off_20C9C0(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C9C0:
	dc.w	BossBubbleObject_0_Routine0-*
	dc.w	BossBubbleObject_0_Routine2-off_20C9C0
	dc.w	BossBubbleObject_0_Routine4-off_20C9C0
	dc.w	BossBubbleObject_0_Routine6-off_20C9C0
	dc.w	BossBubbleObject_0_Routine8-off_20C9C0
	dc.w	BossBubbleObject_0_RoutineA-off_20C9C0
	dc.w	BossBubbleObject_0_RoutineC-off_20C9C0
	dc.w	BossBubbleObject_0_RoutineE-off_20C9C0
	dc.w	BossBubbleObject_0_Routine10-off_20C9C0

; ------------------------------------------------------------------------------

BossBubbleObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#BossBubbleSprites,obj.sprite_data(a0)
	jsr	Random
	andi.l	#$FFFF,d0
	ext.l	d0
	divs.w	#$500,d0
	swap	d0
	tst.w	d0
	bmi.s	loc_20CA1C
	addi.w	#$80,d0
	bra.s	loc_20CA20

; ------------------------------------------------------------------------------

loc_20CA1C:
	subi.w	#$80,d0

loc_20CA20:
	move.w	d0,obj.var_36(a0)
	jsr	Random
	andi.l	#$FFFF,d0
	divu.w	#$10,d0
	swap	d0
	addi.w	#$A,d0
	move.w	d0,obj.var_3c(a0)

BossBubbleObject_0_Routine2:
	subi.l	#$18000,obj.y(a0)
	tst.b	obj.routine_2(a0)
	beq.s	loc_20CA58
	cmpi.w	#$470,obj.y(a0)
	bge.s	loc_20CA68
	bra.w	BossBubbleObject_0_RoutineE

; ------------------------------------------------------------------------------

loc_20CA58:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.y(a1),d0
	cmp.w	obj.y(a0),d0
	bge.w	loc_20CA72

loc_20CA68:
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.var_34(a0)
	bra.s	loc_20CAB6

; ------------------------------------------------------------------------------

loc_20CA72:
	move.w	obj.x(a0),d0
	sub.w	8(a1),d0
	bge.s	loc_20CA84
	move.w	#0,obj.var_34(a0)
	bra.s	loc_20CA8A

; ------------------------------------------------------------------------------

loc_20CA84:
	move.w	#$8000,obj.var_34(a0)

loc_20CA8A:
	move.w	d0,obj.var_3c(a0)
	move.w	d0,obj.x_speed(a0)
	neg.w	d0
	move.w	d0,obj.var_38(a0)
	clr.w	obj.var_3a(a0)
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	#4,obj.routine(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CAB6:
	move.w	obj.var_38(a0),d3
	sub.w	d3,obj.x(a0)
	bsr.w	sub_20CE72
	cmpi.b	#4,obj.anim_index(a0)
	bne.s	loc_20CAD4
	move.b	#1,obj.anim_id(a0)
	clr.b	obj.anim_index(a0)

loc_20CAD4:
	lea	(BossBubbleAnims).l,a1
	jsr	AnimateObject
	rts

; ------------------------------------------------------------------------------

BossBubbleObject_0_Routine4:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	bsr.w	sub_20CE72
	move.w	obj.var_36(a0),d0
	bmi.s	loc_20CAFE
	neg.w	d0

loc_20CAFE:
	add.w	d0,obj.var_34(a0)
	movea.w	obj.var_2e(a0),a1
	cmpi.b	#$A,obj.routine(a1)
	bne.s	locret_20CB42
	clr.w	obj.var_38(a0)
	clr.w	obj.var_3a(a0)
	move.b	#6,obj.routine(a0)
	move.l	obj.x(a1),obj.x(a0)
	move.l	obj.y(a1),obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	mulu.w	#$1000,d0
	move.w	d0,obj.var_34(a0)
	move.w	#$10,obj.var_3c(a0)
	move.w	#$10,obj.x_speed(a0)

locret_20CB42:
	rts

; ------------------------------------------------------------------------------

BossBubbleObject_0_Routine6:
	btst	#1,obj.var_2c(a0)
	beq.s	loc_20CB50
	bsr.w	loc_20CDE0

loc_20CB50:
	moveq	#0,d3
	movea.w	obj.var_2e(a0),a1
	move.l	obj.x(a1),obj.x(a0)
	move.l	obj.y(a1),obj.y(a0)
	cmpi.w	#$30,obj.var_3c(a0)
	bge.s	loc_20CB74
	addi.l	#$4000,obj.var_3c(a0)
	bra.s	loc_20CB7C

; ------------------------------------------------------------------------------

loc_20CB74:
	move.w	#$30,obj.var_3c(a0)
	addq.l	#1,d3

loc_20CB7C:
	cmpi.w	#$30,obj.x_speed(a0)
	bge.s	loc_20CB8E
	addi.l	#$4000,obj.x_speed(a0)
	bra.s	loc_20CB96

; ------------------------------------------------------------------------------

loc_20CB8E:
	move.w	#$30,obj.x_speed(a0)
	addq.l	#1,d3

loc_20CB96:
	btst	#3,obj.var_2c(a1)
	beq.s	loc_20CBA6
	addi.w	#$480,obj.var_34(a0)
	bra.s	loc_20CBAC

; ------------------------------------------------------------------------------

loc_20CBA6:
	subi.w	#$480,obj.var_34(a0)

loc_20CBAC:
	movem.l	d3,-(sp)
	bsr.w	sub_20CE72
	movem.l	(sp)+,d3
	cmpi.b	#2,obj.anim_index(a0)
	bne.s	loc_20CBCA
	move.b	#3,obj.anim_id(a0)
	clr.b	obj.anim_index(a0)

loc_20CBCA:
	cmpi.w	#2,d3
	bne.s	loc_20CBEA
	move.b	#8,obj.routine(a0)
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20CBEA
	move.b	#$FF,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)

loc_20CBEA:
	lea	(BossBubbleAnims).l,a1
	jsr	AnimateObject
	rts

; ------------------------------------------------------------------------------

BossBubbleObject_0_Routine8:
	movea.w	obj.var_2e(a0),a1
	move.l	obj.x(a1),obj.x(a0)
	move.l	obj.y(a1),obj.y(a0)
	btst	#4,obj.var_2c(a1)
	beq.s	loc_20CC1A
	move.b	#$A,obj.routine(a0)
	bra.w	BossBubbleObject_0_RoutineA

; ------------------------------------------------------------------------------

loc_20CC1A:
	btst	#5,obj.var_2c(a1)
	beq.s	loc_20CC32
	move.b	#$10,obj.routine(a0)
	move.b	#3,obj.sprite_layer(a0)
	bra.w	BossBubbleObject_0_Routine10

; ------------------------------------------------------------------------------

loc_20CC32:
	bsr.w	loc_20CDE0
	btst	#3,obj.var_2c(a1)
	beq.s	loc_20CC46
	addi.w	#$180,obj.var_34(a0)
	bra.s	loc_20CC4C

; ------------------------------------------------------------------------------

loc_20CC46:
	subi.w	#$180,obj.var_34(a0)

loc_20CC4C:
	bra.w	sub_20CE72

; ------------------------------------------------------------------------------

BossBubbleObject_0_RoutineA:
	bsr.w	loc_20CDE0
	movea.w	obj.var_2e(a0),a1
	move.l	obj.x(a1),obj.x(a0)
	move.l	obj.y(a1),obj.y(a0)
	tst.b	obj.routine_2(a0)
	bne.w	loc_20CC7E
	subi.l	#$10000,obj.var_3c(a0)
	bge.w	loc_20CCAA
	addq.b	#1,obj.routine_2(a0)
	bra.s	loc_20CCAA

; ------------------------------------------------------------------------------

loc_20CC7E:
	subi.l	#$10000,obj.var_3c(a0)
	cmpi.l	#-$300000,obj.var_3c(a0)
	bgt.s	loc_20CCAA
	move.l	#$300000,obj.var_3c(a0)
	move.b	#8,obj.routine(a0)
	bsr.w	loc_20CCEC
	bsr.s	loc_20CCAA
	clr.b	obj.routine_2(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CCAA:
	move.w	#$480,d0
	btst	#3,obj.var_2c(a1)
	bne.s	loc_20CCB8
	neg.w	d0

loc_20CCB8:
	add.w	d0,obj.var_34(a0)
	move.b	obj.var_34(a0),d0
	subi.b	#$40,d0
	movea.w	obj.var_2e(a0),a1
	btst	#3,obj.var_2c(a1)
	beq.s	loc_20CCD4
	eori.b	#$80,d0

loc_20CCD4:
	andi.b	#$80,d0
	bne.s	loc_20CCE2
	move.b	#3,obj.sprite_layer(a0)
	bra.s	loc_20CCE8

; ------------------------------------------------------------------------------

loc_20CCE2:
	move.b	#5,obj.sprite_layer(a0)

loc_20CCE8:
	bra.w	sub_20CE72

; ------------------------------------------------------------------------------

loc_20CCEC:
	move.w	obj.var_34(a0),d0
	cmpi.w	#$4000,d0
	bcc.s	loc_20CD08
	move.w	#$4000,d1
	sub.w	d0,d1
	addi.w	#$4000,d1
	move.w	d1,obj.var_34(a0)
	bra.w	locret_20CD3E

; ------------------------------------------------------------------------------

loc_20CD08:
	cmpi.w	#$8000,d0
	bcc.s	loc_20CD1C
	move.w	#$8000,d1
	sub.w	d0,d1
	move.w	d1,obj.var_34(a0)
	bra.w	locret_20CD3E

; ------------------------------------------------------------------------------

loc_20CD1C:
	cmpi.w	#$C000,d0
	bcc.s	loc_20CD30
	move.w	#$8000,d1
	sub.w	d0,d1
	move.w	d1,obj.var_34(a0)
	bra.w	locret_20CD3E

; ------------------------------------------------------------------------------

loc_20CD30:
	move.w	#$8000,d1
	sub.w	d0,d1
	move.w	d1,obj.var_34(a0)
	bra.w	*+4

; ------------------------------------------------------------------------------

locret_20CD3E:
	rts

; ------------------------------------------------------------------------------

BossBubbleObject_0_Routine10:
	bsr.w	loc_20CDE0
	movea.w	obj.var_2e(a0),a1
	move.l	obj.x(a1),obj.x(a0)
	move.l	obj.y(a1),obj.y(a0)
	subi.l	#$10000,obj.var_3c(a0)
	subi.l	#$10000,obj.x_speed(a0)
	cmpi.l	#$100000,obj.var_3c(a0)
	bgt.s	loc_20CDA0
	moveq	#0,d0
	moveq	#0,d1
	move.b	obj.var_2d(a1),d0
	add.w	d0,d0
	move.w	word_20CDBE(pc,d0.w),d0
	move.b	obj.var_32(a1),d1
	mulu.w	d0,d1
	move.w	d1,obj.var_34(a0)
	addq.b	#1,obj.var_32(a1)
	move.l	#$100000,obj.var_3c(a0)
	move.l	#$100000,obj.x_speed(a0)
	move.b	#6,obj.routine(a0)

loc_20CDA0:
	bsr.w	loc_20CDE0
	btst	#3,obj.var_2c(a1)
	beq.s	loc_20CDB4
	addi.w	#$480,obj.var_34(a0)
	bra.s	loc_20CDBA

; ------------------------------------------------------------------------------

loc_20CDB4:
	subi.w	#$480,obj.var_34(a0)

loc_20CDBA:
	bra.w	sub_20CE72

; ------------------------------------------------------------------------------

word_20CDBE:
	dc.w	0
	dc.w	0
	dc.w	$8000
	dc.w	$5555
	dc.w	$4000
	dc.w	$3333
	dc.w	$2AAA
	dc.w	$2492
	dc.w	$2000
	dc.w	$1C71
	dc.w	$1999
	dc.w	$1745
	dc.w	$1555
	dc.w	$13B1
	dc.w	$1249
	dc.w	$1111
	dc.w	$1000

; ------------------------------------------------------------------------------

loc_20CDE0:
	movea.w	obj.var_2e(a0),a1
	cmpi.b	#$14,obj.routine(a1)
	beq.w	loc_20CE0C
	tst.b	obj.collide_type(a0)
	beq.s	loc_20CDF6
	rts

; ------------------------------------------------------------------------------

loc_20CDF6:
	bset	#6,obj.var_2c(a1)
	beq.s	loc_20CE0C
	move.b	#$FF,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CE0C:
	move.b	#$C,obj.routine(a0)
	move.b	#4,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	subq.b	#1,obj.var_2d(a1)
	bra.w	*+4

; ------------------------------------------------------------------------------

BossBubbleObject_0_RoutineC:
	lea	(BossBubbleAnims).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

BossBubbleObject_0_RoutineE:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

	move.b	obj.var_34(a0),d0
	subi.b	#$40,d0
	movea.w	obj.var_2e(a0),a1
	btst	#3,obj.var_2c(a1)
	beq.s	loc_20CE5C
	eori.b	#$80,d0

loc_20CE5C:
	andi.b	#$80,d0
	bne.s	loc_20CE6A
	move.b	#3,obj.sprite_layer(a0)
	bra.s	locret_20CE70

; ------------------------------------------------------------------------------

loc_20CE6A:
	move.b	#5,obj.sprite_layer(a0)

locret_20CE70:
	rts

; ------------------------------------------------------------------------------

sub_20CE72:
	move.b	obj.var_34(a0),d0
	jsr	SineCosine
	moveq	#0,d3
	moveq	#0,d2
	move.w	obj.var_3c(a0),d3
	move.w	obj.x_speed(a0),d2
	muls.w	d0,d2
	muls.w	d1,d3
	asr.w	#8,d2
	asr.w	#8,d3
	move.w	d3,obj.var_38(a0)
	move.w	d2,obj.var_3a(a0)
	add.w	d3,obj.x(a0)
	add.w	d2,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20CEA2:
	bsr.w	sub_20CEAE
	move.b	#1,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

sub_20CEAE:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20CED0
	move.w	a3,obj.var_2e(a1)
	move.b	#$4F,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	#$5B8,obj.y(a1)

locret_20CED0:
	rts

; ------------------------------------------------------------------------------

sub_20CED2:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20CEF8
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#$4D,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

locret_20CEF8:
	rts

; ------------------------------------------------------------------------------

sub_20CEFA:
	lea	(byte_20CF5A).l,a2
	moveq	#3,d0

loc_20CF02:
	movem.l	d0/a2,-(sp)
	jsr	SpawnObject
	movem.l	(sp)+,d0/a2
	bne.s	loc_20CF56
	move.w	a0,obj.var_2e(a1)
	move.b	#$4E,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	(a2)+,d1
	ext.w	d1
	move.b	(a2)+,d2
	ext.w	d2
	move.l	(a2)+,d3
	move.l	(a2)+,d4
	btst	#0,obj.flags(a0)
	beq.s	loc_20CF40
	neg.w	d1
	neg.l	d3

loc_20CF40:
	move.w	d1,obj.var_38(a1)
	move.w	d2,obj.var_3a(a1)
	move.l	d3,obj.var_3c(a1)
	move.l	d4,obj.x_speed(a1)
	dbf	d0,loc_20CF02
	bra.s	locret_20CF58

; ------------------------------------------------------------------------------

loc_20CF56:
	nop

locret_20CF58:
	rts

; ------------------------------------------------------------------------------

byte_20CF5A:
	dc.b	$E3
	dc.b	$17
	dc.l	-$13C68
	dc.l	$13C68
	dc.b	$FA
	dc.b	$1F
	dc.l	0
	dc.l	$1C000
	dc.b	$10
	dc.b	$1C
	dc.l	$E000
	dc.l	$183F7
	dc.b	$1D
	dc.b	$11
	dc.l	$13C68
	dc.l	$13C68

; ------------------------------------------------------------------------------

BossMissileObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CFA2(pc,d0.w),d0
	jsr	off_20CFA2(pc,d0.w)
	lea	(BossMissileAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20CFA2:
	dc.w	BossMissileObject_0_Routine0-*
	dc.w	BossMissileObject_0_Routine2-off_20CFA2
	dc.w	BossMissileObject_0_Routine4-off_20CFA2

; ------------------------------------------------------------------------------

BossMissileObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#4,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#BossMissileSprites,obj.sprite_data(a0)

BossMissileObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	btst	#7,$2C(a1)
	bne.s	loc_20D03C
	move.w	8(a1),obj.x(a0)
	move.w	$C(a1),obj.y(a0)
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.var_3a(a0),d0
	add.w	d0,obj.y(a0)
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$2D,obj.var_2a(a0)
	bne.s	locret_20D016
	move.b	#$FE,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	addq.b	#2,obj.routine(a0)

locret_20D016:
	rts

; ------------------------------------------------------------------------------

BossMissileObject_0_Routine4:
	movea.w	obj.var_2e(a0),a1
	btst	#7,$2C(a1)
	bne.s	loc_20D03C
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	bsr.w	sub_20D044
	bne.s	loc_20D03C
	rts

; ------------------------------------------------------------------------------

loc_20D03C:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20D044:
	cmpi.w	#$9A0,obj.x(a0)
	blt.s	loc_20D060
	cmpi.w	#$B00,obj.x(a0)
	bgt.s	loc_20D060
	cmpi.w	#$5D0,obj.y(a0)
	bgt.s	loc_20D060
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20D060:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

EggmanAnims:
	include	"src/anims/r4/eggman.asm"
	even

EggmanSprites:
	include	"src/sprites/r4/eggman.asm"
	even

EggMobileSprites:
	include	"src/sprites/r4/eggmobile.asm"
	even

BossMissileAnims:
	include	"src/anims/r4/boss_missile.asm"
	even

BossMissileSprites:
	include	"src/sprites/r4/boss_missile.asm"
	even

BossBubbleAnims:
	include	"src/anims/r4/boss_bubble.asm"
	even

BossBubbleSprites:
	include	"src/sprites/r4/boss_bubble.asm"
	even

; ------------------------------------------------------------------------------