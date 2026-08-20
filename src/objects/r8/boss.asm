; ------------------------------------------------------------------------------

EggmanObject:
	lea	player_object,a1
	tst.w	obj.var_2e(a0)
	beq.s	loc_20B1F8
	movea.w	obj.var_2e(a0),a2
	bclr	#5,obj.var_2c(a2)
	bclr	#6,obj.var_2c(a2)

loc_20B1F8:
	movem.l	a1-a2,-(sp)
	bsr.w	sub_20B416
	tst.b	obj.var_3c(a0)
	beq.s	loc_20B212
	subq.b	#1,obj.var_3c(a0)
	bne.s	loc_20B212
	move.b	#0,obj.anim_id(a0)

loc_20B212:
	movem.l	(sp)+,a1-a2
	bsr.w	sub_20B29E
	bclr	#0,obj.var_2c(a0)
	beq.s	loc_20B226
	bsr.w	sub_20BFF6

loc_20B226:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B266(pc,d0.w),d0
	jsr	off_20B266(pc,d0.w)
	lea	EggmanAnims,a1
	jsr	AnimateObject
	movea.l	a0,a3
	adda.w	#obj.var_3d,a3
	movea.l	a0,a4
	adda.w	#obj.var_3e,a4
	jsr	CycleBossPalette
	movea.w	obj.var_2e(a0),a2
	btst	#0,obj.var_3c(a2)
	bne.s	locret_20B264
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20B264:
	rts

; ------------------------------------------------------------------------------

off_20B266:
	dc.w	EggmanObject_0_Routine0-*
	dc.w	EggmanObject_0_Routine2-off_20B266
	dc.w	EggmanObject_0_Routine4-off_20B266
	dc.w	EggmanObject_0_Routine6-off_20B266
	dc.w	EggmanObject_0_Routine8-off_20B266
	dc.w	EggmanObject_0_RoutineA-off_20B266
	dc.w	EggmanObject_0_RoutineC-off_20B266
	dc.w	EggmanObject_0_RoutineE-off_20B266
	dc.w	EggmanObject_0_Routine10-off_20B266
	dc.w	EggmanObject_0_Routine12-off_20B266
	dc.w	EggmanObject_0_Routine14-off_20B266
	dc.w	EggmanObject_0_Routine16-off_20B266
	dc.w	EggmanObject_0_Routine18-off_20B266
	dc.w	EggmanObject_0_Routine1A-off_20B266
	dc.w	EggmanObject_0_Routine1C-off_20B266
	dc.w	EggmanObject_0_Routine1E-off_20B266
	dc.w	EggmanObject_0_Routine20-off_20B266
	dc.w	EggmanObject_0_Routine22-off_20B266
	dc.w	EggmanObject_0_Routine22-off_20B266
	dc.w	EggmanObject_0_Routine26-off_20B266
	dc.w	EggmanObject_0_Routine28-off_20B266
	dc.w	EggmanObject_0_Routine2A-off_20B266
	dc.w	EggmanObject_0_Routine2C-off_20B266
	dc.w	EggmanObject_0_Routine2E-off_20B266
	dc.w	EggmanObject_0_Routine30-off_20B266
	dc.w	EggmanObject_0_Routine32-off_20B266
	dc.w	EggmanObject_0_Routine34-off_20B266
	dc.w	EggmanObject_0_Routine36-off_20B266

; ------------------------------------------------------------------------------

sub_20B29E:
	btst	#3,obj.var_2c(a0)
	beq.s	locret_20B2BE
	move.b	#$FF,obj.var_3b(a2)
	tst.b	obj.var_3c(a2)
	bne.s	loc_20B2C0
	tst.b	obj.collide_type(a0)
	beq.s	loc_20B2E2
	tst.b	obj.collide_type(a2)
	beq.s	loc_20B2E2

locret_20B2BE:
	rts

; ------------------------------------------------------------------------------

loc_20B2C0:
	subq.b	#1,obj.var_3c(a2)
	beq.s	loc_20B2C8
	rts

; ------------------------------------------------------------------------------

loc_20B2C8:
	move.b	#$32,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.b	#$33,obj.collide_type(a2)
	move.b	#2,obj.collide_status(a2)
	rts

; ------------------------------------------------------------------------------

loc_20B2E2:
	cmpi.b	#$1E,obj.routine(a0)
	beq.s	loc_20B2C8
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	clr.b	obj.collide_type(a2)
	clr.b	obj.collide_status(a2)
	movem.l	a1-a2,-(sp)
	bsr.w	sub_20CF62
	move.b	#$96,obj.var_3c(a0)
	move.b	#1,obj.anim_id(a0)
	movem.l	(sp)+,a1-a2
	move.b	#$78,obj.var_3c(a2)
	clr.b	obj.var_3b(a0)
	clr.b	obj.var_2d(a0)
	bset	#0,obj.var_2c(a0)
	move.w	#$AC,d0
	jsr	PlayFmSound
	subq.b	#1,obj.var_3a(a0)
	bsr.w	sub_20BFA4
	tst.b	obj.var_3a(a0)
	beq.w	loc_20B362
	move.b	$35(a2),d0
	cmpi.b	#3,obj.var_3a(a0)
	beq.s	loc_20B3BE
	cmpi.b	#2,obj.var_3a(a0)
	beq.s	loc_20B38C
	cmpi.b	#1,obj.var_3a(a0)
	beq.s	loc_20B378
	clr.b	obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B362:
	move.b	#$32,obj.routine(a0)
	bclr	#0,obj.var_2c(a0)
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	bra.s	loc_20B3F6

; ------------------------------------------------------------------------------

loc_20B378:
	moveq	#5,d0
	jsr	AddGfxQueue
	move.w	obj.x(a1),d1
	cmp.w	obj.x(a0),d1
	bge.s	loc_20B3F6
	bra.s	loc_20B3FE

; ------------------------------------------------------------------------------

loc_20B38C:
	move.w	obj.x(a1),d1
	cmp.w	obj.x(a0),d1
	bge.s	loc_20B3AA
	cmpi.b	#$D,d0
	bge.s	loc_20B406
	cmpi.b	#2,d0
	ble.s	loc_20B406
	cmpi.b	#7,d0
	ble.s	loc_20B3FE
	bra.s	loc_20B3F6

; ------------------------------------------------------------------------------

loc_20B3AA:
	cmpi.b	#$C,d0
	bge.s	loc_20B406
	cmpi.b	#0,d0
	beq.s	loc_20B406
	cmpi.b	#4,d0
	ble.s	loc_20B3FE
	bra.s	loc_20B3F6

; ------------------------------------------------------------------------------

loc_20B3BE:
	move.w	obj.x(a1),d1
	cmp.w	obj.x(a0),d1
	bge.s	loc_20B3DC
	cmpi.b	#3,d0
	ble.s	loc_20B406
	cmpi.b	#7,d0
	ble.s	loc_20B3FE
	cmpi.b	#$B,d0
	ble.s	loc_20B3F6
	bra.s	loc_20B40E

; ------------------------------------------------------------------------------

loc_20B3DC:
	cmpi.b	#$D,d0
	bge.s	loc_20B406
	cmpi.b	#0,d0
	beq.s	loc_20B406
	cmpi.b	#4,d0
	ble.s	loc_20B3FE
	cmpi.b	#8,d0
	ble.s	loc_20B3F6
	bra.s	loc_20B40E

; ------------------------------------------------------------------------------

loc_20B3F6:
	move.b	#0,obj.var_3b(a2)
	rts

; ------------------------------------------------------------------------------

loc_20B3FE:
	move.b	#1,obj.var_3b(a2)
	rts

; ------------------------------------------------------------------------------

loc_20B406:
	move.b	#2,obj.var_3b(a2)
	rts

; ------------------------------------------------------------------------------

loc_20B40E:
	move.b	#3,obj.var_3b(a2)
	rts

; ------------------------------------------------------------------------------

sub_20B416:
	tst.b	obj.anim_id(a0)
	bne.s	locret_20B432
	lea	player_object,a1
	tst.w	obj.var_30(a1)
	bne.w	loc_20B434
	cmpi.b	#6,obj.routine(a1)
	beq.w	loc_20B434

locret_20B432:
	rts

; ------------------------------------------------------------------------------

loc_20B434:
	move.b	#$78,obj.var_3c(a0)
	move.b	#4,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$3DE,obj.sprite_tile(a0)
	move.l	#EggmanSprites,obj.sprite_data(a0)
	move.b	#4,obj.var_3a(a0)
	subi.w	#$100,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine2:
	move.w	#$E60,d0
	move.w	d0,right_bound
	move.w	d0,target_right_bound
	lea	player_object,a1
	move.w	obj.x(a1),d0
	subi.w	#$A0,d0
	cmp.w	left_bound,d0
	blt.s	locret_20B4E2
	cmpi.w	#$F00,8(a1)
	blt.s	loc_20B4DA
	move.b	#8,boss_flags
	move.b	#8,boss_started
	bsr.w	sub_20CF00
	lea	player_object,a1
	movea.w	obj.var_2e(a0),a2
	bsr.w	sub_20BFA4
	bclr	#1,obj.var_2c(a0)
	move.b	#4,obj.routine(a0)
	move.w	#$E60,d0
	move.w	d0,right_bound
	move.w	d0,target_right_bound
	move.w	#$E60,d0

loc_20B4DA:
	move.w	d0,left_bound
	move.w	d0,target_left_bound

