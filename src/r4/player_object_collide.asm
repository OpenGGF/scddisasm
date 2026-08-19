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
	bne.s	loc_20715C
	addi.w	#$C,d3
	moveq	#$A,d5

loc_20715C:
	move.w	#$10,d4
	add.w	d5,d5
	lea	object_spawn_pool,a1
	move.w	#$5F,d6

loc_20716A:
	tst.b	obj.sprite_flags(a1)
	bpl.s	loc_207176
	move.b	obj.collide_type(a1),d0
	bne.s	loc2_207182

loc_207176:
	lea	obj.struct_len(a1),a1
	dbf	d6,loc_20716A
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc2_207182:
	andi.w	#$3F,d0
	add.w	d0,d0
	lea	byte_207510,a2
	lea	-2(a2,d0.w),a2
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.x(a1),d0
	sub.w	d1,d0
	sub.w	d2,d0
	bcc.s	loc_2071AA
	add.w	d1,d1
	add.w	d1,d0
	bcs.s	loc_2071B0
	bra.w	loc_207176

; ------------------------------------------------------------------------------

loc_2071AA:
	cmp.w	d4,d0
	bhi.w	loc_207176

loc_2071B0:
	moveq	#0,d1
	move.b	(a2)+,d1
	move.w	obj.y(a1),d0
	sub.w	d1,d0
	sub.w	d3,d0
	bcc.s	loc_2071C8
	add.w	d1,d1
	add.w	d0,d1
	bcs.s	loc_2071CE
	bra.w	loc_207176

; ------------------------------------------------------------------------------

loc_2071C8:
	cmp.w	d5,d0
	bhi.w	loc_207176

loc_2071CE:
	move.b	obj.collide_type(a1),d1
	andi.b	#$C0,d1
	beq.w	sub_207242
	cmpi.b	#$C0,d1
	beq.w	loc_207422
	tst.b	d1
	bmi.w	sub_20730C
	move.b	obj.collide_type(a1),d0
	andi.b	#$3F,d0
	cmpi.b	#6,d0
	beq.s	loc_207206
	cmpi.w	#90,obj.var_30(a0)
	bcc.w	locret_207204
	addq.b	#2,obj.routine(a1)

locret_207204:
	rts

; ------------------------------------------------------------------------------

loc_207206:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_207230
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	cmp.w	obj.y(a1),d0
	bcs.s	locret_207240
	neg.w	obj.y_speed(a0)
	move.w	#-$180,obj.y_speed(a1)
	tst.b	obj.routine_2(a1)
	bne.s	locret_207240
	addq.b	#4,obj.routine_2(a1)
	rts

; ------------------------------------------------------------------------------

loc_207230:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_207240
	neg.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a1)

locret_207240:
	rts

; ------------------------------------------------------------------------------

sub_207242:
	tst.b	warping
	bne.s	loc_20725C
	tst.b	invincible
	bne.s	loc_20725C
	cmpi.b	#2,obj.anim_id(a0)
	bne.w	sub_20730C

loc_20725C:
	tst.b	obj.collide_status(a1)
	beq.s	loc_207286
	neg.w	obj.x_speed(a0)
	neg.w	obj.y_speed(a0)
	asr	obj.x_speed(a0)
	asr	obj.y_speed(a0)
	move.b	#0,obj.collide_type(a1)
	subq.b	#1,obj.collide_status(a1)
	bne.s	locret_207284
	bset	#7,obj.flags(a1)

locret_207284:
	rts

; ------------------------------------------------------------------------------

loc_207286:
	bset	#7,obj.flags(a1)
	moveq	#0,d0
	move.w	score_chain,d0
	addq.w	#2,score_chain
	cmpi.w	#6,d0
	bcs.s	loc_20729E
	moveq	#6,d0

loc_20729E:
	move.w	d0,explode.points(a1)
	move.w	word_2072FE(pc,d0.w),d0
	cmpi.w	#$20,score_chain
	bcs.s	loc_2072B8
	move.w	#1000,d0
	move.w	#10,explode.points(a1)

loc_2072B8:
	bsr.w	AddPoints
	move.w	#$96,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#0,obj.routine(a1)
	move.b	#1,obj.subtype(a1)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_2072EE
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcc.s	loc_2072F6
	neg.w	obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_2072EE:
	addi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_2072F6:
	subi.w	#$100,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

word_2072FE:
	dc.w	10
	dc.w	20
	dc.w	50
	dc.w	100

; ------------------------------------------------------------------------------

	bset	#7,obj.flags(a1)

; ------------------------------------------------------------------------------

sub_20730C:
	tst.b	warping
	bne.s	loc_20731C
	tst.b	invincible
	beq.s	loc2_207320

