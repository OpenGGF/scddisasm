; ------------------------------------------------------------------------------

loc_20D95E:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20D982
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20D982:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpikeCrusherObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20DC9A
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D9B0(pc,d0.w),d0
	jsr	off_20D9B0(pc,d0.w)
	bsr.s	sub_20D9B8
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20D9B0:
	dc.w	SpikeCrusherObject_0_Routine0-*
	dc.w	SpikeCrusherObject_0_Routine2-off_20D9B0
	dc.w	SpikeCrusherObject_0_Routine4-off_20D9B0
	dc.w	SpikeCrusherObject_0_Routine6-off_20D9B0

; ------------------------------------------------------------------------------

sub_20D9B8:
	cmpi.b	#3,obj.sprite_frame(a0)
	bne.s	loc_20D9C2

locret_20D9C0:
	rts

; ------------------------------------------------------------------------------

loc_20D9C2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20D9C0
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20D9DA
	neg.w	d0

loc_20D9DA:
	cmpi.w	#$20,d0
	bcc.s	locret_20D9C0
	jmp	SolidObject

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$400,obj.sprite_tile(a0)
	move.l	#SpikeCrusherSprites,obj.sprite_data(a0)
	bsr.w	sub_20DAF4
	moveq	#0,d0
	tst.b	obj.var_3d(a0)
	bne.w	loc_20DA8A
	move.b	obj.var_3c(a0),d0
	asl.b	#2,d0
	lea	byte_20DB3A(pc),a2
	lea	(a2,d0.w),a2
	move.b	(a2)+,obj.sprite_frame(a0)
	move.b	(a2)+,d0
	move.b	(a2)+,obj.width_2(a0)
	move.b	(a2)+,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	ext.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	move.b	#1,obj.var_3b(a0)
	jsr	SpawnObject
	beq.s	loc_20DA58
	jmp	loc_20D95E

; ------------------------------------------------------------------------------

loc_20DA58:
	move.b	#$33,obj.id(a1)
	move.b	#1,obj.var_3d(a1)
	lea	byte_20DB46(pc),a2
	bsr.s	sub_20DABC
	jsr	SpawnObject
	beq.s	loc_20DA78
	jmp	loc_20D95E

; ------------------------------------------------------------------------------

loc_20DA78:
	move.b	#$33,obj.id(a1)
	move.b	#2,obj.var_3d(a1)
	lea	byte_20DB52(pc),a2
	bsr.s	sub_20DABC

loc_20DA8A:
	cmpi.b	#3,obj.sprite_frame(a0)
	beq.s	locret_20DABA
	jsr	SpawnObject
	bne.s	locret_20DABA
	move.b	#$33,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.sprite_frame(a0),obj.var_3c(a1)
	move.w	a0,obj.var_34(a1)
	move.w	a1,obj.var_34(a0)

locret_20DABA:
	rts

; ------------------------------------------------------------------------------