locret_20B4E2:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine4:
	cmpi.b	#1,obj.var_2d(a0)
	beq.w	loc_20B53A
	cmpi.b	#2,obj.var_2d(a0)
	beq.w	loc_20B572
	cmpi.b	#3,obj.var_2d(a0)
	beq.w	loc_20B5AE
	move.b	#5,obj.anim_id(a0)
	addq.b	#1,obj.var_2d(a0)
	movem.l	d7-a7,-(sp)
	move.w	#7,d0
	jsr	LoadPalette
	move.w	#8,d0
	jsr	LoadPalette
	move.w	#9,d0
	jsr	LoadPalette
	movem.l	(sp)+,d7-a7
	moveq	#4,d0
	jsr	AddGfxQueue

loc_20B53A:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$F0,obj.var_2a(a0)
	beq.s	loc_20B548
	rts

; ------------------------------------------------------------------------------

loc_20B548:
	addi.w	#$100,obj.y(a0)
	move.w	#$68,d0
	jsr	SubCpuCommand
	bset	#7,boss_started
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	addq.b	#1,obj.var_2d(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B572:
	move.b	obj.var_2a(a0),d0
	divu.w	#3,d0
	andi.l	#$FFFF0000,d0
	bne.s	loc_20B590
	movem.l	a0,-(sp)
	jsr	BossFadeFromBlack
	movem.l	(sp)+,a0

loc_20B590:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$3F,obj.var_2a(a0)
	beq.s	loc_20B59E
	rts

; ------------------------------------------------------------------------------

loc_20B59E:
	addq.b	#1,obj.var_2d(a0)
	move.b	#0,obj.anim_id(a0)
	clr.b	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B5AE:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$28,obj.var_2a(a0)
	beq.s	loc_20B5BC
	rts

; ------------------------------------------------------------------------------

loc_20B5BC:
	bset	#0,obj.var_2c(a0)
	clr.b	obj.var_2a(a0)
	bset	#3,obj.var_2c(a0)
	move.b	#$32,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.b	#$33,obj.collide_type(a2)
	move.b	#2,obj.collide_status(a2)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine6:
	addq.b	#1,obj.var_2a(a0)
	move.b	obj.var_39(a0),d0
	cmp.b	obj.var_2a(a0),d0
	beq.s	loc_20B5F6
	rts

; ------------------------------------------------------------------------------

