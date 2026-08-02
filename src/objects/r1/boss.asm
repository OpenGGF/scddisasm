; ------------------------------------------------------------------------------

BossEggmanObject:
	bsr.w	sub_20B9A6
	bsr.w	sub_20B9CA
	bsr.w	sub_20BAC0
	bsr.w	sub_20B9FC
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B996(pc,d0.w),d0
	jsr	off_20B996(pc,d0.w)
	lea	(Ani_20D7BC).l,a1
	jsr	(AnimateObject).l
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20B996:
	dc.w	BossEggmanObject_0_Routine0-*
	dc.w	BossEggmanObject_0_Routine2-off_20B996
	dc.w	BossEggmanObject_0_Routine4-off_20B996
	dc.w	BossEggmanObject_0_Routine6-off_20B996
	dc.w	BossEggmanObject_0_Routine8-off_20B996
	dc.w	BossEggmanObject_0_RoutineA-off_20B996
	dc.w	BossEggmanObject_0_RoutineC-off_20B996
	dc.w	BossEggmanObject_0_RoutineE-off_20B996

; ------------------------------------------------------------------------------

sub_20B9A6:
	tst.b	obj.var_2a(a0)
	beq.s	locret_20B9C8
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_20B9C8
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.b	#0,obj.anim_id(a0)

locret_20B9C8:
	rts

; ------------------------------------------------------------------------------

sub_20B9CA:
	move.w	#$310,d1
	tst.b	(boss_flags).w
	beq.s	loc_20B9F2
	move.w	#$100,d1
	tst.b	obj.var_35(a0)
	beq.s	loc_20B9F2
	subq.b	#1,obj.var_35(a0)
	move.w	#1,d0
	btst	#0,obj.var_35(a0)
	beq.s	loc_20B9F0
	neg.w	d0

loc_20B9F0:
	add.w	d0,d1

loc_20B9F2:
	move.w	d1,(bottom_bound).w
	move.w	d1,(target_bottom_bound).w
	rts

; ------------------------------------------------------------------------------

sub_20B9FC:
	tst.b	obj.var_34(a0)
	bne.s	loc_20BA0C
	btst	#3,obj.var_2c(a0)
	bne.s	loc2_20BA1A
	rts

; ------------------------------------------------------------------------------

loc_20BA0C:
	subq.b	#1,obj.var_34(a0)
	bne.s	locret_20BA18
	jsr	(sub_20BC06).l

locret_20BA18:
	rts

; ------------------------------------------------------------------------------

loc2_20BA1A:
	movea.l	a0,a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAF8
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAF8
	movea.w	obj.var_30(a1),a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAF8
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a1),a1
	movea.w	obj.var_30(a1),a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAF8
	movea.w	obj.var_30(a1),a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAF8
	cmpi.b	#3,obj.var_2b(a0)
	beq.s	loc_20BA76
	cmpi.b	#2,obj.var_2b(a0)
	beq.s	loc_20BA8E
	rts

; ------------------------------------------------------------------------------

loc_20BA76:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_32(a1),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAA8

loc_20BA8E:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	tst.b	obj.collide_type(a1)
	beq.w	loc_20BAA8
	rts

; ------------------------------------------------------------------------------

loc_20BAA8:
	bset	#4,obj.var_2c(a1)
	bsr.w	sub_20BBCE
	bsr.w	sub_20BC06
	move.w	#$98,d0
	jsr	(PlayFmSound).l

; ------------------------------------------------------------------------------

sub_20BAC0:
	tst.b	obj.anim_id(a0)
	bne.s	locret_20BAD8
	lea	(player_object).w,a1
	tst.w	obj.var_30(a1)
	bne.s	loc_20BADA
	cmpi.b	#6,obj.routine(a1)
	beq.s	loc_20BADA

locret_20BAD8:
	rts

; ------------------------------------------------------------------------------

loc_20BADA:
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.b	#1,obj.anim_id(a0)
	move.b	#$3C,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BAF8:
	move.b	#$14,obj.var_34(a0)
	bsr.w	sub_20BBCE
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.b	#2,obj.anim_id(a0)
	move.b	#$78,obj.var_2a(a0)
	subq.b	#1,obj.var_2b(a0)
	beq.w	loc_20BB4C
	cmpi.b	#2,obj.var_2b(a0)
	beq.w	loc_20BB3E
	movea.w	obj.var_32(a0),a1
	bset	#6,obj.var_2c(a1)
	bra.w	loc_20BC38

; ------------------------------------------------------------------------------

loc_20BB3E:
	movea.w	obj.var_32(a0),a1
	bset	#5,obj.var_2c(a1)
	bra.w	loc_20BC2C

; ------------------------------------------------------------------------------

loc_20BB4C:
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.b	#2,obj.anim_id(a0)
	clr.b	obj.var_2a(a0)
	bclr	#3,obj.var_2c(a0)
	clr.b	obj.routine_2(a0)
	move.b	#6,obj.routine(a0)
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	movea.w	obj.var_32(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	obj.var_30(a0),a1
	move.b	#$E,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	bsr.w	sub_20BBA2
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a1),a1

; ------------------------------------------------------------------------------

