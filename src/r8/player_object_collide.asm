; ------------------------------------------------------------------------------

PlayerObjectCollide:
	btst	#0,obj.var_2c(a0)
	beq.s	loc_2068BA
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2068BA:
	nop
	move.w	obj.x(a0),d2
	move.w	obj.y(a0),d3
	subq.w	#8,d2
	moveq	#0,d5
	move.b	obj.height(a0),d5
	subq.b	#3,d5
	sub.w	d5,d3
	cmpi.b	#$39,obj.sprite_frame(a0)
	bne.s	loc_2068DE
	addi.w	#$C,d3
	moveq	#$A,d5

loc_2068DE:
	move.w	#$10,d4
	add.w	d5,d5
	lea	object_spawn_pool,a1
	move.w	#$5F,d6

loc_2068EC:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_2068F8
	move.b	obj.collide_type(a1),d0
	bne.s	loc_206904

loc_2068F8:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_2068EC
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206904:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	byte_206D2A,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_20692C
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_206932
	bra.w	loc_2068F8

; ------------------------------------------------------------------------------

loc_20692C:
	cmp.w	d4,d0
	bhi.w	loc_2068F8

loc_206932:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_20694A
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc_206950
	bra.w	loc_2068F8

; ------------------------------------------------------------------------------

loc_20694A:
	cmp.w	d5,d0
	bhi.w	loc_2068F8

loc_206950:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_2069E8
	cmpi.b	#$C0,d1
	beq.w	loc_206BDE
	tst.b	d1
	bmi.w	loc_20696C
	bra.s	loc_206978

; ------------------------------------------------------------------------------

loc_20696C:
	tst.b	invincible
	bne.s	loc_2068F8
	bra.w	sub_206AB2

; ------------------------------------------------------------------------------

loc_206978:
	tst.b	stage_layer
	beq.s	loc_206988
	tst.b	obj.subtype_2(a1)
	bne.s	loc_206990
	rts

; ------------------------------------------------------------------------------

loc_206988:
	tst.b	obj.subtype_2(a1)
	beq.s	loc_206990
	rts

; ------------------------------------------------------------------------------

loc_206990:
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_2069AC
	cmpi.w	#90,obj.var_30(a0)
	bcc.s	locret_2069AA
	addq.b	#2,obj.routine(a1)

locret_2069AA:
	rts

; ------------------------------------------------------------------------------

loc_2069AC:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_2069D6
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_2069E6
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_2069E6
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_2069D6:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_2069E6
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_2069E6:
	rts

; ------------------------------------------------------------------------------

sub_2069E8:
	tst.b	warping
	bne.s	loc_206A02
	tst.b	invincible
	bne.s	loc_206A02
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	sub_206AB2

loc_206A02:
	tst.b	obj.collide_status(a1)
	beq.s	loc_206A2C
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr.w	obj.x_speed(a0)
	asr.w	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_206A2A
	bset	#7,obj.flags(a1)

locret_206A2A:
	rts

; ------------------------------------------------------------------------------

loc_206A2C:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	score_chain,d0
	addq.w	#2,score_chain
	cmpi.w	#6,d0
	bcs.s	loc_206A44
	moveq	#6,d0

loc_206A44:
	move.w	d0,explode.points(a1)
	move.w	word_206AA4(pc,d0.w),d0
	cmpi.w	#$20,score_chain
	bcs.s	loc_206A5E
	move.w	#1000,d0
	move.w	#$A,explode.points(a1)

loc_206A5E:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_206A94
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_206A9C
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_206A94:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_206A9C:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_206AA4:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

sub_206AB2:
	btst	#0,obj.var_2c(a0)
	bne.s	loc_206ACA
	tst.b	warping
	bne.s	loc_206ACA
	tst.b	invincible
	beq.s	loc_206ACE

loc_206ACA:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

loc_206ACE:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_206ACA
	movea.l	a1,a2

; ------------------------------------------------------------------------------

HurtPlayer:
	tst.b	shield
	bne.s	loc_206B12
	if (R8_VARIANT=5)&(DEMO<>0)&(REGION<>USA)
	 tst.b	combine_ring
	 bne.s	loc_206B12
	endif
	tst.w	rings
	beq.w	loc_206B7C
	jsr	SpawnObject
	bne.s	loc_206B12
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	tst.b	stage_layer
	beq.s	loc_206B12
	move.b	#1,obj.subtype_2(a1)