loc_20B5F6:
	clr.b	obj.var_2a(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine8:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.var_38(a0),d0
	cmp.w	obj.x(a0),d0
	ble.s	loc_20B616
	rts

; ------------------------------------------------------------------------------

loc_20B616:
	move.w	d0,obj.x(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineA:
	move.l	obj.var_34(a0),d0
	sub.l	d0,obj.x(a0)
	move.w	obj.var_38(a0),d0
	cmp.w	obj.x(a0),d0
	bge.s	loc_20B636
	rts

; ------------------------------------------------------------------------------

loc_20B636:
	move.w	d0,obj.x(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineC:
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_38(a0),d0
	cmp.w	obj.y(a0),d0
	ble.s	loc_20B656
	rts

; ------------------------------------------------------------------------------

loc_20B656:
	move.w	d0,obj.y(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineE:
	move.l	obj.x_speed(a0),d0
	sub.l	d0,obj.y(a0)
	move.w	obj.var_38(a0),d0
	cmp.w	obj.y(a0),d0
	bge.s	loc_20B676
	rts

; ------------------------------------------------------------------------------

loc_20B676:
	move.w	d0,obj.y(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine10:
	tst.b	obj.var_2d(a0)
	beq.s	loc_20B6E6
	btst	#0,obj.var_2d(a0)
	bne.s	loc_20B6AC
	move.l	obj.var_34(a0),d0
	sub.l	d0,obj.x(a0)
	move.w	obj.var_30(a0),d0
	cmp.w	obj.x(a0),d0
	bge.s	loc_20B6A4
	rts

; ------------------------------------------------------------------------------

loc_20B6A4:
	move.w	d0,obj.x(a0)
	bra.w	loc_20B6C8

; ------------------------------------------------------------------------------

loc_20B6AC:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.var_30(a0),d0
	cmp.w	obj.x(a0),d0
	ble.s	loc_20B6C0
	rts

; ------------------------------------------------------------------------------

loc_20B6C0:
	move.w	d0,obj.x(a0)
	bra.w	loc_20B6C8

; ------------------------------------------------------------------------------

loc_20B6C8:
	tst.w	obj.var_38(a0)
	beq.s	loc_20B6DE
	subq.w	#1,obj.var_38(a0)
	beq.s	loc_20B710
	bchg	#0,obj.var_2d(a0)
	beq.s	loc_20B6F4
	bra.s	loc_20B702

; ------------------------------------------------------------------------------

loc_20B6DE:
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B6E6:
	move.b	#2,obj.var_2d(a0)
	cmpi.w	#$F00,obj.x(a0)
	bgt.s	loc_20B702

loc_20B6F4:
	bset	#0,obj.var_2d(a0)
	move.w	#$F7C,obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B702:
	bclr	#0,obj.var_2d(a0)
	move.w	#$E84,obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B710:
	bchg	#0,obj.var_2d(a0)
	move.w	#$F00,obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine12:
	tst.b	obj.var_2d(a0)
	bne.s	loc_20B734
	bsr.w	EggmanObject_0_Routine1C
	bclr	#0,obj.var_2c(a0)
	move.b	#1,obj.var_2d(a0)

loc_20B734:
	subi.l	#$14000,obj.y(a0)
	move.w	obj.var_38(a0),d0
	cmp.w	obj.y(a0),d0
	bge.s	loc_20B748
	rts

; ------------------------------------------------------------------------------

loc_20B748:
	move.w	d0,obj.y(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine14:
	btst	#6,obj.var_3a(a2)
	bne.s	loc_20B76A
	bset	#4,obj.var_2c(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)

loc_20B76A:
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine16:
	tst.b	obj.var_2d(a0)
	bne.s	loc_20B7AC
	addq.b	#1,obj.var_2d(a0)
	bset	#4,obj.var_2c(a2)
	bclr	#7,obj.var_3a(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)
	cmpi.b	#2,obj.var_3a(a0)
	beq.s	loc_20B7A2
	move.b	#4,obj.var_36(a2)
	bra.w	loc_20B7AC

; ------------------------------------------------------------------------------

loc_20B7A2:
	move.b	#8,obj.var_36(a2)
	bra.w	loc_20B7AC

; ------------------------------------------------------------------------------

loc_20B7AC:
	btst	#7,obj.var_3a(a2)
	bne.s	loc_20B7B6
	rts

; ------------------------------------------------------------------------------

loc_20B7B6:
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine18:
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2a(a2)
	clr.b	obj.var_2b(a2)
	bset	#7,obj.var_3a(a2)
	bset	#5,obj.var_3a(a2)
	bclr	#6,obj.var_3a(a2)
	move.b	#4,obj.routine(a2)
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine1A:
	move.w	#$C9,d0
	jsr	PlayFmSound
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2a(a2)
	clr.b	obj.var_2b(a2)
	move.b	#6,obj.routine(a2)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine1C:
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2a(a2)
	clr.b	obj.var_2b(a2)
	move.b	#8,obj.routine(a2)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine1E:
	cmpi.b	#1,obj.var_2d(a0)
	beq.s	loc_20B860
	cmpi.b	#2,obj.var_2d(a0)
	beq.s	loc_20B87A
	addq.b	#1,obj.var_2d(a0)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2a(a2)
	clr.b	obj.var_2b(a2)
	move.b	#$A,obj.routine(a2)
	clr.b	obj.var_3d(a2)
	clr.b	obj.var_3e(a2)
	rts

; ------------------------------------------------------------------------------

loc_20B860:
	move.w	#$13C,obj.var_38(a0)
	bsr.w	EggmanObject_0_RoutineE
	bclr	#0,obj.var_2c(a0)
	bne.s	loc_20B874
	rts

; ------------------------------------------------------------------------------

loc_20B874:
	addq.b	#1,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B87A:
	move.b	obj.var_3a(a0),d0
	add.b	d0,d0
	cmp.b	obj.var_3d(a2),d0
	beq.s	loc_20B888
	rts

; ------------------------------------------------------------------------------

loc_20B888:
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine20:
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2a(a2)
	clr.b	obj.var_2b(a2)
	move.b	#$C,obj.routine(a2)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine2A:
	cmpi.b	#1,obj.var_2d(a0)
	beq.w	loc_20B92A
	cmpi.b	#2,obj.var_2d(a0)
	beq.w	loc_20B930
	cmpi.b	#3,obj.var_2d(a0)
	beq.w	loc_20B95E
	cmpi.b	#4,obj.var_3a(a0)
	bne.s	loc_20B8D8
	move.b	#8,obj.var_36(a2)
	bra.s	loc_20B93E

; ------------------------------------------------------------------------------

loc_20B8D8:
	move.w	obj.x(a1),d0
	cmp.w	obj.x(a0),d0
	bge.s	loc_20B906
	cmpi.b	#3,obj.var_3a(a0)
	beq.s	loc_20B8F2
	move.b	#8,obj.var_36(a2)
	bra.s	loc_20B8F8

; ------------------------------------------------------------------------------

loc_20B8F2:
	move.b	#8,$36(a2)

loc_20B8F8:
	move.w	#$F7C,obj.var_38(a0)
	move.b	#1,obj.var_2d(a0)
	bra.s	loc_20B92A

; ------------------------------------------------------------------------------

loc_20B906:
	cmpi.b	#3,obj.var_3a(a0)
	beq.s	loc_20B916
	move.b	#4,obj.var_36(a2)
	bra.s	loc_20B91C

; ------------------------------------------------------------------------------

loc_20B916:
	move.b	#0,$36(a2)

loc_20B91C:
	move.w	#$E84,obj.var_38(a0)
	move.b	#2,obj.var_2d(a0)
	bra.s	loc_20B930

; ------------------------------------------------------------------------------

loc_20B92A:
	bsr.w	EggmanObject_0_Routine8
	bra.s	loc_20B934

; ------------------------------------------------------------------------------

loc_20B930:
	bsr.w	EggmanObject_0_RoutineA

loc_20B934:
	bclr	#0,obj.var_2c(a0)
	bne.s	loc_20B93E
	rts

; ------------------------------------------------------------------------------

loc_20B93E:
	bset	#4,obj.var_2c(a2)
	bclr	#7,obj.var_3a(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)
	move.w	#$1A0,obj.var_38(a0)
	move.b	#3,obj.var_2d(a0)

loc_20B95E:
	bsr.w	EggmanObject_0_RoutineC
	bclr	#0,obj.var_2c(a0)
	bne.s	loc_20B96C
	rts

; ------------------------------------------------------------------------------

loc_20B96C:
	clr.b	obj.var_2d(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine22:
	cmpi.b	#5,obj.var_2d(a0)
	bge.w	loc_20BAC8
	tst.b	obj.var_2d(a0)
	bmi.w	loc_20BAB0
	bne.w	loc_20B9D8
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_38(a0)
	cmpi.b	#4,obj.var_3a(a0)
	beq.s	loc_20B9A8
	cmpi.w	#$F00,obj.x(a0)
	bge.s	loc_20B9B2
	bra.s	loc_20B9C0

; ------------------------------------------------------------------------------

loc_20B9A8:
	move.w	obj.x(a1),d0
	cmp.w	obj.x(a0),d0
	bge.s	loc_20B9C0

loc_20B9B2:
	move.b	#7,obj.var_2b(a0)
	move.b	#1,obj.var_2d(a0)
	bra.s	loc_20B9CA

; ------------------------------------------------------------------------------

loc_20B9C0:
	clr.b	obj.var_2b(a0)
	move.b	#2,obj.var_2d(a0)

loc_20B9CA:
	move.b	#$E,obj.routine(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)

loc_20B9D8:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$14,obj.var_2a(a0)
	beq.s	loc_20B9E6
	rts

; ------------------------------------------------------------------------------

loc_20B9E6:
	addq.b	#1,obj.var_38(a0)
	btst	#0,obj.var_38(a0)
	bne.s	loc_20B9FC
	move.w	#$7E,d0
	jsr	SubCpuCommand

loc_20B9FC:
	clr.b	obj.var_2a(a0)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	add.b	d0,d0
	lea	off_20BAEA,a3
	movea.l	a3,a4
	adda.w	d0,a4
	adda.w	(a4),a3
	moveq	#0,d0
	move.b	obj.var_2b(a0),d0
	andi.b	#$F,d0
	add.w	d0,d0
	add.w	d0,d0
	adda.w	d0,a3
	move.w	(a3)+,d0
	move.w	(a3)+,d1
	btst	#0,obj.var_2d(a0)
	beq.s	loc_20BA3C
	bset	#6,obj.var_2c(a2)
	neg.w	d0
	neg.w	d1
	bra.s	loc2_20BA42

; ------------------------------------------------------------------------------

loc_20BA3C:
	bset	#5,obj.var_2c(a2)

loc2_20BA42:
	add.w	d0,obj.x(a0)
	add.w	d1,obj.y(a0)
	cmpi.b	#4,obj.var_3a(a0)
	beq.s	loc_20BA64
	cmpi.b	#4,obj.var_38(a0)
	beq.s	loc_20BA76
	cmpi.b	#8,obj.var_38(a0)
	beq.s	loc_20BA76
	bra.s	loc_20BA9C

; ------------------------------------------------------------------------------

loc_20BA64:
	cmpi.b	#4,obj.var_38(a0)
	beq.s	loc_20BA76
	cmpi.b	#$C,obj.var_38(a0)
	beq.s	loc_20BA76
	bra.s	loc_20BA9C

; ------------------------------------------------------------------------------

loc_20BA76:
	cmpi.b	#3,obj.var_2d(a0)
	bge.s	loc_20BA96
	cmpi.b	#1,obj.var_2d(a0)
	beq.s	loc_20BA8E
	move.b	#$83,obj.var_2d(a0)
	bra.s	locret_20BAAE

; ------------------------------------------------------------------------------

loc_20BA8E:
	move.b	#$84,obj.var_2d(a0)
	bra.s	locret_20BAAE

; ------------------------------------------------------------------------------

loc_20BA96:
	move.b	#$85,obj.var_2d(a0)

loc_20BA9C:
	btst	#0,obj.var_2d(a0)
	beq.s	loc_20BAAA
	subq.b	#1,obj.var_2b(a0)
	bra.s	locret_20BAAE

; ------------------------------------------------------------------------------

loc_20BAAA:
	addq.b	#1,obj.var_2b(a0)

locret_20BAAE:
	rts

; ------------------------------------------------------------------------------

loc_20BAB0:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$3C,obj.var_2a(a0)
	bne.s	locret_20BAC6
	clr.b	obj.var_2a(a0)
	andi.b	#$7F,obj.var_2d(a0)

locret_20BAC6:
	rts

; ------------------------------------------------------------------------------

loc_20BAC8:
	move.b	#2,obj.routine(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)
	clr.b	obj.var_2d(a0)
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

off_20BAEA:
	dc.w	off_20BAEA-off_20BAEA
	dc.w	word_20BB34-off_20BAEA
	dc.w	word_20BB34-off_20BAEA
	dc.w	word_20BAF4-off_20BAEA
	dc.w	word_20BB34-off_20BAEA

word_20BAF4:
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$15, $F
	dc.w	$1A, $16

word_20BB34:
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4
	dc.w	$1A, -4
	dc.w	$1A, 6
	dc.w	$1A, -6
	dc.w	$1A, 4

; ------------------------------------------------------------------------------

EggmanObject_0_Routine26:
	tst.b	obj.var_2d(a0)
	bne.s	loc_20BB7E
	bsr.w	sub_20BBFA

loc_20BB7E:
	btst	#1,obj.var_2d(a0)
	bne.s	loc_20BB8A
	bsr.w	sub_20BBA2

loc_20BB8A:
	btst	#2,obj.var_2d(a0)
	bne.s	loc_20BB96
	bsr.w	sub_20BBB4

loc_20BB96:
	cmpi.b	#7,obj.var_2d(a0)
	beq.w	loc_20BBF2
	rts

; ------------------------------------------------------------------------------

sub_20BBA2:
	btst	#7,obj.var_3a(a2)
	bne.s	loc_20BBAC
	rts

; ------------------------------------------------------------------------------

loc_20BBAC:
	bset	#1,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

sub_20BBB4:
	move.w	#$17C,d1
	move.b	obj.var_36(a2),d0
	andi.b	#3,d0
	beq.s	loc_20BBC6
	move.w	#$18A,d1

loc_20BBC6:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmp.w	obj.y(a0),d1
	ble.s	loc2_20BBDE
	rts

; ------------------------------------------------------------------------------

loc2_20BBDE:
	move.w	d1,obj.y(a0)
	neg.l	obj.var_34(a0)
	neg.l	obj.x_speed(a0)
	bset	#2,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BBF2:
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

sub_20BBFA:
	bset	#0,obj.var_2d(a0)
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d1
	move.w	d0,d2
	bge.s	loc_20BC10
	neg.w	d1

loc_20BC10:
	bset	#4,obj.var_2c(a2)
	bclr	#7,obj.var_3a(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)
	cmpi.w	#$40,d1
	bge.s	loc_20BC72
	ext.l	d0
	asl.w	#4,d0
	divs.w	#90,d0
	ext.l	d0
	move.w	#$C,d1
	asl.l	d1,d0
	move.l	d0,obj.var_34(a0)
	move.w	#$17C,d0
	sub.w	obj.y(a0),d0
	ext.l	d0
	asl.w	#4,d0
	divs.w	#90,d0
	ext.l	d0
	move.w	#$C,d1
	asl.l	d1,d0
	move.l	d0,obj.x_speed(a0)
	cmpi.b	#2,obj.var_3a(a0)
	beq.s	loc_20BC6A
	move.b	#4,obj.var_36(a2)
	rts

; ------------------------------------------------------------------------------

loc_20BC6A:
	move.b	#6,obj.var_36(a2)
	rts

; ------------------------------------------------------------------------------

loc_20BC72:
	tst.w	d2
	bge.s	loc2_20BC7C
	addi.w	#$10,d0
	bra.s	loc_20BC80

; ------------------------------------------------------------------------------

loc2_20BC7C:
	subi.w	#$10,d0

loc_20BC80:
	ext.l	d0
	asl.w	#4,d0
	divs.w	#$5A,d0
	ext.l	d0
	move.w	#$C,d1
	asl.l	d1,d0
	move.l	d0,obj.var_34(a0)
	move.w	#$18A,d0
	sub.w	obj.y(a0),d0
	ext.l	d0
	asl.w	#4,d0
	divs.w	#$5A,d0
	ext.l	d0
	move.w	#$C,d1
	asl.l	d1,d0
	move.l	d0,obj.x_speed(a0)
	cmpi.b	#2,obj.var_3a(a0)
	beq.s	loc_20BCCA
	move.b	#2,obj.var_36(a2)
	tst.w	d2
	bge.s	locret_20BCC8
	move.b	#6,obj.var_36(a2)

locret_20BCC8:
	rts

; ------------------------------------------------------------------------------

loc_20BCCA:
	move.b	#6,obj.var_36(a2)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine28:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.w	#$13C,obj.y(a0)
	ble.s	loc_20BCEC
	rts

; ------------------------------------------------------------------------------

loc_20BCEC:
	move.w	#$13C,obj.y(a0)
	clr.b	obj.var_2d(a0)
	bset	#0,obj.var_2c(a0)
	bsr.w	sub_20BFA4
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine2C:
	cmpi.b	#1,obj.var_2d(a0)
	beq.w	loc_20BD5A
	cmpi.b	#2,obj.var_2d(a0)
	beq.w	loc_20BD60
	cmpi.b	#3,obj.var_2d(a0)
	beq.w	loc_20BD8E
	cmpi.b	#4,obj.var_2d(a0)
	beq.w	loc_20BDA2
	cmpi.b	#5,obj.var_2d(a0)
	beq.w	loc_20BDC6
	move.w	obj.x(a1),d0
	cmp.w	obj.x(a0),d0
	bge.s	loc_20BD4C
	move.w	#$F7C,obj.var_38(a0)
	move.b	#1,obj.var_2d(a0)
	bra.s	loc_20BD5A

; ------------------------------------------------------------------------------

loc_20BD4C:
	move.w	#$E84,obj.var_38(a0)
	move.b	#2,obj.var_2d(a0)
	bra.s	loc_20BD60

; ------------------------------------------------------------------------------

loc_20BD5A:
	bsr.w	EggmanObject_0_Routine8
	bra.s	loc_20BD64

; ------------------------------------------------------------------------------

loc_20BD60:
	bsr.w	EggmanObject_0_RoutineA

loc_20BD64:
	bclr	#0,obj.var_2c(a0)
	bne.s	loc_20BD6E
	rts

; ------------------------------------------------------------------------------

loc_20BD6E:
	bset	#4,obj.var_2c(a2)
	bclr	#7,obj.var_3a(a2)
	move.b	#8,obj.var_36(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)
	move.b	#3,obj.var_2d(a0)

loc_20BD8E:
	btst	#7,obj.var_3a(a2)
	bne.s	loc_20BD98
	rts

; ------------------------------------------------------------------------------

loc_20BD98:
	move.w	#$138,obj.var_38(a0)
	addq.b	#4,obj.var_2d(a0)

loc_20BDA2:
	bsr.w	EggmanObject_0_RoutineC
	bclr	#0,obj.var_2c(a0)
	bne.s	loc_20BDB0
	rts

; ------------------------------------------------------------------------------

loc_20BDB0:
	move.b	#5,obj.var_2d(a0)
	clr.w	obj.var_30(a0)
	move.w	#-$68,obj.var_32(a0)
	move.w	#$4000,obj.var_2a(a0)

loc_20BDC6:
	bsr.w	sub_20BF4A
	move.w	obj.var_30(a0),d1
	sub.w	d1,obj.x(a0)
	clr.w	obj.var_30(a0)
	cmpi.w	#$8000,obj.var_2a(a0)
	beq.s	loc_20BDE0
	rts

; ------------------------------------------------------------------------------

loc_20BDE0:
	clr.b	obj.var_2d(a0)
	bset	#0,obj.var_2c(a0)
	move.w	#$B4,d0
	jsr	PlayFmSound
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine2E:
	cmpi.b	#5,obj.var_2d(a0)
	bge.w	loc_20BECC
	tst.b	obj.var_2d(a0)
	bne.w	loc_20BE4A
	move.w	#0,obj.var_32(a0)
	move.w	#0,obj.var_2a(a0)
	cmpi.w	#$F00,obj.x(a0)
	bge.s	loc_20BE2A
	move.w	#-$29,obj.var_30(a0)
	move.b	#2,obj.var_2d(a0)
	bra.s	loc_20BE36

; ------------------------------------------------------------------------------

loc_20BE2A:
	move.w	#$29,obj.var_30(a0)
	move.b	#1,obj.var_2d(a0)

loc_20BE36:
	move.b	#$12,obj.routine(a2)
	move.b	#2,obj.var_34(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)

loc_20BE4A:
	bsr.w	sub_20BF4A
	cmpi.w	#$8000,obj.var_2a(a0)
	beq.s	loc_20BE58
	rts

; ------------------------------------------------------------------------------

loc_20BE58:
	move.w	#$B4,d0
	jsr	PlayFmSound
	move.w	#0,obj.var_32(a0)
	clr.w	obj.var_2a(a0)
	btst	#0,obj.var_2d(a0)
	beq.s	loc_20BE8E
	move.w	#$29,obj.var_30(a0)
	move.w	obj.x(a0),d0
	subi.w	#$E84,d0
	bge.s	loc_20BE86
	neg.w	d0

loc_20BE86:
	cmpi.w	#$29,d0
	blt.s	loc_20BEA8
	rts

; ------------------------------------------------------------------------------

loc_20BE8E:
	move.w	#-$29,obj.var_30(a0)
	move.w	obj.x(a0),d0
	subi.w	#$F7C,d0
	bge.s	loc_20BEA0
	neg.w	d0

loc_20BEA0:
	cmpi.w	#$29,d0
	blt.s	loc_20BEA8
	rts

; ------------------------------------------------------------------------------

loc_20BEA8:
	neg.w	obj.var_30(a0)
	cmpi.b	#3,obj.var_2d(a0)
	bge.s	loc_20BECC
	cmpi.b	#1,obj.var_2d(a0)
	beq.s	loc_20BEC4
	move.b	#3,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BEC4:
	move.b	#4,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BECC:
	clr.b	obj.var_2d(a0)
	bset	#0,obj.var_2c(a0)
	move.b	#2,obj.routine(a2)
	clr.b	obj.var_2d(a2)
	clr.b	obj.var_2b(a2)
	move.w	#0,obj.var_38(a2)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine30:
	tst.b	obj.var_2d(a0)
	bne.w	loc_20BF0A
	move.b	#1,obj.var_2d(a0)
	clr.w	obj.var_30(a0)
	move.w	#0,obj.var_32(a0)
	move.w	#0,obj.var_2a(a0)

loc_20BF0A:
	bsr.w	sub_20BF4A
	move.w	obj.var_30(a0),d1
	sub.w	d1,obj.x(a0)
	clr.w	obj.var_30(a0)
	cmpi.w	#$4000,obj.var_2a(a0)
	bge.s	loc_20BF24
	rts

; ------------------------------------------------------------------------------

loc_20BF24:
	clr.b	obj.var_2d(a0)
	bset	#0,obj.var_2c(a0)
	clr.b	obj.var_2d(a0)
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	clr.w	obj.var_30(a0)
	clr.w	obj.var_32(a0)
	bset	#0,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

sub_20BF4A:
	move.w	obj.var_30(a0),d1
	move.w	obj.var_32(a0),d0
	sub.w	d1,obj.x(a0)
	sub.w	d0,obj.y(a0)
	addi.w	#$230,obj.var_2a(a0)
	cmpi.w	#$8000,obj.var_2a(a0)
	bcs.s	loc_20BF6E
	move.w	#$8000,obj.var_2a(a0)

loc_20BF6E:
	moveq	#0,d0
	moveq	#0,d1
	move.b	obj.var_2a(a0),d0
	jsr	SineCosine
	btst	#0,obj.var_2d(a0)
	bne.s	loc_20BF86
	neg.w	d1

loc_20BF86:
	muls.w	#$29,d1
	muls.w	#-$68,d0
	asr.w	#8,d0
	asr.w	#8,d1
	move.w	d1,obj.var_30(a0)
	move.w	d0,obj.var_32(a0)
	add.w	d1,obj.x(a0)
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20BFA4:
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	mulu.w	#$A,d0
	lea	dword_20BFC4,a3
	adda.w	d0,a3
	move.l	(a3)+,obj.var_34(a0)
	move.l	(a3)+,obj.x_speed(a0)
	move.b	(a3)+,obj.var_37(a2)
	rts

; ------------------------------------------------------------------------------

dword_20BFC4:
	dc.l	$14000
	dc.l	0
	dc.b	4
	dc.b	0
	dc.l	$1C000
	dc.l	$10000
	dc.b	2
	dc.b	0
	dc.l	$1A000
	dc.l	$E000
	dc.b	3
	dc.b	0
	dc.l	$18000
	dc.l	$C000
	dc.b	4
	dc.b	0
	dc.l	$16000
	dc.l	$A000
	dc.b	5
	dc.b	0

; ------------------------------------------------------------------------------

sub_20BFF6:
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	add.w	d0,d0
	moveq	#0,d1
	move.b	obj.var_3b(a0),d1
	add.w	d1,d1
	add.w	d1,d1
	move.w	off_20C030(pc,d0.w),d0
	add.w	d1,d0
	lea	off_20C030(pc,d0.w),a3
	tst.w	(a3)
	bne.s	loc_20C01C
	clr.b	obj.var_3b(a0)
	bra.s	sub_20BFF6

; ------------------------------------------------------------------------------

loc_20C01C:
	addq.b	#1,obj.var_3b(a0)
	move.b	(a3)+,obj.routine(a0)
	move.b	(a3)+,d0
	move.w	(a3),obj.var_38(a0)
	clr.b	obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

off_20C030:
	dc.w	off_20C030-off_20C030
	dc.w	byte_20C03A-off_20C030
	dc.w	byte_20C06E-off_20C030
	dc.w	byte_20C0CA-off_20C030
	dc.w	byte_20C13E-off_20C030

byte_20C03A:
	dc.b	$12
	dc.b	0
	dc.w	$13C
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$1E
	dc.b	0
	dc.w	0
	dc.b	$20
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$2C
	dc.b	0
	dc.w	0
	dc.b	$2E
	dc.b	0
	dc.w	0
	dc.b	$30
	dc.b	0
	dc.w	0
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	0
	dc.b	0
	dc.w	0

byte_20C06E:
	dc.b	$12
	dc.b	0
	dc.w	$13C
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$16
	dc.b	0
	dc.w	0
	dc.b	$18
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$3C
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$1E
	dc.b	0
	dc.w	0
	dc.b	$20
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$26
	dc.b	0
	dc.w	0
	dc.b	$1A
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$3C
	dc.b	$1C
	dc.b	0
	dc.w	0
	dc.b	$28
	dc.b	0
	dc.w	0
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$26
	dc.b	0
	dc.w	0
	dc.b	$1A
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$3C
	dc.b	$1C
	dc.b	0
	dc.w	0
	dc.b	$28
	dc.b	0
	dc.w	0
	dc.b	0
	dc.b	0
	dc.w	0

byte_20C0CA:
	dc.b	$12
	dc.b	0
	dc.w	$13C
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$2A
	dc.b	0
	dc.w	0
	dc.b	$22
	dc.b	0
	dc.w	0
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$E
	dc.b	0
	dc.w	$15C
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$16
	dc.b	0
	dc.w	0
	dc.b	$18
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$28
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$1E
	dc.b	0
	dc.w	0
	dc.b	$20
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$26
	dc.b	0
	dc.w	0
	dc.b	$1A
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$5A
	dc.b	$1C
	dc.b	0
	dc.w	0
	dc.b	$28
	dc.b	0
	dc.w	0
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$26
	dc.b	0
	dc.w	0
	dc.b	$1A
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$5A
	dc.b	$1C
	dc.b	0
	dc.w	0
	dc.b	$28
	dc.b	0
	dc.w	0
	dc.b	0
	dc.b	0
	dc.w	0

byte_20C13E:
	dc.b	$12
	dc.b	0
	dc.w	$13C
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$2A
	dc.b	0
	dc.w	0
	dc.b	$22
	dc.b	0
	dc.w	0
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$E
	dc.b	0
	dc.w	$15C
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$10
	dc.b	0
	dc.w	2
	dc.b	$16
	dc.b	0
	dc.w	0
	dc.b	$18
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$28
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$1E
	dc.b	0
	dc.w	0
	dc.b	$20
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$26
	dc.b	0
	dc.w	0
	dc.b	$1A
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$1C
	dc.b	0
	dc.w	0
	dc.b	$28
	dc.b	0
	dc.w	0
	dc.b	$14
	dc.b	0
	dc.w	0
	dc.b	$26
	dc.b	0
	dc.w	0
	dc.b	$1A
	dc.b	0
	dc.w	0
	dc.b	6
	dc.b	0
	dc.w	$78
	dc.b	$1C
	dc.b	0
	dc.w	0
	dc.b	$28
	dc.b	0
	dc.w	0
	dc.b	0
	dc.b	0
	dc.w	0

; ------------------------------------------------------------------------------

EggmanObject_0_Routine32:
	tst.b	obj.var_2a(a0)
	bne.s	loc_20C1E4
	move.b	#3,obj.anim_id(a0)
	clr.b	obj.var_3c(a0)
	move.b	#$10,obj.routine(a2)
	move.b	#3,obj.sprite_frame(a2)
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	clr.b	obj.collide_type(a2)
	clr.b	obj.collide_status(a2)
	bclr	#3,obj.var_2c(a0)

loc_20C1E4:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#90,obj.var_2a(a0)
	bcc.s	loc_20C1FE
	movem.l	a1-a2,-(sp)
	bsr.w	sub_20CF94
	movem.l	(sp)+,a1-a2
	rts

; ------------------------------------------------------------------------------

loc_20C1FE:
	jsr	SpawnObject
	bne.w	locret_20C220
	move.b	#$43,obj.id(a1)
	move.w	#$E48,obj.x(a1)
	move.w	#$1CC,obj.y(a1)
	move.b	#$34,obj.routine(a0)

locret_20C220:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine34:
	tst.b	obj.var_2d(a0)
	bne.s	loc_20C23C
	moveq	#100,d0
	jsr	AddPoints
	clr.b	obj.var_2b(a0)
	clr.w	obj.var_32(a0)
	addq.b	#1,obj.var_2d(a0)

loc_20C23C:
	addq.b	#1,obj.var_2a(a0)
	movem.l	a1-a2,-(sp)
	bsr.w	sub_20CF94
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	divu.w	#60,d0
	andi.l	#$FFFF0000,d0
	bne.s	loc_20C25E
	bsr.w	sub_20CF62

loc_20C25E:
	movem.l	(sp)+,a1-a2
	move.w	obj.var_32(a0),d0
	sub.w	d0,obj.y(a0)
	addi.l	#$4000,obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_2b(a0),d0
	addq.b	#3,obj.var_2b(a0)
	jsr	SineCosine
	muls.w	#4,d0
	asr.w	#8,d0
	move.w	d0,obj.var_32(a0)
	add.w	d0,obj.y(a0)
	move.l	obj.var_34(a0),d1
	add.l	d1,obj.x(a0)
	cmpi.w	#$FE0,obj.x(a0)
	bge.s	loc_20C2A2
	rts

; ------------------------------------------------------------------------------

loc_20C2A2:
	movem.l	d7-a7,-(sp)
	move.w	#$B,d0
	jsr	LoadPalette
	movem.l	(sp)+,d7-a7
	move.b	#$36,obj.routine(a0)
	clr.b	obj.var_2a(a0)
	clr.b	boss_started
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine36:
	addq.b	#1,obj.var_2a(a0)
	movem.l	a1-a2,-(sp)
	bsr.w	sub_20CF94
	movem.l	(sp)+,a1-a2
	rts

; ------------------------------------------------------------------------------

EggMobileObject:
	lea	player_object,a1
	movea.w	obj.var_2e(a0),a2
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C2FC(pc,d0.w),d0
	jsr	off_20C2FC(pc,d0.w)
	btst	#0,obj.var_3c(a0)
	bne.s	locret_20C2FA
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20C2FA:
	rts

; ------------------------------------------------------------------------------

off_20C2FC:
	dc.w	EggMobileObject_0_Routine0-*
	dc.w	EggMobileObject_0_Routine2-off_20C2FC
	dc.w	EggMobileObject_0_Routine4-off_20C2FC
	dc.w	EggMobileObject_0_Routine6-off_20C2FC
	dc.w	EggMobileObject_0_Routine8-off_20C2FC
	dc.w	EggMobileObject_0_RoutineA-off_20C2FC
	dc.w	EggMobileObject_0_RoutineC-off_20C2FC
	dc.w	EggMobileObject_0_RoutineE-off_20C2FC
	dc.w	EggMobileObject_0_Routine10-off_20C2FC
	dc.w	EggMobileObject_0_Routine12-off_20C2FC

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$24,obj.width_2(a0)
	move.b	#$24,obj.height(a0)
	move.w	#$23DE,obj.sprite_tile(a0)
	move.l	#EggMobileSprites,obj.sprite_data(a0)
	move.w	#0,obj.var_38(a0)
	move.b	#$FF,obj.var_3b(a0)
	bsr.w	sub_20CF28
	bset	#7,obj.var_3a(a0)
	bset	#5,obj.var_3a(a0)
	bclr	#6,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine2:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	bsr.w	sub_20C562
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_RoutineE:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	bsr.w	sub_20C624
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine4:
	tst.b	obj.var_2d(a0)
	beq.s	loc_20C394
	cmpi.b	#1,obj.var_2d(a0)
	beq.s	loc_20C3A6
	bra.s	loc_20C3AE

; ------------------------------------------------------------------------------

loc_20C394:
	move.b	#1,obj.var_34(a0)
	move.w	#0,obj.var_38(a0)
	move.b	#1,obj.var_2d(a0)

loc_20C3A6:
	cmpi.w	#$AA,obj.var_38(a0)
	ble.s	loc_20C3D2

loc_20C3AE:
	addq.b	#1,obj.var_2d(a0)
	cmpi.b	#2,obj.var_2d(a0)
	beq.s	loc_20C3CC
	cmpi.b	#6,obj.var_2d(a0)
	beq.s	loc_20C3C4
	bra.s	loc_20C3D2

; ------------------------------------------------------------------------------

loc_20C3C4:
	move.b	#4,obj.var_34(a0)
	bra.s	loc_20C3D2

; ------------------------------------------------------------------------------

loc_20C3CC:
	move.b	#3,obj.var_34(a0)

loc_20C3D2:
	addq.w	#8,obj.var_38(a0)
	cmpi.w	#$100,obj.var_38(a0)
	bge.s	loc_20C3E0
	rts

; ------------------------------------------------------------------------------

loc_20C3E0:
	move.w	#$100,obj.var_38(a0)
	clr.b	obj.var_2d(a0)
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine6:
	tst.b	obj.var_2d(a0)
	bne.s	loc_20C408
	move.b	#1,obj.var_34(a0)
	addq.b	#1,obj.var_2d(a0)

loc_20C408:
	addi.w	#$10,obj.var_38(a0)
	cmpi.w	#$EC,obj.var_38(a0)
	blt.s	loc_20C41C
	move.b	#2,obj.var_34(a0)

loc_20C41C:
	cmpi.w	#$100,obj.var_38(a0)
	bge.s	loc_20C426
	rts

; ------------------------------------------------------------------------------

loc_20C426:
	move.w	#$100,obj.var_38(a0)
	clr.b	obj.var_2d(a0)
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine8:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	tst.b	obj.var_2d(a0)
	bne.s	loc_20C454
	move.b	#2,obj.var_34(a0)
	addq.b	#1,obj.var_2d(a0)

loc_20C454:
	subq.w	#6,obj.var_38(a0)
	cmpi.w	#$EC,obj.var_38(a0)
	bge.s	loc_20C466
	move.b	#1,obj.var_34(a0)

loc_20C466:
	cmpi.w	#0,obj.var_38(a0)
	ble.s	loc_20C470
	rts

; ------------------------------------------------------------------------------

loc_20C470:
	move.w	#0,obj.var_38(a0)
	clr.b	obj.var_2d(a0)
	move.b	#2,obj.routine(a0)
	move.b	#0,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_RoutineA:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	move.b	obj.var_3a(a2),d0
	cmp.b	obj.var_3d(a0),d0
	beq.s	loc_20C4A4
	bsr.w	loc_20C5E0
	rts

; ------------------------------------------------------------------------------

loc_20C4A4:
	move.w	obj.x(a1),d0
	add.b	obj.anim_timer(a1),d0
	andi.b	#3,d0
	add.b	d0,d0
	add.b	d0,d0
	add.b	d0,d0
	move.b	d0,obj.var_3f(a0)
	move.b	#2,obj.routine(a0)
	bset	#4,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_RoutineC:
	move.w	8(a2),obj.x(a0)
	move.w	$C(a2),obj.y(a0)
	cmpi.b	#1,obj.var_2d(a0)
	beq.s	loc_20C4FE
	bset	#3,obj.var_2c(a0)
	addq.b	#1,obj.var_2d(a0)
	move.w	#$FF00,obj.var_38(a0)
	bset	#7,obj.var_3a(a0)
	bset	#5,obj.var_3a(a0)
	bclr	#6,obj.var_3a(a0)

loc_20C4FE:
	addq.w	#6,obj.var_38(a0)
	cmpi.w	#0,obj.var_38(a0)
	bge.s	loc_20C50C
	rts

; ------------------------------------------------------------------------------

loc_20C50C:
	bclr	#3,obj.var_2c(a0)
	move.w	#0,obj.var_38(a0)
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2d(a0)
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine10:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

EggMobileObject_0_Routine12:
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	moveq	#0,d0
	move.w	#$1A0,d0
	sub.w	obj.y(a2),d0
	cmpi.w	#$24,d0
	ble.s	loc_20C556
	move.w	#$24,d0

loc_20C556:
	lsl.w	#8,d0
	divu.w	#$24,d0
	move.w	d0,obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

sub_20C562:
	bclr	#4,obj.var_2c(a0)
	bne.s	loc_20C578
	btst	#6,obj.var_3a(a0)
	beq.w	loc_20C596
	bra.w	loc_20C5E0

; ------------------------------------------------------------------------------

loc_20C578:
	clr.b	obj.var_2b(a0)
	bclr	#7,obj.var_3a(a0)
	bclr	#5,obj.var_3a(a0)
	bchg	#6,obj.var_3a(a0)
	beq.w	loc_20C5E0
	bra.w	loc_20C596

; ------------------------------------------------------------------------------

loc_20C596:
	tst.b	obj.var_3a(a0)
	bmi.s	locret_20C5DE
	btst	#5,obj.var_3a(a0)
	bne.s	loc_20C5C4
	move.b	#1,obj.sprite_frame(a0)
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#$A,obj.var_2b(a0)
	bne.s	loc_20C608
	bset	#5,obj.var_3a(a0)
	clr.b	obj.var_2b(a0)
	bra.w	loc_20C608

; ------------------------------------------------------------------------------

loc_20C5C4:
	move.b	obj.var_35(a0),d0
	cmp.b	obj.var_36(a0),d0
	beq.s	loc_20C5D2
	bra.w	loc_20C608

; ------------------------------------------------------------------------------

loc_20C5D2:
	bset	#7,obj.var_3a(a0)
	move.b	#0,obj.sprite_frame(a0)

locret_20C5DE:
	rts

; ------------------------------------------------------------------------------

loc_20C5E0:
	btst	#5,obj.var_3a(a0)
	bne.s	loc_20C604
	move.b	#1,obj.sprite_frame(a0)
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#$A,obj.var_2b(a0)
	bne.s	locret_20C622
	clr.b	obj.var_2b(a0)
	bset	#5,obj.var_3a(a0)

loc_20C604:
	bsr.w	sub_20C624

loc_20C608:
	addq.b	#1,obj.var_2a(a0)
	move.b	obj.var_2a(a0),d0
	cmp.b	obj.var_37(a0),d0
	blt.s	locret_20C622
	move.b	#0,obj.var_2a(a0)
	bset	#6,obj.var_2c(a0)

locret_20C622:
	rts

; ------------------------------------------------------------------------------

sub_20C624:
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#6,obj.var_2b(a0)
	beq.s	loc_20C63A
	cmpi.b	#$C,obj.var_2b(a0)
	beq.s	loc_20C642
	bra.s	locret_20C64C

; ------------------------------------------------------------------------------

loc_20C63A:
	move.b	#2,obj.sprite_frame(a0)
	bra.s	locret_20C64C

; ------------------------------------------------------------------------------

loc_20C642:
	clr.b	obj.var_2b(a0)
	move.b	#1,obj.sprite_frame(a0)

locret_20C64C:
	rts

; ------------------------------------------------------------------------------

BossPanelObject:
	lea	player_object,a1
	movea.w	obj.var_2e(a0),a2
	movea.w	obj.var_2e(a2),a3
	tst.b	obj.var_3b(a2)
	bmi.s	loc_20C664
	bsr.w	sub_20C7C0

loc_20C664:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C6C6(pc,d0.w),d0
	jsr	off_20C6C6(pc,d0.w)
	cmpi.b	#4,obj.sprite_frame(a0)
	bge.s	loc_20C688
	bclr	#1,obj.sprite_flags(a0)
	bclr	#0,obj.sprite_flags(a0)
	bra.s	loc_20C6C0

; ------------------------------------------------------------------------------

loc_20C688:
	cmpi.b	#8,obj.sprite_frame(a0)
	bge.s	loc_20C69E
	bset	#1,obj.sprite_flags(a0)
	bclr	#0,obj.sprite_flags(a0)
	bra.s	loc_20C6C0

; ------------------------------------------------------------------------------

loc_20C69E:
	cmpi.b	#$C,obj.sprite_frame(a0)
	bge.s	loc_20C6B4
	bset	#1,obj.sprite_flags(a0)
	bset	#0,obj.sprite_flags(a0)
	bra.s	loc_20C6C0

; ------------------------------------------------------------------------------

loc_20C6B4:
	bclr	#1,obj.sprite_flags(a0)
	bset	#0,obj.sprite_flags(a0)

loc_20C6C0:
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C6C6:
	dc.w	BossPanelObject_0_Routine0-*
	dc.w	BossPanelObject_0_Routine2-off_20C6C6
	dc.w	BossPanelObject_0_Routine4-off_20C6C6
	dc.w	BossPanelObject_0_Routine6-off_20C6C6
	dc.w	BossPanelObject_0_Routine8-off_20C6C6
	dc.w	BossPanelObject_0_RoutineA-off_20C6C6

; ------------------------------------------------------------------------------

BossPanelObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.w	#$2220,obj.sprite_tile(a0)
	move.l	#BossPanelSprites1,obj.sprite_data(a0)
	bsr.w	BossPanelObject_0_Routine4
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	rts

; ------------------------------------------------------------------------------

BossPanelObject_0_Routine2:
	bsr.w	loc_20C79E
	cmpi.b	#4,obj.routine(a3)
	bne.s	loc2_20C722
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	rts

; ------------------------------------------------------------------------------

loc2_20C722:
	move.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BossPanelObject_0_Routine4:
	btst	#3,obj.var_2c(a0)
	beq.s	loc_20C740
	clr.b	obj.var_2d(a0)
	move.b	#$A,obj.routine(a0)
	bra.w	loc_20C664

; ------------------------------------------------------------------------------

loc_20C740:
	cmpi.b	#$A,obj.routine(a2)
	bne.s	loc_20C75E
	tst.b	obj.sprite_frame(a0)
	bne.s	loc_20C75E
	clr.b	obj.var_2d(a0)
	move.b	#6,obj.routine(a0)
	addq.b	#1,obj.var_3d(a2)
	rts

; ------------------------------------------------------------------------------

loc_20C75E:
	moveq	#0,d0
	move.b	obj.var_34(a2),d0
	add.w	d0,d0
	lea	BossPanelSprites,a5
	move.w	(a5,d0.w),d0
	lea	(a5,d0.w),a4
	move.l	a4,obj.sprite_data(a0)
	btst	#6,obj.var_2c(a2)
	beq.s	loc_20C786
	bsr.w	sub_20CBA2
	bra.s	loc_20C792

; ------------------------------------------------------------------------------

loc_20C786:
	btst	#5,obj.var_2c(a2)
	beq.s	loc_20C792
	bsr.w	sub_20CBB4

loc_20C792:
	tst.b	obj.var_38(a0)
	bne.s	loc_20C79E
	move.b	obj.sprite_frame(a0),obj.var_35(a2)

loc_20C79E:
	bsr.w	sub_20CBEA
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	move.w	obj.var_30(a0),d1
	move.w	obj.var_32(a0),d2
	add.w	d1,obj.x(a0)
	add.w	d2,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20C7C0:
	move.b	obj.var_3b(a2),d0
	cmp.b	obj.var_38(a0),d0
	bne.s	loc_20C7D2
	bset	#3,obj.var_2c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C7D2:
	cmpi.b	#1,obj.var_3a(a3)
	beq.w	loc_20C808
	moveq	#0,d0
	move.b	obj.var_3a(a3),d0
	add.w	d0,d0
	move.w	off_20C810(pc,d0.w),d0
	lea	off_20C810(pc,d0.w),a4
	moveq	#0,d0
	move.b	obj.var_3b(a2),d0
	add.w	d0,d0
	move.w	(a4,d0.w),d0
	adda.w	d0,a4
	moveq	#0,d0
	move.b	obj.var_38(a0),d0
	adda.w	d0,a4
	move.b	(a4),obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C808:
	move.b	#0,obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

off_20C810:
	dc.w	off_20C810-off_20C810
	dc.w	off_20C810-off_20C810
	dc.w	off_20C830-off_20C810
	dc.w	off_20C818-off_20C810

off_20C818:
	dc.w	byte_20C820-off_20C818
	dc.w	byte_20C824-off_20C818
	dc.w	byte_20C828-off_20C818
	dc.w	byte_20C82C-off_20C818

byte_20C820:
	dc.b	-1
	dc.b	0
	dc.b	1
	dc.b	2

byte_20C824:
	dc.b	2
	dc.b	-1
	dc.b	0
	dc.b	1

byte_20C828:
	dc.b	1
	dc.b	2
	dc.b	-1
	dc.b	0

byte_20C82C:
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	-1

off_20C830:
	dc.w	byte_20C836-off_20C830
	dc.w	byte_20C83A-off_20C830
	dc.w	byte_20C83E-off_20C830

byte_20C836:
	dc.b	-1
	dc.b	0
	dc.b	1
	dc.b	-1

byte_20C83A:
	dc.b	0
	dc.b	-1
	dc.b	1
	dc.b	-1

byte_20C83E:
	dc.b	0
	dc.b	1
	dc.b	-1
	dc.b	-1

; ------------------------------------------------------------------------------

BossPanelObject_0_Routine6:
	cmpi.b	#6,obj.var_2d(a0)
	beq.w	loc_20CA6C
	cmpi.b	#5,obj.var_2d(a0)
	beq.w	loc_20CA46
	cmpi.b	#4,obj.var_2d(a0)
	beq.w	loc_20C9F6
	cmpi.b	#3,obj.var_2d(a0)
	beq.w	loc_20C8C4
	cmpi.b	#2,obj.var_2d(a0)
	beq.w	loc_20C8AE
	cmpi.b	#1,obj.var_2d(a0)
	beq.w	loc_20C892
	addq.b	#1,obj.var_2d(a0)
	cmpi.b	#1,obj.var_3a(a3)
	bne.s	loc_20C892
	move.l	#BossPanelSprites2,obj.sprite_data(a0)

loc_20C892:
	subi.l	#$10000,obj.y(a0)
	cmpi.w	#$E0,obj.y(a0)
	ble.s	loc_20C8A4
	rts

; ------------------------------------------------------------------------------

loc_20C8A4:
	addq.b	#1,obj.var_2d(a0)
	addq.b	#1,obj.var_3e(a2)
	rts

; ------------------------------------------------------------------------------

loc_20C8AE:
	move.b	obj.var_3a(a3),d0
	cmp.b	obj.var_3e(a2),d0
	ble.s	loc_20C8BA
	rts

; ------------------------------------------------------------------------------

loc_20C8BA:
	clr.b	obj.var_2a(a0)
	addq.b	#1,obj.var_2d(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C8C4:
	addq.b	#1,obj.var_2a(a0)
	moveq	#0,d0
	move.b	obj.var_38(a0),d0
	addq.b	#1,d0
	mulu.w	#$1E,d0
	cmp.b	obj.var_2a(a0),d0
	beq.s	loc_20C8DC
	rts

; ------------------------------------------------------------------------------

loc_20C8DC:
	move.b	#3,obj.sprite_layer(a0)
	addq.b	#1,obj.var_2d(a0)
	clr.b	obj.var_2a(a0)
	move.l	#BossPanelSprites6,obj.sprite_data(a0)
	move.b	#0,obj.sprite_frame(a0)
	cmpi.b	#3,$3A(a3)
	bge.w	loc_20C9AA
	move.l	#BossPanelSprites2,obj.sprite_data(a0)
	cmpi.b	#2,$3A(a3)
	beq.w	loc_20C98C
	cmpi.w	#$F00,obj.x(a1)
	bge.s	loc_20C954
	move.b	#3,obj.sprite_frame(a0)
	moveq	#0,d0
	move.w	#$FF8,d0
	sub.w	obj.x(a1),d0
	muls.w	#$95F6,d0
	swap	d0
	move.w	d0,obj.y(a0)
	addi.w	#$1E0,obj.y(a0)
	move.w	#$FC8,obj.x(a0)
	move.l	#-$33BB9,obj.var_34(a0)
	move.l	#$156CF,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C954:
	move.b	#$D,obj.sprite_frame(a0)
	moveq	#0,d0
	move.w	obj.x(a1),d0
	subi.w	#$E08,d0
	muls.w	#$95F6,d0
	swap	d0
	move.w	d0,obj.y(a0)
	addi.w	#$1E0,obj.y(a0)
	move.w	#$E38,obj.x(a0)
	move.l	#$33BB9,obj.var_34(a0)
	move.l	#$156CF,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C98C:
	tst.b	obj.var_38(a0)
	beq.s	loc_20C9AA
	move.w	obj.x(a1),obj.x(a0)
	move.l	#0,obj.var_34(a0)
	move.l	#$38000,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C9AA:
	moveq	#0,d0
	move.b	obj.var_3f(a2),d0
	lea	word_20C9D6(pc,d0.w),a4
	moveq	#0,d0
	move.b	obj.var_38(a0),d0
	add.w	d0,d0
	move.w	(a4,d0.w),d0
	move.w	d0,obj.x(a0)
	move.l	#0,obj.var_34(a0)
	move.l	#$38000,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_20C9D6:
	dc.w	$EC0
	dc.w	$F40
	dc.w	$F80
	dc.w	$E80
	dc.w	$E80
	dc.w	$EC0
	dc.w	$F00
	dc.w	$F40
	dc.w	$F80
	dc.w	$F40
	dc.w	$F00
	dc.w	$E80
	dc.w	$EB0
	dc.w	$F50
	dc.w	$ED0
	dc.w	$F10

; ------------------------------------------------------------------------------

loc_20C9F6:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	cmpi.b	#0,obj.sprite_frame(a0)
	bne.s	loc_20CA22
	move.w	#$1C0,d0
	cmpi.l	#BossPanelSprites6,obj.sprite_data(a0)
	beq.s	loc_20CA26
	move.w	#$1B8,d0
	bra.s	loc_20CA26

; ------------------------------------------------------------------------------

loc_20CA22:
	move.w	#$1D0,d0

loc_20CA26:
	cmp.w	obj.y(a0),d0
	ble.s	loc_20CA2E
	rts

; ------------------------------------------------------------------------------

loc_20CA2E:
	move.w	d0,obj.y(a0)
	addq.b	#1,obj.var_2d(a0)
	clr.b	obj.var_2a(a0)
	move.w	#$B4,d0
	jsr	PlayFmSound
	rts

; ------------------------------------------------------------------------------

loc_20CA46:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$1E,obj.var_2a(a0)
	beq.s	loc_20CA54
	rts

; ------------------------------------------------------------------------------

loc_20CA54:
	move.b	#5,obj.sprite_layer(a0)
	addq.b	#1,obj.var_2d(a0)
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	clr.b	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CA6C:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#60,obj.var_2a(a0)
	beq.s	loc_20CA86
	btst	#0,obj.var_2a(a0)
	bne.s	loc_20CA82
	rts

; ------------------------------------------------------------------------------

loc_20CA82:
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

loc_20CA86:
	addq.b	#1,obj.var_3d(a2)
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2d(a0)
	move.b	#8,obj.routine(a0)
	moveq	#0,d0
	move.b	$3A(a3),d0
	add.b	d0,d0
	move.w	off_20CAC4(pc,d0.w),d0
	lea	off_20CAC4(pc,d0.w),a4
	moveq	#0,d0
	move.b	obj.var_38(a0),d0
	bne.s	loc_20CAB4
	move.b	(a4),obj.var_35(a2)

loc_20CAB4:
	adda.w	d0,a4
	move.b	(a4),obj.sprite_frame(a0)
	move.b	#0,obj.var_34(a2)
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

off_20CAC4:
	dc.w	off_20CAC4-off_20CAC4
	dc.w	byte_20CAD6-off_20CAC4
	dc.w	byte_20CAD8-off_20CAC4
	dc.w	byte_20CAD2-off_20CAC4
	dc.w	byte_20CACE-off_20CAC4

byte_20CACE:
	dc.b	0
	dc.b	4
	dc.b	8
	dc.b	$C

byte_20CAD2:
	dc.b	4
	dc.b	8
	dc.b	$C
	dc.b	$FF

byte_20CAD6:
	dc.b	8
	dc.b	$FF

byte_20CAD8:
	dc.b	8
	dc.b	$C

; ------------------------------------------------------------------------------

BossPanelObject_0_Routine8:
	btst	#3,obj.var_2c(a0)
	bne.w	loc_20CB9A
	btst	#3,obj.var_2c(a2)
	beq.s	loc_20CAF2
	move.b	#4,obj.routine(a0)

loc_20CAF2:
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

BossPanelObject_0_RoutineA:
	tst.b	obj.var_2d(a0)
	bne.s	loc_20CB48
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)
	move.l	#$10000,obj.var_34(a0)
	move.l	#-$30000,obj.x_speed(a0)
	cmpi.b	#8,obj.sprite_frame(a0)
	ble.s	loc_20CB20
	neg.l	obj.var_34(a0)

loc_20CB20:
	clr.b	obj.var_2a(a0)
	clr.b	obj.var_2b(a0)
	addq.b	#1,obj.var_2d(a0)
	cmpi.l	#BossPanelSprites4,obj.sprite_data(a0)
	beq.s	loc_20CB40
	move.l	#BossPanelSprites3,obj.sprite_data(a0)
	bra.s	loc_20CB48

; ------------------------------------------------------------------------------

loc_20CB40:
	move.l	#BossPanelSprites5,obj.sprite_data(a0)

loc_20CB48:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.x_speed(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$3000,obj.x_speed(a0)
	cmpi.w	#$1E0,obj.y(a0)
	bge.s	loc_20CB9A
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#4,obj.var_2a(a0)
	bne.s	loc_20CB88
	clr.b	obj.var_2a(a0)
	addq.b	#1,obj.sprite_frame(a0)
	cmpi.b	#$F,obj.sprite_frame(a0)
	ble.s	loc_20CB88
	clr.b	obj.sprite_frame(a0)

loc_20CB88:
	addq.b	#1,obj.var_2b(a0)
	btst	#0,obj.var_2b(a0)
	bne.s	loc_20CB96
	rts

; ------------------------------------------------------------------------------

loc_20CB96:
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

loc_20CB9A:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20CBA2:
	subq.b	#1,obj.sprite_frame(a0)
	bge.s	loc_20CBAE
	move.b	#$F,obj.sprite_frame(a0)

loc_20CBAE:
	bsr.w	sub_20CBCA
	rts

; ------------------------------------------------------------------------------

sub_20CBB4:
	addq.b	#1,obj.sprite_frame(a0)
	cmpi.b	#$10,obj.sprite_frame(a0)
	blt.s	loc_20CBC4
	clr.b	obj.sprite_frame(a0)

loc_20CBC4:
	bsr.w	sub_20CBCA
	rts

; ------------------------------------------------------------------------------

sub_20CBCA:
	tst.b	obj.var_38(a0)
	bne.s	locret_20CBE8
	move.b	obj.sprite_frame(a0),d0
	andi.b	#3,d0
	cmpi.b	#2,d0
	beq.s	locret_20CBE8
	move.w	#$BA,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

locret_20CBE8:
	rts

; ------------------------------------------------------------------------------

sub_20CBEA:
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	move.b	obj.var_34(a2),d0
	add.w	d0,d0
	move.w	off_20CC38(pc,d0.w),d0
	lea	off_20CC38(pc,d0.w),a4
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	mulu.w	#$A,d0
	adda.w	d0,a4
	move.w	(a4)+,d1
	move.w	(a4)+,d2
	move.w	(a4)+,d3
	move.w	(a4)+,d4
	move.w	(a4)+,d5
	move.w	obj.var_38(a2),d0
	muls.w	d0,d3
	muls.w	d0,d4
	asr.w	#8,d3
	asr.w	#8,d4
	add.w	d3,d1
	add.w	d4,d2
	move.w	d1,obj.var_30(a0)
	move.w	d2,obj.var_32(a0)
	move.b	d5,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	rts

; ------------------------------------------------------------------------------

off_20CC38:
	dc.w	word_20CC44-off_20CC38
	dc.w	word_20CC44-off_20CC38
	dc.w	word_20CC44-off_20CC38
	dc.w	word_20CCE4-off_20CC38
	dc.w	word_20CD84-off_20CC38
	dc.w	word_20CD84-off_20CC38

word_20CC44:
	dc.w	0, -$28, 0, -$24, $B4
	dc.w	$13, -$24, $12, -$1F, $B5
	dc.w	$1F, -$20, $19, -$19, $B6
	dc.w	$26, -$10, $1F, -$12, $B7
	dc.w	$28, 0, $24, 0, $B8
	dc.w	$26, $10, $1F, $12, $B7
	dc.w	$1F, $20, $19, $19, $B6
	dc.w	$13, $24, $12, $1F, $B5
	dc.w	0, $28, 0, $24, $B4
	dc.w	-$13, $24, -$12, $1F, $B5
	dc.w	-$1F, $20, -$19, $19, $B6
	dc.w	-$26, $10, -$1F, $12, $B7
	dc.w	-$28, 0, -$24, 0, $B8
	dc.w	-$26, -$10, -$1F, -$12, $B7
	dc.w	-$1F, -$20, -$19, -$19, $B6
	dc.w	-$13, -$24, -$12, -$1F, $B5

word_20CCE4:
	dc.w	0, -$20, 0, -$24, $B9
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	$20, 0, $24, 0, $BA
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	0, $20, 0, $24, $B9
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	-$20, 0, -$24, 0, $BA
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0
	dc.w	0, 0, 0, 0, 0

word_20CD84:
	dc.w	0, -$20, 0, -$24, $BB
	dc.w	$C, -$1D, $12, -$1F, $BC
	dc.w	$17, -$17, $19, -$19, $BD
	dc.w	$1D, -$C, $1F, -$12, $BE
	dc.w	$20, 0, $24, 0, $BF
	dc.w	$1D, $C, $1F, $12, $BE
	dc.w	$17, $17, $19, $19, $BD
	dc.w	$C, $1D, $12, $1F, $BC
	dc.w	0, $20, 0, $24, $BB
	dc.w	-$C, $1D, -$12, $1F, $BC
	dc.w	-$17, $17, -$19, $19, $BD
	dc.w	-$1D, $C, -$1F, $12, $BE
	dc.w	-$20, 0, -$24, 0, $BF
	dc.w	-$1D, -$C, -$1F, -$12, $BE
	dc.w	-$17, -$17, -$19, -$19, $BD
	dc.w	-$C, -$1D, -$12, -$1F, $BC

; ------------------------------------------------------------------------------

SparksObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CE38(pc,d0.w),d0
	jsr	off_20CE38(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20CE38:
	dc.w	SparksObject_0_Routine0-*
	dc.w	SparksObject_0_Routine2-off_20CE38

; ------------------------------------------------------------------------------

SparksObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$3DE,obj.sprite_tile(a0)
	move.l	#SparksSprites,obj.sprite_data(a0)

SparksObject_0_Routine2:
	movea.w	obj.var_2e(a0),a2
	move.w	obj.x(a2),obj.x(a0)
	move.w	obj.y(a2),obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_34(a0),d0
	add.w	d0,d0
	move.w	off_20CEE4(pc,d0.w),d0
	lea	off_20CEE4(pc,d0.w),a3
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	adda.w	d0,a3
	move.w	(a3)+,d0
	add.w	d0,obj.x(a0)
	move.w	(a3),d0
	add.w	d0,obj.y(a0)
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$96,obj.var_2a(a0)
	beq.w	loc_20CB9A
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#4,obj.var_2b(a0)
	bne.s	loc_20CED8
	addq.b	#4,obj.var_2d(a0)
	cmpi.b	#8,obj.var_2d(a0)
	ble.s	loc_20CEC4
	clr.b	obj.var_2d(a0)

loc_20CEC4:
	clr.b	obj.var_2b(a0)
	addq.b	#1,obj.sprite_frame(a0)
	cmpi.b	#2,obj.sprite_frame(a0)
	ble.s	loc_20CED8
	clr.b	obj.sprite_frame(a0)

loc_20CED8:
	cmpi.b	#2,obj.sprite_frame(a0)
	bne.s	locret_20CEE2
	addq.l	#4,sp

locret_20CEE2:
	rts

; ------------------------------------------------------------------------------

off_20CEE4:
	dc.w	word_20CEE8-off_20CEE4
	dc.w	word_20CEF4-off_20CEE4

word_20CEE8:
	dc.w	-$10, 0
	dc.w	-$10, -8
	dc.w	-4, 0

word_20CEF4:
	dc.w	4, 0
	dc.w	$10, -8
	dc.w	8, 0

; ------------------------------------------------------------------------------

sub_20CF00:
	movea.l	a0,a3
	jsr	SpawnObjectAfter
	bne.w	locret_20CF26
	move.w	a3,obj.var_2e(a1)
	move.w	a1,obj.var_2e(a3)
	move.b	#$41,obj.id(a1)
	move.w	obj.x(a3),obj.x(a1)
	move.w	obj.y(a3),obj.y(a1)

locret_20CF26:
	rts

; ------------------------------------------------------------------------------

sub_20CF28:
	movea.l	a0,a3
	moveq	#0,d1
	moveq	#0,d2

loc_20CF2E:
	jsr	SpawnObjectAfter
	bne.w	locret_20CF60
	move.w	a3,obj.var_2e(a1)
	move.b	d1,obj.var_38(a1)
	move.b	#$40,obj.id(a1)
	move.w	obj.x(a3),obj.x(a1)
	move.w	obj.y(a3),obj.y(a1)
	move.b	d2,obj.sprite_frame(a1)
	addq.b	#1,d1
	addq.b	#4,d2
	cmpi.w	#4,d1
	bne.s	loc_20CF2E

locret_20CF60:
	rts

; ------------------------------------------------------------------------------

sub_20CF62:
	movea.l	a0,a3
	moveq	#0,d1

loc_20CF66:
	jsr	SpawnObject
	bne.w	locret_20CF92
	move.w	a3,obj.var_2e(a1)
	move.b	#$42,obj.id(a1)
	move.w	obj.x(a3),obj.x(a1)
	move.w	obj.y(a3),obj.y(a1)
	move.b	d1,obj.var_34(a1)
	addq.b	#1,d1
	cmpi.w	#2,d1
	bne.s	loc_20CF66

locret_20CF92:
	rts

; ------------------------------------------------------------------------------

sub_20CF94:
	moveq	#0,d2
	move.b	obj.var_2a(a0),d2
	divu.w	#2,d2
	swap	d2
	tst.w	d2
	beq.s	loc_20CFA6
	rts

; ------------------------------------------------------------------------------

loc_20CFA6:
	jsr	SpawnObject
	bne.s	locret_20CFF0
	move.b	#$18,obj.id(a1)
	st	obj.routine_2(a1)
	jsr	Random
	moveq	#0,d1
	move.w	d0,d1
	ext.l	d1
	clr.w	d0
	swap	d0
	ext.l	d0
	divs.w	#$80,d0
	swap	d0
	addi.w	#$F00,d0
	move.w	d0,obj.x(a1)
	divs.w	#$50,d1
	swap	d1
	addi.w	#$180,d1
	move.w	d1,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20CFF0:
	rts

; ------------------------------------------------------------------------------

EggmanAnims:
	include	"src/anims/r8/eggman.asm"
	even

; ------------------------------------------------------------------------------
