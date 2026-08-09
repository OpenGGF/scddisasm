; ------------------------------------------------------------------------------

EggmanObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B32A(pc,d0.w),d0
	jsr	off_20B32A(pc,d0.w)
	tst.b	obj.anim_id(a0)
	beq.s	loc_20B324
	lea	(EggmanAnims).l,a1
	jsr	AnimateObject

loc_20B324:
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20B32A:
	dc.w	EggmanObject_0_Routine0-*
	dc.w	EggmanObject_0_Routine2-off_20B32A
	dc.w	EggmanObject_0_Routine4-off_20B32A

; ------------------------------------------------------------------------------

EggmanObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2BC,obj.sprite_tile(a0)
	move.l	#EggmanSprites,obj.sprite_data(a0)
	bsr.w	sub_20C304

EggmanObject_0_Routine2:
	btst	#2,obj.var_2c(a0)
	bne.w	loc_20B3A6
	movea.w	obj.var_2e(a0),a1
	move.w	obj.y(a1),obj.y(a0)
	cmpi.b	#4,obj.sprite_frame(a1)
	bge.s	loc_20B37C
	rts

; ------------------------------------------------------------------------------

loc_20B37C:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20B390
	subq.b	#1,obj.var_2a(a0)
	cmpi.b	#$14,obj.var_2a(a0)
	beq.s	loc_20B39E
	rts

; ------------------------------------------------------------------------------

loc_20B390:
	moveq	#2,d0
	bsr.w	sub_20C3FE
	move.b	#$44,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B39E:
	moveq	#0,d0
	bsr.w	sub_20C3FE
	rts

; ------------------------------------------------------------------------------

loc_20B3A6:
	move.b	#3,obj.sprite_layer(a0)
	clr.b	obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	moveq	#3,d0
	bsr.w	sub_20C3FE
	addq.w	#6,obj.y(a0)
	moveq	#$64,d0
	jsr	AddPoints

EggmanObject_0_Routine4:
	addi.l	#$12000,obj.x(a0)
	cmpi.w	#$E20,obj.x(a0)
	bge.w	BossExplosionObject_0_Routine4
	rts

; ------------------------------------------------------------------------------

BossTopObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B3FC(pc,d0.w),d0
	jsr	off_20B3FC(pc,d0.w)
	movea.w	obj.var_30(a0),a1
	btst	#3,obj.var_2c(a1)
	bne.s	locret_20B3FA
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20B3FA:
	rts

; ------------------------------------------------------------------------------

off_20B3FC:
	dc.w	BossTopObject_0_Routine0-*
	dc.w	BossTopObject_0_Routine2-off_20B3FC
	dc.w	BossTopObject_0_Routine4-off_20B3FC
	dc.w	BossTopObject_0_Routine6-off_20B3FC

; ------------------------------------------------------------------------------

BossTopObject_0_Routine0:
	move.w	#6,d0
	movem.l	d7-a7,-(sp)
	jsr	LoadPalette
	movem.l	(sp)+,d7-a7
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#BossTopSprites,obj.sprite_data(a0)
	bsr.w	sub_20C2AE

BossTopObject_0_Routine2:
	btst	#1,obj.var_2c(a0)
	bne.s	loc_20B464
	cmpi.w	#$C8,(scroll_focus_y).w
	blt.s	loc_20B460
	move.b	#5,(boss_flags).w
	bset	#1,obj.var_2c(a0)

loc_20B460:
	addq.w	#6,(scroll_focus_y).w

loc_20B464:
	move.w	#$CC0,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	bsr.w	sub_20C416
	move.w	obj.x(a1),d0
	subi.w	#$A0,d0
	cmp.w	(left_bound).w,d0
	blt.s	locret_20B4BE
	cmpi.w	#$D60,obj.x(a1)
	blt.s	loc_20B4B6
	bclr	#1,obj.var_2c(a0)
	move.w	#$67,d0
	jsr	SubCpuCommand
	move.b	#5,(boss_started).w
	move.b	#6,obj.routine(a0)
	move.w	#$CC0,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	move.w	#$CC0,d0

loc_20B4B6:
	move.w	d0,(left_bound).w
	move.w	d0,(target_left_bound).w

locret_20B4BE:
	rts

; ------------------------------------------------------------------------------

BossTopObject_0_Routine4:
	lea	(word_202856+2).l,a1
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	(a1)+,d3
	addq.w	#6,(right_bound).w
	addq.w	#6,(target_right_bound).w
	cmp.w	(right_bound).w,d1
	ble.s	loc_20B4DE
	rts

; ------------------------------------------------------------------------------

loc_20B4DE:
	clr.b	(boss_started).w
	move.w	d1,(right_bound).w
	move.w	d1,(target_right_bound).w
	move.w	#$1A,d0
	tst.b	(good_future).l
	beq.s	loc_20B4FA
	move.w	#$19,d0

loc_20B4FA:
	jsr	SubCpuCommand
	jsr	LoadCapsulePalette
	move.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BossTopObject_0_Routine6:
	movea.w	obj.var_30(a0),a1
	bclr	#7,$2C(a1)
	beq.s	loc_20B520
	move.b	#8,obj.var_3e(a0)

loc_20B520:
	tst.b	obj.var_3e(a0)
	beq.s	locret_20B540
	subq.b	#1,obj.var_3e(a0)
	move.w	#2,d0
	btst	#0,obj.var_3e(a0)
	beq.s	loc_20B538
	neg.w	d0

loc_20B538:
	add.w	d0,(bottom_bound).w
	add.w	d0,(target_bottom_bound).w

locret_20B540:
	rts

; ------------------------------------------------------------------------------

BossBoothObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B598(pc,d0.w),d0
	jsr	off_20B598(pc,d0.w)
	btst	#3,obj.var_2c(a0)
	bne.s	locret_20B596
	move.w	#$DD0,obj.x(a0)
	movea.w	obj.var_32(a0),a1
	cmpi.w	#$400,obj.var_32(a1)
	blt.s	loc_20B590
	cmpi.w	#$500,obj.var_32(a1)
	blt.s	loc_20B584
	addq.w	#1,obj.x(a0)
	eori.b	#1,obj.var_34(a0)
	beq.s	loc_20B590
	subq.w	#2,obj.x(a0)
	bra.s	loc_20B590

; ------------------------------------------------------------------------------

loc_20B584:
	eori.b	#1,obj.var_34(a0)
	beq.s	loc_20B590
	subq.w	#1,obj.x(a0)

loc_20B590:
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20B596:
	rts

; ------------------------------------------------------------------------------

off_20B598:
	dc.w	BossBoothObject_0_Routine0-*
	dc.w	BossBoothObject_0_Routine2-off_20B598
	dc.w	BossBoothObject_0_Routine4-off_20B598
	dc.w	BossBoothObject_0_Routine6-off_20B598
	dc.w	BossBoothObject_0_Routine8-off_20B598
	dc.w	BossBoothObject_0_RoutineA-off_20B598
	dc.w	BossBoothObject_0_RoutineC-off_20B598

; ------------------------------------------------------------------------------

BossBoothObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$70,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#BossBoothSprites,obj.sprite_data(a0)
	bsr.w	sub_20C2DC
	bsr.w	sub_20C35C
	bsr.w	sub_20C338
	bsr.w	sub_20C3E2
	move.b	#$3E,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.w	#$960,obj.var_3e(a0)

BossBoothObject_0_Routine2:
	tst.b	obj.collide_type(a0)
	bne.s	locret_20B60C
	move.w	#$AC,d0
	jsr	PlayFmSound
	move.b	#4,obj.routine(a0)
	clr.b	obj.collide_status(a0)

locret_20B60C:
	rts

; ------------------------------------------------------------------------------

BossBoothObject_0_Routine4:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$3C,obj.var_2a(a0)
	beq.s	loc_20B630
	move.w	#2,d0
	btst	#0,obj.var_2a(a0)
	bne.s	loc_20B62A
	move.w	#$FFFE,d0

loc_20B62A:
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B630:
	clr.b	obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	move.l	#$13000,obj.x_speed(a0)
	movea.w	obj.var_30(a0),a1
	moveq	#1,d0
	bsr.w	loc_20C400
	move.w	#$288,obj.var_38(a0)
	move.w	#$280,obj.var_36(a0)

BossBoothObject_0_Routine6:
	movea.w	obj.var_2e(a0),a1
	cmpi.b	#2,obj.var_2d(a0)
	beq.s	loc_20B66A
	cmpi.b	#1,obj.var_2d(a0)
	beq.s	loc_20B69E

loc_20B66A:
	move.w	obj.y(a0),d0
	cmp.w	obj.var_38(a0),d0
	bge.s	loc_20B67E
	addi.l	#$13000,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B67E:
	move.w	#$B4,d0
	jsr	PlayFmSound
	bset	#7,obj.var_2c(a0)
	bsr.w	sub_20C1C4
	tst.b	obj.var_2d(a0)
	bne.s	loc_20B6C2
	addq.b	#1,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B69E:
	move.w	obj.y(a0),d0
	cmp.w	obj.var_36(a0),d0
	blt.s	loc_20B6B2
	subi.l	#$8000,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B6B2:
	move.w	#$B4,d0
	jsr	PlayFmSound
	addq.b	#1,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B6C2:
	tst.b	obj.sprite_frame(a0)
	bne.s	loc_20B6E0
	move.w	#$C4,d0
	jsr	PlayFmSound
	addq.b	#1,obj.sprite_frame(a0)
	movea.w	obj.var_30(a0),a1
	moveq	#0,d0
	bsr.w	loc_20C400

loc_20B6E0:
	move.b	#8,obj.routine(a0)
	clr.b	obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

BossBoothObject_0_Routine8:
	bsr.w	loc_20B802
	moveq	#0,d0
	move.w	obj.var_3e(a0),d0
	divu.w	#6,d0
	andi.l	#$FFFF0000,d0
	bne.s	loc_20B710
	bset	#1,obj.var_2c(a0)
	bne.s	loc_20B716
	bsr.w	sub_20C196
	bra.s	loc_20B716

; ------------------------------------------------------------------------------

loc_20B710:
	bclr	#1,obj.var_2c(a0)

loc_20B716:
	tst.w	obj.var_3e(a0)
	ble.s	loc_20B736
	cmpi.w	#$708,obj.var_3e(a0)
	beq.s	loc_20B75C
	cmpi.w	#$4B0,obj.var_3e(a0)
	beq.s	loc_20B75C
	cmpi.w	#$258,obj.var_3e(a0)
	beq.s	loc_20B75C
	rts

; ------------------------------------------------------------------------------

loc_20B736:
	bset	#2,obj.var_2c(a0)
	movea.w	obj.var_30(a0),a1
	bset	#2,$2C(a1)
	move.b	#$A,obj.routine(a0)
	addq.b	#1,obj.sprite_frame(a0)
	movea.w	obj.var_2e(a0),a2
	move.b	#4,obj.routine(a2)
	rts

; ------------------------------------------------------------------------------

