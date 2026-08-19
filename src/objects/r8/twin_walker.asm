; ------------------------------------------------------------------------------

TwinWalkerObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20E482
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	move.w	off_20E1D6(pc,d0.w),d0
	jmp	off_20E1D6(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E1D6:
	dc.w	TwinWalkerObject_0_Routine0-*
	dc.w	TwinWalkerObject_0_Routine2-off_20E1D6
	dc.w	TwinWalkerObject_0_Routine4-off_20E1D6
	dc.w	TwinWalkerObject_0_Routine6-off_20E1D6
	dc.w	TwinWalkerObject_0_Routine8-off_20E1D6

; ------------------------------------------------------------------------------

TwinWalkerObject_0_Routine0:
	lea	obj.var_2e(a0),a6
	move.w	obj.x(a0),d4
	moveq	#8,d5
	moveq	#8,d6
	movea.w	a0,a1
	bra.s	loc_20E230

; ------------------------------------------------------------------------------

loc_20E1F0:
	jsr	SpawnObject
	bne.w	loc_20E490
	move.b	obj.id(a0),obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#1,obj.sprite_frame(a1)
	move.b	#4,obj.width(a1)
	move.b	#4,obj.width_2(a1)
	move.b	#4,obj.height(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	d5,d4
	move.w	d4,obj.x(a1)

loc_20E230:
	move.w	a1,(a6)+
	move.w	a0,obj.var_2e(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	#$318,obj.sprite_tile(a1)
	move.l	#Spr_20E496,obj.sprite_data(a1)
	dbf	d6,loc_20E1F0
	bsr.w	sub_20E2F8
	movea.w	a0,a1
	bsr.w	sub_20E2F8
	addq.b	#2,obj.var_2a(a0)
	move.b	#$C,obj.var_2b(a0)
	move.w	#$8000,obj.var_2c(a0)

TwinWalkerObject_0_Routine2:
	move.w	a0,-(sp)
	movea.w	obj.var_3e(a0),a0
	bsr.w	sub_20E318
	movea.w	(sp)+,a0
	bsr.w	sub_20E3B6

loc_20E278:
	move.w	a0,-(sp)
	movea.w	(sp),a0
	movea.w	obj.var_30(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_32(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_34(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_36(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_38(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_3a(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_3c(a0),a0
	jsr	DrawObject
	movea.w	(sp)+,a0
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

TwinWalkerObject_0_Routine4:
	move.b	#6,obj.var_2a(a0)

TwinWalkerObject_0_Routine6:
	bsr.w	sub_20E318
	move.w	a0,-(sp)
	movea.w	obj.var_3e(a0),a0
	bsr.w	sub_20E3B6
	movea.w	(sp)+,a0
	bra.s	loc_20E278

; ------------------------------------------------------------------------------

TwinWalkerObject_0_Routine8:
	move.b	#2,obj.var_2a(a0)
	bra.w	TwinWalkerObject_0_Routine2

; ------------------------------------------------------------------------------

sub_20E2F8:
	move.b	#0,obj.sprite_frame(a1)
	move.b	#4,obj.sprite_layer(a1)
	move.b	#$18,obj.width(a1)
	move.b	#$18,obj.width_2(a1)
	move.b	#$29,obj.height(a1)
	rts

; ------------------------------------------------------------------------------

sub_20E318:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E326(pc,d0.w),d0
	jmp	off_20E326(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E326:
	dc.w	TwinWalkerObject_1_Routine0-*
	dc.w	TwinWalkerObject_1_Routine2-off_20E326
	dc.w	TwinWalkerObject_1_Routine4-off_20E326

; ------------------------------------------------------------------------------

TwinWalkerObject_1_Routine0:
	lea	player_object,a1
	jsr	TopSolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

TwinWalkerObject_1_Routine2:
	addq.b	#2,obj.routine(a0)
	move.w	#$8000,obj.x+2(a0)
	move.w	#$8000,obj.y+2(a0)

TwinWalkerObject_1_Routine4:
	movea.w	obj.var_2e(a0),a1
	addi.w	#$200,$2C(a1)
	lea	$30(a1),a6
	moveq	#6,d6
	move.l	obj.x(a0),d5
	move.l	obj.y(a0),d4
	moveq	#0,d1
	moveq	#0,d0
	move.b	$2C(a1),d0
	jsr	SineCosine
	swap	d1
	swap	d0
	asr.l	#5,d1
	asr.l	#5,d0

loc_20E37A:
	movea.w	(a6)+,a5
	add.l	d1,d5
	add.l	d0,d4
	move.l	d5,8(a5)
	move.l	d4,$C(a5)
	dbf	d6,loc_20E37A
	movea.w	$3E(a1),a5
	tst.b	obj.subtype(a0)
	beq.s	loc_20E39A
	movea.w	$2E(a1),a5

loc_20E39A:
	move.l	8(a5),d3
	add.l	d1,d5
	add.l	d0,d4
	move.l	d5,8(a5)
	move.l	d4,$C(a5)
	sub.l	d3,d5
	asr.l	#8,d5
	move.w	d5,$10(a5)
	bra.w	TwinWalkerObject_1_Routine0

; ------------------------------------------------------------------------------

sub_20E3B6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E3C4(pc,d0.w),d0
	jmp	off_20E3C4(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E3C4:
	dc.w	TwinWalkerObject_2_Routine0-*
	dc.w	TwinWalkerObject_2_Routine2-off_20E3C4

; ------------------------------------------------------------------------------

TwinWalkerObject_2_Routine0:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	loc_20E3F2
	movea.w	obj.var_2e(a0),a1
	tst.b	$2B(a1)
	beq.s	loc_20E3F2
	subq.b	#1,$2B(a1)
	movea.w	$2E(a1),a2
	movea.w	$3E(a1),a3
	addq.b	#2,$24(a2)
	addq.b	#2,$24(a3)

loc_20E3F2:
	jmp	DrawObject

; ------------------------------------------------------------------------------

TwinWalkerObject_2_Routine2:
	lea	player_object,a1
	bsr.w	sub_20E454
	jsr	DrawObject
	movea.w	obj.var_2e(a0),a1
	move.w	$2C(a1),d0
	addi.w	#$4000,d0
	bmi.s	locret_20E452
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20E452
	addq.w	#2,d1
	add.w	d1,obj.y(a0)
	movea.w	obj.var_2e(a0),a1
	addq.b	#2,$2A(a1)
	addi.w	#-$8000,$2C(a1)
	movea.w	$2E(a1),a2
	movea.w	$3E(a1),a3
	clr.b	$24(a2)
	clr.b	$24(a3)
	clr.w	$10(a2)
	clr.w	$10(a3)
	clr.w	$12(a2)
	clr.w	$12(a3)

locret_20E452:
	rts

; ------------------------------------------------------------------------------

sub_20E454:
	move.w	obj.x_speed(a0),-(sp)
	move.w	#0,obj.x_speed(a0)
	move.b	#$2B,obj.height(a0)
	jsr	TopSolidObject
	sne	d0
	move.w	(sp)+,obj.x_speed(a0)
	move.b	#$29,obj.height(a0)
	tst.b	d0
	beq.s	locret_20E480
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

locret_20E480:
	rts

; ------------------------------------------------------------------------------

loc_20E482:
	movea.w	obj.var_2e(a0),a1
	cmpi.b	#$26,0(a1)
	bne.s	loc_20E490
	rts

; ------------------------------------------------------------------------------

loc_20E490:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Spr_20E496:
	dc.w	@Spr_20E496_0-*
	dc.w	@Spr_20E496_1-Spr_20E496

@Spr_20E496_0:
	dc.b	$B
	dc.b	$FC, 0, 0, $10, $FC
	dc.b	$D8, 9, 0, 0, $E8
	dc.b	$D8, 9, 8, 0, 0
	dc.b	$E8, 1, 0, 6, $F8
	dc.b	$E8, 1, 8, 6, 0
	dc.b	$F8, 1, 0, 8, $F8
	dc.b	$F8, 1, 8, 8, 0
	dc.b	8, 1, 0, 6, $F8
	dc.b	8, 1, 8, 6, 0
	dc.b	$18, 9, 0, $A, $E8
	dc.b	$18, 9, 8, $A, 0

@Spr_20E496_1:
	dc.b	1
	dc.b	$FC, 0, 0, $10, $FC

; ------------------------------------------------------------------------------
