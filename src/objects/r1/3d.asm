; ------------------------------------------------------------------------------

Plant3dObject:
	lea	(player_object).w,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DCEA(pc,d0.w),d0
	jsr	off_20DCEA(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	bra.w	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20DCEA:
	dc.w	Plant3dObject_0_Routine0-*
	dc.w	Plant3dObject_0_Routine2-off_20DCEA

; ------------------------------------------------------------------------------

Plant3dObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#Plant3dSprites,obj.sprite_data(a0)
	move.w	#$4424,obj.sprite_tile(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.w	obj.x(a0),d3
	movea.l	a0,a1
	moveq	#3,d6
	bclr	#0,obj.subtype(a0)
	beq.s	loc_20DD20
	moveq	#1,d6

loc_20DD20:
	moveq	#0,d2
	bra.s	loc_20DD2A

; ------------------------------------------------------------------------------

loc_20DD24:
	jsr	(SpawnObject).l

loc_20DD2A:
	addq.b	#2,obj.routine(a1)
	move.b	#$2C,obj.id(a1)
	move.w	d3,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	d3,obj.var_2a(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	obj.width_2(a0),obj.width_2(a1)
	move.b	obj.height(a0),obj.height(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	word_20DDD6(pc,d2.w),d1
	add.w	d1,obj.x(a1)
	move.w	obj.x(a1),obj.var_2c(a1)
	addq.b	#2,d2
	dbf	d6,loc_20DD24
	moveq	#2,d6
	moveq	#0,d2

loc_20DD78:
	jsr	(SpawnObject).l
	addq.b	#2,obj.routine(a1)
	move.b	#$2C,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.b	#1,obj.sprite_frame(a1)
	move.b	#4,obj.sprite_layer(a1)
	move.w	d3,obj.x(a1)
	move.w	d3,obj.var_2a(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	#$C,obj.width_2(a1)
	move.b	#$C,obj.height(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	word_20DDDE(pc,d2.w),d1
	add.w	d1,obj.x(a1)
	addq.b	#2,d2
	dbf	d6,loc_20DD78
	rts

; ------------------------------------------------------------------------------

word_20DDD6:
	dc.w	$40
	dc.w	$80
	dc.w	-$40
	dc.w	-$80

word_20DDDE:
	dc.w	0
	dc.w	$60
	dc.w	-$60

; ------------------------------------------------------------------------------

Plant3dObject_0_Routine2:
	tst.b	obj.subtype(a0)
	bne.s	locret_20DE34
	moveq	#0,d0
	btst	#1,obj.var_2c(a6)
	beq.s	loc_20DE2C
	moveq	#0,d3
	move.w	obj.x(a6),d0
	move.w	d0,d2
	andi.w	#$FF,d0
	cmp.w	obj.var_2a(a0),d2
	bcc.s	loc_20DE0E
	move.w	d0,d1
	move.w	#$FF,d0
	sub.w	d1,d0

loc_20DE0E:
	cmpi.w	#$C0,d0
	bcs.s	loc_20DE22
	cmpi.w	#$F0,d0
	bcc.s	loc_20DE20
	move.w	#$BF,d0
	bra.s	loc_20DE22

; ------------------------------------------------------------------------------

loc_20DE20:
	moveq	#0,d0

loc_20DE22:
	lsr.w	#1,d0
	cmp.w	obj.var_2a(a0),d2
	bcc.s	loc_20DE2C
	neg.w	d0

loc_20DE2C:
	add.w	obj.var_2c(a0),d0
	move.w	d0,obj.x(a0)

locret_20DE34:
	rts

; ------------------------------------------------------------------------------

loc_20DE36:
	move.w	off_20DE42(pc,d0.w),d0
	jsr	off_20DE42(pc,d0.w)
	bra.w	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20DE42:
	dc.w	Boost3dObject_0_Routine0-*
	dc.w	Boost3dObject_0_Routine2-off_20DE42

; ------------------------------------------------------------------------------

Boost3dObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)

Boost3dObject_0_Routine2:
	cmpi.b	#$2B,obj.anim_id(a6)
	beq.w	locret_20DEC6
	move.w	obj.y(a0),d0
	sub.w	obj.y(a6),d0
	addi.w	#$40,d0
	cmpi.w	#$80,d0
	bcc.s	locret_20DEC6
	move.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	addi.w	#$20,d0
	cmpi.w	#$40,d0
	bcc.s	locret_20DEC6
	move.w	obj.x(a0),d0
	move.w	obj.x_speed(a6),d1
	tst.w	d1
	bpl.s	locret_20DEC6
	cmp.w	obj.x(a6),d0
	bcs.s	locret_20DEC6
	move.w	d0,obj.x(a6)
	move.w	#0,obj.x_speed(a6)
	move.w	#0,obj.ground_speed(a6)
	move.b	#$37,obj.anim_id(a6)
	move.b	#1,obj.var_3c(a6)
	clr.b	obj.var_38(a6)
	move.b	#$E,obj.height(a0)
	move.b	#7,obj.width(a0)
	addq.w	#5,obj.y(a0)
	bset	#2,obj.flags(a6)

locret_20DEC6:
	rts

; ------------------------------------------------------------------------------

Boost3dObject:
	lea	(player_object).w,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	tst.b	obj.subtype_2(a0)
	bne.w	loc_20DE36
	move.w	off_20DEF0(pc,d0.w),d0
	jsr	off_20DEF0(pc,d0.w)
	jsr	(DrawObject).l
	move.w	obj.var_2a(a0),d0
	bra.w	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20DEF0:
	dc.w	Boost3dObject_1_Routine0-*
	dc.w	Boost3dObject_1_Routine2-off_20DEF0

; ------------------------------------------------------------------------------

Boost3dObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#Boost3dSprites,obj.sprite_data(a0)
	move.w	#$441,obj.sprite_tile(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	tst.b	obj.subtype(a0)
	beq.s	Boost3dObject_1_Routine2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

Boost3dObject_1_Routine2:
	tst.b	obj.var_2e(a0)
	beq.s	loc_20DF5C
	move.b	#1,obj.anim_id(a0)
	btst	#1,obj.var_2c(a6)
	bne.s	loc_20DF4E
	addq.b	#1,obj.anim_id(a0)

loc_20DF4E:
	lea	(Boost3dAnims).l,a1
	jsr	(AnimateObject).l
	bra.s	loc_20DF6C

; ------------------------------------------------------------------------------

loc_20DF5C:
	move.b	#0,obj.sprite_frame(a0)
	moveq	#0,d1
	btst	#1,obj.var_2c(a6)
	beq.s	loc_20DFB8

loc_20DF6C:
	move.w	obj.x(a6),d0
	andi.w	#$FF,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20DF82
	move.w	d0,d1
	move.w	#$FF,d0
	sub.w	d1,d0

loc_20DF82:
	cmpi.w	#$C0,d0
	bcs.s	loc_20DF96
	cmpi.w	#$F0,d0
	bcc.s	loc_20DF94
	move.w	#$BF,d0
	bra.s	loc_20DF96

; ------------------------------------------------------------------------------

loc_20DF94:
	moveq	#0,d0

loc_20DF96:
	ext.l	d0
	move.w	d0,d1
	tst.b	obj.var_2e(a0)
	bne.s	loc_20DFA8
	divu.w	#$30,d0
	move.b	d0,obj.sprite_frame(a0)

loc_20DFA8:
	lsr.w	#2,d1
	move.w	d1,d2
	lsr.w	#1,d2
	add.w	d2,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20DFB8
	neg.w	d1

loc_20DFB8:
	add.w	obj.var_2a(a0),d1
	move.w	d1,obj.x(a0)
	tst.b	obj.var_2e(a0)
	beq.s	loc_20DFCC
	subq.b	#1,obj.var_2e(a0)
	bra.s	loc_20DFD4

; ------------------------------------------------------------------------------

loc_20DFCC:
	btst	#1,obj.flags(a6)
	bne.s	locret_20E02C

loc_20DFD4:
	move.b	obj.width_2(a0),d1
	ext.w	d1
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	locret_20E02C
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	locret_20E02C
	move.b	obj.height(a0),d1
	ext.w	d1
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	add.w	d1,d0
	bmi.s	locret_20E02C
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	locret_20E02C
	cmpi.b	#$2B,obj.anim_id(a6)
	beq.s	locret_20E02C
	tst.b	obj.var_2e(a0)
	bne.s	loc_20E018
	move.b	#$3C,obj.var_2e(a0)

loc_20E018:
	tst.w	obj.y_speed(a6)
	bpl.s	loc_20E026
	move.w	#-$C00,obj.y_speed(a6)
	rts

; ------------------------------------------------------------------------------

loc_20E026:
	move.w	#$C00,obj.y_speed(a6)

locret_20E02C:
	rts

; ------------------------------------------------------------------------------

Plant3dSprites:
	dc.w	@Plant3dSprites_0-*
	dc.w	@Plant3dSprites_1-Plant3dSprites

@Plant3dSprites_0:
	dc.b	4
	dc.b	$EC, 4, 0, 0, $F8
	dc.b	$F4, $E, 0, 2, $F8
	dc.b	$FC, 5, 0, $E, $E8
	dc.b	$C, 8, 0, $12, $F0
	dc.b	0

@Plant3dSprites_1:
	dc.b	2
	dc.b	$F4, 0, 0, $15, $FC
	dc.b	$FC, 9, 0, $16, $F4
	dc.b	0

Boost3dAnims:
	include	"src/anims/r1/3d_boost.asm"
	even

; ------------------------------------------------------------------------------