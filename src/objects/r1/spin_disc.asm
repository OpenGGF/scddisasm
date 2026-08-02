; ------------------------------------------------------------------------------

SpinDiscSolid:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	(SolidObject).l

; ------------------------------------------------------------------------------

SpinDiscObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2093E0(pc,d0.w),d0
	jsr	off_2093E0(pc,d0.w)
	tst.w	(time_stop).l
	bne.s	loc_2093D4
	lea	(SpinDiscAnims).l,a1
	bsr.w	AnimateObject

loc_2093D4:
	jsr	(DrawObject).l
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

off_2093E0:
	dc.w	SpinDiscObject_0_Routine0-*
	dc.w	SpinDiscObject_0_Routine2-off_2093E0

; ------------------------------------------------------------------------------

SpinDiscObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#SpinDiscSprites,obj.sprite_data(a0)
	moveq	#6,d0
	jsr	SetObjectSpriteTile(pc)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)

SpinDiscObject_0_Routine2:
	tst.b	obj.sprite_flags(a0)
	bpl.w	locret_209452
	lea	(player_object).w,a1
	bsr.s	SpinDiscSolid
	beq.s	locret_209452
	bset	#0,obj.var_2c(a1)
	bne.s	loc_209448
	move.b	#$2D,obj.anim_id(a1)
	moveq	#0,d0
	move.b	d0,obj.var_2b(a1)
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	loc_209444
	neg.w	d0
	move.b	#$80,obj.var_2b(a1)

loc_209444:
	move.b	d0,obj.var_39(a1)

loc_209448:
	cmpi.b	#6,obj.routine(a1)
	bcc.s	locret_209452
	bra.s	loc_209454

; ------------------------------------------------------------------------------

locret_209452:
	rts

; ------------------------------------------------------------------------------

loc_209454:
	addq.b	#8,obj.var_2b(a1)
	move.b	obj.var_2b(a1),d0
	jsr	(SineCosine).l
	moveq	#0,d0
	move.b	obj.var_39(a1),d0
	muls.w	d1,d0
	lsr.l	#8,d0
	move.w	obj.x(a0),obj.x(a1)
	add.w	d0,obj.x(a1)
	moveq	#0,d0
	move.b	obj.var_2b(a1),d0
	move.b	d0,d1
	andi.b	#$F0,d0
	lsr.b	#4,d0
	move.b	byte_2094A4(pc,d0.w),obj.anim_index(a1)
	andi.b	#$3F,d1
	bne.s	loc_209494
	addq.b	#1,obj.var_39(a1)

loc_209494:
	move.w	(p1_joy_hold).w,(player_joy_hold).w
	bsr.w	sub_2094B4
	bra.w	loc_209506

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

byte_2094A4:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	4
	dc.b	4
	dc.b	5
	dc.b	5
	dc.b	5

; ------------------------------------------------------------------------------

sub_2094B4:
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	loc_2094E2
	btst	#2,(player_joy_hold).w
	beq.s	loc_2094CC
	addq.b	#1,obj.var_39(a1)
	bra.s	locret_209504

; ------------------------------------------------------------------------------

loc_2094CC:
	btst	#3,(player_joy_hold).w
	beq.s	locret_209504
	subq.b	#1,obj.var_39(a1)
	bcc.s	locret_209504
	move.b	#0,obj.var_39(a1)
	bra.s	locret_209504

; ------------------------------------------------------------------------------

loc_2094E2:
	btst	#3,(player_joy_hold).w
	beq.s	loc_2094F0
	addq.b	#1,obj.var_39(a1)
	bra.s	locret_209504

; ------------------------------------------------------------------------------

loc_2094F0:
	btst	#2,(player_joy_hold).w
	beq.s	locret_209504
	subq.b	#1,obj.var_39(a1)
	bcc.s	locret_209504
	move.b	#0,obj.var_39(a1)

locret_209504:
	rts

; ------------------------------------------------------------------------------

loc_209506:
	move.b	(player_joy_tap).w,d0
	andi.b	#$70,d0
	beq.w	locret_2095C2
	clr.b	obj.var_2c(a1)
	move.w	#$680,d2
	btst	#6,obj.flags(a0)
	beq.s	loc_209526
	move.w	#$380,d2

loc_209526:
	moveq	#0,d0
	move.b	obj.angle(a1),d0
	subi.b	#$40,d0
	jsr	(SineCosine).l
	muls.w	d2,d1
	asr.l	#8,d1
	add.w	d1,obj.x_speed(a1)
	muls.w	d2,d0
	asr.l	#8,d0
	add.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	move.b	#1,obj.var_3c(a1)
	clr.b	obj.var_38(a1)
	move.w	#$A0,d0
	jsr	(PlayFmSound).l
	tst.b	(shrunk_player).l
	beq.s	loc_20957C
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	bra.s	loc_209588

; ------------------------------------------------------------------------------

loc_20957C:
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)

loc_209588:
	btst	#2,obj.flags(a1)
	bne.s	loc_2095C4
	tst.b	(shrunk_player).l
	beq.s	loc_2095A6
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	bra.s	loc_2095B6

; ------------------------------------------------------------------------------

loc_2095A6:
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)

loc_2095B6:
	bset	#2,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)

locret_2095C2:
	rts

; ------------------------------------------------------------------------------

loc_2095C4:
	bset	#4,obj.flags(a1)
	rts

; ------------------------------------------------------------------------------

SpinDiscAnims:
	dc.w	@SpinDiscAnims_0-*

@SpinDiscAnims_0:
	dc.b	1
	dc.b	0, 1, 2
	dc.b	$FF
	dc.b	0

SpinDiscSprites:
	dc.w	@SpinDiscSprites_0-*
	dc.w	@SpinDiscSprites_1-SpinDiscSprites
	dc.w	@SpinDiscSprites_2-SpinDiscSprites

@SpinDiscSprites_0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0
	dc.b	0

@SpinDiscSprites_1:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0
	dc.b	0

@SpinDiscSprites_2:
	dc.b	1
	dc.b	$F8, $D, 0, 4, $F0

; ------------------------------------------------------------------------------