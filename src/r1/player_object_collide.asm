; ------------------------------------------------------------------------------

PlayerObjectCollide:
	nop
	move.w	obj.x(a0),d2
	move.w	obj.y(a0),d3
	subq.w	#8,d2
	moveq	#0,d5
	move.b	obj.height(a0),d5
	subq.b	#3,d5
	sub.w	d5,d3
	cmpi.b	#$39,obj.sprite_frame(a0)
	bne.s	loc_206D48
	addi.w	#$C,d3
	moveq	#$A,d5

loc_206D48:
	move.w	#$10,d4
	add.w	d5,d5
	lea	(object_spawn_pool).w,a1
	move.w	#$5F,d6

loc_206D56:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_206D62
	move.b	obj.collide_type(a1),d0
	bne.s	loc_206D6E

loc_206D62:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_206D56
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206D6E:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	(byte_2070D4).l,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_206D96
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_206D9C
	bra.w	loc_206D62

; ------------------------------------------------------------------------------

loc_206D96:
	cmp.w	d4,d0
	bhi.w	loc_206D62

loc_206D9C:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_206DB4
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc_206DBA
	bra.w	loc_206D62

; ------------------------------------------------------------------------------

loc_206DB4:
	cmp.w	d5,d0
	bhi.w	loc_206D62

loc_206DBA:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_206E2E
	cmpi.b	#$C0,d1
	beq.w	loc_20700E
	tst.b	d1
	bmi.w	loc_206EF8
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_206DF2
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	locret_206DF0
	addq.b	#2,obj.routine(a1)

locret_206DF0:
	rts

; ------------------------------------------------------------------------------

loc_206DF2:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_206E1C
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_206E2C
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_206E2C
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_206E1C:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_206E2C
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_206E2C:
	rts

; ------------------------------------------------------------------------------

sub_206E2E:
	tst.b	(warping).l
	bne.s	loc_206E48
	tst.b	(invincible).l
	bne.s	loc_206E48
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	loc_206EF8

loc_206E48:
	tst.b	obj.collide_status(a1)
	beq.s	loc_206E72
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_206E70
	bset	#7,obj.flags(a1)

locret_206E70:
	rts

; ------------------------------------------------------------------------------

loc_206E72:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	(score_chain).w,d0
	addq.w	#2,(score_chain).w
	cmpi.w	#6,d0
	bcs.s	loc_206E8A
	moveq	#6,d0

loc_206E8A:
	move.w	d0,explode.points(a1)
	move.w	word_206EEA(pc,d0.w),d0
	cmpi.w	#$20,(score_chain).w
	bcs.s	loc_206EA4
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

loc_206EA4:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	(PlayFmSound).l
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_206EDA
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_206EE2
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_206EDA:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_206EE2:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_206EEA:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

loc_206EF2:
	bset	#7,obj.flags(a1)

loc_206EF8:
	tst.b	(warping).l
	bne.s	loc_206F08
	tst.b	(invincible).l
	beq.s	loc_206F0C

loc_206F08:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_206F0C:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_206F08
	movea.l	a1,a2

HurtPlayer:
	tst.b	(shield).l
	bne.s	loc_206F42
	tst.w	(rings).l
	beq.w	loc_206FAC
	jsr	(SpawnObject).l
	bne.s	loc_206F42
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_206F42:
	clr.b	obj.var_2a(a0)
	bclr	#0,(shield).l
	bne.s	loc_206F58
	move.b	#0,(combine_ring).l

loc_206F58:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_206F88
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_206F88:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc_206F96
	neg.w	obj.x_speed(a0)

loc_206F96:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#120,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_206FAC:
	tst.w	(debug_cheat).l
	bne.w	loc_206F42

KillPlayer:
	tst.w	(debug_mode).l
	bne.s	loc_20700A
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
	jsr	(PlayFmSound).l

loc_20700A:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_20700E:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$1F,d1
	beq.w	loc_2070C0
	cmpi.b	#$B,d1
	beq.w	loc_20708A
	cmpi.b	#$C,d1
	beq.w	loc_20708E
	cmpi.b	#$17,d1
	beq.w	loc_2070C0
	cmpi.b	#$21,d1
	beq.w	loc_2070C0
	cmpi.b	#$23,d1
	beq.w	loc_2070C0
	cmpi.b	#$2F,d1
	beq.w	loc_2070C6
	cmpi.b	#$3A,d1
	beq.w	loc_2070C6
	cmpi.b	#$3B,d1
	beq.w	loc_2070C6
	cmpi.b	#1,(boss_started).w
	bne.s	locret_207088
	cmpi.b	#$3C,d1
	blt.s	locret_207088
	cmpi.b	#$3F,d1
	bgt.s	locret_207088
	bsr.w	sub_206E2E
	tst.b	obj.collide_type(a1)
	bne.s	loc_207080
	addq.b	#3,obj.collide_status(a1)

loc_207080:
	clr.b	obj.collide_type(a1)
	bra.w	loc_2070C0

; ------------------------------------------------------------------------------

locret_207088:
	rts

; ------------------------------------------------------------------------------

loc_20708A:
	bra.w	loc_206EF2

; ------------------------------------------------------------------------------

loc_20708E:
	sub.w	d0,d5
	cmpi.w	#8,d5
	bcc.s	loc_2070BC
	move.w	obj.x(a1),d0
	subq.w	#4,d0
	btst	#0,obj.flags(a1)
	beq.s	loc_2070A8
	subi.w	#$10,d0

loc_2070A8:
	sub.w	d2,d0
	bcc.s	loc_2070B4
	addi.w	#$18,d0
	bcs.s	loc_2070B8
	bra.s	loc_2070BC

; ------------------------------------------------------------------------------

loc_2070B4:
	cmp.w	d4,d0
	bhi.s	loc_2070BC

loc_2070B8:
	bra.w	loc_206EF8

; ------------------------------------------------------------------------------

loc_2070BC:
	bra.w	sub_206E2E

; ------------------------------------------------------------------------------

loc_2070C0:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc_2070C6:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_2070D2
	addq.b	#1,obj.collide_status(a1)

locret_2070D2:
	rts

; ------------------------------------------------------------------------------

byte_2070D4:
	dc.b	$14, $14
	dc.b	$12, $C
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
	dc.b	8, $10
	dc.b	$10, $10
	dc.b	$C, $C
	dc.b	$10, $10
	dc.b	4, 4
	dc.b	$10, $10
	dc.b	$16, $1A
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
	dc.b	$20, $18
	dc.b	$C, $14
	dc.b	$20, $C
	dc.b	$C, $10

; ------------------------------------------------------------------------------