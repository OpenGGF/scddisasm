; ------------------------------------------------------------------------------

FireShooterObject:
	move.b	obj.subtype(a0),d0
	cmpi.b	#1,d0
	beq.w	loc_20C988
	cmpi.b	#2,d0
	beq.w	loc_20CBA6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C92C(pc,d0.w),d0
	jsr	off_20C92C(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C928
	rts

; ------------------------------------------------------------------------------

loc_20C928:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20C92C:
	dc.w	FireShooterObject_2_Routine0-*
	dc.w	FireShooterObject_2_Routine2-off_20C92C

; ------------------------------------------------------------------------------

FireShooterObject_2_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$379,obj.sprite_tile(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.l	#Spr_20CC96,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	jsr	SpawnObject
	beq.s	loc_20C966
	rts

; ------------------------------------------------------------------------------

loc_20C966:
	move.b	#$27,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),d0
	addq.w	#8,d0
	move.w	d0,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	addq.b	#2,obj.routine(a0)

FireShooterObject_2_Routine2:
	rts

; ------------------------------------------------------------------------------

loc_20C988:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C9BE(pc,d0.w),d0
	jsr	off_20C9BE(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C9BA
	rts

; ------------------------------------------------------------------------------

loc_20C9BA:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20C9BE:
	dc.w	FireShooterObject_0_Routine0-*
	dc.w	FireShooterObject_0_Routine2-off_20C9BE
	dc.w	FireShooterObject_0_Routine4-off_20C9BE
	dc.w	FireShooterObject_0_Routine6-off_20C9BE
	dc.w	FireShooterObject_0_Routine8-off_20C9BE

; ------------------------------------------------------------------------------

loc_20C9C8:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

FireShooterObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$379,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20CC96,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#1,obj.sprite_frame(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

FireShooterObject_0_Routine2:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20CA36
	bsr.w	sub_20CF36
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bcc.s	loc_20CA26
	neg.w	d0

loc_20CA26:
	cmpi.w	#$78,d0
	bcs.s	loc_20CA30
	bra.w	loc_20C9C8

; ------------------------------------------------------------------------------

loc_20CA30:
	move.b	#$3C,obj.var_3a(a0)

loc_20CA36:
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20CA64
	tst.b	(time_zone).l
	beq.s	loc_20CA60
	cmpi.b	#1,(time_zone).l
	beq.s	loc_20CA56
	tst.b	(good_future).l
	bne.s	loc_20CA60

loc_20CA56:
	lea	Ani_20CC74(pc),a1
	jsr	AnimateObject

loc_20CA60:
	bra.w	loc_20C9C8

; ------------------------------------------------------------------------------

loc_20CA64:
	move.w	#0,obj.var_3a(a0)
	move.b	#1,obj.sprite_frame(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

FireShooterObject_0_Routine4:
	addq.b	#8,obj.var_3b(a0)
	cmpi.b	#$20,obj.var_3b(a0)
	bcs.s	loc_20CA88
	move.b	#$20,obj.var_3b(a0)

loc_20CA88:
	move.b	obj.var_3b(a0),d0
	ext.w	d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	cmpi.b	#$20,obj.var_3b(a0)
	beq.s	loc_20CAA4
	bra.w	loc_20C9C8

; ------------------------------------------------------------------------------

loc_20CAA4:
	jsr	sub_20CB40(pc)
	lea	(player_object).w,a1
	bsr.s	sub_20CADC
	bne.s	loc_20CABC
	move.b	#8,obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CABC:
	move.w	#-$700,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	move.b	#$10,obj.anim_id(a1)
	bclr	#3,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

sub_20CADC:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

FireShooterObject_0_Routine6:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20CAF6
	subq.b	#1,obj.var_3a(a0)
	bra.s	loc_20CB26

; ------------------------------------------------------------------------------

loc_20CAF6:
	subq.b	#4,obj.var_3b(a0)
	bcc.s	loc_20CB02
	move.b	#0,obj.var_3b(a0)

loc_20CB02:
	move.b	obj.var_3b(a0),d0
	ext.w	d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	cmpi.b	#0,obj.var_3b(a0)
	beq.s	loc_20CB1C
	bra.s	loc_20CB26

; ------------------------------------------------------------------------------

loc_20CB1C:
	move.b	#$3C,obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

loc_20CB26:
	bra.w	loc_20C9C8

; ------------------------------------------------------------------------------

FireShooterObject_0_Routine8:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20CB38
	subq.b	#1,obj.var_3a(a0)
	bra.w	loc_20C9C8

; ------------------------------------------------------------------------------

loc_20CB38:
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_20CB40:
	tst.b	(time_zone).l
	beq.s	locret_20CB8C
	cmpi.b	#1,(time_zone).l
	beq.s	loc_20CB5A
	tst.b	(good_future).l
	bne.s	locret_20CB8C

loc_20CB5A:
	jsr	SpawnObject
	bne.s	loc_20CB70
	bsr.s	sub_20CB8E
	move.w	obj.x(a0),d0
	subi.w	#$18,d0
	move.w	d0,obj.x(a1)

loc_20CB70:
	jsr	SpawnObject
	bne.s	locret_20CB8C
	bsr.s	sub_20CB8E
	move.w	obj.x(a0),d0
	addi.w	#$18,d0
	move.w	d0,obj.x(a1)
	move.b	#1,obj.var_3a(a1)

locret_20CB8C:
	rts

; ------------------------------------------------------------------------------

sub_20CB8E:
	move.b	#$27,obj.id(a1)
	move.b	#2,obj.subtype(a1)
	move.w	obj.y(a0),d0
	addq.b	#8,d0
	move.w	d0,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

loc_20CBA6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CBC0(pc,d0.w),d0
	jsr	off_20CBC0(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20CBC0:
	dc.w	FireShooterObject_1_Routine0-*
	dc.w	FireShooterObject_1_Routine2-off_20CBC0

; ------------------------------------------------------------------------------

FireShooterObject_1_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$379,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$98,obj.collide_type(a0)
	move.l	#Spr_20CC96,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	#$100,d0
	move.w	#$10,d1
	move.w	#2,d2
	move.w	obj.var_3a(a0),d3
	bne.s	loc_20CC04
	neg.w	d0
	neg.w	d1
	move.w	#1,d2

loc_20CC04:
	move.w	d0,obj.x_speed(a0)
	move.w	d1,obj.var_3e(a0)
	move.b	d2,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)
	lea	Ani_20CC74(pc),a1
	jsr	AnimateObject

FireShooterObject_1_Routine2:
	move.w	obj.var_3e(a0),d0
	add.w	d0,obj.x_speed(a0)
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	lea	Ani_20CC74(pc),a1
	jsr	AnimateObject
	move.w	obj.x(a0),d0
	sub.w	obj.var_36(a0),d0
	bcc.s	loc_20CC48
	neg.w	d0

loc_20CC48:
	cmpi.w	#$40,d0
	bcc.s	loc_20CC50
	rts

; ------------------------------------------------------------------------------

loc_20CC50:
	clr.b	obj.collide_type(a0)
	tst.b	obj.var_3b(a0)
	bne.s	loc_20CC66
	addq.b	#2,obj.anim_id(a0)
	move.b	#$1E,obj.var_3b(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CC66:
	subq.b	#1,obj.var_3b(a0)
	beq.s	loc_20CC6E
	rts

; ------------------------------------------------------------------------------

loc_20CC6E:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Ani_20CC74:
	dc.w	@Ani_20CC74_0-*
	dc.w	@Ani_20CC74_1-Ani_20CC74
	dc.w	@Ani_20CC74_2-Ani_20CC74
	dc.w	@Ani_20CC74_3-Ani_20CC74
	dc.w	@Ani_20CC74_4-Ani_20CC74

@Ani_20CC74_0:
	dc.b	2
	dc.b	1, 2
	dc.b	$FF

@Ani_20CC74_1:
	dc.b	2
	dc.b	3, 5
	dc.b	$FF

@Ani_20CC74_2:
	dc.b	2
	dc.b	4, 5
	dc.b	$FF

@Ani_20CC74_3:
	dc.b	0
	dc.b	3, 6, 5, 6
	dc.b	$FF

@Ani_20CC74_4:
	dc.b	0
	dc.b	4, 6, 5, 6
	dc.b	$FF

Spr_20CC96:
	dc.w	@Spr_20CC96_0-*
	dc.w	@Spr_20CC96_1-Spr_20CC96
	dc.w	@Spr_20CC96_2-Spr_20CC96
	dc.w	@Spr_20CC96_3-Spr_20CC96
	dc.w	@Spr_20CC96_4-Spr_20CC96
	dc.w	@Spr_20CC96_5-Spr_20CC96
	dc.w	@Spr_20CC96_5-Spr_20CC96

@Spr_20CC96_0:
	dc.b	1
	dc.b	$FC, $C, 0, $E, $F0

@Spr_20CC96_1:
	dc.b	7
	dc.b	$EC, $C, 0, 0, $F0
	dc.b	$F4, 4, 0, 4, $F0
	dc.b	$F4, 4, 0, 6, 0
	dc.b	$FC, 5, 0, 8, $F0
	dc.b	$FC, 5, 8, 8, 0
	dc.b	$C, 4, 0, $C, $F0
	dc.b	$C, 4, 8, $C, 0

@Spr_20CC96_2:
	dc.b	7
	dc.b	$EC, $C, 0, $12, $F0
	dc.b	$F4, 4, 0, 4, $F0
	dc.b	$F4, 4, 0, 6, 0
	dc.b	$FC, 5, 0, 8, $F0
	dc.b	$FC, 5, 8, 8, 0
	dc.b	$C, 4, 0, $C, $F0
	dc.b	$C, 4, 8, $C, 0

@Spr_20CC96_3:
	dc.b	2
	dc.b	$F8, 4, 0, $16, $F8
	dc.b	0, 4, $10, $16, $F8
	dc.b	0

@Spr_20CC96_4:
	dc.b	2
	dc.b	$F8, 4, 8, $16, $F8
	dc.b	0, 4, $18, $16, $F8
	dc.b	0

@Spr_20CC96_5:
	dc.b	0
	dc.b	0, 0, 0, 0, 0

; ------------------------------------------------------------------------------