; ------------------------------------------------------------------------------

	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20BDAC
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20BDAC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpikesObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20BEA4
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BDD8(pc,d0.w),d0
	jsr	off_20BDD8(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20BDD8:
	dc.w	SpikesObject_1_Routine0-*
	dc.w	SpikesObject_1_Routine2-off_20BDD8

; ------------------------------------------------------------------------------

SpikesObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$43F0,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#BlockSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	jsr	SpawnObject
	beq.s	loc_20BE20
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20BE20:
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20BE4C
	move.b	#$A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	bra.s	SpikesObject_1_Routine2

; ------------------------------------------------------------------------------

loc_20BE4C:
	move.b	#$36,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)

SpikesObject_1_Routine2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20BE9A
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20BE86
	neg.w	d0

loc_20BE86:
	cmpi.w	#$20,d0
	bcc.s	locret_20BE9A
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	SolidObject

locret_20BE9A:
	rts

; ------------------------------------------------------------------------------

BlockSprites:
	include	"sprites/r8/block.asm"
	even

; ------------------------------------------------------------------------------

loc_20BEA4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BEF8(pc,d0.w),d0
	jsr	off_20BEF8(pc,d0.w)
	jsr	DrawObject
	moveq	#0,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_20BEE8
	movea.w	d1,a1
	tst.b	obj.id(a1)
	beq.s	loc_20BEF2
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_20BEE8:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20BEF2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20BEF8:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20BEF8

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$488,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	cmpi.b	#$FF,obj.subtype(a0)
	beq.s	SpikesObject_0_Routine2
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$83,obj.collide_type(a0)
	move.b	#$12,obj.width_2(a0)

SpikesObject_0_Routine2:
	tst.b	obj.sprite_frame(a0)
	bne.w	loc_20BFBC
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20BF64
	neg.w	d0

loc_20BF64:
	cmpi.w	#$20,d0
	bcc.s	locret_20BFBA
	jsr	SolidObject
	beq.s	locret_20BFBA
	btst	#3,obj.flags(a0)
	beq.s	locret_20BFBA
	tst.b	warping
	bne.s	locret_20BFBA
	tst.b	invincible
	bne.s	locret_20BFBA
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20BFB8
	tst.w	obj.var_30(a0)
	bne.s	loc_20BFB8
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer

loc_20BFB8:
	movea.l	(sp)+,a0

locret_20BFBA:
	rts

; ------------------------------------------------------------------------------

loc_20BFBC:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20BFE8
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20BFD4
	neg.w	d0

loc_20BFD4:
	cmpi.w	#$20,d0
	bcc.s	locret_20BFE8
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	SolidObject

locret_20BFE8:
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"sprites/r8/spikes.asm"
	even

; ------------------------------------------------------------------------------

TrapDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C018(pc,d0.w),d0
	jsr	off_20C018(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C018:
	dc.w	TrapDoorObject_0_Routine0-*
	dc.w	TrapDoorObject_0_Routine2-off_20C018
	dc.w	TrapDoorObject_0_Routine4-off_20C018

; ------------------------------------------------------------------------------

loc_20C01E:
	lea	player_object,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

loc_20C028:
	lea	player_object,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

TrapDoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.w	#$33C,obj.sprite_tile(a0)
	move.l	#TrapDoorSprites,obj.sprite_data(a0)
	move.b	#8,obj.height(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$10,obj.sprite_frame(a0)
	tst.b	obj.var_3e(a0)
	bne.s	TrapDoorObject_0_Routine2
	subq.w	#4,obj.x(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	jsr	SpawnObject
	beq.s	loc_20C080
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20C080:
	move.b	#$37,obj.id(a1)
	move.w	obj.x(a0),d0
	addi.w	#$80,d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	#1,obj.anim_id(a1)
	move.b	#1,obj.var_3e(a1)

TrapDoorObject_0_Routine2:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20C0B8
	subq.b	#1,obj.var_3a(a0)
	bra.w	loc_20C028

; ------------------------------------------------------------------------------

loc_20C0B8:
	lea	byte_20C1B4,a1
	moveq	#4,d2
	tst.b	obj.var_3e(a0)
	beq.s	loc_20C0E0
	lea	byte_20C1C4,a1
	moveq	#-4,d2
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20C0E0
	move.w	#$A4,d0
	jsr	PlayFmSound

loc_20C0E0:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	move.b	d0,d1
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.sprite_frame(a0)
	move.b	(a1)+,obj.width_2(a0)
	add.w	d2,obj.x(a0)
	addq.b	#1,obj.var_3d(a0)
	cmpi.b	#8,obj.var_3d(a0)
	bne.s	loc_20C114
	move.b	#60,obj.var_3a(a0)
	clr.b	obj.var_3d(a0)
	addq.b	#2,obj.routine(a0)

loc_20C114:
	bra.w	loc_20C01E

; ------------------------------------------------------------------------------

TrapDoorObject_0_Routine4:
	tst.b	obj.var_3a(a0)
	beq.s	loc_20C126
	subq.b	#1,obj.var_3a(a0)
	bra.w	loc_20C01E

; ------------------------------------------------------------------------------

loc_20C126:
	lea	byte_20C194,a1
	moveq	#-4,d2
	tst.b	obj.var_3e(a0)
	beq.s	loc_20C14E
	lea	byte_20C1A4,a1
	moveq	#4,d2
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20C14E
	move.w	#$A4,d0
	jsr	PlayFmSound

loc_20C14E:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	move.b	d0,d1
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.sprite_frame(a0)
	move.b	(a1)+,obj.width_2(a0)
	add.w	d2,obj.x(a0)
	addq.b	#1,obj.var_3d(a0)
	cmpi.b	#8,obj.var_3d(a0)
	bne.s	loc_20C190
	move.b	#$3C,obj.var_3a(a0)
	clr.b	obj.var_3d(a0)
	move.b	#$10,obj.sprite_frame(a0)
	clr.b	obj.width_2(a0)
	subq.b	#2,obj.routine(a0)
	bra.w	loc_20C028

; ------------------------------------------------------------------------------

loc_20C190:
	bra.w	loc_20C01E

; ------------------------------------------------------------------------------

byte_20C194:
	dc.b	7, $20
	dc.b	6, $1C
	dc.b	5, $18
	dc.b	4, $14
	dc.b	3, $10
	dc.b	2, $C
	dc.b	1, 8
	dc.b	0, 4

byte_20C1A4:
	dc.b	$F, $20
	dc.b	$E, $1C
	dc.b	$D, $18
	dc.b	$C, $14
	dc.b	$B, $10
	dc.b	$A, $C
	dc.b	9, 8
	dc.b	8, 4

byte_20C1B4:
	dc.b	0, 4
	dc.b	1, 8
	dc.b	2, $C
	dc.b	3, $10
	dc.b	4, $14
	dc.b	5, $18
	dc.b	6, $1C
	dc.b	7, $20

byte_20C1C4:
	dc.b	8, 4
	dc.b	9, 8
	dc.b	$A, $C
	dc.b	$B, $10
	dc.b	$C, $14
	dc.b	$D, $18
	dc.b	$E, $1C
	dc.b	$F, $20

TrapDoorSprites:
	include	"sprites/r8/trap_door.asm"
	even

; ------------------------------------------------------------------------------
