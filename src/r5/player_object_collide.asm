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
	bne.s	loc_206EC0
	addi.w	#$C,d3
	moveq	#$A,d5

loc_206EC0:
	move.w	#$10,d4
	add.w	d5,d5
	lea	(object_spawn_pool).w,a1
	move.w	#$5F,d6

loc_206ECE:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_206EDA
	move.b	obj.collide_type(a1),d0
	bne.s	loc_206EE6

loc_206EDA:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_206ECE
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206EE6:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	(byte_207284).l,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_206F0E
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_206F14
	bra.w	loc_206EDA

; ------------------------------------------------------------------------------

loc_206F0E:
	cmp.w	d4,d0
	bhi.w	loc_206EDA

loc_206F14:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_206F2C
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc2_206F32
	bra.w	loc_206EDA

; ------------------------------------------------------------------------------

loc_206F2C:
	cmp.w	d5,d0
	bhi.w	loc_206EDA

loc2_206F32:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_206FA6
	cmpi.b	#$C0,d1
	beq.w	loc_207186
	tst.b	d1
	bmi.w	sub_207070
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_206F6A
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	locret_206F68
	addq.b	#2,obj.routine(a1)

locret_206F68:
	rts

; ------------------------------------------------------------------------------

loc_206F6A:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_206F94
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_206FA4
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_206FA4
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_206F94:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_206FA4
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_206FA4:
	rts

; ------------------------------------------------------------------------------

sub_206FA6:
	tst.b	(warping).l
	bne.s	loc_206FC0
	tst.b	(invincible).l
	bne.s	loc_206FC0
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	sub_207070

loc_206FC0:
	tst.b	obj.collide_status(a1)
	beq.s	loc_206FEA
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_206FE8
	bset	#7,obj.flags(a1)

locret_206FE8:
	rts

; ------------------------------------------------------------------------------

loc_206FEA:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	(score_chain).w,d0
	addq.w	#2,(score_chain).w
	cmpi.w	#6,d0
	bcs.s	loc_207002
	moveq	#6,d0

loc_207002:
	move.w	d0,explode.points(a1)
	move.w	word_207062(pc,d0.w),d0
	cmpi.w	#$20,(score_chain).w
	bcs.s	loc_20701C
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

loc_20701C:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_207052
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_20705A
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_207052:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20705A:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_207062:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

sub_207070:
	tst.b	(warping).l
	bne.s	loc_207080
	tst.b	(invincible).l
	beq.s	loc_207084

loc_207080:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207084:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_207080
	movea.l	a1,a2

HurtPlayer:
	tst.b	(shield).l
	bne.s	loc_2070BA
	tst.w	(rings).l
	beq.w	loc_207124
	jsr	SpawnObject
	bne.s	loc_2070BA
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_2070BA:
	clr.b	obj.var_2a(a0)
	bclr	#0,(shield).l
	bne.s	loc_2070D0
	move.b	#0,(combine_ring).l

loc_2070D0:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_207100
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_207100:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc_20710E
	neg.w	obj.x_speed(a0)

loc_20710E:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#$78,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207124:
	tst.w	(debug_cheat).l
	bne.w	loc_2070BA

KillPlayer:
	tst.w	(debug_mode).l
	bne.s	loc2_207182
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

loc2_207182:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207186:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$1F,d1
	beq.w	loc_207226
	cmpi.b	#$23,d1
	beq.w	loc_207226
	cmpi.b	#$2E,d1
	beq.w	loc_20726E
	cmpi.b	#$37,d1
	beq.w	loc_207226
	cmpi.b	#$38,d1
	beq.w	loc_20727C
	cmpi.b	#$3A,d1
	beq.w	loc_20726E
	cmpi.b	#$3B,d1
	beq.w	loc_20726E
	cmpi.b	#$3C,d1
	beq.w	loc_20726E
	tst.b	(boss_started).w
	beq.w	locret_207224
	cmpi.b	#1,(boss_started).w
	beq.s	loc_2071EE
	cmpi.b	#4,(boss_started).w
	beq.s	loc_207210
	cmpi.b	#5,(boss_started).w
	beq.s	loc_20721E

loc_2071EE:
	cmpi.b	#$3C,d1
	blt.s	locret_207224
	cmpi.b	#$3F,d1
	bgt.s	locret_207224
	bsr.w	sub_206FA6
	tst.b	obj.collide_type(a1)
	bne.s	loc_207208
	addq.b	#3,obj.collide_status(a1)

loc_207208:
	clr.b	obj.collide_type(a1)
	bra.w	loc_207226

; ------------------------------------------------------------------------------

loc_207210:
	cmpi.b	#$3F,d1
	beq.s	loc2_207232
	cmpi.b	#$3E,d1
	beq.s	loc2_20722C
	bra.s	locret_207224

; ------------------------------------------------------------------------------

loc_20721E:
	cmpi.b	#$3D,d1
	beq.s	loc2_20722C

locret_207224:
	rts

; ------------------------------------------------------------------------------

loc_207226:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc2_20722C:
	bsr.w	sub_207070
	bra.s	loc_207226

; ------------------------------------------------------------------------------

loc2_207232:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	locret_20726C
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a1),d0
	bcs.s	locret_20726C
	neg.w	obj.x_speed(a0)

locret_20726C:
	rts

; ------------------------------------------------------------------------------

loc_20726E:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_20727A
	addq.b	#1,obj.collide_status(a1)

locret_20727A:
	rts

; ------------------------------------------------------------------------------

loc_20727C:
	addq.b	#1,obj.collide_status(a1)

loc_207280:
	bra.w	sub_207070

; ------------------------------------------------------------------------------

byte_207284:
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
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$17, $30
	dc.b	$10, $10
	dc.b	$C, 5
	dc.b	$14, $10
	dc.b	3, 3
	dc.b	8, 8
	dc.b	8, $C
	dc.b	$18, $18
	dc.b	$18, $10
	dc.b	$C, 8
	dc.b	$10, $10
	dc.b	4, $10
	dc.b	$28, $24
	dc.b	$12, $11
	dc.b	$E, $18
	dc.b	8, 8
	dc.b	$20, $38
	dc.b	$1E, $20

; ------------------------------------------------------------------------------