loc_20B75C:
	bsr.w	sub_20C1C4
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	add.w	d0,d0
	move.w	word_20B78E(pc,d0.w),d0
	move.w	obj.y(a0),obj.var_38(a0)
	move.w	obj.y(a0),obj.var_36(a0)
	add.w	d0,obj.var_38(a0)
	lsr.w	#1,d0
	add.w	d0,obj.var_36(a0)
	move.b	#6,obj.routine(a0)
	addq.b	#1,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

word_20B78E:
	dc.w	0
	dc.w	8
	dc.w	8
	dc.w	8

; ------------------------------------------------------------------------------

BossBoothObject_0_RoutineA:
	bsr.w	loc_20B802
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$3C,obj.var_2a(a0)
	beq.s	loc_20B7BE
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	divu.w	#$12,d0
	andi.l	#$FFFF0000,d0
	bne.s	locret_20B7BC
	bsr.w	sub_20C1C4

locret_20B7BC:
	rts

; ------------------------------------------------------------------------------

loc_20B7BE:
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	move.b	#$C,obj.routine(a0)
	move.b	#1,(Z80_RAM+$1C3E).l
	rts

; ------------------------------------------------------------------------------

BossBoothObject_0_RoutineC:
	cmpi.b	#$78,obj.var_2a(a0)
	bcc.s	loc_20B7FA
	bsr.w	loc_20B802
	addq.b	#1,obj.var_2a(a0)
	bsr.w	sub_20C238
	btst	#0,obj.var_2a(a0)
	beq.s	loc_20B7FA
	bclr	#3,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B7FA:
	bset	#3,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B802:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	(player_object).w,a1
	jsr	SolidObject
	rts

; ------------------------------------------------------------------------------

BossBoothBackObject:
	movea.w	obj.var_2e(a0),a2
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B838(pc,d0.w),d0
	jsr	off_20B838(pc,d0.w)
	btst	#3,obj.var_2c(a2)
	bne.s	locret_20B836
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20B836:
	rts

; ------------------------------------------------------------------------------

off_20B838:
	dc.w	BossBoothBackObject_0_Routine0-*
	dc.w	BossBoothBackObject_0_Routine2-off_20B838

; ------------------------------------------------------------------------------

BossBoothBackObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#BossBackSprites,obj.sprite_data(a0)

BossBoothBackObject_0_Routine2:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossPipesObject:
	movea.w	obj.var_2e(a0),a2
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B896(pc,d0.w),d0
	jsr	off_20B896(pc,d0.w)
	btst	#3,obj.var_2c(a2)
	bne.s	locret_20B894
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20B894:
	rts

; ------------------------------------------------------------------------------

off_20B896:
	dc.w	BossPipesObject_0_Routine0-*
	dc.w	BossPipesObject_0_Routine2-off_20B896

; ------------------------------------------------------------------------------

BossPipesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$30,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#BossPipesSprites,obj.sprite_data(a0)

BossPipesObject_0_Routine2:
	moveq	#0,d0
	move.w	$C(a2),d0
	sub.w	obj.y(a0),d0
	divu.w	#$20,d0
	move.b	d0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

BombDropperObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B8F8(pc,d0.w),d0
	jsr	off_20B8F8(pc,d0.w)
	lea	(BombDropAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20B8F8:
	dc.w	BombDropperObject_0_Routine0-*
	dc.w	BombDropperObject_0_Routine2-off_20B8F8
	dc.w	BombDropperObject_0_Routine4-off_20B8F8
	dc.w	BombDropperObject_0_Routine6-off_20B8F8
	dc.w	BombDropperObject_0_Routine8-off_20B8F8
	dc.w	BombDropperObject_0_RoutineA-off_20B8F8
	dc.w	BombDropperObject_0_RoutineC-off_20B8F8

; ------------------------------------------------------------------------------

BombDropperObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$2BC,obj.sprite_tile(a0)
	move.l	#BombDropSprites,obj.sprite_data(a0)

BombDropperObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	movea.w	$2E(a1),a1
	cmpi.b	#2,$24(a1)
	bne.s	loc_20B944
	rts

; ------------------------------------------------------------------------------

loc_20B944:
	move.b	#4,obj.routine(a0)

BombDropperObject_0_Routine4:
	cmpi.w	#$DC0,obj.x(a0)
	bge.s	loc_20B95C
	addi.l	#$1E000,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B95C:
	move.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BombDropperObject_0_Routine6:
	movea.w	obj.var_2e(a0),a1
	movea.w	$2E(a1),a1
	cmpi.w	#$D2,$3E(a1)
	ble.w	BossExplosionObject_0_Routine4
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$B4,obj.var_2a(a0)
	beq.s	loc_20B984
	rts

; ------------------------------------------------------------------------------

loc_20B984:
	clr.b	obj.var_2a(a0)
	move.w	#$CB,d0
	jsr	PlayFmSound
	move.b	#8,obj.routine(a0)
	bsr.w	loc_20BA30
	bsr.w	sub_20C386
	moveq	#1,d0
	bsr.w	sub_20C3FE
	rts

; ------------------------------------------------------------------------------

BombDropperObject_0_Routine8:
	subi.l	#$C000,obj.x(a0)
	cmpi.w	#$DA0,obj.x(a0)
	ble.s	loc_20B9BA
	rts

; ------------------------------------------------------------------------------

loc_20B9BA:
	move.b	#$A,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BombDropperObject_0_RoutineA:
	bsr.w	sub_20C416
	move.w	obj.x(a1),d0
	cmp.w	obj.x(a0),d0
	bge.s	loc_20B9E2
	cmpi.w	#$CE0,obj.x(a0)
	ble.s	loc_20B9E2
	subi.l	#$C000,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B9E2:
	move.w	#$C4,d0
	jsr	PlayFmSound
	bsr.w	loc_20BA48
	move.b	#$C,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BombDropperObject_0_RoutineC:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$1E,obj.var_2a(a0)
	beq.s	loc_20BA1E
	cmpi.b	#$78,obj.var_2a(a0)
	beq.s	loc_20BA0E
	rts

; ------------------------------------------------------------------------------

loc_20BA0E:
	clr.b	obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	bsr.w	loc_20BA48
	rts

; ------------------------------------------------------------------------------

loc_20BA1E:
	bsr.w	loc_20BA30
	bset	#6,obj.var_2c(a0)
	moveq	#0,d0
	bsr.w	sub_20C3FE
	rts

; ------------------------------------------------------------------------------

loc_20BA30:
	movea.w	obj.var_2e(a0),a1
	tst.b	$1C(a1)
	bne.s	locret_20BA46
	moveq	#0,d0
	bsr.w	loc_20C400
	move.b	#1,$1A(a1)

locret_20BA46:
	rts

; ------------------------------------------------------------------------------

loc_20BA48:
	movea.w	obj.var_2e(a0),a1
	tst.b	$1C(a1)
	bne.s	locret_20BA5E
	moveq	#0,d0
	bsr.w	loc_20C400
	move.b	#0,$1A(a1)

locret_20BA5E:
	rts

; ------------------------------------------------------------------------------

LargeBombObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BA74(pc,d0.w),d0
	jsr	off_20BA74(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20BA74:
	dc.w	LargeBombObject_0_Routine0-*
	dc.w	LargeBombObject_0_Routine2-off_20BA74
	dc.w	LargeBombObject_0_Routine4-off_20BA74
	dc.w	LargeBombObject_0_Routine6-off_20BA74
	dc.w	LargeBombObject_0_Routine8-off_20BA74

; ------------------------------------------------------------------------------

LargeBombObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#BombSprites,obj.sprite_data(a0)
	move.b	#$FD,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.w	#$FFFD,obj.var_38(a0)
	move.w	#$C000,obj.var_32(a0)

LargeBombObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	8(a1),obj.x(a0)
	cmpi.b	#$A,$24(a1)
	beq.s	loc_20BAD4
	rts

; ------------------------------------------------------------------------------

loc_20BAD4:
	addq.b	#2,obj.routine(a0)

LargeBombObject_0_Routine4:
	movea.w	obj.var_2e(a0),a1
	move.w	8(a1),obj.x(a0)
	bclr	#6,$2C(a1)
	bne.s	loc_20BB18
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.y(a0)
	addi.w	#$480,obj.var_32(a0)
	move.b	obj.var_32(a0),d0
	jsr	SineCosine
	andi.l	#$FFFF,d0
	muls.w	#3,d0
	asr.w	#8,d0
	move.w	d0,obj.var_38(a0)
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BB18:
	addq.b	#2,obj.routine(a0)

LargeBombObject_0_Routine6:
	cmpi.b	#2,obj.collide_status(a0)
	bgt.w	loc_20BC7C
	movea.w	obj.var_2e(a0),a1
	btst	#2,$2C(a1)
	bne.w	BossExplosionObject_0_Routine4
	addi.l	#$22000,obj.y(a0)
	cmpi.w	#$2B8,obj.y(a0)
	bge.s	loc_20BB46
	rts

; ------------------------------------------------------------------------------

loc_20BB46:
	move.w	#$B4,d0
	jsr	PlayFmSound
	addq.b	#2,obj.routine(a0)

LargeBombObject_0_Routine8:
	cmpi.b	#2,obj.collide_status(a0)
	bgt.w	loc_20BC7C
	movea.w	obj.var_2e(a0),a1
	btst	#2,$2C(a1)
	bne.w	BossExplosionObject_0_Routine4
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#8,obj.var_2a(a0)
	beq.s	loc_20BB7A
	rts

; ------------------------------------------------------------------------------

loc_20BB7A:
	bsr.w	sub_20C3B0
	bra.w	BossExplosionObject_0_Routine4

; ------------------------------------------------------------------------------

SmallBombObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BB96(pc,d0.w),d0
	jsr	off_20BB96(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20BB96:
	dc.w	SmallBombObject_0_Routine0-*
	dc.w	SmallBombObject_0_Routine2-off_20BB96
	dc.w	SmallBombObject_0_Routine4-off_20BB96

; ------------------------------------------------------------------------------

SmallBombObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#BombSprites,obj.sprite_data(a0)
	move.b	#$FD,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.b	#1,obj.sprite_frame(a0)
	lea	(word_20BCA8).l,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	mulu.w	#$14,d0
	adda.w	d0,a1
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	add.w	d0,obj.x(a0)
	add.w	d1,obj.y(a0)
	move.l	(a1)+,d0
	move.l	(a1)+,d1
	move.l	d0,obj.var_3a(a0)
	move.l	d1,obj.x_speed(a0)

SmallBombObject_0_Routine2:
	cmpi.b	#2,obj.collide_status(a0)
	bgt.w	loc_20BC7C
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#4,obj.var_2a(a0)
	beq.s	loc_20BC1A
	rts

; ------------------------------------------------------------------------------

loc_20BC1A:
	clr.b	obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

SmallBombObject_0_Routine4:
	cmpi.b	#2,obj.collide_status(a0)
	bgt.w	loc_20BC7C
	movea.w	obj.var_2e(a0),a1
	btst	#2,$2C(a1)
	bne.w	BossExplosionObject_0_Routine4
	move.l	obj.var_3a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	lea	(dword_20BCB4).l,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	mulu.w	#$14,d0
	adda.w	d0,a1
	move.l	(a1)+,d0
	move.l	(a1),d1
	add.l	d0,obj.var_3a(a0)
	add.l	d1,obj.x_speed(a0)
	cmpi.w	#$2C8,obj.y(a0)
	bge.w	BossExplosionObject_0_Routine4
	tst.b	obj.collide_type(a0)
	beq.w	BossExplosionObject_0_Routine4
	rts

; ------------------------------------------------------------------------------

loc_20BC7C:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	DeleteObject
	st	obj.routine_2(a0)
	move.b	#$18,obj.id(a0)
	move.w	d3,obj.x(a0)
	move.w	d4,obj.y(a0)
	move.w	#$9E,d0
	addq.l	#4,sp
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

word_20BCA8:
	dc.w	4
	dc.w	-$C
	dc.l	$A000
	dc.l	-$38000

dword_20BCB4:
	dc.l	0
	dc.l	$3000
	dc.l	$4FFF8
	dc.l	$14000
	dc.l	-$1C000
	dc.l	0
	dc.l	$1800
	dc.l	-$3000C
	dc.l	-$A000
	dc.l	-$38000
	dc.l	0
	dc.l	$3000
	dc.l	-$30008
	dc.l	-$14000
	dc.l	-$1C000
	dc.l	0
	dc.l	$1800

; ------------------------------------------------------------------------------

BossSparksObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BD18(pc,d0.w),d0
	jsr	off_20BD18(pc,d0.w)
	lea	(SparksAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20BD18:
	dc.w	BossSparksObject_0_Routine0-*
	dc.w	BossSparksObject_0_Routine2-off_20BD18
	dc.w	BossSparksObject_0_Routine4-off_20BD18

; ------------------------------------------------------------------------------

BossSparksObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#4,obj.height(a0)
	move.w	#$22BC,obj.sprite_tile(a0)
	move.l	#SparksSprites,obj.sprite_data(a0)
	move.l	#-$20000,obj.var_3a(a0)
	move.l	#-$20000,obj.x_speed(a0)
	tst.b	obj.var_2d(a0)
	beq.s	BossSparksObject_0_Routine2
	addq.b	#2,obj.routine(a0)
	bra.w	BossSparksObject_0_Routine4

; ------------------------------------------------------------------------------

BossSparksObject_0_Routine2:
	addi.l	#-$1000,obj.var_3a(a0)
	move.l	obj.var_3a(a0),d0
	add.l	d0,obj.x(a0)
	cmpi.w	#$D78,obj.x(a0)
	ble.w	BossExplosionObject_0_Routine4
	bra.w	loc_20BDA8

; ------------------------------------------------------------------------------

BossSparksObject_0_Routine4:
	addi.l	#-$1000,obj.var_3a(a0)
	addi.l	#$2000,obj.x_speed(a0)
	move.l	obj.var_3a(a0),d0
	move.l	obj.x_speed(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)
	bra.w	*+4

; ------------------------------------------------------------------------------

loc_20BDA8:
	bsr.w	sub_20C420
	bne.s	BossExplosionObject_0_Routine4
	rts

; ------------------------------------------------------------------------------

BossExplosionObject_0_Routine4:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpikeWallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BDCC(pc,d0.w),d0
	jsr	off_20BDCC(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20BDCC:
	dc.w	SpikeWallObject_0_Routine0-*
	dc.w	SpikeWallObject_0_Routine2-off_20BDCC
	dc.w	SpikeWallObject_0_Routine4-off_20BDCC
	dc.w	SpikeWallObject_0_Routine6-off_20BDCC
	dc.w	SpikeWallObject_0_Routine8-off_20BDCC

; ------------------------------------------------------------------------------

SpikeWallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.w	#$42BC,obj.sprite_tile(a0)
	move.l	#SpikeWallSprites,obj.sprite_data(a0)
	move.b	#$BF,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)

SpikeWallObject_0_Routine2:
	bsr.w	sub_20C416
	cmpi.w	#$C50,obj.x(a1)
	bge.s	loc_20BE1A
	rts

; ------------------------------------------------------------------------------

loc_20BE1A:
	moveq	#4,d0
	jsr	AddGfxQueue
	addq.b	#2,obj.routine(a0)

SpikeWallObject_0_Routine4:
	subi.l	#$20000,obj.y(a0)
	cmpi.w	#$2A0,obj.y(a0)
	ble.s	loc_20BE3A
	bra.w	loc_20BE66

; ------------------------------------------------------------------------------

loc_20BE3A:
	move.w	#$2A0,obj.y(a0)
	addq.b	#2,obj.routine(a0)

SpikeWallObject_0_Routine6:
	addi.l	#$20000,obj.x(a0)
	cmpi.w	#$CD0,obj.x(a0)
	bge.s	loc_20BE58
	bra.w	loc_20BE66

; ------------------------------------------------------------------------------

loc_20BE58:
	addq.b	#2,obj.routine(a0)
	move.w	#$CD0,obj.x(a0)

SpikeWallObject_0_Routine8:
	bra.w	*+4

; ------------------------------------------------------------------------------

loc_20BE66:
	move.b	#$C,obj.width_2(a0)
	move.b	#$1E,obj.height(a0)
	bsr.w	loc_20B802
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

BossBeltObject:
	bsr.w	sub_20C416
	movea.w	obj.var_2e(a0),a2
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BE9A(pc,d0.w),d0
	jmp	off_20BE9A(pc,d0.w)

; ------------------------------------------------------------------------------

off_20BE9A:
	dc.w	BossBeltObject_0_Routine0-*
	dc.w	BossBeltObject_0_Routine2-off_20BE9A
	dc.w	BossBeltObject_0_Routine4-off_20BE9A
	dc.w	BossBeltObject_0_Routine6-off_20BE9A
	dc.w	BossBeltObject_0_Routine8-off_20BE9A

; ------------------------------------------------------------------------------

BossBeltObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	bra.w	loc_20C09E

; ------------------------------------------------------------------------------

BossBeltObject_0_Routine2:
	cmpi.b	#2,$24(a2)
	bne.s	loc_20BEB6
	rts

; ------------------------------------------------------------------------------

loc_20BEB6:
	addq.b	#2,obj.routine(a0)

BossBeltObject_0_Routine4:
	bsr.w	loc_20C060
	moveq	#0,d1
	bsr.w	loc_20BEE2
	bsr.w	sub_20C41C
	beq.s	loc_20BED8
	bsr.w	loc_20BEE2
	cmpi.w	#2,d1
	beq.w	loc_20BEFE
	rts

; ------------------------------------------------------------------------------

loc_20BED8:
	cmpi.w	#1,d1
	beq.w	loc_20BEFE
	rts

; ------------------------------------------------------------------------------

loc_20BEE2:
	cmpi.w	#$D88,obj.x(a1)
	ble.s	loc_20BEFA
	subq.w	#3,obj.x(a1)
	tst.w	obj.x_speed(a1)
	bmi.s	locret_20BEF8
	clr.w	obj.x_speed(a1)

locret_20BEF8:
	rts

; ------------------------------------------------------------------------------

loc_20BEFA:
	addq.l	#1,d1
	rts

; ------------------------------------------------------------------------------

loc_20BEFE:
	move.w	#$C0,obj.var_32(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BossBeltObject_0_Routine6:
	btst	#2,$2C(a2)
	beq.w	loc_20BF24
	subi.w	#$10,obj.var_32(a0)
	bgt.w	loc_20BF24
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BF24:
	bsr.w	loc_20BF3C
	bsr.w	sub_20C41C
	beq.s	loc_20BF32
	bsr.w	loc_20BF3C

loc_20BF32:
	bsr.w	loc_20BFA8
	bsr.w	loc_20C060
	rts

; ------------------------------------------------------------------------------

loc_20BF3C:
	bsr.w	sub_20C0F8
	btst	#2,$2C(a2)
	bne.w	loc_20BF4E
	bsr.w	loc_20BF58

loc_20BF4E:
	bsr.w	loc_20BFC4
	bsr.w	loc_20C048
	rts

; ------------------------------------------------------------------------------

loc_20BF58:
	bsr.w	sub_20C0F8
	tst.b	d6
	bgt.s	loc_20BF84
	bmi.s	loc_20BF7C
	moveq	#0,d0
	move.w	obj.x_speed(a1),d0
	cmp.w	obj.var_32(a0),d0
	blt.s	loc_20BF76
	beq.s	loc_20BF88
	addq.w	#8,obj.var_32(a0)
	bra.s	loc_20BF88

; ------------------------------------------------------------------------------

loc_20BF76:
	subq.w	#7,obj.var_32(a0)
	bra.s	loc_20BF88

; ------------------------------------------------------------------------------

loc_20BF7C:
	move.w	#$C0,obj.var_32(a0)
	bra.s	loc_20BF88

; ------------------------------------------------------------------------------

loc_20BF84:
	subq.w	#1,obj.var_32(a0)

loc_20BF88:
	cmpi.w	#$C0,obj.var_32(a0)
	bgt.s	loc_20BF98
	move.w	#$C0,obj.var_32(a0)
	bra.s	locret_20BFA6

; ------------------------------------------------------------------------------

loc_20BF98:
	cmpi.w	#$5D0,obj.var_32(a0)
	blt.s	locret_20BFA6
	move.w	#$5D0,obj.var_32(a0)

locret_20BFA6:
	rts

; ------------------------------------------------------------------------------

loc_20BFA8:
	move.w	obj.var_32(a0),d0
	add.w	d0,obj.var_34(a0)
	cmpi.w	#$5D0,obj.var_34(a0)
	blt.s	locret_20BFC2
	subq.w	#1,$3E(a2)
	subi.w	#$5D0,obj.var_34(a0)

locret_20BFC2:
	rts

; ------------------------------------------------------------------------------

loc_20BFC4:
	cmpi.b	#1,d6
	beq.s	loc_20C01A
	move.l	a1,d0
	bclr	#4,obj.var_2c(a0)
	move.w	obj.x_speed(a1),obj.var_36(a0)
	move.w	obj.y_speed(a1),obj.var_38(a0)
	bra.s	loc_20BFF2

; ------------------------------------------------------------------------------

	bclr	#5,obj.var_2c(a0)
	move.w	obj.x_speed(a1),obj.var_3a(a0)
	move.w	obj.y_speed(a1),obj.var_3c(a0)

loc_20BFF2:
	tst.w	d6
	bmi.s	locret_20C018
	moveq	#0,d0
	move.w	obj.var_32(a0),d0
	move.w	d0,d1
	sub.w	obj.x_speed(a1),d1
	cmpi.w	#$300,d1
	ble.s	loc_20C012
	move.w	#$300,d0
	add.w	obj.x_speed(a1),d0
	ext.l	d0

loc_20C012:
	asl.l	#8,d0
	sub.l	d0,obj.x(a1)

locret_20C018:
	rts

; ------------------------------------------------------------------------------

loc_20C01A:
	move.l	a1,d0
	bset	#4,obj.var_2c(a0)
	bne.s	locret_20C046
	move.w	obj.var_36(a0),d0
	move.w	obj.var_38(a0),d1
	bra.s	loc_20C03E

; ------------------------------------------------------------------------------

	bset	#5,obj.var_2c(a0)
	bne.s	locret_20C046
	move.w	obj.var_3a(a0),d0
	move.w	obj.var_3c(a0),d1

loc_20C03E:
	sub.w	d0,obj.x_speed(a1)
	sub.w	d1,obj.y_speed(a1)

locret_20C046:
	rts

; ------------------------------------------------------------------------------

loc_20C048:
	btst	#2,$2C(a2)
	bne.s	locret_20C05E
	cmpi.w	#$D88,obj.x(a1)
	blt.s	locret_20C05E
	move.w	#$D88,obj.x(a1)

locret_20C05E:
	rts

; ------------------------------------------------------------------------------

loc_20C060:
	move.w	obj.var_32(a0),d0
	cmpi.w	#$400,obj.var_32(a0)
	bgt.s	loc_20C088
	cmpi.w	#$300,obj.var_32(a0)
	bgt.s	loc_20C084
	cmpi.w	#$200,obj.var_32(a0)
	bgt.s	loc_20C080
	moveq	#4,d0
	bra.s	loc_20C08A

; ------------------------------------------------------------------------------

loc_20C080:
	moveq	#2,d0
	bra.s	loc_20C08A

; ------------------------------------------------------------------------------

loc_20C084:
	moveq	#1,d0
	bra.s	loc_20C08A

; ------------------------------------------------------------------------------

loc_20C088:
	moveq	#1,d0

loc_20C08A:
	addq.b	#1,obj.var_2a(a0)
	cmp.b	obj.var_2a(a0),d0
	bgt.s	locret_20C09C
	clr.b	obj.var_2a(a0)
	bsr.w	loc_20C09E

locret_20C09C:
	rts

; ------------------------------------------------------------------------------

loc_20C09E:
	addq.b	#6,obj.var_3e(a0)
	cmpi.b	#$12,obj.var_3e(a0)
	blt.s	loc_20C0B0
	move.b	#0,obj.var_3e(a0)

loc_20C0B0:
	moveq	#0,d0
	move.b	obj.var_3e(a0),d0
	lea	word_20C0D4(pc,d0.w),a3
	tst.b	(good_future).l
	beq.s	loc_20C0C6
	lea	word_20C0E6(pc,d0.w),a3

loc_20C0C6:
	movea.l	#(palette+$54)&$FFFFFF,a4
	move.w	(a3)+,(a4)+
	move.w	(a3)+,(a4)+
	move.w	(a3),(a4)
	rts

; ------------------------------------------------------------------------------

word_20C0D4:
	dc.w	$CEE, $466, 0
	dc.w	0, $CEE, $466
	dc.w	$466, 0, $CEE

word_20C0E6:
	dc.w	$20, $80, $6C2
	dc.w	$80, $6C2, $20
	dc.w	$6C2, $20, $80

; ------------------------------------------------------------------------------

sub_20C0F8:
	cmpi.b	#$1A,obj.anim_id(a1)
	beq.s	loc_20C128
	cmpi.b	#$19,obj.anim_id(a1)
	beq.s	loc_20C128
	cmpi.b	#$18,obj.anim_id(a1)
	beq.s	loc_20C128
	btst	#7,obj.flags(a1)
	bne.s	loc_20C128
	btst	#1,obj.flags(a1)
	bne.s	loc_20C124
	moveq	#0,d6
	rts

; ------------------------------------------------------------------------------

loc_20C124:
	moveq	#1,d6
	rts

; ------------------------------------------------------------------------------

loc_20C128:
	moveq	#$FFFFFFFF,d6
	rts

; ------------------------------------------------------------------------------

BossBeltObject_0_Routine8:
	rts

; ------------------------------------------------------------------------------

BossExplosionObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C14E(pc,d0.w),d0
	jsr	off_20C14E(pc,d0.w)
	lea	(BossExplodeAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C14E:
	dc.w	BossExplosionObject_0_Routine0-*
	dc.w	BossExplosionObject_0_Routine2-off_20C14E
	dc.w	BossExplosionObject_0_Routine4-off_20C14E

; ------------------------------------------------------------------------------

BossExplosionObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$680,obj.sprite_tile(a0)
	move.l	#ExplosionSprites,obj.sprite_data(a0)

BossExplosionObject_0_Routine2:
	subi.l	#$30000,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossExplodeAnims:
	include	"src/anims/r5/boss_explode.asm"
	even

; ------------------------------------------------------------------------------

sub_20C196:
	jsr	SpawnObject
	bne.w	locret_20C1B6
	move.w	a3,obj.var_2e(a1)
	move.b	#$20,obj.id(a1)
	move.w	#$DE8,obj.x(a1)
	move.w	#$2B8,obj.y(a1)

locret_20C1B6:
	rts

; ------------------------------------------------------------------------------

word_20C1B8:
	dc.w	$34
	dc.w	$34
	dc.w	$2C
	dc.w	$20
	dc.w	$1C
	dc.w	$1C

; ------------------------------------------------------------------------------

sub_20C1C4:
	moveq	#0,d4
	move.b	obj.sprite_frame(a0),d4
	add.w	d4,d4
	move.w	word_20C1B8(pc,d4.w),d4
	movea.l	a0,a3
	move.w	#7,d1
	lea	(word_20C218).l,a2

loc_20C1DC:
	jsr	SpawnObject
	bne.w	locret_20C216
	move.b	#1,obj.var_2d(a1)
	move.w	a3,obj.var_2e(a1)
	move.b	#$20,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,d2
	move.w	(a2)+,d3
	add.w	d2,obj.x(a1)
	add.w	d3,obj.y(a1)
	add.w	d4,obj.y(a1)
	dbf	d1,loc_20C1DC

locret_20C216:
	rts

; ------------------------------------------------------------------------------

word_20C218:
	dc.w	-$18, 0
	dc.w	-6, 0
	dc.w	6, 0
	dc.w	$18, 0
	dc.w	-$C, -8
	dc.w	$C, -8
	dc.w	-$C, 8
	dc.w	$C, 8

; ------------------------------------------------------------------------------

sub_20C238:
	moveq	#0,d2
	move.b	obj.var_2a(a0),d2
	divu.w	#4,d2
	swap	d2
	tst.w	d2
	bne.s	locret_20C29C
	jsr	SpawnObject
	bne.s	locret_20C29C
	clr.w	d2
	swap	d2
	divu.w	#4,d2
	swap	d2
	move.w	d2,d3
	add.w	d2,d2
	add.w	d2,d2
	jsr	SpawnObject
	bne.s	locret_20C29C
	lea	(word_20C29E).l,a2
	adda.w	d2,a2
	move.b	d3,obj.var_2a(a1)
	move.b	#$23,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,d0
	add.w	d0,obj.x(a1)
	move.w	(a2),d0
	add.w	d0,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20C29C:
	rts

; ------------------------------------------------------------------------------

word_20C29E:
	dc.w	-$10, -8
	dc.w	-$20, 8
	dc.w	-$10, $18
	dc.w	$20, 8

; ------------------------------------------------------------------------------

sub_20C2AE:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C2DA
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#$34,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$38,obj.y(a1)

locret_20C2DA:
	rts

; ------------------------------------------------------------------------------

sub_20C2DC:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C302
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#$32,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

locret_20C302:
	rts

; ------------------------------------------------------------------------------

sub_20C304:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C336
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_30(a3)
	move.b	#$37,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#-$80,obj.x(a1)
	addi.w	#-$44,obj.y(a1)

locret_20C336:
	rts

; ------------------------------------------------------------------------------

sub_20C338:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C35A
	move.w	a3,obj.var_2e(a1)
	move.b	#$36,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

locret_20C35A:
	rts

; ------------------------------------------------------------------------------

sub_20C35C:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C384
	move.w	a3,obj.var_2e(a1)
	move.b	#$35,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$38,obj.y(a1)

locret_20C384:
	rts

; ------------------------------------------------------------------------------

sub_20C386:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C3AE
	move.w	a3,obj.var_2e(a1)
	move.b	#$38,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$18,obj.y(a1)

locret_20C3AE:
	rts

; ------------------------------------------------------------------------------

sub_20C3B0:
	movea.w	obj.var_2e(a0),a3
	move.w	#3,d1

loc_20C3B8:
	jsr	SpawnObject
	bne.w	locret_20C3E0
	move.w	a3,obj.var_2e(a1)
	move.b	#$39,obj.id(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.l	obj.y(a0),obj.y(a1)
	move.b	d1,obj.subtype(a1)
	dbf	d1,loc_20C3B8

locret_20C3E0:
	rts

; ------------------------------------------------------------------------------

sub_20C3E2:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C3FC
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_32(a0)
	move.b	#$22,obj.id(a1)

locret_20C3FC:
	rts

; ------------------------------------------------------------------------------

sub_20C3FE:
	movea.l	a0,a1

loc_20C400:
	move.b	d0,obj.anim_id(a1)
	clr.b	obj.sprite_frame(a1)
	clr.b	obj.anim_index(a1)
	clr.b	obj.anim_timer(a1)
	clr.b	obj.var_1f(a1)
	rts

; ------------------------------------------------------------------------------

sub_20C416:
	lea	(player_object).w,a1
	rts

; ------------------------------------------------------------------------------

sub_20C41C:
	cmp.w	d1,d1
	rts

; ------------------------------------------------------------------------------

sub_20C420:
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	move.b	obj.width_2(a0),d0
	move.w	obj.x(a0),d3
	sub.w	(scroll_fg_x).w,d3
	move.w	d3,d1
	add.w	d0,d1
	bmi.s	loc_20C462
	move.w	d3,d1
	sub.w	d0,d1
	cmpi.w	#$140,d1
	bge.s	loc_20C462
	move.b	obj.height(a0),d0
	move.w	obj.y(a0),d3
	sub.w	(scroll_fg_y).w,d3
	move.w	d3,d1
	add.w	d0,d1
	bmi.s	loc_20C462
	move.w	d3,d1
	sub.w	d0,d1
	cmpi.w	#$E0,d1
	bge.s	loc_20C462
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20C462:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

BossTopSprites:
	include	"src/sprites/r5/boss_top.asm"
	even

BossBoothSprites:
	include	"src/sprites/r5/boss_booth.asm"
	even

BossBackSprites:
	include	"src/sprites/r5/boss_back.asm"
	even

EggmanAnims:
	include	"src/anims/r5/eggman.asm"
	even

EggmanSprites:
	include	"src/sprites/r5/eggman.asm"
	even

BossPipesSprites:
	include	"src/sprites/r5/boss_pipes.asm"
	even

BombDropAnims:
	include	"src/anims/r5/bomb_drop.asm"
	even

BombDropSprites:
	include	"src/sprites/r5/bomb_drop.asm"
	even

BombSprites:
	include	"src/sprites/r5/bomb.asm"
	even

SparksAnims:
	include	"src/anims/r5/sparks.asm"
	even

SparksSprites:
	include	"src/sprites/r5/sparks.asm"
	even

SpikeWallSprites:
	include	"src/sprites/r5/spike_wall.asm"
	even

; ------------------------------------------------------------------------------