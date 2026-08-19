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
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

GeyserObject_0_Routine0:
	lea	palette+$6E,a2
	move.w	#$646,(a2)+
	move.w	#$A8A,(a2)+
	move.w	#$EEE,(a2)
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$6300,obj.sprite_tile(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#GeyserSprites,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$3C,obj.height(a0)

GeyserObject_0_Routine2:
	bsr.s	sub_20D1FA
	lea	GeyserAnims,a1
	jsr	AnimateObject
	move.w	water_y,d0
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
	move.l	#GeyserSprites,obj.sprite_data(a0)
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
	lea	GeyserAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20D300:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

GeyserAnims:
	include	"src/anims/r4/geyser.asm"
	even

GeyserSprites:
	include	"src/sprites/r4/geyser.asm"
	even

; ------------------------------------------------------------------------------
