; ------------------------------------------------------------------------------

DrainSwitchObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20AA5C(pc,d0.w),d0
	jsr	off_20AA5C(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20AA5C:
	dc.w	DrainSwitchObject_0_Routine0-*
	dc.w	DrainSwitchObject_0_Routine2-off_20AA5C

; ------------------------------------------------------------------------------

DrainSwitchObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$443E,obj.sprite_tile(a0)
	move.l	#Spr_20ABDA,obj.sprite_data(a0)
	move.w	#$FFFE,obj.var_2e(a0)
	cmpi.b	#$FF,obj.subtype(a0)
	bne.s	loc_20AAA6
	move.w	#$80,obj.var_2a(a0)
	st	obj.var_3e(a0)
	st	obj.var_3f(a0)

loc_20AAA6:
	jsr	SpawnObject
	bne.s	DrainSwitchObject_0_Routine2
	move.w	a1,obj.var_2c(a0)
	move.w	a0,obj.var_36(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	#$380,obj.x(a1)
	move.w	#$4F8,obj.y(a1)

DrainSwitchObject_0_Routine2:
	lea	(player_object).w,a6
	lea	obj.var_3e(a0),a5
	bsr.w	sub_20AAF2
	tst.w	obj.var_2a(a0)
	beq.s	locret_20AAF0
	addi.w	#-1,obj.var_2a(a0)
	lea	Ani_20ABCA(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

locret_20AAF0:
	rts

; ------------------------------------------------------------------------------

sub_20AAF2:
	move.w	obj.y(a0),d0
	sub.w	obj.y(a6),d0
	subi.w	#-$10,d0
	subi.w	#$20,d0
	bcc.s	loc_20AB3E
	move.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	subi.w	#-$10,d0
	subi.w	#$20,d0
	bcc.s	loc_20AB3E
	tst.b	(a5)
	bne.s	locret_20AB3C
	st	(a5)
	move.w	#$FF,obj.anim_id(a0)
	tst.w	obj.y_speed(a6)
	bpl.s	loc_20AB2E
	move.w	#$1FF,obj.anim_id(a0)

loc_20AB2E:
	move.w	obj.var_2a(a0),d0
	move.w	#$80,obj.var_2a(a0)
	tst.w	d0
	beq.s	loc_20AB42

locret_20AB3C:
	rts

; ------------------------------------------------------------------------------

loc_20AB3E:
	sf	(a5)
	rts

; ------------------------------------------------------------------------------

loc_20AB42:
	cmpi.w	#4,obj.var_2e(a0)
	beq.s	loc_20AB9A
	addq.w	#2,obj.var_2e(a0)
	move.w	obj.var_32(a0),obj.var_34(a0)
	move.w	obj.var_30(a0),obj.var_32(a0)
	jsr	SpawnObject
	bne.s	loc_20AB80
	move.w	a1,obj.var_30(a0)
	move.w	a0,obj.var_36(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.w	#$380,obj.x(a1)
	move.w	obj.var_2e(a0),d0
	move.w	word_20AB94(pc,d0.w),obj.y(a1)

loc_20AB80:
	cmpi.w	#4,obj.var_2e(a0)
	bne.s	locret_20AB92
	movea.w	obj.var_2c(a0),a1
	move.b	#4,obj.routine(a1)

locret_20AB92:
	rts

; ------------------------------------------------------------------------------

word_20AB94:
	dc.w	$498
	dc.w	$4B0
	dc.w	$4C8

; ------------------------------------------------------------------------------

loc_20AB9A:
	move.w	#-2,obj.var_2e(a0)
	movea.w	obj.var_30(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	obj.var_34(a0),a1
	move.b	#4,obj.routine(a1)
	movea.w	obj.var_2c(a0),a1
	move.b	#6,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

Ani_20ABCA:
	dc.w	@Ani_20ABCA_0-*
	dc.w	@Ani_20ABCA_1-Ani_20ABCA

@Ani_20ABCA_0:
	dc.b	3
	dc.b	1, 2, 3, 0
	dc.b	$FF

@Ani_20ABCA_1:
	dc.b	3
	dc.b	3, 2, 1, 0
	dc.b	$FF

Spr_20ABDA:
	dc.w	@Spr_20ABDA_0-*
	dc.w	@Spr_20ABDA_1-Spr_20ABDA
	dc.w	@Spr_20ABDA_2-Spr_20ABDA
	dc.w	@Spr_20ABDA_3-Spr_20ABDA

@Spr_20ABDA_0:
	dc.b	3
	dc.b	$F8, 1, 0, $14, $F0
	dc.b	$F8, 5, 0, $16, $F8
	dc.b	$F8, 1, 8, $14, 8

@Spr_20ABDA_1:
	dc.b	2
	dc.b	$F0, 7, 0, $C, $F0
	dc.b	$F0, 7, 8, $C, 0

@Spr_20ABDA_2:
	dc.b	3
	dc.b	$F0, 3, 0, 0, $F0
	dc.b	$F0, 7, 0, 4, $F8
	dc.b	$F0, 3, 8, 0, 8

@Spr_20ABDA_3:
	dc.b	2
	dc.b	$F0, 7, $10, $C, $F0
	dc.b	$F0, 7, $18, $C, 0

; ------------------------------------------------------------------------------