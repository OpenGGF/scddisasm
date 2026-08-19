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
	move.l	#ShootSprites,obj.sprite_data(a1)
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
	lea	player_object,a1
	bsr.s	sub_20F35E
	bcc.s	loc_20F340
	move.l	obj.var_2c(a0),d0
	asr.l	#8,d0
	move.w	d0,obj.ground_speed(a1)

loc_20F340:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	lea	ShootAnims(pc),a1
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

ShootAnims:
	include	"src/anims/r4/shoot.asm"
	even

ShootSprites:
	include	"src/sprites/r4/shoot.asm"
	even

; ------------------------------------------------------------------------------