sub_20BBA2:
	move.b	#$18,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$E,obj.routine(a1)
	clr.b	obj.collide_type(a1)
	clr.b	obj.collide_status(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$C,obj.routine(a1)
	clr.b	obj.collide_type(a1)
	clr.b	obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

sub_20BBCE:
	lea	(player_object).w,a2
	move.w	#$400,d1
	move.w	#-$400,d2
	move.w	#$400,obj.ground_speed(a2)
	btst	#1,obj.flags(a2)
	bne.s	loc_20BBF0
	eori.b	#$80,obj.angle(a2)
	moveq	#0,d2

loc_20BBF0:
	move.w	obj.x(a2),d0
	cmp.w	8(a1),d0
	bcc.s	loc_20BBFC
	neg.w	d1

loc_20BBFC:
	move.w	d1,obj.x_speed(a2)
	move.w	d2,obj.y_speed(a2)
	rts

; ------------------------------------------------------------------------------

sub_20BC06:
	cmpi.b	#3,obj.var_2b(a0)
	beq.s	loc_20BC20
	cmpi.b	#2,obj.var_2b(a0)
	beq.s	loc_20BC2C
	cmpi.b	#1,obj.var_2b(a0)
	beq.s	loc_20BC38
	rts

; ------------------------------------------------------------------------------

loc_20BC20:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_32(a1),a1
	bsr.w	sub_20BC92

loc_20BC2C:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_30(a1),a1
	bsr.w	sub_20BC92

loc_20BC38:
	move.b	#$FC,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	movea.w	obj.var_30(a0),a2
	movea.w	obj.var_30(a2),a1
	movea.w	obj.var_30(a1),a1
	move.b	#$BD,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$BE,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	movea.w	obj.var_32(a2),a1
	movea.w	obj.var_30(a1),a1
	move.b	#$BD,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$BE,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

sub_20BC92:
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	move.b	#$FF,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

BossEggmanObject_0_Routine0:
	moveq	#4,d0
	jsr	(AddGfxQueue).l
	move.b	#1,(boss_started).w
	clr.b	obj.flags(a0)
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$3FD,obj.sprite_tile(a0)
	move.l	#Spr_20D7DC,obj.sprite_data(a0)
	move.b	#1,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.w	#$C52,obj.x(a0)
	move.w	#$78,obj.y(a0)
	move.w	#5,d0
	movem.l	d7-a7,-(sp)
	jsr	(LoadPalette).l
	movem.l	(sp)+,d7-a7
	rts

; ------------------------------------------------------------------------------

sub_20BD1C:
	jsr	(SpawnObject).l
	bne.w	locret_20BD34
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	moveq	#0,d0

locret_20BD34:
	rts

; ------------------------------------------------------------------------------

sub_20BD36:
	movea.l	a0,a3
	bsr.s	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#6,obj.sprite_layer(a1)
	move.b	#$2B,obj.id(a1)
	movea.l	a1,a3
	movea.l	a1,a4
	bsr.s	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#6,obj.sprite_layer(a1)
	move.b	#$2C,obj.id(a1)
	movea.l	a1,a3
	bsr.s	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#$2D,obj.id(a1)
	movea.l	a1,a3
	bsr.s	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#2,obj.sprite_layer(a1)
	move.b	#$2E,obj.id(a1)
	movea.w	a4,a3
	move.w	a3,obj.var_30(a1)
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_32(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#7,obj.sprite_layer(a1)
	move.b	#$2C,obj.id(a1)
	bset	#2,obj.var_2c(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#6,obj.sprite_layer(a1)
	move.b	#$2D,obj.id(a1)
	bset	#2,obj.var_2c(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#5,obj.sprite_layer(a1)
	move.b	#$2E,obj.id(a1)
	bset	#2,obj.var_2c(a1)
	movea.l	a1,a3
	movea.w	a4,a3
	move.w	a3,obj.var_30(a1)
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a3,obj.var_2e(a1)
	movea.w	obj.var_2e(a3),a3
	move.w	a1,$32(a3)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#$2F,obj.id(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,obj.var_30(a3)
	move.b	#$80,obj.var_2a(a1)
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#5,obj.sprite_layer(a1)
	move.b	#$30,obj.id(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#4,obj.sprite_layer(a1)
	move.l	#Spr_20D918,obj.sprite_data(a1)
	move.b	#$31,obj.id(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#$32,obj.id(a1)
	movea.l	a1,a3
	move.w	a4,obj.var_30(a1)
	movea.w	obj.var_2e(a3),a3
	movea.w	$2E(a3),a3
	movea.w	$2E(a3),a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a1,$32(a3)
	move.w	a3,obj.var_2e(a1)
	move.b	#7,obj.sprite_layer(a1)
	move.b	#$30,obj.id(a1)
	bset	#2,obj.var_2c(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#7,obj.sprite_layer(a1)
	move.l	#Spr_20D942,obj.sprite_data(a1)
	move.b	#$31,obj.id(a1)
	bset	#2,obj.var_2c(a1)
	movea.l	a1,a3
	bsr.w	sub_20BD1C
	bne.w	locret_20BF42
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#6,obj.sprite_layer(a1)
	move.b	#$32,obj.id(a1)
	bset	#2,obj.var_2c(a1)
	movea.l	a1,a3
	move.w	a4,obj.var_30(a1)
	move.b	#3,obj.var_2b(a0)
	jsr	(sub_20BC06).l

locret_20BF42:
	rts

; ------------------------------------------------------------------------------

BossEggmanObject_0_Routine2:
	move.w	#$AC0,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	lea	(player_object).w,a1
	cmpi.w	#$A6A,obj.x(a1)
	blt.s	locret_20BF90
	move.w	obj.x(a1),d0
	subi.w	#$A0,d0
	cmp.w	(left_bound).w,d0
	blt.s	locret_20BF90
	cmpi.w	#$B60,obj.x(a1)
	blt.s	loc_20BF88
	move.b	#$C,obj.routine(a0)
	move.w	#$AC0,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	move.w	#$AC0,d0

loc_20BF88:
	move.w	d0,(left_bound).w
	move.w	d0,(target_left_bound).w

locret_20BF90:
	rts

; ------------------------------------------------------------------------------

BossEggmanObject_0_RoutineC:
	addq.w	#6,(scroll_focus_y).w
	cmpi.w	#$C8,(scroll_focus_y).w
	bge.s	loc_20BFA0
	rts

; ------------------------------------------------------------------------------

loc_20BFA0:
	move.w	#$67,d0
	jsr	(SubCpuCommand).l
	move.b	#1,(boss_flags).w
	move.b	#$E,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BossEggmanObject_0_RoutineE:
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#$3C,obj.var_2b(a0)
	bne.s	locret_20BFDE
	clr.b	obj.var_2b(a0)
	move.b	#4,obj.routine(a0)
	move.w	#$BD2,obj.x(a0)
	move.w	#$78,obj.y(a0)
	bsr.w	sub_20BD36

locret_20BFDE:
	rts

; ------------------------------------------------------------------------------

BossEggmanObject_0_Routine4:
	movea.w	obj.var_30(a0),a1
	bclr	#0,$2C(a1)
	beq.s	locret_20C04C
	cmpi.b	#2,obj.routine_2(a0)
	bne.s	loc_20C020
	move.w	#0,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.b	#3,obj.var_2b(a0)
	bset	#3,obj.var_2c(a0)
	jsr	(sub_20BC06).l
	movea.w	obj.var_30(a0),a1

loc_20C020:
	addq.b	#2,obj.routine_2(a0)
	moveq	#0,d0
	bclr	#1,obj.var_2c(a1)

loc_20C02C:
	lea	(byte_20C04E).l,a2
	move.b	obj.routine_2(a0),d0
	adda.w	d0,a2
	tst.b	(a2)
	bge.s	loc_20C044
	move.b	#6,obj.routine_2(a0)
	bra.s	loc_20C02C

; ------------------------------------------------------------------------------

loc_20C044:
	move.b	(a2)+,obj.routine(a1)
	move.b	(a2),obj.var_2d(a1)

locret_20C04C:
	rts

; ------------------------------------------------------------------------------

byte_20C04E:
	dc.b	2, 0
	dc.b	4, 0
	dc.b	6, 0
	dc.b	8, 5
	dc.b	$A, 6
	dc.b	$C, $A
	dc.b	8, $A
	dc.b	$10, $32
	dc.b	$A, $A
	dc.b	$FF, $FF

; ------------------------------------------------------------------------------

BossEggmanObject_0_Routine6:
	addq.b	#1,obj.var_2b(a0)
	bsr.w	sub_20D72A
	cmpi.b	#$5E,obj.var_2b(a0)
	bne.s	loc_20C09E
	move.w	obj.x(a0),obj.var_3c(a0)
	move.w	obj.y(a0),obj.x_speed(a0)
	move.b	#3,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	movea.w	obj.var_30(a0),a1
	bset	#0,obj.var_2c(a1)

loc_20C09E:
	cmpi.b	#$78,obj.var_2b(a0)
	bcs.s	locret_20C0C4
	clr.b	obj.var_2b(a0)
	move.b	#8,obj.routine(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	moveq	#100,d0
	jsr	(AddPoints).l

locret_20C0C4:
	rts

; ------------------------------------------------------------------------------

BossEggmanObject_0_Routine8:
	tst.b	obj.routine_2(a0)
	beq.w	loc_20C100
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.y(a0)
	addq.b	#3,obj.var_2b(a0)
	move.b	obj.var_2b(a0),d0
	jsr	(SineCosine).l
	asr.w	#5,d0
	move.w	d0,obj.var_38(a0)
	add.w	d0,obj.y(a0)
	addi.l	#$28000,obj.x(a0)
	cmpi.w	#$C80,obj.x(a0)
	bge.s	loc_20C16C
	rts

; ------------------------------------------------------------------------------

loc_20C100:
	addq.b	#1,obj.var_2b(a0)
	move.w	obj.x(a0),d0
	move.w	obj.y(a0),d1
	movem.w	d0-d1,-(sp)
	move.w	obj.var_3c(a0),obj.x(a0)
	move.w	obj.x_speed(a0),obj.y(a0)
	bsr.w	sub_20D72A
	movem.w	(sp)+,d0-d1
	move.w	d0,obj.x(a0)
	move.w	d1,obj.y(a0)
	addi.l	#$8000,obj.x(a0)
	subi.l	#$20000,obj.y(a0)
	cmpi.w	#$158,obj.y(a0)
	bgt.s	locret_20C16A
	addq.b	#1,obj.routine_2(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)
	move.b	#4,obj.anim_id(a0)
	move.b	#$40,obj.var_2b(a0)
	move.w	#8,obj.var_38(a0)

locret_20C16A:
	rts

; ------------------------------------------------------------------------------

loc_20C16C:
	clr.b	obj.var_2b(a0)
	move.w	#$11,d0
	tst.b	(good_future).l
	beq.s	loc_20C180
	move.w	#$10,d0

loc_20C180:
	jsr	(SubCpuCommand).l
	jsr	(LoadCapsulePalette).l
	clr.b	(boss_flags).w
	clr.b	(boss_started).w
	move.b	#$A,obj.routine(a0)

BossEggmanObject_0_RoutineA:
	lea	(unk_2027F8+2).l,a1
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	addq.w	#6,(right_bound).w
	addq.w	#6,(target_right_bound).w
	cmp.w	(right_bound).w,d1
	ble.s	loc_20C1B6
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

loc_20C1B6:
	move.w	d1,(right_bound).w
	move.w	d1,(target_right_bound).w
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

BossBodyObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C1DA(pc,d0.w),d0
	jsr	off_20C1DA(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20C1DA:
	dc.w	BossBodyObject_0_Routine0-*
	dc.w	BossBodyObject_0_Routine2-off_20C1DA
	dc.w	BossBodyObject_0_Routine4-off_20C1DA
	dc.w	BossBodyObject_0_Routine6-off_20C1DA
	dc.w	BossBodyObject_0_Routine8-off_20C1DA
	dc.w	BossBodyObject_0_RoutineA-off_20C1DA
	dc.w	BossBodyObject_0_RoutineC-off_20C1DA
	dc.w	BossBodyObject_0_RoutineE-off_20C1DA
	dc.w	BossBodyObject_0_Routine10-off_20C1DA

; ------------------------------------------------------------------------------

BossBodyObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$24,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.w	#$359,obj.sprite_tile(a0)
	move.l	#Spr_20D8AE,obj.sprite_data(a0)
	bsr.w	sub_20C5AE
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_Routine10:
	subq.b	#1,obj.var_2d(a0)
	bne.w	locret_20C234
	bsr.w	sub_20C5AE
	bset	#0,obj.var_2c(a0)
	bclr	#1,obj.var_2c(a0)

locret_20C234:
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_Routine2:
	movea.w	obj.var_32(a0),a1
	move.b	#$10,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#4,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$A,obj.routine(a1)
	movea.w	obj.var_30(a0),a1
	bsr.w	sub_20C8D0
	btst	#4,obj.var_2c(a1)
	bne.s	loc_20C27A
	addi.l	#$18000,obj.y(a0)
	movea.w	obj.var_2e(a0),a1
	addi.l	#$18000,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

loc_20C27A:
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_Routine4:
	movea.w	obj.var_32(a0),a1
	bclr	#0,obj.var_2c(a1)
	movea.w	obj.var_30(a0),a1
	bclr	#0,obj.var_2c(a1)
	beq.s	locret_20C2F4
	cmpi.b	#$C,obj.routine(a1)
	beq.s	loc_20C2EC
	cmpi.b	#$A,obj.routine(a1)
	beq.s	loc_20C2E4
	move.b	#2,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_32(a0),a1
	move.b	#8,obj.routine(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#2,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#4,obj.routine(a1)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C2E4:
	move.b	#$E,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

loc_20C2EC:
	move.b	#$A,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

locret_20C2F4:
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_Routine6:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20C302
	bsr.w	sub_20C474

loc_20C302:
	movea.w	obj.var_30(a0),a1
	btst	#0,obj.var_2c(a1)
	beq.s	locret_20C32C
	movea.w	obj.var_32(a0),a1
	btst	#0,obj.var_2c(a1)
	beq.s	locret_20C32C
	bclr	#1,obj.var_2c(a0)
	bset	#6,obj.var_2c(a0)
	bset	#0,obj.var_2c(a0)

locret_20C32C:
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_Routine8:
	btst	#6,obj.var_2c(a0)
	bne.s	loc_20C340
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a0),a2
	bra.s	loc_20C348

; ------------------------------------------------------------------------------

loc_20C340:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_30(a0),a2

loc_20C348:
	btst	#0,obj.var_2c(a1)
	beq.w	locret_20C42C
	btst	#0,obj.var_2c(a2)
	beq.w	locret_20C42C
	movea.w	obj.var_30(a1),a3
	movea.w	obj.var_30(a3),a3
	movea.w	obj.var_30(a2),a4
	movea.w	obj.var_30(a2),a4
	bclr	#0,obj.var_2c(a1)
	bclr	#0,obj.var_2c(a3)
	bclr	#0,obj.var_2c(a2)
	bclr	#0,obj.var_2c(a4)
	cmpi.w	#$B58,obj.x(a0)
	bgt.s	loc_20C392
	move.b	#1,obj.var_2d(a0)

loc_20C392:
	subq.b	#1,obj.var_2d(a0)
	bne.w	loc_20C3A8
	bset	#0,obj.var_2c(a0)
	bclr	#1,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C3A8:
	bchg	#6,obj.var_2c(a0)
	beq.w	loc_20C3F0
	movea.w	obj.var_30(a0),a1
	move.b	#8,obj.routine(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#6,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#2,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_30(a1),a1
	move.b	#8,obj.routine(a1)
	bsr.w	sub_20C42E
	rts

; ------------------------------------------------------------------------------

loc_20C3F0:
	movea.w	obj.var_30(a0),a1
	move.b	#2,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_30(a1),a1
	move.b	#8,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#8,obj.routine(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#6,obj.routine(a1)
	bsr.w	sub_20C474

locret_20C42C:
	rts

; ------------------------------------------------------------------------------

sub_20C42E:
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_32(a1),a2
	movea.w	obj.var_32(a2),a1
	move.l	a1,d0
	beq.s	loc_20C454
	move.b	#2,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#8,obj.routine(a1)
	move.b	#0,obj.sprite_frame(a1)

loc_20C454:
	movea.w	obj.var_30(a2),a1
	move.l	a1,d0
	beq.s	locret_20C472
	move.b	#6,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#6,obj.routine(a1)
	move.b	#0,obj.sprite_frame(a1)

locret_20C472:
	rts

; ------------------------------------------------------------------------------

sub_20C474:
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_32(a1),a2
	movea.w	obj.var_32(a2),a1
	move.l	a1,d0
	beq.s	loc_20C49A
	move.b	#6,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#6,obj.routine(a1)
	move.b	#0,obj.sprite_frame(a1)

loc_20C49A:
	movea.w	obj.var_30(a2),a1
	move.l	a1,d0
	beq.s	locret_20C4B8
	move.b	#2,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#8,obj.routine(a1)
	move.b	#0,obj.sprite_frame(a1)

locret_20C4B8:
	rts

; ------------------------------------------------------------------------------

sub_20C4BA:
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_32(a1),a2
	movea.w	obj.var_32(a2),a1
	move.l	a1,d0
	beq.s	loc_20C4E0
	move.b	#2,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$A,obj.routine(a1)
	move.b	#1,obj.sprite_frame(a1)

loc_20C4E0:
	movea.w	obj.var_30(a2),a1
	move.l	a1,d0
	beq.s	locret_20C4FE
	move.b	#2,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#$A,obj.routine(a1)
	move.b	#1,obj.sprite_frame(a1)

locret_20C4FE:
	rts

; ------------------------------------------------------------------------------

sub_20C500:
	movem.l	a1,-(sp)
	movea.w	obj.var_30(a0),a1
	move.b	#8,obj.var_3c(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$10000,obj.var_3c(a1)
	move.l	#$8000,obj.x_speed(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$C000,obj.var_3c(a1)
	move.l	#$18000,obj.x_speed(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#8,obj.var_3c(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$10000,obj.var_3c(a1)
	move.l	#$8000,obj.x_speed(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$C000,obj.var_3c(a1)
	move.l	#$18000,obj.x_speed(a1)
	movem.l	(sp)+,a1
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_32(a1),a2
	movea.w	obj.var_32(a2),a1
	move.l	a1,d0
	beq.s	loc_20C590
	movea.w	obj.var_30(a1),a1
	bset	#7,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bset	#7,obj.var_2c(a1)

loc_20C590:
	movea.w	obj.var_30(a2),a1
	move.l	a1,d0
	beq.s	locret_20C5AC
	movea.w	obj.var_30(a1),a1
	bset	#7,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bset	#7,obj.var_2c(a1)

locret_20C5AC:
	rts

; ------------------------------------------------------------------------------

sub_20C5AE:
	movem.l	a1,-(sp)
	movea.w	obj.var_30(a0),a1
	move.b	#2,obj.var_3c(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$8000,obj.var_3c(a1)
	move.l	#$4000,obj.x_speed(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$4000,obj.var_3c(a1)
	move.l	#$8000,obj.x_speed(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#2,obj.var_3c(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$8000,obj.var_3c(a1)
	move.l	#$4000,obj.x_speed(a1)
	movea.w	obj.var_30(a1),a1
	move.l	#$4000,obj.var_3c(a1)
	move.l	#$8000,obj.x_speed(a1)
	movem.l	(sp)+,a1
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_32(a1),a2
	movea.w	obj.var_32(a2),a1
	move.l	a1,d0
	beq.s	loc_20C63E
	movea.w	obj.var_30(a1),a1
	bclr	#7,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bclr	#7,obj.var_2c(a1)

loc_20C63E:
	movea.w	obj.var_30(a2),a1
	move.l	a1,d0
	beq.s	locret_20C65A
	movea.w	obj.var_30(a1),a1
	bclr	#7,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bclr	#7,obj.var_2c(a1)

locret_20C65A:
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_RoutineA:
	btst	#6,obj.var_2c(a0)
	bne.s	loc_20C66E
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a0),a2
	bra.s	loc_20C676

; ------------------------------------------------------------------------------

loc_20C66E:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_30(a0),a2

loc_20C676:
	btst	#0,obj.var_2c(a1)
	beq.w	locret_20C76A
	btst	#0,obj.var_2c(a2)
	beq.w	locret_20C76A
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20C69A
	bsr.w	sub_20C5AE
	bra.w	loc_20C6E6

; ------------------------------------------------------------------------------

loc_20C69A:
	movea.w	obj.var_30(a1),a3
	movea.w	obj.var_30(a3),a3
	movea.w	obj.var_30(a2),a4
	movea.w	obj.var_30(a2),a4
	bclr	#0,obj.var_2c(a1)
	bclr	#0,obj.var_2c(a3)
	bclr	#0,obj.var_2c(a2)
	bclr	#0,obj.var_2c(a4)
	cmpi.w	#$BA0,obj.x(a0)
	blt.s	loc_20C6D0
	move.b	#1,obj.var_2d(a0)

loc_20C6D0:
	subq.b	#1,obj.var_2d(a0)
	bne.w	loc_20C6E6
	bclr	#1,obj.var_2c(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C6E6:
	bchg	#6,obj.var_2c(a0)
	beq.w	loc_20C72E
	movea.w	obj.var_30(a0),a1
	move.b	#$16,obj.routine(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#8,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#$12,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_30(a1),a1
	move.b	#6,obj.routine(a1)
	bsr.w	sub_20C474
	rts

; ------------------------------------------------------------------------------

loc_20C72E:
	movea.w	obj.var_30(a0),a1
	move.b	#$12,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_30(a1),a1
	move.b	#6,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#$16,obj.routine(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#8,obj.routine(a1)
	bsr.w	sub_20C42E

locret_20C76A:
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_RoutineC:
	btst	#6,obj.var_2c(a0)
	bne.s	loc_20C77E
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a0),a2
	bra.s	loc_20C786

