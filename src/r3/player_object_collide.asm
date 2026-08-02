; ------------------------------------------------------------------------------

PlayerObjectCollide:
	btst	#6,obj.var_2c(a0)
	bne.s	loc_2071CE
	nop
	move.w	obj.x(a0),d2
	move.w	obj.y(a0),d3
	subq.w	#8,d2
	moveq	#0,d5
	move.b	obj.height(a0),d5
	subq.b	#3,d5
	sub.w	d5,d3
	cmpi.b	#$39,obj.sprite_frame(a0)
	bne.s	loc_2071AC
	addi.w	#$C,d3
	moveq	#$A,d5

loc_2071AC:
	move.w	#$10,d4
	add.w	d5,d5
	lea	(object_spawn_pool).w,a1
	move.w	#$5F,d6

loc_2071BA:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_2071C6
	move.b	obj.collide_type(a1),d0
	bne.s	loc_2071D2

loc_2071C6:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_2071BA

loc_2071CE:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2071D2:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	(byte_207558).l,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_2071FA
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_207200
	bra.w	loc_2071C6

; ------------------------------------------------------------------------------

loc_2071FA:
	cmp.w	d4,d0
	bhi.w	loc_2071C6

loc_207200:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_207218
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc_20721E
	bra.w	loc_2071C6

; ------------------------------------------------------------------------------

loc_207218:
	cmp.w	d5,d0
	bhi.w	loc_2071C6

loc_20721E:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_207292
	cmpi.b	#$C0,d1
	beq.w	loc_207472
	tst.b	d1
	bmi.w	sub_20735C
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_207256
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	locret_207254
	addq.b	#2,obj.routine(a1)

locret_207254:
	rts

; ------------------------------------------------------------------------------

loc_207256:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_207280
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_207290
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_207290
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_207280:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_207290
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_207290:
	rts

; ------------------------------------------------------------------------------

sub_207292:
	tst.b	(warping).l
	bne.s	loc_2072AC
	tst.b	(invincible).l
	bne.s	loc_2072AC
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	sub_20735C

loc_2072AC:
	tst.b	obj.collide_status(a1)
	beq.s	loc_2072D6
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_2072D4
	bset	#7,obj.flags(a1)

locret_2072D4:
	rts

; ------------------------------------------------------------------------------

loc_2072D6:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	(score_chain).w,d0
	addq.w	#2,(score_chain).w
	cmpi.w	#6,d0
	bcs.s	loc_2072EE
	moveq	#6,d0

loc_2072EE:
	move.w	d0,explode.points(a1)
	move.w	word_20734E(pc,d0.w),d0
	cmpi.w	#$20,(score_chain).w
	bcs.s	loc_207308
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

loc_207308:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20733E
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_207346
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20733E:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_207346:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_20734E:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

sub_20735C:
	tst.b	(warping).l
	bne.s	loc_20736C
	tst.b	(invincible).l
	beq.s	loc_207370

loc_20736C:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207370:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_20736C
	movea.l	a1,a2

HurtPlayer:
	tst.b	(shield).l
	bne.s	loc_2073A6
	tst.w	(rings).l
	beq.w	loc_207410
	jsr	SpawnObject
	bne.s	loc_2073A6
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_2073A6:
	clr.b	obj.var_2a(a0)
	bclr	#0,(shield).l
	bne.s	loc2_2073BC
	move.b	#0,(combine_ring).l

loc2_2073BC:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_2073EC
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_2073EC:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc_2073FA
	neg.w	obj.x_speed(a0)

loc_2073FA:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#120,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207410:
	tst.w	(debug_cheat).l
	bne.w	loc_2073A6

KillPlayer:
	tst.w	(debug_mode).l
	bne.s	loc_20746E
	move.b	#0,(invincible).l
	move.b	#6,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$700,obj.y_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	move.w	obj.y(a0),obj.var_38(a0)
	move.b	#$18,obj.anim_id(a0)
	bset	#7,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.w	#$93,d0
	jsr	PlayFmSound

loc_20746E:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207472:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$17,d1
	beq.w	loc_207502
	cmpi.b	#$1F,d1
	beq.w	loc_207502
	cmpi.b	#$23,d1
	beq.w	loc_207502
	cmpi.b	#$27,d1
	beq.w	loc_207502
	cmpi.b	#$3A,d1
	beq.w	loc_20754A
	cmpi.b	#$3B,d1
	beq.w	loc_20754A
	tst.b	(boss_started).w
	beq.w	locret_207500
	cmpi.b	#1,(boss_started).w
	beq.s	loc_2074CA
	cmpi.b	#4,(boss_started).w
	beq.s	loc_2074EC
	cmpi.b	#5,(boss_started).w
	beq.s	loc_2074FA

loc_2074CA:
	cmpi.b	#$3C,d1
	blt.s	locret_207500
	cmpi.b	#$3F,d1
	bgt.s	locret_207500
	bsr.w	sub_207292
	tst.b	obj.collide_type(a1)
	bne.s	loc_2074E4
	addq.b	#3,obj.collide_status(a1)

loc_2074E4:
	clr.b	obj.collide_type(a1)
	bra.w	loc_207502

; ------------------------------------------------------------------------------

loc_2074EC:
	cmpi.b	#$3F,d1
	beq.s	loc_20750E
	cmpi.b	#$3E,d1
	beq.s	loc_207508
	bra.s	locret_207500

; ------------------------------------------------------------------------------

loc_2074FA:
	cmpi.b	#$3D,d1
	beq.s	loc_207508

locret_207500:
	rts

; ------------------------------------------------------------------------------

loc_207502:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc_207508:
	bsr.w	sub_20735C
	bra.s	loc_207502

; ------------------------------------------------------------------------------

loc_20750E:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	locret_207548
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a1),d0
	bcs.s	locret_207548
	neg.w	obj.x_speed(a0)

locret_207548:
	rts

; ------------------------------------------------------------------------------

loc_20754A:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_207556
	addq.b	#1,obj.collide_status(a1)

locret_207556:
	rts

; ------------------------------------------------------------------------------

byte_207558:
	dc.b	$14, $14
	dc.b	$10, $C
	dc.b	$C, $10
	dc.b	4, $10
	dc.b	$C, $12
	dc.b	$10, $10
	dc.b	6, 6
	dc.b	$18, $C
	dc.b	$C, $10
	dc.b	$10, $C
	dc.b	8, 8
	dc.b	$14, $10
	dc.b	$14, 8
	dc.b	$E, $E
	dc.b	$18, $18
	dc.b	$28, $10
	dc.b	$10, $18
	dc.b	8, $10
	dc.b	$20, $70
	dc.b	$40, $20
	dc.b	$80, $20
	dc.b	$20, $20
	dc.b	8, 8
	dc.b	4, 4
	dc.b	$20, 8
	dc.b	$C, $C
	dc.b	8, 4
	dc.b	$18, 4
	dc.b	$28, 4
	dc.b	4, 8
	dc.b	4, $18
	dc.b	4, $28
	dc.b	4, $20
	dc.b	$18, $18
	dc.b	$C, $18
	dc.b	$48, 8
	dc.b	8, $C
	dc.b	$10, 8
	dc.b	$20, $10
	dc.b	$20, $10
	dc.b	8, 8
	dc.b	$10, $10
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$28, $24
	dc.b	$12, $11
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$30, $10
	dc.b	$40, $10

; ------------------------------------------------------------------------------