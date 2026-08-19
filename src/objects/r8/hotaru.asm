; ------------------------------------------------------------------------------

HotaruObject:
	cmpi.b	#$FD,obj.subtype(a0)
	beq.w	loc_20F644
	cmpi.b	#$FE,obj.subtype(a0)
	beq.w	loc_20F67E
	cmpi.b	#$FF,obj.subtype(a0)
	beq.w	loc_20F59E
	andi.b	#$7F,obj.subtype(a0)
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F356(pc,d0.w),d0
	jsr	off_20F356(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F356:
	dc.w	HotaruObject_2_Routine0-*
	dc.w	HotaruObject_2_Routine2-off_20F356
	dc.w	HotaruObject_2_Routine4-off_20F356
	dc.w	HotaruObject_2_Routine6-off_20F356
	dc.w	HotaruObject_2_Routine8-off_20F356
	dc.w	HotaruObject_2_RoutineA-off_20F356
	dc.w	HotaruObject_2_RoutineC-off_20F356

; ------------------------------------------------------------------------------

sub_20F364:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	d0,obj.sprite_layer(a0)
	move.w	#$23B0,obj.sprite_tile(a0)
	move.l	#Spr_23E2CE,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

HotaruObject_2_Routine0:
	moveq	#1,d0
	bsr.s	sub_20F364
	move.b	#8,obj.height(a0)
	move.b	#8,obj.width_2(a0)
	addq.b	#2,obj.routine(a0)
	move.b	#$3C,obj.var_3a(a0)

HotaruObject_2_Routine2:
	move.b	#4,obj.anim_id(a0)
	lea	HotaruAnims(pc),a1
	jsr	AnimateObject
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20F3CA
	move.b	#1,obj.anim_id(a0)
	move.b	obj.subtype(a0),obj.var_2b(a0)
	addq.b	#2,obj.routine(a0)

locret_20F3CA:
	rts

; ------------------------------------------------------------------------------

HotaruObject_2_Routine4:
	bsr.w	sub_20F69A
	btst	#0,obj.var_2b(a0)
	beq.w	loc_20F3FA
	move.w	8(a1),d0
	andi.w	#$FFF8,d0
	cmpi.w	#$BC0,d0
	bcs.s	loc_20F3FA
	cmpi.w	#$CA0,d0
	bcc.s	loc_20F3FA
	move.w	d0,obj.var_2c(a0)
	move.w	#$158,obj.var_2e(a0)
	bra.s	loc_20F422

; ------------------------------------------------------------------------------

loc_20F3FA:
	move.w	stage_frames,d0
	andi.w	#$7F,d0
	addi.w	#$BF0,d0
	move.w	d0,obj.var_2c(a0)
	move.w	8(a1),d0
	asl.w	#2,d0
	add.w	8(a1),d0
	andi.w	#$1F,d0
	addi.w	#$160,d0
	move.w	d0,obj.var_2e(a0)

loc_20F422:
	clr.w	obj.y_speed(a0)
	move.w	obj.var_2e(a0),d0
	sub.w	obj.y(a0),d0
	beq.s	loc_20F436
	asl.w	#3,d0
	move.w	d0,obj.y_speed(a0)

loc_20F436:
	clr.w	obj.x_speed(a0)
	move.w	obj.var_2c(a0),d0
	sub.w	obj.x(a0),d0
	beq.s	loc_20F44A
	asl.w	#3,d0
	move.w	d0,obj.x_speed(a0)

loc_20F44A:
	addq.b	#1,obj.var_2b(a0)
	move.b	#$20,obj.var_3b(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

HotaruObject_2_Routine6:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	bsr.w	sub_20F48E
	subq.b	#1,obj.var_3b(a0)
	bne.s	loc_20F484
	addq.b	#2,obj.routine(a0)

loc_20F484:
	lea	HotaruAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

sub_20F48E:
	move.b	obj.var_3b(a0),d0
	andi.b	#3,d0
	cmpi.b	#3,d0
	bne.s	locret_20F4BC
	jsr	SpawnObject
	bne.s	locret_20F4BC
	move.b	#$39,obj.id(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.b	#$FD,obj.subtype(a1)

locret_20F4BC:
	rts

; ------------------------------------------------------------------------------

HotaruObject_2_Routine8:
	clr.b	obj.anim_id(a0)
	lea	HotaruAnims(pc),a1
	jsr	AnimateObject
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	move.b	byte_20F4F0(pc,d0.w),d0
	addq.b	#1,obj.var_3c(a0)
	cmpi.b	#$FF,d0
	beq.s	loc_20F4E6
	jmp	sub_20F81E

; ------------------------------------------------------------------------------

loc_20F4E6:
	addq.b	#2,obj.routine(a0)
	clr.b	obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

byte_20F4F0:
	if STAGE_GOOD_FUTURE<>0
		dc.b	0
		dc.b	0
		dc.b	0
		dc.b	$C
		dc.b	$C
		dc.b	$C
		dc.b	$24
		dc.b	$24
		dc.b	$24
		dc.b	0
		dc.b	0
		dc.b	0
		dc.b	$C
		dc.b	$C
		dc.b	$C
		dc.b	$24
		dc.b	$24
		dc.b	$24
		dc.b	0
		dc.b	0
		dc.b	0
		dc.b	$C
		dc.b	$C
		dc.b	$C
		dc.b	$24
		dc.b	$24
		dc.b	$24
		dc.b	$30
		dc.b	$3C
		dc.b	$48
		dc.b	$54
		dc.b	$FF
	else
		dc.b	0
		dc.b	0
		dc.b	0
		dc.b	$18
		dc.b	$18
		dc.b	$18
		dc.b	$48
		dc.b	$48
		dc.b	$48
		dc.b	0
		dc.b	0
		dc.b	0
		dc.b	$18
		dc.b	$18
		dc.b	$18
		dc.b	$48
		dc.b	$48
		dc.b	$48
		dc.b	0
		dc.b	0
		dc.b	0
		dc.b	$18
		dc.b	$18
		dc.b	$18
		dc.b	$48
		dc.b	$48
		dc.b	$48
		dc.b	$60
		dc.b	$78
		dc.b	$90
		dc.b	$A8
		dc.b	$FF
	endif

; ------------------------------------------------------------------------------

HotaruObject_2_RoutineA:
	tst.b	obj.var_3c(a0)
	bne.s	loc_20F528
	move.b	#$14,obj.var_3c(a0)
	move.b	#2,obj.anim_id(a0)
	move.b	#$B,obj.collide_type(a0)

loc_20F528:
	addi.b	#-$80,obj.var_3f(a0)
	bcc.s	loc_20F532
	bsr.s	sub_20F548

loc_20F532:
	lea	HotaruAnims(pc),a1
	jsr	AnimateObject
	subq.b	#1,obj.var_3c(a0)
	bne.s	locret_20F546
	addq.b	#2,obj.routine(a0)

locret_20F546:
	rts

; ------------------------------------------------------------------------------

sub_20F548:
	jsr	SpawnObject
	bne.s	locret_20F568
	move.b	#$39,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

locret_20F568:
	rts

; ------------------------------------------------------------------------------

HotaruObject_2_RoutineC:
	tst.b	obj.var_3c(a0)
	bne.s	loc_20F57A
	move.b	#$10,obj.var_3c(a0)
	clr.b	obj.anim_id(a0)

loc_20F57A:
	lea	HotaruAnims(pc),a1
	jsr	AnimateObject
	subq.b	#1,obj.var_3c(a0)
	bne.s	locret_20F59C
	move.b	#4,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)
	moveq	#0,d0
	jsr	sub_20F81E(pc)

locret_20F59C:
	rts

; ------------------------------------------------------------------------------

loc_20F59E:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F5B2(pc,d0.w),d0
	jsr	off_20F5B2(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F5B2:
	dc.w	HotaruObject_1_Routine0-*
	dc.w	HotaruObject_1_Routine2-off_20F5B2
	dc.w	HotaruObject_1_Routine4-off_20F5B2

; ------------------------------------------------------------------------------

HotaruObject_1_Routine0:
	moveq	#3,d0
	bsr.w	sub_20F364
	addq.b	#2,obj.routine(a0)
	move.b	#8,obj.height(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$98,obj.collide_type(a0)
	rts

; ------------------------------------------------------------------------------

HotaruObject_1_Routine2:
	move.b	#8,obj.anim_id(a0)
	addq.w	#8,obj.y(a0)
	lea	HotaruAnims(pc),a1
	jsr	AnimateObject
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20F5FC
	addq.b	#2,obj.routine(a0)
	clr.w	obj.var_3a(a0)

locret_20F5FC:
	rts

; ------------------------------------------------------------------------------

HotaruObject_1_Routine4:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20F61E
	move.b	#2,obj.var_3a(a0)
	move.b	#9,obj.anim_id(a0)
	tst.b	obj.var_3b(a0)
	beq.s	loc_20F61E
	move.b	#9,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F61E:
	lea	HotaruAnims(pc),a1
	jsr	AnimateObject
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20F630
	rts

; ------------------------------------------------------------------------------

loc_20F630:
	addq.b	#1,obj.var_3b(a0)
	cmpi.b	#2,obj.var_3b(a0)
	bcs.s	locret_20F642
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20F642:
	rts

; ------------------------------------------------------------------------------

loc_20F644:
	tst.b	obj.routine(a0)
	bne.s	loc_20F660
	moveq	#4,d0
	bsr.w	sub_20F364
	move.b	#$18,obj.var_3a(a0)
	move.b	#4,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)

loc_20F660:
	lea	HotaruAnims,a1
	jsr	AnimateObject
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20F678
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F678:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20F67E:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F68C(pc,d0.w),d0
	jmp	off_20F68C(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F68C:
	dc.w	HotaruObject_0_Routine0-*
	dc.w	HotaruObject_0_Routine2-off_20F68C
	dc.w	HotaruObject_0_Routine4-off_20F68C
	dc.w	HotaruObject_0_Routine6-off_20F68C
	dc.w	HotaruObject_0_Routine8-off_20F68C
	dc.w	HotaruObject_0_RoutineA-off_20F68C
	dc.w	HotaruObject_0_RoutineC-off_20F68C

; ------------------------------------------------------------------------------

sub_20F69A:
	lea	player_object,a1
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_Routine0:
	moveq	#1,d0
	bsr.w	sub_20F364
	bsr.w	sub_20F69A
	move.w	obj.x(a1),d0
	cmpi.w	#$BD0,d0
	bcs.s	locret_20F6DE
	move.b	#1,boss_door_flag
	jsr	SpawnObject
	bne.s	locret_20F6DE
	move.b	#$29,obj.id(a1)
	move.w	#$1D0,obj.y(a1)
	move.w	#$CA8,obj.x(a1)
	move.w	a1,obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)

locret_20F6DE:
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_Routine2:
	bsr.w	sub_20F69A
	move.w	obj.x(a1),d0
	cmpi.w	#$BD0,d0
	bcs.s	locret_20F710
	cmpi.w	#$CC,scroll_focus_y
	blt.s	loc_20F6FC
	move.b	#8,boss_flags

loc_20F6FC:
	addq.w	#6,scroll_focus_y
	cmpi.b	#8,boss_flags
	bne.s	locret_20F710
	addq.b	#2,obj.routine(a0)
	clr.w	obj.var_3a(a0)

locret_20F710:
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_Routine4:
	lea	byte_20F874,a3
	jsr	sub_20F83C(pc)
	cmpi.b	#$10,obj.var_3a(a0)
	bne.s	locret_20F750
	clr.w	obj.var_3a(a0)
	jsr	SpawnObject
	bne.s	locret_20F750
	move.b	#$39,obj.id(a1)
	move.w	#$190,obj.y(a1)
	move.w	#$BE0,obj.x(a1)
	move.w	a1,obj.var_34(a0)
	move.b	#$3C,obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

locret_20F750:
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_Routine6:
	movea.w	obj.var_34(a0),a1
	cmpi.b	#$39,0(a1)
	bne.s	loc_20F760

locret_20F75E:
	rts

; ------------------------------------------------------------------------------

loc_20F760:
	moveq	#0,d0
	jsr	sub_20F81E(pc)
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20F75E
	jsr	SpawnObject
	bne.s	locret_20F75E
	move.b	#$39,obj.id(a1)
	move.w	#$188,obj.y(a1)
	move.w	#$BE0,obj.x(a1)
	move.w	a1,obj.var_34(a0)
	move.b	#1,obj.subtype(a1)
	addq.b	#2,obj.routine(a0)

HotaruObject_0_Routine8:
	jsr	SpawnObject
	bne.s	locret_20F7C0
	move.b	#$39,obj.id(a1)
	move.w	#$188,obj.y(a1)
	move.w	#$C80,obj.x(a1)
	move.w	a1,obj.var_30(a0)
	move.b	#0,obj.subtype(a1)
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

locret_20F7C0:
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_RoutineA:
	movea.w	obj.var_34(a0),a1
	cmpi.b	#$39,0(a1)
	bne.s	loc_20F7D0
	rts

; ------------------------------------------------------------------------------

loc_20F7D0:
	movea.w	obj.var_30(a0),a1
	cmpi.b	#$39,0(a1)
	beq.s	locret_20F7E0
	addq.b	#2,obj.routine(a0)

locret_20F7E0:
	rts

; ------------------------------------------------------------------------------

HotaruObject_0_RoutineC:
	if STAGE_GOOD_FUTURE<>0
		lea	byte_20F884,a3
		jsr	sub_20F83C(pc)
		cmpi.b	#$10,obj.var_3a(a0)
		beq.s	loc_20F7F6

	locret_20F7F4:
		rts

; ------------------------------------------------------------------------------

loc_20F7F6:
	else
		moveq	#0,d0
		jsr	sub_20F81E(pc)
	endif
	movea.w	obj.var_3e(a0),a1
	st	$3F(a1)
	jsr	SpawnObject
	bne.s	locret_20F7F4
	move.b	#$3F,obj.id(a1)
	move.w	#$F00,obj.x(a1)
	move.w	#$13C,obj.y(a1)
	jmp	DeleteObject
	
	if STAGE_GOOD_FUTURE=0
	locret_20F7F4:
		rts
	endif

; ------------------------------------------------------------------------------

sub_20F81E:
	lea	word_20F894,a1
	lea	(a1,d0.w),a1

; ------------------------------------------------------------------------------

sub_20F828:
	lea	palette+$60,a2
	if STAGE_GOOD_FUTURE<>0
		movem.l	(a1)+,d0-d2
		move.l	d0,2(a2)
		movem.l	d1-d2,$18(a2)
	else
		movem.l	(a1)+,d0-d5
		movem.l	d0-d5,8(a2)
	endif
	rts

; ------------------------------------------------------------------------------

sub_20F83C:
	cmpi.b	#$10,obj.var_3a(a0)
	beq.s	locret_20F872
	tst.b	obj.var_3b(a0)
	bne.s	loc_20F86E
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	lea	(a3,d0.w),a3
	move.b	(a3)+,d0
	move.b	(a3)+,obj.var_3b(a0)
	lea	word_20F894,a1
	lea	(a1,d0.w),a1
	jsr	sub_20F828(pc)
	addq.b	#2,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F86E:
	subq.b	#1,obj.var_3b(a0)

locret_20F872:
	rts

; ------------------------------------------------------------------------------

	if STAGE_GOOD_FUTURE<>0
	byte_20F874:
		dc.b	$54, $40
		dc.b	$48, 4
		dc.b	$3C, 5
		dc.b	$30, 6
		dc.b	$24, 7
		dc.b	$18, 8
		dc.b	$C, 9
		dc.b	0, 0

	byte_20F884:
		dc.b	0, $40
		dc.b	$C, 9
		dc.b	$18, 8
		dc.b	$24, 7
		dc.b	$30, 6
		dc.b	$3C, 5
		dc.b	$48, 4
		dc.b	$54, $20

	word_20F894:
		dc.w	0, 0, 0, 0, 0, 0
		dc.w	0, $200, 0, 0, $200, 0
		dc.w	0, $400, 0, $200, $400, 0
		dc.w	0, $600, 0, $400, $600, 0
		dc.w	0, $822, $200, $600, $800, 0
		dc.w	0, $A44, $400, $800, $A02, $200
		dc.w	0, $C66, $600, $A02, $C24, $400
		dc.w	$200, $E88, $820, $C24, $E46, $600
	else
	byte_20F874:
		dc.b	$A8, $40
		dc.b	$90, 4
		dc.b	$78, 5
		dc.b	$60, 6
		dc.b	$48, 7
		dc.b	$30, 8
		dc.b	$18, 9
		dc.b	0, 0

	word_20F894:
		dc.w	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		dc.w	0, 0, 0, $20, 0, 0, 0, 0, 0, 0, 0, $200
		dc.w	0, 0, 0, $40, 0, 0, 0, 0, 0, 0, 0, $400
		dc.w	0, 0, $20, $260, 0, 0, 0, 0, 0, 0, $200, $620
		dc.w	0, 0, $42, $480, 0, 0, $200, 0, 0, 0, $402, $842
		dc.w	0, $20, $62, $6A0, 0, 0, $400, $200, 0, $200, $622, $A62
		dc.w	$20, $40, $282, $8C0, 0, 0, $620, $420, $200, $420, $842, $C82
		dc.w	$22, $42, $284, $8C2, 0, 0, $620, $420, $200, $422, $844, $C84
		dc.w	$24, $44, $286, $8C4, 2, 0, $620, $420, $202, $424, $846, $C86
	endif

HotaruAnims:
	include	"src/anims/r8/hotaru.asm"
	even

; ------------------------------------------------------------------------------
