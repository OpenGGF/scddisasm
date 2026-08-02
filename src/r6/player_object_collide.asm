; ------------------------------------------------------------------------------

PlayerObjectCollide:
	btst	#6,obj.var_2c(a0)
	beq.s	loc_206E94
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206E94:
	nop
	move.w	obj.x(a0),d2
	move.w	obj.y(a0),d3
	subq.w	#8,d2
	moveq	#0,d5
	move.b	obj.height(a0),d5
	subq.b	#3,d5
	sub.w	d5,d3
	cmpi.b	#$39,obj.sprite_frame(a0)
	bne.s	loc_206EB8
	addi.w	#$C,d3
	moveq	#$A,d5

loc_206EB8:
	move.w	#$10,d4
	add.w	d5,d5
	lea	(object_spawn_pool).w,a1
	move.w	#$5F,d6

loc_206EC6:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_206ED2
	move.b	obj.collide_type(a1),d0
	bne.s	loc_206EDE

loc_206ED2:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_206EC6
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206EDE:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	(byte_207266).l,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_206F06
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_206F0C
	bra.w	loc_206ED2

; ------------------------------------------------------------------------------

loc_206F06:
	cmp.w	d4,d0
	bhi.w	loc_206ED2

loc_206F0C:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_206F24
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc_206F2A
	bra.w	loc_206ED2

; ------------------------------------------------------------------------------

loc_206F24:
	cmp.w	d5,d0
	bhi.w	loc_206ED2

loc_206F2A:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_206F9E
	cmpi.b	#$C0,d1
	beq.w	loc_207188
	tst.b	d1
	bmi.w	sub_207068
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_206F62
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	locret_206F60
	addq.b	#2,obj.routine(a1)

locret_206F60:
	rts

; ------------------------------------------------------------------------------

loc_206F62:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_206F8C
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_206F9C
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_206F9C
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_206F8C:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_206F9C
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_206F9C:
	rts

; ------------------------------------------------------------------------------

sub_206F9E:
	tst.b	(warping).l
	bne.s	loc_206FB8
	tst.b	(invincible).l
	bne.s	loc_206FB8
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	sub_207068

loc_206FB8:
	tst.b	obj.collide_status(a1)
	beq.s	loc_206FE2
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_206FE0
	bset	#7,obj.flags(a1)

locret_206FE0:
	rts

; ------------------------------------------------------------------------------

loc_206FE2:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	(score_chain).w,d0
	addq.w	#2,(score_chain).w
	cmpi.w	#6,d0
	bcs.s	loc_206FFA
	moveq	#6,d0

loc_206FFA:
	move.w	d0,explode.points(a1)
	move.w	word_20705A(pc,d0.w),d0
	cmpi.w	#$20,(score_chain).w
	bcs.s	loc_207014
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

loc_207014:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20704A
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_207052
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20704A:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_207052:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_20705A:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

sub_207068:
	tst.b	(warping).l
	bne.s	loc_207078
	tst.b	(invincible).l
	beq.s	CheckHurtPlayer

loc_207078:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

CheckHurtPlayer:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_207078
	movea.l	a1,a2

HurtPlayer:
	clr.b	obj.var_2a(a0)
	andi.b	#$E7,obj.var_2c(a0)
	clr.w	explode.points(a0)
	tst.b	(shield).l
	bne.s	loc_2070C0
	tst.w	(rings).l
	beq.w	loc_207126
	jsr	SpawnObject
	bne.s	loc_2070C0
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_2070C0:
	bclr	#0,(shield).l
	bne.s	loc_2070D2
	move.b	#0,(combine_ring).l

loc_2070D2:
	move.b	#4,obj.routine(a0)
	bsr.w	sub_205500
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_207102
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_207102:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc_207110
	neg.w	obj.x_speed(a0)

loc_207110:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#$78,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207126:
	tst.w	(debug_cheat).l
	bne.w	loc_2070C0

KillPlayer:
	tst.w	(debug_mode).l
	bne.s	loc_207184
	move.b	#0,(invincible).l
	move.b	#6,obj.routine(a0)
	bsr.w	sub_205500
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

loc_207184:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207188:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$1F,d1
	beq.w	loc_207210
	cmpi.b	#$23,d1
	beq.w	loc_207210
	cmpi.b	#$38,d1
	beq.w	loc_207258
	cmpi.b	#$3A,d1
	beq.w	loc_207258
	cmpi.b	#$3B,d1
	beq.w	loc_207258
	tst.b	(boss_started).w
	beq.w	locret_20720E
	cmpi.b	#1,(boss_started).w
	beq.s	loc_2071D8
	cmpi.b	#4,(boss_started).w
	beq.s	loc_2071FA
	cmpi.b	#5,(boss_started).w
	beq.s	loc_207208

loc_2071D8:
	cmpi.b	#$3C,d1
	blt.s	locret_20720E
	cmpi.b	#$3F,d1
	bgt.s	locret_20720E
	bsr.w	sub_206F9E
	tst.b	obj.collide_type(a1)
	bne.s	loc2_2071F2
	addq.b	#3,obj.collide_status(a1)

loc2_2071F2:
	clr.b	obj.collide_type(a1)
	bra.w	loc_207210

; ------------------------------------------------------------------------------

loc_2071FA:
	cmpi.b	#$3F,d1
	beq.s	loc_20721C
	cmpi.b	#$3E,d1
	beq.s	loc_207216
	bra.s	locret_20720E

; ------------------------------------------------------------------------------

loc_207208:
	cmpi.b	#$3D,d1
	beq.s	loc_207216

locret_20720E:
	rts

; ------------------------------------------------------------------------------

loc_207210:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc_207216:
	bsr.w	sub_207068
	bra.s	loc_207210

; ------------------------------------------------------------------------------

loc_20721C:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	locret_207256
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$400,obj.y_speed(a0)
	move.w	#$FE00,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	8(a1),d0
	bcs.s	locret_207256
	neg.w	obj.x_speed(a0)

locret_207256:
	rts

; ------------------------------------------------------------------------------

loc_207258:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_207264
	addq.b	#1,obj.collide_status(a1)

locret_207264:
	rts

; ------------------------------------------------------------------------------

byte_207266:
	dc.b	$14, $14
	dc.b	$12, $C
	dc.b	$10, $10
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
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	8, $13
	dc.b	8, $1C
	dc.b	$18, $C
	dc.b	$10, $10
	dc.b	4, 4
	dc.b	8, $10
	dc.b	$10, 5
	dc.b	$C, $C
	dc.b	8, 8
	dc.b	$1A, $1E
	dc.b	8, 8
	dc.b	$28, $24
	dc.b	$12, $11
	dc.b	$1E, $30
	dc.b	$3C, $20
	dc.b	$10, 8
	dc.b	2, $C

; ------------------------------------------------------------------------------