; ------------------------------------------------------------------------------

loc_20C77E:
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_30(a0),a2

loc_20C786:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20C792
	bsr.w	sub_20C500

loc_20C792:
	cmpi.b	#4,obj.routine(a1)
	bne.s	loc_20C7AE
	movea.w	obj.var_30(a1),a3
	move.b	#$A,obj.routine(a3)
	movea.w	obj.var_30(a2),a3
	move.b	#$C,obj.routine(a3)

loc_20C7AE:
	btst	#0,obj.var_2c(a1)
	beq.w	locret_20C8A4
	btst	#0,obj.var_2c(a2)
	beq.w	locret_20C8A4
	movea.w	obj.var_30(a1),a3
	movea.w	obj.var_30(a3),a3
	movea.w	obj.var_30(a2),a4
	movea.w	obj.var_30(a2),a4
	bclr	#0,obj.var_2c(a1)
	bclr	#0,obj.var_2c(a3)
	bclr	#0,obj.var_2c(a2)
	bclr	#0,obj.var_2c(a4)
	subq.b	#1,obj.var_2d(a0)
	bne.w	loc_20C800
	bset	#0,obj.var_2c(a0)
	bclr	#1,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C800:
	bchg	#6,obj.var_2c(a0)
	beq.w	loc_20C858
	movea.w	obj.var_30(a0),a1
	bclr	#1,obj.var_2c(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#$A,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#2,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	bclr	#1,obj.var_2c(a1)
	move.b	#2,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_30(a1),a1
	move.b	#$C,obj.routine(a1)
	bsr.w	sub_20C4BA
	rts