sub_20DABC:
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	asl.b	#2,d0
	lea	(a2,d0.w),a2
	move.b	(a2)+,obj.sprite_frame(a1)
	move.b	(a2)+,d0
	move.b	(a2)+,obj.width_2(a1)
	move.b	(a2)+,obj.height(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.y(a0),obj.y(a1)
	ext.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	rts

; ------------------------------------------------------------------------------

sub_20DAF4:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.b	byte_20DB02(pc,d0.w),obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

byte_20DB02:
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	2
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	0
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	2

byte_20DB3A:
	dc.b	1, $CC, $1C, 8
	dc.b	4, $BC, $C, 8
	dc.b	5, $DC, $2C, 8

byte_20DB46:
	dc.b	3, 0, $18, 8
	dc.b	3, $E0, $18, 8
	dc.b	3, $20, $18, 8

byte_20DB52:
	dc.b	2, $34, $1C, 8
	dc.b	5, $24, $2C, 8
	dc.b	4, $44, $C, 8

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine2:
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcs.s	locret_20DB88
	cmpi.w	#$100,d0
	bcc.s	locret_20DB88
	lea	sub_20DB8A(pc),a2
	tst.b	obj.subtype(a0)
	beq.s	loc_20DB80
	lea	loc_20DB92(pc),a2

loc_20DB80:
	jsr	(a2)
	beq.s	locret_20DB88
	addq.b	#2,obj.routine(a0)

locret_20DB88:
	rts

; ------------------------------------------------------------------------------

sub_20DB8A:
	moveq	#0,d1
	move.b	#$30,d1
	bra.s	loc_20DB98

; ------------------------------------------------------------------------------

loc_20DB92:
	moveq	#0,d1
	move.b	#$50,d1

loc_20DB98:
	lea	player_object,a1
	move.w	obj.x(a1),d0
	sub.w	obj.var_36(a0),d0
	add.w	d1,d0
	bmi.s	loc_20DBB2
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20DBB2
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20DBB2:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine4:
	tst.b	obj.subtype(a0)
	bne.s	loc_20DBC4
	tst.b	obj.var_3d(a0)
	bne.s	loc_20DBC4
	bsr.s	sub_20DC14

loc_20DBC4:
	tst.b	obj.var_3f(a0)
	bne.s	locret_20DBFA
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	move.w	word_20DC08(pc,d0.w),d0
	move.l	obj.y(a0),-(sp)
	add.w	d0,obj.y(a0)
	jsr	CheckBlockDown
	move.l	(sp)+,obj.y(a0)
	tst.w	d1
	bmi.s	loc_20DBFC
	addi.l	#$8000,obj.y(a0)
	move.w	#$80,obj.y_speed(a0)

locret_20DBFA:
	rts

; ------------------------------------------------------------------------------

loc_20DBFC:
	clr.w	obj.y_speed(a0)
	move.b	#$FF,obj.var_3f(a0)
	rts

; ------------------------------------------------------------------------------

word_20DC08:
	dc.w	8
	dc.w	$20
	dc.w	$38
	dc.w	$50
	dc.w	$68
	dc.w	$80

; ------------------------------------------------------------------------------

sub_20DC14:
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20DC2A
	neg.w	d0
	cmpi.w	#$80,d0
	bcc.s	locret_20DC5C

loc_20DC2A:
	bsr.w	loc_20DB92
	beq.s	locret_20DC5C
	addq.w	#1,obj.var_30(a0)
	cmpi.w	#$12C,obj.var_30(a0)
	bne.s	loc_20DC3E
	bra.s	loc_20DC5E

; ------------------------------------------------------------------------------

loc_20DC3E:
	cmpi.w	#$258,obj.var_30(a0)
	bne.s	loc_20DC48
	bra.s	loc_20DC5E

; ------------------------------------------------------------------------------

loc_20DC48:
	cmpi.w	#$348,obj.var_30(a0)
	bne.s	loc_20DC52
	bra.s	loc_20DC5E

; ------------------------------------------------------------------------------

loc_20DC52:
	cmpi.w	#$438,obj.var_30(a0)
	bne.s	locret_20DC5C
	bra.s	loc_20DC5E

; ------------------------------------------------------------------------------

locret_20DC5C:
	rts

; ------------------------------------------------------------------------------

loc_20DC5E:
	cmpi.b	#5,obj.var_3b(a0)
	bcc.s	locret_20DC96
	jsr	SpawnObject
	beq.s	loc_20DC70
	rts

; ------------------------------------------------------------------------------

loc_20DC70:
	move.b	#$33,obj.id(a1)
	move.w	obj.var_36(a0),obj.x(a1)
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	move.b	d0,obj.subtype(a1)
	asl.w	#4,d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a1)
	addq.b	#1,obj.var_3b(a0)

locret_20DC96:
	rts

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine6:
	rts

; ------------------------------------------------------------------------------

loc_20DC9A:
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#SpikeCrusherSprites,obj.sprite_data(a0)
	move.w	#$4400,obj.sprite_tile(a0)
	move.b	#6,obj.sprite_frame(a0)
	move.w	obj.var_34(a0),d0
	beq.s	loc_20DCEA
	movea.w	d0,a1
	cmpi.b	#$33,0(a1)
	bne.s	loc_20DCEA
	move.w	$12(a1),obj.y_speed(a0)
	move.w	$C(a1),d0
	addi.w	#$C,d0
	move.w	d0,obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	move.b	byte_20DCF0(pc,d0.w),d0
	move.b	d0,obj.collide_type(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20DCEA:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

byte_20DCF0:
	dc.b	0
	dc.b	$9C
	dc.b	$9C
	dc.b	0
	dc.b	$9B
	dc.b	$9D

; ------------------------------------------------------------------------------

SpikesObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20DDE6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DD1C(pc,d0.w),d0
	jsr	off_20DD1C(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20DD1C:
	dc.w	SpikesObject_1_Routine0-*
	dc.w	SpikesObject_1_Routine2-off_20DD1C

; ------------------------------------------------------------------------------

SpikesObject_1_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$43F0,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#BlockSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	jsr	SpawnObject
	beq.s	loc_20DD5E
	bra.w	SpikesObject_1_Routine2

; ------------------------------------------------------------------------------

loc_20DD5E:
	addq.b	#2,obj.routine(a0)
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20DD8E
	move.b	#$A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	bra.s	SpikesObject_1_Routine2

; ------------------------------------------------------------------------------

loc_20DD8E:
	move.b	#$36,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)

SpikesObject_1_Routine2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20DDDC
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20DDC8
	neg.w	d0

loc_20DDC8:
	cmpi.w	#$20,d0
	bcc.s	locret_20DDDC
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	SolidObject

locret_20DDDC:
	rts

; ------------------------------------------------------------------------------

BlockSprites:
	include	"src/sprites/r8/block.asm"
	even

; ------------------------------------------------------------------------------

loc_20DDE6:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DE3A(pc,d0.w),d0
	jsr	off_20DE3A(pc,d0.w)
	jsr	DrawObject
	moveq	#0,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_20DE2A
	movea.w	d1,a1
	tst.b	0(a1)
	beq.s	loc_20DE34
	move.w	8(a1),obj.x(a0)
	move.w	$C(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_20DE2A:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20DE34:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20DE3A:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20DE3A

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$488,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	cmpi.b	#$FF,obj.subtype(a0)
	beq.s	SpikesObject_0_Routine2
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$12,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.b	#$83,obj.collide_type(a0)

SpikesObject_0_Routine2:
	tst.b	obj.sprite_frame(a0)
	bne.w	loc_20DF04
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20DEAC
	neg.w	d0

loc_20DEAC:
	cmpi.w	#$20,d0
	bcc.s	locret_20DF02
	jsr	SolidObject
	beq.s	locret_20DF02
	btst	#3,obj.flags(a0)
	beq.s	locret_20DF02
	tst.b	warping
	bne.s	locret_20DF02
	tst.b	invincible
	bne.s	locret_20DF02
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20DF00
	tst.w	obj.var_30(a0)
	bne.s	loc_20DF00
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer

loc_20DF00:
	movea.l	(sp)+,a0

locret_20DF02:
	rts

; ------------------------------------------------------------------------------

loc_20DF04:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20DF28
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20DF1C
	neg.w	d0

loc_20DF1C:
	cmpi.w	#$20,d0
	bcc.s	locret_20DF28
	jsr	SolidObject

locret_20DF28:
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"src/sprites/r8/spikes.asm"
	even

; ------------------------------------------------------------------------------

	dc.b	7
	dc.b	$20
	dc.b	6
	dc.b	$1C
	dc.b	5
	dc.b	$18
	dc.b	4
	dc.b	$14
	dc.b	3
	dc.b	$10
	dc.b	2
	dc.b	$C
	dc.b	1
	dc.b	8
	dc.b	0
	dc.b	4
	dc.b	$F
	dc.b	$20
	dc.b	$E
	dc.b	$1C
	dc.b	$D
	dc.b	$18
	dc.b	$C
	dc.b	$14
	dc.b	$B
	dc.b	$10
	dc.b	$A
	dc.b	$C
	dc.b	9
	dc.b	8
	dc.b	8
	dc.b	4

; ------------------------------------------------------------------------------
