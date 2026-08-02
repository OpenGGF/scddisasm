; ------------------------------------------------------------------------------

ShooterObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20F32E
	tst.b	obj.routine(a0)
	bne.s	loc_20F2A6
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$4318,obj.sprite_tile(a0)
	move.l	#Spr_20F326,obj.sprite_data(a0)
	move.l	#-$30000,obj.var_2c(a0)
	move.w	#$20,d6
	tst.b	obj.subtype(a0)
	beq.s	loc_20F29C
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	neg.l	obj.var_2c(a0)
	neg.w	d6

loc_20F29C:
	move.w	obj.x(a0),obj.var_30(a0)
	add.w	d6,obj.var_30(a0)

loc_20F2A6:
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	loc_20F31A
	move.w	#$1E,obj.var_2a(a0)
	jsr	SpawnObject
	bne.s	loc_20F31A
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.var_30(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addq.w	#4,obj.y(a1)
	move.l	obj.var_2c(a0),obj.var_2c(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)
	move.b	#$20,obj.width(a1)
	move.b	#$20,obj.width_2(a1)
	move.b	#6,obj.height(a1)
	move.w	#$318,obj.sprite_tile(a1)
	move.l	#Spr_20F38A,obj.sprite_data(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.flags(a0),obj.flags(a1)

loc_20F31A:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

Spr_20F326:
	dc.w	@Spr_20F326_0-*

@Spr_20F326_0:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $F8

; ------------------------------------------------------------------------------

loc_20F32E:
	lea	(player_object).w,a1
	bsr.s	sub_20F35E
	bcc.s	loc_20F340
	move.l	obj.var_2c(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.ground_speed(a1)

loc_20F340:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	lea	Ani_20F382(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

sub_20F35E:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$C,d0
	subi.w	#$18,d0
	bcc.s	locret_20F380
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$14,d0
	subi.w	#$28,d0

locret_20F380:
	rts

; ------------------------------------------------------------------------------

Ani_20F382:
	dc.w	@Ani_20F382_0-*

@Ani_20F382_0:
	dc.b	9
	dc.b	0, 1, 2, 3
	dc.b	$FF

Spr_20F38A:
	dc.w	@Spr_20F38A_0-*
	dc.w	@Spr_20F38A_1-Spr_20F38A
	dc.w	@Spr_20F38A_2-Spr_20F38A
	dc.w	@Spr_20F38A_3-Spr_20F38A

@Spr_20F38A_0:
	dc.b	2
	dc.b	$F8, 9, 0, 8, $F0
	dc.b	$F8, 1, 0, $E, 8

@Spr_20F38A_1:
	dc.b	2
	dc.b	$F8, 9, $10, 8, $F0
	dc.b	$F8, 1, $10, $10, 8

@Spr_20F38A_2:
	dc.b	2
	dc.b	$F8, 9, 0, 8, $F0
	dc.b	$F8, 1, 0, $E, 8

@Spr_20F38A_3:
	dc.b	2
	dc.b	$F8, 9, $10, 8, $F0
	dc.b	$F8, 1, $10, $10, 8

; ------------------------------------------------------------------------------