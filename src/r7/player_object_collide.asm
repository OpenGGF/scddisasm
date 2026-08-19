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
	bne.s	loc_206C8A
	addi.w	#$C,d3
	moveq	#$A,d5

loc_206C8A:
	move.w	#$10,d4
	add.w	d5,d5
	lea	object_spawn_pool,a1
	move.w	#$5F,d6

loc_206C98:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_206CA4
	move.b	obj.collide_type(a1),d0
	bne.s	loc_206CB0

loc_206CA4:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_206C98
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206CB0:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	byte_20704A,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_206CD8
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_206CDE
	bra.w	loc_206CA4

; ------------------------------------------------------------------------------

loc_206CD8:
	cmp.w	d4,d0
	bhi.w	loc_206CA4

loc_206CDE:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_206CF6
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc_206CFC
	bra.w	loc_206CA4

; ------------------------------------------------------------------------------

loc_206CF6:
	cmp.w	d5,d0
	bhi.w	loc_206CA4

loc_206CFC:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_206D70
	cmpi.b	#$C0,d1
	beq.w	loc_206F50
	tst.b	d1
	bmi.w	sub_206E3A
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_206D34
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	locret_206D32
	addq.b	#2,obj.routine(a1)

locret_206D32:
	rts

; ------------------------------------------------------------------------------

loc_206D34:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_206D5E
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_206D6E
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_206D6E
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_206D5E:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_206D6E
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_206D6E:
	rts

; ------------------------------------------------------------------------------

sub_206D70:
	tst.b	warping
	bne.s	loc_206D8A
	tst.b	invincible
	bne.s	loc_206D8A
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	sub_206E3A

loc_206D8A:
	tst.b	obj.collide_status(a1)
	beq.s	loc_206DB4
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_206DB2
	bset	#7,obj.flags(a1)

locret_206DB2:
	rts

; ------------------------------------------------------------------------------

loc_206DB4:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	score_chain,d0
	addq.w	#2,score_chain
	cmpi.w	#6,d0
	bcs.s	loc_206DCC
	moveq	#6,d0

loc_206DCC:
	move.w	d0,explode.points(a1)
	move.w	word_206E2C(pc,d0.w),d0
	cmpi.w	#$20,score_chain
	bcs.s	loc_206DE6
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

loc_206DE6:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_206E1C
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_206E24
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_206E1C:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_206E24:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_206E2C:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

sub_206E3A:
	tst.b	warping
	bne.s	loc_206E4A
	tst.b	invincible
	beq.s	loc_206E4E

loc_206E4A:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

loc_206E4E:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_206E4A
	movea.l	a1,a2

HurtPlayer:
	tst.b	shield
	bne.s	loc_206E84
	tst.w	rings
	beq.w	loc_206EEE
	jsr	SpawnObject
	bne.s	loc_206E84
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_206E84:
	clr.b	obj.var_2a(a0)
	bclr	#0,shield
	bne.s	loc_206E9A
	move.b	#0,combine_ring

loc_206E9A:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_206ECA
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_206ECA:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc_206ED8
	neg.w	obj.x_speed(a0)

loc_206ED8:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#120,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_206EEE:
	tst.w	debug_cheat
	bne.w	loc_206E84

KillPlayer:
	tst.w	debug_mode
	bne.s	loc_206F4C
	move.b	#0,invincible
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

loc_206F4C:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_206F50:
	move.b	$20(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$1F,d1
	beq.w	loc_206FE8
	cmpi.b	#$23,d1
	beq.w	loc_206FE8
	cmpi.b	#$2D,d1
	beq.w	loc_20703E
	cmpi.b	#$31,d1
	beq.w	loc_20703E
	cmpi.b	#$35,d1
	beq.w	loc_207030
	cmpi.b	#$3A,d1
	beq.w	loc_207030
	cmpi.b	#$3B,d1
	beq.w	loc_207030
	tst.b	boss_started
	beq.w	locret_206FE6
	cmpi.b	#1,boss_started
	beq.s	loc_206FB0
	cmpi.b	#4,boss_started
	beq.s	loc_206FD2
	cmpi.b	#5,boss_started
	beq.s	loc_206FE0

loc_206FB0:
	cmpi.b	#$3C,d1
	blt.s	locret_206FE6
	cmpi.b	#$3F,d1
	bgt.s	locret_206FE6
	bsr.w	sub_206D70
	tst.b	obj.collide_type(a1)
	bne.s	loc_206FCA
	addq.b	#3,obj.collide_status(a1)

loc_206FCA:
	clr.b	obj.collide_type(a1)
	bra.w	loc_206FE8

; ------------------------------------------------------------------------------

loc_206FD2:
	cmpi.b	#$3F,d1
	beq.s	loc_206FF4
	cmpi.b	#$3E,d1
	beq.s	loc_206FEE
	bra.s	locret_206FE6

; ------------------------------------------------------------------------------

loc_206FE0:
	cmpi.b	#$3D,d1
	beq.s	loc_206FEE

locret_206FE6:
	rts

; ------------------------------------------------------------------------------

loc_206FE8:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc_206FEE:
	bsr.w	sub_206E3A
	bra.s	loc_206FE8

; ------------------------------------------------------------------------------

loc_206FF4:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	locret_20702E
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a1),d0
	bcs.s	locret_20702E
	neg.w	obj.x_speed(a0)

locret_20702E:
	rts

; ------------------------------------------------------------------------------

loc_207030:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_20703C
	addq.b	#1,obj.collide_status(a1)

locret_20703C:
	rts

; ------------------------------------------------------------------------------

loc_20703E:
	btst	#2,obj.flags(a0)
	beq.w	sub_206D70
	bra.s	loc_206FE8

; ------------------------------------------------------------------------------

byte_20704A:
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
	dc.b	$28, 4
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$10, 9
	dc.b	$10, $10
	dc.b	0, 0
	dc.b	$10, $10
	dc.b	$C, $C
	dc.b	5, 5
	dc.b	$10, 8
	dc.b	8, $10
	dc.b	8, 8
	dc.b	$C, $C
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$28, $24
	dc.b	$12, $11
	dc.b	$18, $C
	dc.b	$14, $14
	dc.b	8, $10
	dc.b	0, 0

; ------------------------------------------------------------------------------