loc_20731C:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

loc2_207320:
	nop
	tst.w	obj.var_30(a0)
	bne.s	loc_20731C
	movea.l	a1,a2

HurtPlayer:
	tst.b	shield
	bne.s	loc_207356
	tst.w	rings
	beq.w	loc_2073C0
	jsr	SpawnObject
	bne.s	loc_207356
	move.b	#$11,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_207356:
	clr.b	obj.var_2a(a0)
	bclr	#0,shield
	bne.s	loc_20736C
	move.b	#0,combine_ring

loc_20736C:
	move.b	#4,obj.routine(a0)
	bsr.w	PlayerSetGround
	bset	#1,obj.flags(a0)
	move.w	#-$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	btst	#6,obj.flags(a0)
	beq.s	loc_20739C
	move.w	#-$200,obj.y_speed(a0)
	move.w	#-$100,obj.x_speed(a0)

loc_20739C:
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcs.s	loc2_2073AA
	neg.w	obj.x_speed(a0)

loc2_2073AA:
	move.w	#0,obj.ground_speed(a0)
	move.b	#$1A,obj.anim_id(a0)
	move.w	#$78,obj.var_30(a0)
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_2073C0:
	tst.w	debug_cheat
	bne.w	loc_207356

KillPlayer:
	tst.w	debug_mode
	bne.s	loc_20741E
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

loc_20741E:
	moveq	#-1,d0
	rts

; ------------------------------------------------------------------------------

loc_207422:
	move.b	obj.collide_type(a1),d1
	andi.b	#$3F,d1
	cmpi.b	#$1F,d1
	beq.w	loc_2074AA
	cmpi.b	#$23,d1
	beq.w	loc_2074AA
	cmpi.b	#$33,d1
	beq.w	loc_207502
	cmpi.b	#$3A,d1
	beq.w	loc_207502
	cmpi.b	#$3B,d1
	beq.w	loc_207502
	tst.b	boss_started
	beq.w	locret_2074A8
	cmpi.b	#1,boss_started
	beq.s	loc_207472
	cmpi.b	#4,boss_started
	beq.s	loc_207494
	cmpi.b	#5,boss_started
	beq.s	loc_2074A2

loc_207472:
	cmpi.b	#$3C,d1
	blt.s	locret_2074A8
	cmpi.b	#$3F,d1
	bgt.s	locret_2074A8
	bsr.w	sub_207242
	tst.b	obj.collide_type(a1)
	bne.s	loc_20748C
	addq.b	#3,obj.collide_status(a1)

loc_20748C:
	clr.b	obj.collide_type(a1)
	bra.w	loc_2074AA

; ------------------------------------------------------------------------------

loc_207494:
	cmpi.b	#$3F,d1
	beq.s	loc_2074B6
	cmpi.b	#$3E,d1
	beq.s	loc_2074B0
	bra.s	locret_2074A8

; ------------------------------------------------------------------------------

loc_2074A2:
	cmpi.b	#$3D,d1
	beq.s	loc_2074B0

locret_2074A8:
	rts

; ------------------------------------------------------------------------------

loc_2074AA:
	addq.b	#1,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

loc_2074B0:
	bsr.w	sub_20730C
	bra.s	loc_2074AA

; ------------------------------------------------------------------------------

loc_2074B6:
	move.b	obj.flags(a0),d0
	andi.b	#$14,d0
	beq.s	locret_207500
	bclr	#2,obj.flags(a0)
	bclr	#4,obj.flags(a0)
	clr.b	obj.collide_type(a1)
	move.b	#$15,obj.anim_id(a0)
	move.w	#$AD,d0
	jsr	PlayFmSound
	jsr	PlayerResetDrown
	move.w	#$400,obj.y_speed(a0)
	move.w	#-$200,obj.x_speed(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a1),d0
	bcs.s	locret_207500
	neg.w	obj.x_speed(a0)

locret_207500:
	rts

; ------------------------------------------------------------------------------

loc_207502:
	cmpi.b	#2,obj.anim_id(a0)
	bne.s	locret_20750E
	addq.b	#1,obj.collide_status(a1)

locret_20750E:
	rts

; ------------------------------------------------------------------------------

byte_207510:
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
	dc.b	$C, $C
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$18, 8
	dc.b	$14, 8
	dc.b	2, 2
	dc.b	$18, $C
	dc.b	$E, $13
	dc.b	$C, 8
	dc.b	4, 4
	dc.b	$16, $12
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	0, 0
	dc.b	$28, $24
	dc.b	$12, $11
	dc.b	$20, $14
	dc.b	$20, $18
	dc.b	3, 3
	dc.b	4, 4

; ------------------------------------------------------------------------------