; ------------------------------------------------------------------------------

loc_20C858:
	movea.w	obj.var_30(a0),a1
	bclr	#1,obj.var_2c(a1)
	move.b	#2,obj.routine(a1)
	bsr.w	sub_20C8F4
	bsr.w	sub_20C93C
	movea.w	obj.var_30(a1),a1
	move.b	#$C,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	bclr	#1,obj.var_2c(a1)
	bsr.w	sub_20C8D0
	bsr.w	sub_20C918
	movea.w	obj.var_30(a1),a1
	move.b	#$A,obj.routine(a1)
	movea.w	obj.var_30(a1),a1
	move.b	#2,obj.routine(a1)
	bsr.w	sub_20C4BA

locret_20C8A4:
	rts

; ------------------------------------------------------------------------------

BossBodyObject_0_RoutineE:
	btst	#0,obj.var_2c(a0)
	bne.w	loc_20C8C8
	jsr	(CheckBlockDown).l
	tst.w	d1
	ble.s	locret_20C8C6
	movea.w	obj.var_2e(a0),a1
	addq.w	#2,obj.y(a0)
	addq.w	#2,obj.y(a1)

locret_20C8C6:
	rts

; ------------------------------------------------------------------------------

loc_20C8C8:
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

sub_20C8D0:
	movem.l	a1,-(sp)
	bset	#5,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bset	#5,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bset	#5,obj.var_2c(a1)
	movem.l	(sp)+,a1
	rts

; ------------------------------------------------------------------------------

sub_20C8F4:
	movem.l	a1,-(sp)
	bclr	#5,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bclr	#5,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bclr	#5,obj.var_2c(a1)
	movem.l	(sp)+,a1
	rts

; ------------------------------------------------------------------------------

sub_20C918:
	movem.l	a1,-(sp)
	bset	#4,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bset	#4,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bset	#4,obj.var_2c(a1)
	movem.l	(sp)+,a1
	rts

; ------------------------------------------------------------------------------

sub_20C93C:
	movem.l	a1,-(sp)
	bclr	#4,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bclr	#4,obj.var_2c(a1)
	movea.w	obj.var_30(a1),a1
	bclr	#4,obj.var_2c(a1)
	movem.l	(sp)+,a1
	rts

; ------------------------------------------------------------------------------

sub_20C960:
	jsr	(SpawnObject).l
	bne.s	locret_20C988
	st	obj.routine_2(a1)
	move.b	#$18,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	#$9E,d0
	jsr	(PlayFmSound).l

locret_20C988:
	rts

; ------------------------------------------------------------------------------

BossElbowObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C99E(pc,d0.w),d0
	jsr	off_20C99E(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20C99E:
	dc.w	BossElbowObject_0_Routine0-*
	dc.w	BossElbowObject_0_Routine2-off_20C99E
	dc.w	BossElbowObject_0_Routine4-off_20C99E

; ------------------------------------------------------------------------------

BossElbowObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.l	#Spr_20D902,obj.sprite_data(a0)
	move.b	#2,obj.routine(a0)

BossElbowObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#$18,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	addi.w	#-$C,obj.y(a0)
	bclr	#6,obj.var_2c(a0)
	bne.s	loc2_20CA12
	bclr	#5,obj.var_2c(a0)
	bne.s	loc_20C9FC
	rts

; ------------------------------------------------------------------------------

loc_20C9FC:
	movea.w	obj.var_32(a0),a1
	move.b	#$A,obj.routine(a1)
	clr.w	obj.var_32(a0)
	move.b	#0,obj.sprite_frame(a1)
	rts

; ------------------------------------------------------------------------------

loc2_20CA12:
	movea.w	obj.var_30(a0),a1
	move.b	#$A,obj.routine(a1)
	clr.w	obj.var_30(a0)
	movea.w	obj.var_32(a0),a1
	movea.w	obj.var_30(a1),a1
	rts

; ------------------------------------------------------------------------------

BossElbowObject_0_Routine4:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20CA44
	move.l	#-$10000,obj.var_3c(a0)
	move.l	#-$20000,obj.x_speed(a0)
	bra.s	loc_20CA54

; ------------------------------------------------------------------------------

loc_20CA44:
	addi.l	#-$600,obj.var_3c(a0)
	addi.l	#$1800,obj.x_speed(a0)

loc_20CA54:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20CA74
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20CA74:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

BossUpperArmObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CA96(pc,d0.w),d0
	jsr	off_20CA96(pc,d0.w)
	btst	#2,obj.var_2c(a0)
	bne.s	locret_20CA94
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

locret_20CA94:
	rts

; ------------------------------------------------------------------------------

off_20CA96:
	dc.w	BossUpperArmObject_0_Routine0-*
	dc.w	BossUpperArmObject_0_Routine2-off_20CA96
	dc.w	BossUpperArmObject_0_Routine4-off_20CA96
	dc.w	BossUpperArmObject_0_Routine6-off_20CA96
	dc.w	BossUpperArmObject_0_Routine4-off_20CA96
	dc.w	BossUpperArmObject_0_RoutineA-off_20CA96

; ------------------------------------------------------------------------------

BossUpperArmObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.l	#Spr_20D910,obj.sprite_data(a0)
	move.b	#6,obj.routine(a0)

BossUpperArmObject_0_Routine2:
	subq.b	#2,obj.var_2a(a0)
	bhi.w	loc_20CB6E
	move.b	#4,obj.routine(a0)
	clr.b	obj.var_2a(a0)
	bset	#0,obj.var_2c(a0)
	bra.w	loc_20CB6E

; ------------------------------------------------------------------------------

BossUpperArmObject_0_Routine6:
	addq.b	#2,obj.var_2a(a0)
	cmpi.b	#$30,obj.var_2a(a0)
	bcs.w	loc_20CB6E
	move.b	#8,obj.routine(a0)
	move.b	#$30,obj.var_2a(a0)
	bset	#0,obj.var_2c(a0)
	bra.w	loc_20CB6E

; ------------------------------------------------------------------------------

BossUpperArmObject_0_Routine4:
	bra.w	loc_20CB6E

; ------------------------------------------------------------------------------

BossUpperArmObject_0_RoutineA:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20CB3A
	move.b	#0,obj.var_2b(a0)
	move.l	#$10000,obj.var_3c(a0)
	move.l	#-$20000,obj.x_speed(a0)
	movea.w	obj.var_30(a0),a1
	move.b	#4,obj.routine(a1)
	bra.s	loc_20CB4A

; ------------------------------------------------------------------------------

loc_20CB3A:
	addi.l	#$600,obj.var_3c(a0)
	addi.l	#$1F00,obj.x_speed(a0)

loc_20CB4A:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20CB6A
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20CB6A:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

loc_20CB6E:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	addi.b	#$40,d0
	jsr	(SineCosine).l
	asr.w	#4,d0
	asr.w	#4,d1
	add.w	d1,obj.x(a0)
	add.w	d0,obj.y(a0)
	btst	#2,obj.var_2c(a0)
	beq.s	locret_20CBA8
	addi.w	#-$A,obj.x(a0)

locret_20CBA8:
	rts

; ------------------------------------------------------------------------------

BossForearmObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CBBE(pc,d0.w),d0
	jsr	off_20CBBE(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20CBBE:
	dc.w	BossForearmObject_0_Routine0-*
	dc.w	BossForearmObject_0_Routine2-off_20CBBE
	dc.w	BossForearmObject_0_Routine4-off_20CBBE
	dc.w	BossForearmObject_0_Routine6-off_20CBBE
	dc.w	BossForearmObject_0_Routine8-off_20CBBE
	dc.w	BossForearmObject_0_RoutineA-off_20CBBE

; ------------------------------------------------------------------------------

BossForearmObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.b	#2,obj.routine(a0)

BossForearmObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#-$24,obj.x(a0)
	move.w	obj.var_34(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	addi.w	#0,obj.y(a0)
	btst	#7,obj.var_2c(a0)
	bne.s	loc_20CC38
	lea	(player_object).w,a1
	move.w	obj.y(a1),d1
	cmp.w	obj.y(a0),d1
	bgt.s	loc_20CC38
	cmpi.w	#-8,obj.var_38(a0)
	ble.s	loc_20CC48
	subi.l	#$10000,obj.var_38(a0)
	bra.s	loc_20CC48

; ------------------------------------------------------------------------------

loc_20CC38:
	cmpi.w	#8,obj.var_38(a0)
	bge.s	loc_20CC48
	addi.l	#$10000,obj.var_38(a0)

loc_20CC48:
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossForearmObject_0_Routine6:
	cmpi.w	#0,obj.var_34(a0)
	ble.s	loc_20CC62
	subi.l	#$8000,obj.var_34(a0)

loc_20CC62:
	bra.s	BossForearmObject_0_Routine2

; ------------------------------------------------------------------------------

BossForearmObject_0_Routine8:
	cmpi.w	#$10,obj.var_34(a0)
	bge.s	loc_20CC74
	addi.l	#$8000,obj.var_34(a0)

loc_20CC74:
	bra.w	BossForearmObject_0_Routine2

; ------------------------------------------------------------------------------

BossForearmObject_0_RoutineA:
	cmpi.w	#8,obj.var_34(a0)
	bge.s	loc_20CC8A
	addi.l	#$8000,obj.var_34(a0)
	bra.s	loc_20CC90

; ------------------------------------------------------------------------------

loc_20CC8A:
	move.b	#1,obj.sprite_frame(a0)

loc_20CC90:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#-$24,obj.x(a0)
	move.w	obj.var_34(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	addi.w	#0,obj.y(a0)
	cmpi.w	#8,obj.var_38(a0)
	bge.s	loc_20CCC4
	addi.l	#$10000,obj.var_38(a0)

loc_20CCC4:
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossForearmObject_0_Routine4:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20CCFC
	move.b	#1,obj.var_2b(a0)
	clr.b	obj.var_2a(a0)
	move.l	#0,obj.var_3c(a0)
	move.l	#$10000,obj.x_speed(a0)
	movea.w	obj.var_30(a0),a1
	move.b	#4,obj.routine(a1)
	bra.s	loc_20CD0C

; ------------------------------------------------------------------------------

loc_20CCFC:
	addi.l	#-$620,obj.var_3c(a0)
	addi.l	#$1220,obj.x_speed(a0)

loc_20CD0C:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20CD2C
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20CD2C:
	addq.b	#1,obj.var_2a(a0)
	moveq	#0,d2
	move.b	obj.var_2a(a0),d2
	divu.w	#7,d2
	swap	d2
	tst.w	d2
	bne.s	loc_20CD44
	bsr.w	sub_20C960

loc_20CD44:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

BossBumperObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CD5C(pc,d0.w),d0
	jsr	off_20CD5C(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20CD5C:
	dc.w	BossBumperObject_0_Routine0-*
	dc.w	BossBumperObject_0_Routine2-off_20CD5C
	dc.w	BossBumperObject_0_Routine4-off_20CD5C

; ------------------------------------------------------------------------------

BossBumperObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.l	#Spr_20D95A,obj.sprite_data(a0)
	move.b	#2,obj.routine(a0)

BossBumperObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#-$C,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	tst.b	obj.sprite_frame(a1)
	beq.s	loc_20CDBC
	cmpi.b	#1,obj.sprite_frame(a1)
	bne.s	loc_20CDB6
	addq.w	#8,obj.x(a0)
	bra.s	loc_20CDBC

; ------------------------------------------------------------------------------

loc_20CDB6:
	addi.w	#$10,obj.x(a0)

loc_20CDBC:
	bclr	#4,obj.var_2c(a0)
	beq.s	locret_20CDC8
	subq.w	#4,obj.x(a0)

locret_20CDC8:
	rts

; ------------------------------------------------------------------------------

BossBumperObject_0_Routine4:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20CDF2
	move.b	#0,obj.var_2b(a0)
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	move.l	#0,obj.var_3c(a0)
	move.l	#-$18000,obj.x_speed(a0)
	bra.s	loc2_20CE02

; ------------------------------------------------------------------------------

loc_20CDF2:
	addi.l	#-$500,obj.var_3c(a0)
	addi.l	#$1800,obj.x_speed(a0)

loc2_20CE02:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20CE22
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20CE22:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

BossThighObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CE3A(pc,d0.w),d0
	jsr	off_20CE3A(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20CE3A:
	dc.w	BossThighObject_0_Routine0-*
	dc.w	BossThighObject_0_Routine2-off_20CE3A
	dc.w	BossThighObject_0_Routine4-off_20CE3A
	dc.w	BossThighObject_0_Routine6-off_20CE3A
	dc.w	BossThighObject_0_Routine8-off_20CE3A
	dc.w	BossThighObject_0_RoutineA-off_20CE3A
	dc.w	BossThighObject_0_RoutineC-off_20CE3A
	dc.w	BossThighObject_0_RoutineE-off_20CE3A
	dc.w	BossThighObject_0_Routine10-off_20CE3A
	dc.w	BossThighObject_0_Routine12-off_20CE3A
	dc.w	BossThighObject_0_Routine14-off_20CE3A
	dc.w	BossThighObject_0_Routine16-off_20CE3A
	dc.w	BossThighObject_0_Routine18-off_20CE3A

; ------------------------------------------------------------------------------

BossThighObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.l	#Spr_20D8DA,obj.sprite_data(a0)
	move.b	#$C,obj.routine(a0)
	move.b	#$58,obj.var_2a(a0)
	move.b	#2,obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

BossThighObject_0_Routine2:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	cmpi.b	#6,obj.routine(a1)
	beq.s	loc_20CEB0
	cmpi.b	#8,obj.routine(a1)
	beq.s	loc_20CEB0
	bclr	#0,obj.var_2c(a1)
	move.b	#6,obj.routine(a1)

loc_20CEB0:
	cmpi.b	#0,obj.var_2a(a0)
	ble.s	loc_20CEC8
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.var_2a(a0)
	cmpi.b	#0,obj.var_2a(a0)
	bgt.s	loc_20CEE4

loc_20CEC8:
	move.b	#0,obj.var_2a(a0)
	cmpi.b	#8,obj.routine(a1)
	beq.s	loc_20CEDE
	bclr	#0,obj.var_2c(a1)
	beq.s	loc_20CEE4

loc_20CEDE:
	move.b	#4,obj.routine(a0)

loc_20CEE4:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_Routine4:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.var_2a(a0)
	cmpi.b	#$58,obj.var_2a(a0)
	bcs.s	loc_20CF12
	move.b	#$58,obj.var_2a(a0)
	move.b	#6,obj.routine(a0)
	move.b	#2,obj.routine(a1)

loc_20CF12:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_Routine6:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	btst	#4,obj.var_2c(a1)
	beq.s	loc_20CF2C
	bset	#0,obj.var_2c(a0)

loc_20CF2C:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_Routine8:
	btst	#0,obj.var_2c(a0)
	bne.s	loc_20CF54
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.var_2a(a0)
	cmpi.b	#$18,obj.var_2a(a0)
	bcc.s	loc_20CF54
	move.b	#$18,obj.var_2a(a0)
	bset	#0,obj.var_2c(a0)

loc_20CF54:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_RoutineA:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	cmpi.b	#8,obj.routine(a1)
	beq.s	loc_20CF70
	move.b	#6,obj.routine(a1)
	bra.s	loc_20CF7A

; ------------------------------------------------------------------------------

loc_20CF70:
	cmpi.b	#0,obj.var_2a(a0)
	beq.w	loc_20CF90

loc_20CF7A:
	cmpi.b	#0,obj.var_2a(a0)
	beq.w	loc_20CF8C
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.var_2a(a0)

loc_20CF8C:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

loc_20CF90:
	bclr	#0,obj.var_2c(a1)
	beq.s	loc_20CF9E
	bset	#0,obj.var_2c(a0)

loc_20CF9E:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_RoutineC:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	cmpi.b	#4,obj.routine(a1)
	beq.s	loc_20CFBA
	move.b	#2,obj.routine(a1)
	bra.s	loc_20CFC4

; ------------------------------------------------------------------------------

loc_20CFBA:
	cmpi.b	#$58,obj.var_2a(a0)
	bge.w	loc_20CFDA

loc_20CFC4:
	cmpi.b	#$58,obj.var_2a(a0)
	bge.w	loc_20CFD6
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.var_2a(a0)

loc_20CFD6:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

loc_20CFDA:
	bclr	#0,obj.var_2c(a1)
	beq.s	loc_20CFE8
	bset	#0,obj.var_2c(a0)

loc_20CFE8:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_RoutineE:
	cmpi.b	#$18,obj.var_2a(a0)
	blt.s	loc_20D010
	bgt.s	loc_20D040
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	btst	#0,obj.var_2c(a1)
	beq.s	loc_20D00C
	bset	#0,obj.var_2c(a0)

loc_20D00C:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

loc_20D010:
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.var_2a(a0)
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	bset	#7,obj.var_2c(a1)
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_32(a1),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	bset	#7,obj.var_2c(a1)
	bra.w	BossThighObject_0_RoutineC

; ------------------------------------------------------------------------------

loc_20D040:
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.var_2a(a0)
	bra.w	BossThighObject_0_RoutineA

; ------------------------------------------------------------------------------

BossThighObject_0_Routine10:
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_30(a1),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#-$A,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.w	obj.var_2a(a1),obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

BossThighObject_0_Routine12:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	cmpi.b	#6,obj.routine(a1)
	beq.w	loc_20D0BC
	cmpi.b	#8,obj.routine(a1)
	beq.s	loc_20D098
	bclr	#0,obj.var_2c(a1)
	move.b	#6,obj.routine(a1)
	bra.w	loc_20D0BC

; ------------------------------------------------------------------------------

loc_20D098:
	cmpi.b	#$20,obj.var_2a(a0)
	beq.s	loc_20D0AA
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.var_2a(a0)
	bgt.s	loc_20D0BC

loc_20D0AA:
	move.b	#$20,obj.var_2a(a0)
	bclr	#0,obj.var_2c(a1)
	move.b	#$14,obj.routine(a0)

loc_20D0BC:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_Routine14:
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.var_2a(a0)
	cmpi.b	#$30,obj.var_2a(a0)
	blt.s	loc_20D0EA
	move.b	#$30,obj.var_2a(a0)
	move.b	#6,obj.routine(a0)
	move.b	#2,obj.routine(a1)

loc_20D0EA:
	bra.w	loc_20D132

; ------------------------------------------------------------------------------

BossThighObject_0_Routine16:
	btst	#0,obj.var_2c(a0)
	bne.s	loc_20D12E
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_30(a1),a1
	cmpi.b	#2,obj.routine(a1)
	beq.s	loc_20D114
	cmpi.b	#4,obj.routine(a1)
	beq.s	loc_20D118
	move.b	#2,obj.routine(a1)

loc_20D114:
	bra.w	loc_20D12E

; ------------------------------------------------------------------------------

loc_20D118:
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.var_2a(a0)
	cmpi.b	#$50,obj.var_2a(a0)
	blt.s	loc_20D12E
	bset	#0,obj.var_2c(a0)

loc_20D12E:
	bra.w	*+4

; ------------------------------------------------------------------------------

loc_20D132:
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	jsr	(SineCosine).l
	moveq	#0,d2
	moveq	#0,d3
	asr.w	#4,d0
	asr.w	#4,d1
	btst	#4,obj.var_2c(a0)
	beq.w	loc_20D198
	btst	#5,obj.var_2c(a0)
	beq.w	loc_20D19E
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20D16A
	move.w	d1,obj.var_34(a0)
	move.w	d0,obj.var_38(a0)

loc_20D16A:
	move.w	d0,d2
	move.w	d1,d3
	sub.w	obj.var_34(a0),d3
	sub.w	obj.var_38(a0),d2
	move.w	d1,obj.var_34(a0)
	move.w	d0,obj.var_38(a0)
	movea.w	obj.var_2e(a0),a1
	sub.w	d3,obj.x(a1)
	sub.w	d2,obj.y(a1)
	movea.w	obj.var_2e(a1),a1
	sub.w	d3,obj.x(a1)
	sub.w	d2,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

loc_20D198:
	bclr	#1,obj.var_2c(a0)

loc_20D19E:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),d2
	addi.w	#$C,d2
	add.w	d1,d2
	btst	#2,obj.var_2c(a0)
	beq.s	loc_20D1B8
	addi.w	#-$A,d2

loc_20D1B8:
	move.w	d2,obj.x(a0)
	move.w	obj.y(a1),d2
	addi.w	#$14,d2
	add.w	d0,d2
	move.w	d2,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossThighObject_0_Routine18:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20D200
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D1EE
	move.l	#0,obj.var_3c(a0)
	move.l	#-$28000,obj.x_speed(a0)
	bra.s	loc_20D22A

; ------------------------------------------------------------------------------

loc_20D1EE:
	move.l	#0,obj.var_3c(a0)
	move.l	#-$28000,obj.x_speed(a0)
	bra.s	loc_20D22A

; ------------------------------------------------------------------------------

loc_20D200:
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D21A
	addi.l	#-$600,obj.var_3c(a0)
	addi.l	#$1860,obj.x_speed(a0)
	bra.s	loc_20D22A

; ------------------------------------------------------------------------------

loc_20D21A:
	subi.l	#-$600,obj.var_3c(a0)
	addi.l	#$1860,obj.x_speed(a0)

loc_20D22A:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20D24A
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20D24A:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

BossCalfObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D262(pc,d0.w),d0
	jsr	off_20D262(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20D262:
	dc.w	BossCalfObject_0_Routine0-*
	dc.w	BossCalfObject_0_Routine2-off_20D262
	dc.w	BossCalfObject_0_Routine4-off_20D262
	dc.w	BossCalfObject_0_Routine6-off_20D262
	dc.w	BossCalfObject_0_Routine8-off_20D262
	dc.w	BossCalfObject_0_RoutineA-off_20D262
	dc.w	BossCalfObject_0_RoutineC-off_20D262
	dc.w	BossCalfObject_0_RoutineE-off_20D262

; ------------------------------------------------------------------------------

BossCalfObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.l	#Spr_20D8E2,obj.sprite_data(a0)
	move.l	#$8000,obj.var_3c(a0)
	move.l	#$4000,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

BossCalfObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),d2
	addq.w	#4,d2
	move.w	d2,obj.x(a0)
	move.w	obj.y(a1),d2
	addi.w	#$10,d2
	move.w	d2,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossCalfObject_0_Routine4:
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_2e(a1),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#-$A,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossCalfObject_0_Routine6:
	cmpi.w	#8,obj.var_34(a0)
	bge.s	loc_20D30E
	move.l	obj.var_3c(a0),d1
	add.l	d1,obj.var_34(a0)
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D30E
	neg.l	d1
	moveq	#0,d2
	bra.w	loc_20D3AC

; ------------------------------------------------------------------------------

loc_20D30E:
	bra.w	loc_20D3DE

; ------------------------------------------------------------------------------

BossCalfObject_0_Routine8:
	move.w	#0,obj.var_38(a0)
	cmpi.w	#-8,obj.var_34(a0)
	ble.s	loc_20D336
	move.l	obj.var_3c(a0),d1
	sub.l	d1,obj.var_34(a0)
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D336
	moveq	#0,d2
	bra.w	loc_20D3AC

; ------------------------------------------------------------------------------

loc_20D336:
	bra.w	loc_20D3DE

; ------------------------------------------------------------------------------

BossCalfObject_0_RoutineA:
	cmpi.w	#-8,obj.var_34(a0)
	ble.s	loc_20D34C
	move.l	obj.var_3c(a0),d1
	sub.l	d1,obj.var_34(a0)
	bra.s	loc_20D34E

; ------------------------------------------------------------------------------

loc_20D34C:
	moveq	#0,d1

loc_20D34E:
	cmpi.w	#-4,obj.var_38(a0)
	ble.s	loc_20D360
	move.l	obj.x_speed(a0),d2
	sub.l	d2,obj.var_38(a0)
	bra.s	loc_20D362

; ------------------------------------------------------------------------------

loc_20D360:
	moveq	#0,d2

loc_20D362:
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D36E
	bra.w	loc_20D3AC

; ------------------------------------------------------------------------------

loc_20D36E:
	bra.w	loc_20D3DE

; ------------------------------------------------------------------------------

BossCalfObject_0_RoutineC:
	cmpi.w	#-8,obj.var_34(a0)
	ble.s	loc_20D384
	move.l	obj.var_3c(a0),d1
	sub.l	d1,obj.var_34(a0)
	bra.s	loc_20D386

; ------------------------------------------------------------------------------

loc_20D384:
	moveq	#0,d1

loc_20D386:
	cmpi.w	#4,obj.var_38(a0)
	bge.s	loc_20D398
	move.l	obj.x_speed(a0),d2
	add.l	d2,obj.var_38(a0)
	bra.s	loc_20D39A

; ------------------------------------------------------------------------------

loc_20D398:
	moveq	#0,d2

loc_20D39A:
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D3A8
	neg.l	d2
	bra.w	loc_20D3AC

; ------------------------------------------------------------------------------

loc_20D3A8:
	bra.w	loc_20D3DE

; ------------------------------------------------------------------------------

loc_20D3AC:
	btst	#5,obj.var_2c(a0)
	bne.w	loc_20D3B8
	rts

; ------------------------------------------------------------------------------

loc_20D3B8:
	movea.w	obj.var_2e(a0),a3
	add.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	movea.w	obj.var_2e(a3),a3
	add.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	movea.w	obj.var_2e(a3),a3
	add.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	rts

; ------------------------------------------------------------------------------

loc_20D3DE:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),d0
	addq.w	#4,d0
	move.w	d0,obj.x(a0)
	move.w	obj.var_34(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y(a1),d0
	addi.w	#$10,d0
	move.w	d0,obj.y(a0)
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossCalfObject_0_RoutineE:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20D43E
	btst	#4,obj.var_2c(a0)
	bne.s	loc_20D42C
	move.l	#0,obj.var_3c(a0)
	move.l	#-$20000,obj.x_speed(a0)
	bra.s	loc_20D468

; ------------------------------------------------------------------------------

loc_20D42C:
	move.l	#0,obj.var_3c(a0)
	move.l	#-$20000,obj.x_speed(a0)
	bra.s	loc_20D468

; ------------------------------------------------------------------------------

loc_20D43E:
	btst	#4,obj.var_2c(a0)
	bne.s	loc_20D458
	addi.l	#-$600,obj.var_3c(a0)
	addi.l	#$1A60,obj.x_speed(a0)
	bra.s	loc_20D468

; ------------------------------------------------------------------------------

loc_20D458:
	subi.l	#-$600,obj.var_3c(a0)
	addi.l	#$1A60,obj.x_speed(a0)

loc_20D468:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20D488
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20D488:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

BossFootObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D4A0(pc,d0.w),d0
	jsr	off_20D4A0(pc,d0.w)
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

off_20D4A0:
	dc.w	BossFootObject_0_Routine0-*
	dc.w	BossFootObject_0_Routine2-off_20D4A0
	dc.w	BossFootObject_0_Routine4-off_20D4A0
	dc.w	BossFootObject_0_Routine6-off_20D4A0
	dc.w	BossFootObject_0_Routine8-off_20D4A0
	dc.w	BossFootObject_0_RoutineA-off_20D4A0
	dc.w	BossFootObject_0_RoutineC-off_20D4A0

; ------------------------------------------------------------------------------

BossFootObject_0_Routine0:
	clr.b	obj.flags(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.w	#$2359,obj.sprite_tile(a0)
	move.l	#Spr_20D8F0,obj.sprite_data(a0)
	move.l	#$4000,obj.var_3c(a0)
	move.l	#$8000,obj.x_speed(a0)
	move.b	#4,obj.routine(a0)
	bset	#0,obj.var_2c(a0)
	move.w	#-8,obj.var_34(a0)
	move.w	#$10,obj.var_38(a0)
	bra.w	loc_20D67A

; ------------------------------------------------------------------------------

BossFootObject_0_Routine2:
	move.l	obj.var_3c(a0),d0
	sub.l	d0,obj.var_34(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.var_38(a0)
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D52A
	btst	#7,obj.var_2c(a0)
	beq.s	loc_20D52A
	cmpi.w	#$C,obj.var_38(a0)
	blt.s	loc_20D536
	bra.w	loc_20D548

; ------------------------------------------------------------------------------

loc_20D52A:
	cmpi.w	#$10,obj.var_38(a0)
	blt.s	loc_20D536
	bra.w	loc_20D548

; ------------------------------------------------------------------------------

loc_20D536:
	bsr.w	loc_20D620
	jsr	(CheckBlockDown).l
	tst.w	d1
	ble.w	loc_20D556
	rts

; ------------------------------------------------------------------------------

loc_20D548:
	bset	#0,obj.var_2c(a0)
	move.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D556:
	bset	#4,obj.var_2c(a0)
	movea.w	obj.var_2e(a0),a3
	bset	#4,obj.var_2c(a3)
	movea.w	obj.var_2e(a3),a3
	bset	#4,obj.var_2c(a3)
	movea.w	obj.var_2e(a3),a3
	movea.w	obj.var_2e(a3),a3
	move.b	#8,obj.var_35(a3)
	move.w	#$7E,d0
	jsr	(SubCpuCommand).l
	rts

; ------------------------------------------------------------------------------

BossFootObject_0_Routine6:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.var_34(a0)
	move.l	obj.x_speed(a0),d0
	sub.l	d0,obj.var_38(a0)
	cmpi.w	#0,obj.var_38(a0)
	bgt.s	loc_20D5C2
	move.w	#0,obj.var_34(a0)
	clr.w	obj.var_36(a0)
	move.w	#0,obj.var_38(a0)
	clr.w	obj.var_3a(a0)
	bset	#0,obj.var_2c(a0)
	move.b	#8,obj.routine(a0)

loc_20D5C2:
	bra.w	loc_20D620

; ------------------------------------------------------------------------------

BossFootObject_0_Routine4:
	btst	#4,obj.var_2c(a0)
	bne.w	locret_20D5E0
	bsr.w	loc_20D67A
	jsr	(CheckBlockDown).l
	tst.w	d1
	ble.w	loc_20D556

locret_20D5E0:
	rts

; ------------------------------------------------------------------------------

BossFootObject_0_Routine8:
	bsr.w	loc_20D67A
	rts

; ------------------------------------------------------------------------------

BossFootObject_0_RoutineA:
	movea.w	obj.var_2e(a0),a1
	movea.w	obj.var_2e(a1),a1
	movea.w	obj.var_2e(a1),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	movea.w	obj.var_30(a1),a1
	move.w	obj.x(a1),obj.x(a0)
	addi.w	#-$A,obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.w	obj.var_34(a1),obj.var_34(a0)
	move.w	obj.var_38(a1),obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D620:
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D67A
	btst	#5,obj.var_2c(a0)
	bne.w	loc_20D634
	rts

; ------------------------------------------------------------------------------

loc_20D634:
	move.l	obj.var_3c(a0),d1
	move.l	obj.x_speed(a0),d2
	cmpi.b	#6,obj.routine(a0)
	beq.s	loc_20D648
	neg.l	d1
	neg.l	d2

loc_20D648:
	movea.w	obj.var_2e(a0),a3
	sub.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	movea.w	obj.var_2e(a3),a3
	sub.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	movea.w	obj.var_2e(a3),a3
	sub.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	movea.w	obj.var_2e(a3),a3
	sub.l	d1,obj.x(a3)
	add.l	d2,obj.y(a3)
	rts

; ------------------------------------------------------------------------------

loc_20D67A:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),d0
	addi.w	#-$B,d0
	move.w	d0,obj.x(a0)
	move.w	obj.var_34(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y(a1),d0
	addi.w	#$E,d0
	move.w	d0,obj.y(a0)
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossFootObject_0_RoutineC:
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20D6DC
	btst	#4,obj.var_2c(a0)
	beq.s	loc_20D6CA
	move.l	#0,obj.var_3c(a0)
	move.l	#-$23000,obj.x_speed(a0)
	bra.s	loc_20D706

; ------------------------------------------------------------------------------

loc_20D6CA:
	move.l	#0,obj.var_3c(a0)
	move.l	#-$23000,obj.x_speed(a0)
	bra.s	loc_20D706

; ------------------------------------------------------------------------------

loc_20D6DC:
	btst	#4,obj.var_2c(a0)
	bne.s	loc_20D6F6
	addi.l	#-$660,obj.var_3c(a0)
	addi.l	#$1660,obj.x_speed(a0)
	bra.s	loc_20D706

; ------------------------------------------------------------------------------

loc_20D6F6:
	subi.l	#-$660,obj.var_3c(a0)
	addi.l	#$1660,obj.x_speed(a0)

loc_20D706:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$240,obj.y(a0)
	blt.s	loc_20D726
	addq.l	#4,sp
	jmp	(DeleteObject).l

; ------------------------------------------------------------------------------

loc_20D726:
	bra.w	locret_20D7AE

; ------------------------------------------------------------------------------

sub_20D72A:
	moveq	#0,d2
	move.b	obj.var_2b(a0),d2
	divu.w	#4,d2
	swap	d2
	tst.w	d2
	bne.s	locret_20D784
	clr.w	d2
	swap	d2
	divu.w	#$A,d2
	swap	d2
	add.w	d2,d2
	add.w	d2,d2
	jsr	(SpawnObject).l
	bne.s	locret_20D784
	st	obj.routine_2(a1)
	lea	(word_20D786).l,a2
	adda.w	d2,a2
	move.b	#$18,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,d0
	add.w	d0,obj.x(a1)
	move.w	(a2),d0
	add.w	d0,obj.y(a1)
	move.w	#$9E,d0
	jsr	(PlayFmSound).l

locret_20D784:
	rts

; ------------------------------------------------------------------------------

word_20D786:
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

locret_20D7AE:
	rts

; ------------------------------------------------------------------------------

	eori.b	#1,obj.var_2b(a0)
	bne.s	locret_20D7BA
	addq.l	#4,sp

locret_20D7BA:
	rts

; ------------------------------------------------------------------------------

Ani_20D7BC:
	dc.w	@Ani_20D7BC_0-*
	dc.w	@Ani_20D7BC_1-Ani_20D7BC
	dc.w	@Ani_20D7BC_2-Ani_20D7BC
	dc.w	@Ani_20D7BC_3-Ani_20D7BC
	dc.w	@Ani_20D7BC_4-Ani_20D7BC

@Ani_20D7BC_0:
	dc.b	$3B
	dc.b	0
	dc.b	$FF

@Ani_20D7BC_1:
	dc.b	7
	dc.b	2, 3
	dc.b	$FF

@Ani_20D7BC_2:
	dc.b	3
	dc.b	1, 5, 4, 6
	dc.b	$FF

@Ani_20D7BC_3:
	dc.b	3
	dc.b	7, 8
	dc.b	$FF

@Ani_20D7BC_4:
	dc.b	3
	dc.b	9, $A
	dc.b	$FF
	dc.b	0

Spr_20D7DC:
	dc.w	@Spr_20D7DC_0-*
	dc.w	@Spr_20D7DC_1-Spr_20D7DC
	dc.w	@Spr_20D7DC_2-Spr_20D7DC
	dc.w	@Spr_20D7DC_3-Spr_20D7DC
	dc.w	@Spr_20D7DC_4-Spr_20D7DC
	dc.w	@Spr_20D7DC_5-Spr_20D7DC
	dc.w	@Spr_20D7DC_6-Spr_20D7DC
	dc.w	@Spr_20D7DC_7-Spr_20D7DC
	dc.w	@Spr_20D7DC_8-Spr_20D7DC
	dc.w	@Spr_20D7DC_9-Spr_20D7DC
	dc.w	@Spr_20D7DC_A-Spr_20D7DC

@Spr_20D7DC_0:
	dc.b	2
	dc.b	$E8, $D, 0, 0, $E4
	dc.b	$E8, 1, 0, 8, 4
	dc.b	0

@Spr_20D7DC_1:
	dc.b	3
	dc.b	$D8, 5, 8, $32, $E4
	dc.b	$E8, $D, 0, $A, $E4
	dc.b	$E8, 1, 0, $12, 4

@Spr_20D7DC_2:
	dc.b	2
	dc.b	$E8, $D, 0, $14, $E4
	dc.b	$E8, 1, 0, $1C, 4
	dc.b	0

@Spr_20D7DC_3:
	dc.b	2
	dc.b	$E8, $D, 0, $1E, $E4
	dc.b	$E8, 1, 0, $26, 4
	dc.b	0

@Spr_20D7DC_4:
	dc.b	3
	dc.b	$D8, 5, 8, $36, $E4
	dc.b	$E8, $D, 0, $28, $E4
	dc.b	$E8, 1, 0, $30, 4

@Spr_20D7DC_5:
	dc.b	2
	dc.b	$E8, $D, 0, $A, $E4
	dc.b	$E8, 1, 0, $12, 4
	dc.b	0

@Spr_20D7DC_6:
	dc.b	2
	dc.b	$E8, $D, 0, $28, $E4
	dc.b	$E8, 1, 0, $30, 4
	dc.b	0

@Spr_20D7DC_7:
	dc.b	4
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $52, $F0
	dc.b	8, 1, 0, $6D, $E4
	dc.b	0

@Spr_20D7DC_8:
	dc.b	4
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $52, $F0
	dc.b	8, 0, 0, $6F, $E4
	dc.b	0

@Spr_20D7DC_9:
	dc.b	5
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $5E, $E8
	dc.b	8, 2, 0, $6A, 8
	dc.b	8, 1, 0, $6D, $E4

@Spr_20D7DC_A:
	dc.b	5
	dc.b	$E8, $F, 0, $3A, $E8
	dc.b	$E8, 7, 0, $4A, 8
	dc.b	8, $E, 0, $5E, $E8
	dc.b	8, 2, 0, $6A, 8
	dc.b	8, 0, 0, $6F, $E4

Spr_20D8AE:
	dc.w	@Spr_20D8AE_0-*

@Spr_20D8AE_0:
	dc.b	8
	dc.b	8, $A, $20, $69, 0
	dc.b	$E0, 8, 0, 0, $F4
	dc.b	$E0, $A, 0, 3, $C
	dc.b	$F8, $F, 0, $C, $DC
	dc.b	$F8, $E, 0, $1C, $FC
	dc.b	$F8, 1, 0, $28, $1C
	dc.b	$18, 8, 0, $2A, $E4
	dc.b	$10, 9, 0, $2D, $FC
	dc.b	0

Spr_20D8DA:
	dc.w	@Spr_20D8DA_0-*

@Spr_20D8DA_0:
	dc.b	1
	dc.b	$F8, 5, 0, $72, $F8

Spr_20D8E2:
	dc.w	@Spr_20D8E2_0-*

@Spr_20D8E2_0:
	dc.b	2
	dc.b	$EC, $B, 0, $76, $F4
	dc.b	$C, 4, 0, $82, $F4
	dc.b	0

Spr_20D8F0:
	dc.w	@Spr_20D8F0_0-*

@Spr_20D8F0_0:
	dc.b	3
	dc.b	$F4, $F, 0, $84, $E0
	dc.b	$EC, $B, 0, $94, 0
	dc.b	$C, $C, 0, $A0, 0

Spr_20D902:
	dc.w	@Spr_20D902_0-*

@Spr_20D902_0:
	dc.b	2
	dc.b	$F4, $E, 0, $33, $E8
	dc.b	$F4, 1, 0, $3F, 8
	dc.b	0

Spr_20D910:
	dc.w	@Spr_20D910_0-*

@Spr_20D910_0:
	dc.b	1
	dc.b	$F8, 5, 0, $41, $F8

Spr_20D918:
	dc.w	@Spr_20D918_0-*
	dc.w	@Spr_20D918_1-Spr_20D918
	dc.w	@Spr_20D918_2-Spr_20D918

@Spr_20D918_0:
	dc.b	2
	dc.b	$F8, $D, 0, $45, $F2
	dc.b	$F8, 9, 0, $57, $A
	dc.b	0

@Spr_20D918_1:
	dc.b	2
	dc.b	$F8, 9, 0, $4D, $FA
	dc.b	$F8, 9, 0, $57, $A
	dc.b	0

@Spr_20D918_2:
	dc.b	2
	dc.b	$F8, 5, 0, $53, 2
	dc.b	$F8, 9, 0, $57, $A
	dc.b	0

Spr_20D942:
	dc.w	@Spr_20D942_0-*
	dc.w	@Spr_20D942_1-Spr_20D942
	dc.w	@Spr_20D942_2-Spr_20D942

@Spr_20D942_0:
	dc.b	1
	dc.b	$F8, $D, 0, $45, $F2

@Spr_20D942_1:
	dc.b	1
	dc.b	$F8, 9, 0, $4D, $FA

@Spr_20D942_2:
	dc.b	1
	dc.b	$F8, 5, 0, $53, 2

Spr_20D95A:
	dc.w	@Spr_20D95A_0-*

@Spr_20D95A_0:
	dc.b	1
	dc.b	$F0, $B, 0, $5D, $EC

; ------------------------------------------------------------------------------