loc_206B12:
	clr.b	obj.var_2a(a0)
	bclr	#0,shield
	bne.s	loc_206B28
	move.b	#0,combine_ring

loc_206B28:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_206B58
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_206B58:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc_206B66
	neg.w	obj.x_speed(a0)

loc_206B66:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#120,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_206B7C:
	tst.w	debug_cheat
	bne.w	loc_206B12

; ------------------------------------------------------------------------------

KillPlayer:
	tst.w	debug_mode
	bne.s	loc_206BDA
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
	if (R8_VARIANT<>5)|(DEMO=0)|(REGION=USA)
	move.b	#0,obj.sprite_layer(a0)
	endif
	move.w	#$93,d0
	jsr	PlayFmSound

loc_206BDA:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_206BDE:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#6,d1
	beq.w	loc_206CEE
	cmpi.b	#$17,d1
	beq.w	loc_206C76
	cmpi.b	#$1F,d1
	beq.w	loc_206C76
	cmpi.b	#$22,d1
	beq.w	loc_206CBE
	cmpi.b	#$23,d1
	beq.w	loc_206C76
	cmpi.b	#$2D,d1
	beq.w	loc_206CCC
	cmpi.b	#$30,d1
	beq.w	loc_206CD8
	tst.b	boss_started
	beq.w	locret_206C74
	cmpi.b	#1,boss_started
	beq.s	loc_206C3E
	cmpi.b	#4,boss_started
	beq.s	loc_206C60
	cmpi.b	#5,boss_started
	beq.s	loc_206C6E

loc_206C3E:
	cmpi.b	#$3C,d1
	blt.s	locret_206C74
	cmpi.b	#$3F,d1
	bgt.s	locret_206C74
	bsr.w	sub_2069E8
	tst.b	obj.collide_type(a1)
	bne.s	loc_206C58
	addq.b	#3,obj.collide_status(a1)

loc_206C58:
	clr.b	obj.collide_type(a1)
	bra.w	loc_206C76

; ------------------------------------------------------------------------------

loc_206C60:
	cmpi.b	#$3F,d1
	beq.s	loc_206C82
	cmpi.b	#$3E,d1
	beq.s	loc_206C7C
	bra.s	locret_206C74

; ------------------------------------------------------------------------------

loc_206C6E:
	cmpi.b	#$3D,d1
	beq.s	loc_206C7C

locret_206C74:
	rts

; ------------------------------------------------------------------------------

loc_206C76:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc_206C7C:
	bsr.w	sub_206AB2
	bra.s	loc_206C76

; ------------------------------------------------------------------------------

loc_206C82:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	locret_206CBC
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a1),d0
	bcs.s	locret_206CBC
	neg.w	obj.x_speed(a0)

locret_206CBC:
	rts

; ------------------------------------------------------------------------------

loc_206CBE:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_206CCA
	addq.b	#1,obj.collide_status(a1)

locret_206CCA:
	rts

; ------------------------------------------------------------------------------

loc_206CCC:
	btst	#2,obj.flags(a0)
	beq.w	sub_2069E8
	bra.s	loc_206C76

; ------------------------------------------------------------------------------

loc_206CD8:
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	smi.b	d0
	move.b	obj.subtype_2(a1),d1
	eor.b	d0,d1
	beq.w	sub_2069E8
	bra.s	loc_206C76

; ------------------------------------------------------------------------------

loc_206CEE:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_206D18
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_206D28
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_206D28
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_206D18:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_206D28
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_206D28:
	rts

; ------------------------------------------------------------------------------

byte_206D2A:
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
	dc.b	$28, $24
	dc.b	$C, $18
	dc.b	$1C, $1C
	dc.b	$38, 6
	dc.b	$10, $10
	dc.b	6, 6
	dc.b	$20, 4
	dc.b	$1C, $1C
	dc.b	$10, $E
	dc.b	$C, $10
	dc.b	$10, 9
	dc.b	$10, $10
	dc.b	$C, $E
	dc.b	8, 8
	dc.b	$18, $B
	dc.b	$10, $3C
	dc.b	$10, $24
	dc.b	$24, $10
	dc.b	$18, $18
	dc.b	$16, $16
	dc.b	$10, $10
	dc.b	$18, $14
	dc.b	$18, $18
	dc.b	$F, $20
	dc.b	$20, $F
	dc.b	8, $20
	dc.b	$10, $20
	dc.b	$1C, $1C
	dc.b	$20, $10
	dc.b	$20, 8

; ------------------------------------------------------------------------------
