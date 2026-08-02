; ------------------------------------------------------------------------------

RotateBlockObject:
	cmpi.b	#$FF,obj.var_3c(a0)
	beq.w	loc_20EE16
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EBDA(pc,d0.w),d0
	jsr	off_20EBDA(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20EBDA:
	dc.w	RotateBlockObject_1_Routine0-*
	dc.w	RotateBlockObject_1_Routine2-off_20EBDA
	dc.w	RotateBlockObject_1_Routine4-off_20EBDA
	dc.w	RotateBlockObject_1_Routine6-off_20EBDA

; ------------------------------------------------------------------------------

loc_20EBE2:
	jmp	DespawnObject

; ------------------------------------------------------------------------------

	lea	(player_object).w,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

RotateBlockObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20EF14,obj.sprite_data(a0)
	move.w	#$4300,obj.sprite_tile(a0)
	move.b	#$40,obj.height(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#3,d0
	move.b	d0,obj.sprite_frame(a0)
	move.b	d0,obj.var_3d(a0)
	jsr	SpawnObject
	bne.w	loc_20EBE2
	move.b	#$3D,obj.id(a1)
	move.w	obj.x(a0),obj.var_36(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$FF,obj.var_3c(a1)
	move.b	#0,obj.var_3d(a1)
	move.w	a1,obj.var_30(a0)
	jsr	SpawnObject
	bne.w	loc_20EBE2
	move.b	#$3D,obj.id(a1)
	move.w	obj.x(a0),obj.var_36(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$FF,obj.var_3c(a1)
	move.b	#1,obj.var_3d(a1)
	move.w	a1,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

RotateBlockObject_1_Routine2:
	movea.w	obj.var_30(a0),a1
	tst.b	obj.var_3e(a1)
	bmi.s	loc_20EC8E
	rts

; ------------------------------------------------------------------------------

loc_20EC8E:
	lea	(player_object).w,a1
	cmpi.b	#2,obj.var_3d(a0)
	bcc.s	loc_20ECAC
	move.w	obj.x(a0),d0
	move.b	obj.width_2(a1),d1
	addq.b	#2,d1
	ext.w	d1
	add.w	obj.x(a1),d1
	bra.s	loc_20ECBE

; ------------------------------------------------------------------------------

loc_20ECAC:
	move.w	obj.x(a0),d1
	move.b	obj.width_2(a1),d0
	addq.b	#2,d0
	neg.b	d0
	ext.w	d0
	add.w	obj.x(a1),d0

loc_20ECBE:
	sub.w	d1,d0
	bcc.s	loc_20ECC4
	rts

; ------------------------------------------------------------------------------

loc_20ECC4:
	moveq	#$10,d0
	jsr	sub_20EDE8
	tst.b	d1
	bmi.s	loc_20ECD6
	cmpi.b	#$10,d1
	bcc.s	loc_20ECF2

loc_20ECD6:
	movea.w	obj.var_34(a0),a1
	tst.b	$3E(a1)
	beq.s	locret_20ECF0
	move.b	#6,obj.routine(a0)
	move.b	#$10,obj.var_3a(a0)
	clr.b	obj.var_3b(a0)

locret_20ECF0:
	rts

; ------------------------------------------------------------------------------

loc_20ECF2:
	addq.b	#2,obj.routine(a0)
	move.b	#$10,obj.var_3a(a0)
	clr.b	obj.var_3b(a0)
	rts

; ------------------------------------------------------------------------------

RotateBlockObject_1_Routine4:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	add.b	obj.var_3b(a0),d0
	move.b	byte_20ED42(pc,d0.w),d0
	bmi.s	loc_20ED36
	move.b	d0,obj.sprite_frame(a0)
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20ED40
	move.w	#$BF,d0
	jsr	PlayFmSound
	move.b	#4,obj.var_3a(a0)
	addq.b	#1,obj.var_3b(a0)
	rts

; ------------------------------------------------------------------------------

loc_20ED36:
	move.b	obj.sprite_frame(a0),obj.var_3d(a0)
	subq.b	#2,obj.routine(a0)

locret_20ED40:
	rts

; ------------------------------------------------------------------------------

byte_20ED42:
	dc.b	0, 4, 1, $FF
	dc.b	1, 5, 2, $FF
	dc.b	2, 5, 1, $FF
	dc.b	3, 6, 2, $FF

; ------------------------------------------------------------------------------

RotateBlockObject_1_Routine6:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	add.b	obj.var_3b(a0),d0
	move.b	byte_20EDD8(pc,d0.w),d0
	bmi.s	loc_20EDCA
	move.b	d0,obj.sprite_frame(a0)
	lea	(player_object).w,a1
	move.w	obj.y(a0),d0
	move.b	obj.height(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.b	obj.height(a1),d1
	ext.w	d1
	sub.w	d1,d0
	move.w	d0,obj.y(a1)
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20EDD6
	move.b	#8,obj.var_3a(a0)
	addq.b	#1,obj.var_3b(a0)
	lea	(player_object).w,a1
	cmpi.b	#1,obj.var_3b(a0)
	bne.s	loc_20EDAA
	move.w	obj.x(a0),obj.x(a1)
	rts

; ------------------------------------------------------------------------------

loc_20EDAA:
	cmpi.b	#2,obj.var_3b(a0)
	bne.s	locret_20EDD6
	move.w	#$10,d0
	btst	#1,obj.var_3d(a0)
	beq.s	loc_20EDC0
	neg.w	d0

loc_20EDC0:
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	rts

; ------------------------------------------------------------------------------

loc_20EDCA:
	move.b	obj.sprite_frame(a0),obj.var_3d(a0)
	move.b	#2,obj.routine(a0)

locret_20EDD6:
	rts

; ------------------------------------------------------------------------------

byte_20EDD8:
	dc.b	0, 7, 3, $FF
	dc.b	1, 4, 2, $FF
	dc.b	2, 4, 1, $FF
	dc.b	3, 7, 0, $FF

; ------------------------------------------------------------------------------

sub_20EDE8:
	move.w	obj.y(a0),d2
	add.w	d0,d2
	move.w	obj.x(a0),d3
	lea	(collide_angle_1).w,a4
	clr.b	(a4)
	movea.w	#$10,a3
	moveq	#0,d6
	moveq	#$D,d5
	jsr	CheckBlockY
	move.b	(collide_angle_1).w,d3
	btst	#0,d3
	beq.s	locret_20EE14
	move.b	#0,d3

locret_20EE14:
	rts

; ------------------------------------------------------------------------------

loc_20EE16:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EE34(pc,d0.w),d0
	jsr	off_20EE34(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20EE34:
	dc.w	RotateBlockObject_0_Routine0-*
	dc.w	RotateBlockObject_0_Routine2-off_20EE34

; ------------------------------------------------------------------------------

RotateBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20EF14,obj.sprite_data(a0)
	move.w	#$4300,obj.sprite_tile(a0)
	move.b	#8,obj.sprite_frame(a0)
	move.b	#$20,d0
	move.b	#$10,d1
	tst.b	obj.var_3d(a0)
	beq.s	loc_20EE72
	move.b	#$10,d0
	move.b	#$10,d1

loc_20EE72:
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)

RotateBlockObject_0_Routine2:
	movea.w	obj.var_34(a0),a1
	moveq	#0,d0
	move.b	obj.sprite_frame(a1),d0
	cmpi.b	#4,d0
	bcc.w	loc_20EEFA
	add.b	d0,d0
	lea	(byte_20EF04).l,a2
	tst.b	obj.var_3d(a0)
	beq.s	loc_20EEA0
	lea	(byte_20EF0C).l,a2

loc_20EEA0:
	lea	(a2,d0.w),a2
	move.b	(a2)+,d0
	move.b	(a2)+,d1
	ext.w	d0
	ext.w	d1
	add.w	obj.x(a1),d0
	add.w	obj.y(a1),d1
	move.w	d0,obj.x(a0)
	move.w	d1,obj.y(a0)
	lea	(player_object).w,a1
	jsr	SolidObject
	tst.b	obj.var_3d(a0)
	bne.s	loc_20EED8
	btst	#3,obj.flags(a0)
	sne	obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EED8:
	btst	#5,obj.flags(a0)
	beq.s	loc_20EEF4
	tst.b	obj.var_3f(a0)
	bne.s	locret_20EEF8
	move.w	#$FFFF,obj.var_3e(a0)
	bclr	#5,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EEF4:
	clr.w	obj.var_3e(a0)

locret_20EEF8:
	rts

; ------------------------------------------------------------------------------

loc_20EEFA:
	lea	(player_object).w,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

byte_20EF04:
	dc.b	-$10, 0
	dc.b	-$10, 0
	dc.b	$10, 0
	dc.b	$10, 0

byte_20EF0C:
	dc.b	0, -$20
	dc.b	0, $20
	dc.b	0, $20
	dc.b	0, -$20

Spr_20EF14:
	dc.w	@Spr_20EF14_0-*
	dc.w	@Spr_20EF14_1-Spr_20EF14
	dc.w	@Spr_20EF14_2-Spr_20EF14
	dc.w	@Spr_20EF14_3-Spr_20EF14
	dc.w	@Spr_20EF14_4-Spr_20EF14
	dc.w	@Spr_20EF14_5-Spr_20EF14
	dc.w	@Spr_20EF14_6-Spr_20EF14
	dc.w	@Spr_20EF14_7-Spr_20EF14
	dc.w	@Spr_20EF14_8-Spr_20EF14

@Spr_20EF14_0:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, $10, 4, $F0
	dc.b	$D0, $F, 0, 4, $F0
	dc.b	$F0, $F, $18, 4, $D0
	dc.b	0

@Spr_20EF14_1:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, 0, 4, $F0
	dc.b	$F0, $F, 8, 4, $D0
	dc.b	$10, $F, $10, 4, $F0
	dc.b	0

@Spr_20EF14_2:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, 8, 4, $F0
	dc.b	$10, $F, $18, 4, $F0
	dc.b	$F0, $F, 0, 4, $10
	dc.b	0

@Spr_20EF14_3:
	dc.b	4
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, $F, $18, 4, $F0
	dc.b	$F0, $F, $10, 4, $10
	dc.b	$D0, $F, 8, 4, $F0
	dc.b	0

@Spr_20EF14_4:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, 7, 0, $1C, 8
	dc.b	$E0, $F, 0, $24, $E8
	dc.b	0, $F, $10, $24, $E8
	dc.b	$D0, $D, 0, $14, $D8
	dc.b	$E0, $B, 0, $34, $D0
	dc.b	0, $B, $10, $34, $D0
	dc.b	$20, $D, $10, $14, $D8
	dc.b	0

@Spr_20EF14_5:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$E8, $D, 0, $14, $F0
	dc.b	$F8, $F, 8, $24, $E0
	dc.b	$F8, $F, 0, $24, 0
	dc.b	8, 7, 8, $1C, $D0
	dc.b	8, 7, 0, $1C, $20
	dc.b	$18, $E, 0, $40, $E0
	dc.b	$18, $E, 8, $40, 0
	dc.b	0

@Spr_20EF14_6:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F0, 7, 8, $1C, $E8
	dc.b	$E0, $F, 8, $24, $F8
	dc.b	0, $F, $18, $24, $F8
	dc.b	$D0, $D, 8, $14, 8
	dc.b	$E0, $B, 8, $34, $18
	dc.b	0, $B, $18, $34, $18
	dc.b	$20, $D, $18, $14, 8
	dc.b	0

@Spr_20EF14_7:
	dc.b	8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, $D, $10, $14, $F0
	dc.b	$E8, $F, $18, $24, $E0
	dc.b	$E8, $F, $10, $24, 0
	dc.b	$D8, 7, $18, $1C, $D0
	dc.b	$D8, 7, $10, $1C, $20
	dc.b	$D0, $E, $10, $40, $E0
	dc.b	$D0, $E, $18, $40, 0
	dc.b	0

@Spr_20EF14_8:
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------