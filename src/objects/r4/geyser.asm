; ------------------------------------------------------------------------------

GeyserObject:
	cmpi.b	#$FF,obj.subtype(a0)
	beq.w	loc_20D290
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D18A(pc,d0.w),d0
	jsr	off_20D18A(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D18A:
	dc.w	GeyserObject_0_Routine0-*
	dc.w	GeyserObject_0_Routine2-off_20D18A
	dc.w	GeyserObject_0_Routine4-off_20D18A

; ------------------------------------------------------------------------------

loc_20D190:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

GeyserObject_0_Routine0:
	lea	(palette+$6E).w,a2
	move.w	#$646,(a2)+
	move.w	#$A8A,(a2)+
	move.w	#$EEE,(a2)
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$6300,obj.sprite_tile(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#Spr_20D318,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$3C,obj.height(a0)

GeyserObject_0_Routine2:
	bsr.s	sub_20D1FA
	lea	(Ani_20D306).l,a1
	jsr	AnimateObject
	move.w	(water_y).w,d0
	subi.w	#$30,d0
	move.w	d0,obj.y(a0)
	bra.w	loc_20D190

; ------------------------------------------------------------------------------

sub_20D1FA:
	addi.b	#$10,obj.var_3b(a0)
	bcc.s	locret_20D24E
	jsr	SpawnObject
	bne.s	locret_20D24E
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#5,obj.sprite_frame(a1)
	move.b	obj.var_3a(a0),d0
	andi.w	#3,d0
	move.b	d0,obj.var_3a(a1)
	asl.w	#3,d0
	lea	word_20D250(pc,d0.w),a2
	move.w	(a2)+,d0
	add.w	obj.x(a0),d0
	move.w	d0,obj.x(a1)
	move.w	(a2)+,d0
	add.w	obj.y(a0),d0
	move.w	d0,obj.y(a1)
	move.w	(a2)+,obj.x_speed(a1)
	move.w	(a2)+,obj.y_speed(a1)
	addq.b	#1,obj.var_3a(a0)

locret_20D24E:
	rts

; ------------------------------------------------------------------------------

word_20D250:
	dc.w	-$28, -$48, -$20, -$80
	dc.w	8, -$48, $20, -$80
	dc.w	$28, -$48, $40, -$80
	dc.w	-8, -$48, -$40, -$80
	dc.w	-$28, -$48, 0, -$80
	dc.w	-8, -$48, 0, -$80
	dc.w	8, -$48, 0, -$80
	dc.w	$28, -$48, 0, -$80

; ------------------------------------------------------------------------------

loc_20D290:
	tst.b	obj.routine(a0)
	bne.w	GeyserObject_0_Routine4
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$6300,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20D318,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#1,obj.anim_id(a0)

; ------------------------------------------------------------------------------

GeyserObject_0_Routine4:
	addq.b	#2,obj.var_3b(a0)
	bcs.s	loc_20D300
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	addq.w	#8,obj.y_speed(a0)
	lea	Ani_20D306(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20D300:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Ani_20D306:
	dc.w	@Ani_20D306_0-*
	dc.w	@Ani_20D306_1-Ani_20D306

@Ani_20D306_0:
	dc.b	0
	dc.b	0, 1, 2, 3, 4
	dc.b	$FF
	dc.b	0

@Ani_20D306_1:
	dc.b	0
	dc.b	5, 6, 7, 8
	dc.b	$FF

Spr_20D318:
	dc.w	@Spr_20D318_0-*
	dc.w	@Spr_20D318_1-Spr_20D318
	dc.w	@Spr_20D318_2-Spr_20D318
	dc.w	@Spr_20D318_3-Spr_20D318
	dc.w	@Spr_20D318_4-Spr_20D318
	dc.w	@Spr_20D318_5-Spr_20D318
	dc.w	@Spr_20D318_6-Spr_20D318
	dc.w	@Spr_20D318_7-Spr_20D318
	dc.w	@Spr_20D318_8-Spr_20D318

@Spr_20D318_0:
	dc.b	$10
	dc.b	$B0, $B, $80, 0, $C8
	dc.b	$B0, $F, $80, $C, $E0
	dc.b	$B0, $F, $80, $C, 0
	dc.b	$B0, $B, $88, 0, $20
	dc.b	$30, $B, 0, 0, $C8
	dc.b	$30, $F, 0, $C, $E0
	dc.b	$30, $F, 0, $C, 0
	dc.b	$30, $B, 8, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	dc.b	0

@Spr_20D318_1:
	dc.b	$10
	dc.b	$B0, $B, $80, 0, $C8
	dc.b	$B0, $F, $80, $C, $E0
	dc.b	$B0, $F, $98, $C, 0
	dc.b	$B0, $B, $88, 0, $20
	dc.b	$30, $B, 0, 0, $C8
	dc.b	$30, $F, 0, $C, $E0
	dc.b	$30, $F, $18, $C, 0
	dc.b	$30, $B, 8, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	dc.b	0

@Spr_20D318_2:
	dc.b	$10
	dc.b	$B0, $B, $90, 0, $C8
	dc.b	$B0, $F, $88, $C, $E0
	dc.b	$B0, $F, $98, $C, 0
	dc.b	$B0, $B, $98, 0, $20
	dc.b	$30, $B, $10, 0, $C8
	dc.b	$30, $F, 8, $C, $E0
	dc.b	$30, $F, $18, $C, 0
	dc.b	$30, $B, $18, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	dc.b	0

@Spr_20D318_3:
	dc.b	$10
	dc.b	$B0, $B, $90, 0, $C8
	dc.b	$B0, $F, $90, $C, $E0
	dc.b	$B0, $F, $80, $C, 0
	dc.b	$B0, $B, $98, 0, $20
	dc.b	$30, $B, $10, 0, $C8
	dc.b	$30, $F, $10, $C, $E0
	dc.b	$30, $F, 0, $C, 0
	dc.b	$30, $B, $18, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	dc.b	0

@Spr_20D318_4:
	dc.b	$10
	dc.b	$B0, $B, $80, 0, $C8
	dc.b	$B0, $F, $98, $C, $E0
	dc.b	$B0, $F, $88, $C, 0
	dc.b	$B0, $B, $88, 0, $20
	dc.b	$30, $B, 0, 0, $C8
	dc.b	$30, $F, $18, $C, $E0
	dc.b	$30, $F, 8, $C, 0
	dc.b	$30, $B, 8, 0, $20
	dc.b	$C0, $F, 0, $1C, $E0
	dc.b	$C0, $F, 0, $1C, 0
	dc.b	$E0, $F, 0, $1C, $E0
	dc.b	$E0, $F, 0, $1C, 0
	dc.b	0, $F, 0, $1C, $E0
	dc.b	0, $F, 0, $1C, 0
	dc.b	$20, $F, 0, $1C, $E0
	dc.b	$20, $F, 0, $1C, 0
	dc.b	0

@Spr_20D318_5:
	dc.b	1
	dc.b	$F0, $F, 0, $2C, $F0

@Spr_20D318_6:
	dc.b	1
	dc.b	$F0, $F, $10, $2C, $F0

@Spr_20D318_7:
	dc.b	1
	dc.b	$F0, $F, 8, $2C, $F0

@Spr_20D318_8:
	dc.b	1
	dc.b	$F0, $F, $18, $2C, $F0

; ------------------------------------------------------------------------------