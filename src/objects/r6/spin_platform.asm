; ------------------------------------------------------------------------------

SpinPlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D5B4(pc,d0.w),d0
	jsr	off_20D5B4(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20D5B4:
	dc.w	SpinPlatformObject_0_Routine0-*
	dc.w	SpinPlatformObject_0_Routine2-off_20D5B4

; ------------------------------------------------------------------------------

sub_20D5B8:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$436A,obj.sprite_tile(a0)
	move.l	#Spr_20D880,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$10,obj.width_2(a0)
	addq.b	#2,obj.routine(a0)

SpinPlatformObject_0_Routine2:
	bsr.w	sub_20D7E6
	lea	SpinPlatformAnims(pc),a1
	jsr	AnimateObject
	lea	(player_object).w,a1
	bsr.w	sub_20D5B8
	beq.s	locret_20D65A
	bset	#0,obj.flags(a1)
	andi.b	#$FC,obj.sprite_flags(a1)
	ori.b	#1,obj.sprite_flags(a1)
	bset	#0,obj.var_2c(a1)
	bne.s	loc_20D650
	move.b	#$2D,obj.anim_id(a1)
	moveq	#0,d0
	move.b	d0,obj.var_2b(a1)
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	loc_20D64C
	neg.w	d0
	move.b	#$80,obj.var_2b(a1)

loc_20D64C:
	move.b	d0,obj.var_39(a1)

loc_20D650:
	cmpi.b	#6,obj.routine(a1)
	bcc.s	locret_20D65A
	bra.s	loc_20D67A

; ------------------------------------------------------------------------------

locret_20D65A:
	rts

; ------------------------------------------------------------------------------

	moveq	#0,d0
	move.b	obj.height(a1),d0
	add.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bmi.s	loc_20D676
	cmpi.w	#$10,d0
	bcs.s	loc_20D676
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

loc_20D676:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20D67A:
	addq.b	#4,obj.var_2b(a1)
	move.b	obj.var_2b(a1),d0
	jsr	SineCosine
	moveq	#0,d0
	move.b	obj.var_39(a1),d0
	muls.w	d1,d0
	asr.l	#8,d0
	move.w	obj.x(a0),obj.x(a1)
	add.w	d0,obj.x(a1)
	moveq	#0,d0
	move.b	obj.var_2b(a1),d0
	move.b	d0,d1
	andi.b	#$F0,d0
	lsr.b	#4,d0
	move.b	byte_20D6D8(pc,d0.w),obj.anim_index(a1)
	andi.b	#$3F,d1
	bne.s	loc_20D6BA
	addq.b	#1,obj.var_39(a1)

loc_20D6BA:
	move.w	(p1_joy_hold).w,(player_joy_hold).w
	cmpi.b	#1,0(a1)
	beq.s	loc_20D6CE
	move.w	(p2_joy_hold).w,(player_joy_hold).w

loc_20D6CE:
	bsr.w	sub_20D6E8
	bra.w	loc_20D736

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

byte_20D6D8:
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

sub_20D6E8:
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	loc_20D714
	btst	#2,(player_joy_hold).w
	beq.s	loc_20D700
	addq.b	#1,$39(a1)
	bra.s	locret_20D734

; ------------------------------------------------------------------------------

loc_20D700:
	btst	#3,(player_joy_hold).w
	beq.s	locret_20D734
	subq.b	#1,obj.var_39(a1)
	bcc.s	locret_20D734
	clr.b	obj.var_39(a1)
	bra.s	locret_20D734

; ------------------------------------------------------------------------------

loc_20D714:
	btst	#3,(player_joy_hold).w
	beq.s	loc_20D722
	addq.b	#1,obj.var_39(a1)
	bra.s	locret_20D734

; ------------------------------------------------------------------------------

loc_20D722:
	btst	#2,(player_joy_hold).w
	beq.s	locret_20D734
	subq.b	#1,obj.var_39(a1)
	bcc.s	locret_20D734
	clr.b	obj.var_39(a1)

locret_20D734:
	rts

; ------------------------------------------------------------------------------

loc_20D736:
	move.b	(player_joy_tap).w,d0
	andi.b	#$70,d0
	beq.w	locret_20D7DC
	clr.b	obj.var_2c(a1)
	move.w	#$680,d2
	moveq	#0,d0
	move.b	obj.angle(a1),d0
	subi.b	#$40,d0
	jsr	SineCosine
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
	tst.b	(shrunk_player).l
	beq.s	loc_20D796
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	bra.s	loc_20D7A2

; ------------------------------------------------------------------------------

loc_20D796:
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)

