; ------------------------------------------------------------------------------

SeesawObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20F3B2
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F18C(pc,d0.w),d0
	jsr	off_20F18C(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20F18C:
	dc.w	SeesawObject_0_Routine0-*
	dc.w	SeesawObject_0_Routine2-off_20F18C
	dc.w	SeesawObject_0_Routine4-off_20F18C

; ------------------------------------------------------------------------------

SeesawObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.w	#$3B8,obj.sprite_tile(a0)
	move.l	#Spr_20F3EE,obj.sprite_data(a0)
	jsr	SpawnObject
	bne.w	loc_20F3C0
	bsr.w	sub_20F20C
	move.w	a1,obj.var_2a(a0)
	subi.w	#$28,obj.x(a1)
	subi.w	#$18,obj.y(a1)
	jsr	SpawnObject
	bne.w	loc_20F3C0
	bsr.w	sub_20F20C
	move.w	a1,obj.var_2c(a0)
	addi.w	#$28,obj.x(a1)
	addi.w	#$18,obj.y(a1)
	bset	#0,obj.sprite_flags(a1)
	bset	#0,obj.flags(a1)
	rts

; ------------------------------------------------------------------------------

sub_20F20C:
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	#9,obj.sprite_frame(a1)
	move.w	a0,obj.var_2a(a1)
	move.w	#$78,obj.var_2e(a0)
	rts

; ------------------------------------------------------------------------------

SeesawObject_0_Routine2:
	lea	sub_20F2CC(pc),a1
	tst.w	obj.y_speed(a0)
	beq.s	loc_20F26E
	lea	sub_20F2EE(pc),a1

loc_20F26E:
	jsr	(a1)
	move.w	a0,-(sp)
	movea.w	obj.var_2c(a0),a0
	lea	(player_object).w,a1
	jsr	TopSolidObject
	jsr	DrawObject
	movea.w	(sp)+,a0
	move.w	a0,-(sp)
	movea.w	obj.var_2a(a0),a0
	lea	(player_object).w,a1
	jsr	TopSolidObject
	sne	obj.var_3f(a0)
	jsr	DrawObject
	movea.w	(sp)+,a0
	movea.w	obj.var_2a(a0),a1
	tst.b	obj.var_3f(a1)
	bne.s	loc_20F2B8
	lea	Ani_20F3C6(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20F2B8:
	move.b	#4,obj.routine(a0)
	move.w	#3,obj.var_2e(a0)
	move.b	#8,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

sub_20F2CC:
	tst.w	obj.var_2e(a0)
	bmi.s	locret_20F2EC
	subq.w	#1,obj.var_2e(a0)
	bmi.s	loc_20F2E2
	cmpi.w	#$3C,obj.var_2e(a0)
	beq.s	loc_20F2E8
	bra.s	locret_20F2EC

; ------------------------------------------------------------------------------

loc_20F2E2:
	move.w	#$100,obj.y_speed(a0)

loc_20F2E8:
	addq.b	#1,obj.anim_id(a0)

locret_20F2EC:
	rts

; ------------------------------------------------------------------------------

sub_20F2EE:
	movea.w	obj.var_2a(a0),a1
	movea.w	obj.var_2c(a0),a2
	moveq	#0,d0
	move.b	obj.y_speed(a0),d0
	add.w	d0,obj.y(a0)
	add.w	d0,obj.y(a1)
	add.w	d0,obj.y(a2)
	moveq	#0,d0
	move.b	obj.width_2(a2),d0
	move.w	obj.x(a2),d3
	cmp.w	obj.x(a0),d3
	blt.s	loc_20F31A
	neg.w	d0

loc_20F31A:
	add.w	d0,d3
	move.w	a0,-(sp)
	movea.w	a2,a0
	jsr	CheckBlockDown2
	movea.w	(sp)+,a0
	tst.w	d1
	bmi.s	loc_20F32E
	rts

; ------------------------------------------------------------------------------

loc_20F32E:
	movea.w	obj.var_2a(a0),a1
	movea.w	obj.var_2c(a0),a2
	add.w	d1,obj.y(a0)
	add.w	d1,obj.y(a1)
	add.w	d1,obj.y(a2)
	move.w	#0,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

SeesawObject_0_Routine4:
	movea.w	obj.var_2c(a0),a1
	subi.w	#$18,obj.y(a1)
	subi.w	#$C,obj.y(a0)
	subq.w	#1,obj.var_2e(a0)
	bpl.s	loc_20F362
	bsr.s	sub_20F37E

loc_20F362:
	move.w	a0,-(sp)
	movea.w	obj.var_2c(a0),a0
	jsr	DrawObject
	movea.w	(sp),a0
	movea.w	obj.var_2a(a0),a0
	jsr	DrawObject
	movea.w	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

sub_20F37E:
	move.b	#2,obj.routine(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	#$78,obj.var_2e(a0)
	move.w	obj.var_2a(a0),obj.var_2c(a0)
	move.w	a1,obj.var_2a(a0)
	moveq	#0,d0
	cmpi.b	#2,obj.anim_id(a0)
	bgt.s	loc_20F3A6
	moveq	#3,d0

loc_20F3A6:
	move.b	d0,obj.anim_id(a0)
	move.b	#$FF,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F3B2:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2C,obj.id(a1)
	bne.s	loc_20F3C0
	rts

; ------------------------------------------------------------------------------

loc_20F3C0:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Ani_20F3C6:
	dc.w	@Ani_20F3C6_0-*
	dc.w	@Ani_20F3C6_1-Ani_20F3C6
	dc.w	@Ani_20F3C6_2-Ani_20F3C6
	dc.w	@Ani_20F3C6_3-Ani_20F3C6
	dc.w	@Ani_20F3C6_4-Ani_20F3C6
	dc.w	@Ani_20F3C6_5-Ani_20F3C6

@Ani_20F3C6_0:
	dc.b	2
	dc.b	0, 1
	dc.b	$FF

@Ani_20F3C6_1:
	dc.b	2
	dc.b	0, 1, 2, 3
	dc.b	$FF

@Ani_20F3C6_2:
	dc.b	2
	dc.b	2, 3
	dc.b	$FF

@Ani_20F3C6_3:
	dc.b	2
	dc.b	4, 5
	dc.b	$FF

@Ani_20F3C6_4:
	dc.b	2
	dc.b	4, 5, 6, 7
	dc.b	$FF

@Ani_20F3C6_5:
	dc.b	2
	dc.b	6, 7
	dc.b	$FF

Spr_20F3EE:
	dc.w	@Spr_20F3EE_0-*
	dc.w	@Spr_20F3EE_1-Spr_20F3EE
	dc.w	@Spr_20F3EE_2-Spr_20F3EE
	dc.w	@Spr_20F3EE_3-Spr_20F3EE
	dc.w	@Spr_20F3EE_4-Spr_20F3EE
	dc.w	@Spr_20F3EE_5-Spr_20F3EE
	dc.w	@Spr_20F3EE_6-Spr_20F3EE
	dc.w	@Spr_20F3EE_7-Spr_20F3EE
	dc.w	@Spr_20F3EE_8-Spr_20F3EE
	dc.w	@Spr_20F3EE_9-Spr_20F3EE

@Spr_20F3EE_0:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 0, $2A, $F8

@Spr_20F3EE_1:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 8, $2A, $F8

@Spr_20F3EE_2:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 0, $26, $F8

@Spr_20F3EE_3:
	dc.b	3
	dc.b	$E8, $B, 0, 8, $E8
	dc.b	$F8, $B, 8, $1A, 0
	dc.b	8, 5, 8, $26, $F8

@Spr_20F3EE_4:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 0, $2A, $F8

@Spr_20F3EE_5:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 8, $2A, $F8

@Spr_20F3EE_6:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 0, $26, $F8

@Spr_20F3EE_7:
	dc.b	3
	dc.b	$F8, $B, 0, $1A, $E8
	dc.b	$E8, $B, 8, 8, 0
	dc.b	8, 5, 8, $26, $F8

@Spr_20F3EE_8:
	dc.b	3
	dc.b	$F8, 9, 0, $14, $E8
	dc.b	$F8, 9, 8, $14, 0
	dc.b	8, 5, 0, $2A, $F8

@Spr_20F3EE_9:
	dc.b	1
	dc.b	$F9, $D, 0, 0, $F0

; ------------------------------------------------------------------------------