loc_20D7A2:
	btst	#2,obj.flags(a1)
	bne.s	loc_20D7DE
	tst.b	(shrunk_player).l
	beq.s	loc_20D7C0
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	bra.s	loc_20D7D0

; ------------------------------------------------------------------------------

loc_20D7C0:
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)

loc_20D7D0:
	bset	#2,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)

locret_20D7DC:
	rts

; ------------------------------------------------------------------------------

loc_20D7DE:
	bset	#4,obj.flags(a1)
	rts

; ------------------------------------------------------------------------------

sub_20D7E6:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	move.w	off_20D7F6(pc,d0.w),d0
	jmp	off_20D7F6(pc,d0.w)

; ------------------------------------------------------------------------------

off_20D7F6:
	dc.w	SpinPlatformObject_1_Routine0-*
	dc.w	SpinPlatformObject_1_Routine2-off_20D7F6
	dc.w	SpinPlatformObject_1_Routine4-off_20D7F6
	dc.w	SpinPlatformObject_1_Routine6-off_20D7F6

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine4:
	bsr.w	sub_20D85A
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine6:
	bsr.w	sub_20D85A
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine0:
	move.l	obj.x(a0),-(sp)
	bsr.w	sub_20D85A
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.l	obj.x(a0),d0
	sub.l	(sp)+,d0
	lsr.l	#8,d0
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_1_Routine2:
	move.l	obj.x(a0),-(sp)
	bsr.w	sub_20D85A
	neg.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.l	obj.x(a0),d0
	sub.l	(sp)+,d0
	lsr.l	#8,d0
	move.w	d0,obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D85A:
	move.w	(stage_frames).l,d0
	andi.w	#$FF,d0
	jsr	SineCosine
	add.w	d0,d0
	add.w	d0,d0
	asr.w	#4,d0
	addq.b	#1,obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

SpinPlatformAnims:
	include	"src/anims/r6/spin_platform.asm"
	even

Spr_20D880:
	dc.w	@Spr_20D880_0-*
	dc.w	@Spr_20D880_1-Spr_20D880
	dc.w	@Spr_20D880_2-Spr_20D880
	dc.w	@Spr_20D880_3-Spr_20D880
	dc.w	@Spr_20D880_4-Spr_20D880
	dc.w	@Spr_20D880_5-Spr_20D880

@Spr_20D880_0:
	dc.b	3
	dc.b	$F0, $B, 0, 0, $E8
	dc.b	$F0, $B, 0, $C, 0
	dc.b	$10, 5, 0, $2C, $F8

@Spr_20D880_1:
	dc.b	3
	dc.b	$F0, $B, 0, $18, $E8
	dc.b	$F0, $B, 8, $18, 0
	dc.b	$10, 5, 8, $28, $F8

@Spr_20D880_2:
	dc.b	3
	dc.b	$F0, $B, 0, 0, $E8
	dc.b	$F0, $B, 0, $C, 0
	dc.b	$10, 5, 0, $24, $F8

@Spr_20D880_3:
	dc.b	3
	dc.b	$F0, $B, 0, $18, $E8
	dc.b	$F0, $B, 8, $18, 0
	dc.b	$10, 5, 0, $24, $F8

@Spr_20D880_4:
	dc.b	3
	dc.b	$F0, $B, 0, 0, $E8
	dc.b	$F0, $B, 0, $C, 0
	dc.b	$10, 5, 0, $24, $F8

@Spr_20D880_5:
	dc.b	3
	dc.b	$F0, $B, 0, $18, $E8
	dc.b	$F0, $B, 8, $18, 0
	dc.b	$10, 5, 0, $28, $F8

; ------------------------------------------------------------------------------