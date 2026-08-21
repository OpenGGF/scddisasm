; ------------------------------------------------------------------------------

loc_20CCAC:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20CCD0
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20CCD0:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TrapDoorObject:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TrapDoorSprites:
	include	"sprites/r8/trap_door.asm"
	even

; ------------------------------------------------------------------------------

SpikeCrusherObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20D0BE
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CDD0(pc,d0.w),d0
	jsr	off_20CDD0(pc,d0.w)
	bsr.s	sub_20CDD8
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20CDD0:
	dc.w	SpikeCrusherObject_0_Routine0-*
	dc.w	SpikeCrusherObject_0_Routine2-off_20CDD0
	dc.w	SpikeCrusherObject_0_Routine4-off_20CDD0
	dc.w	SpikeCrusherObject_0_Routine6-off_20CDD0

; ------------------------------------------------------------------------------

sub_20CDD8:
	cmpi.b	#3,obj.sprite_frame(a0)
	bne.s	loc_20CDE2

locret_20CDE0:
	rts

; ------------------------------------------------------------------------------

loc_20CDE2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20CDE0
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20CDFA
	neg.w	d0

loc_20CDFA:
	cmpi.w	#$20,d0
	bcc.s	locret_20CDE0
	jmp	SolidObject

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$400,obj.sprite_tile(a0)
	move.l	#SpikeCrusherSprites,obj.sprite_data(a0)
	bsr.w	sub_20CF14
	moveq	#0,d0
	tst.b	obj.var_3d(a0)
	bne.w	loc_20CEAA
	move.b	obj.var_3c(a0),d0
	asl.b	#2,d0
	lea	byte_20CF5A(pc),a2
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
	beq.s	loc_20CE78
	jmp	loc_20CCAC

; ------------------------------------------------------------------------------

loc_20CE78:
	move.b	#$33,obj.id(a1)
	move.b	#1,obj.var_3d(a1)
	lea	byte_20CF66(pc),a2
	bsr.s	sub_20CEDC
	jsr	SpawnObject
	beq.s	loc_20CE98
	jmp	loc_20CCAC

; ------------------------------------------------------------------------------

loc_20CE98:
	move.b	#$33,obj.id(a1)
	move.b	#2,obj.var_3d(a1)
	lea	byte_20CF72(pc),a2
	bsr.s	sub_20CEDC

loc_20CEAA:
	cmpi.b	#3,obj.sprite_frame(a0)
	beq.s	locret_20CEDA
	jsr	SpawnObject
	bne.s	locret_20CEDA
	move.b	#$33,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.sprite_frame(a0),obj.var_3c(a1)
	move.w	a0,obj.var_34(a1)
	move.w	a1,obj.var_34(a0)

locret_20CEDA:
	rts

; ------------------------------------------------------------------------------

sub_20CEDC:
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

sub_20CF14:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.b	byte_20CF22(pc,d0.w),obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

byte_20CF22:
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	2
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

byte_20CF5A:
	dc.b	1, $CC, $1C, 8
	dc.b	4, $BC, $C, 8
	dc.b	5, $DC, $2C, 8

byte_20CF66:
	dc.b	3, 0, $18, 8
	dc.b	3, $E0, $18, 8
	dc.b	3, $20, $18, 8

byte_20CF72:
	dc.b	2, $34, $1C, 8
	dc.b	5, $24, $2C, 8
	dc.b	4, $44, $C, 8

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine2:
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcs.s	locret_20CFA8
	cmpi.w	#$100,d0
	bcc.s	locret_20CFA8
	lea	sub_20CFAA(pc),a2
	tst.b	obj.subtype(a0)
	beq.s	loc_20CFA0
	lea	loc_20CFB2(pc),a2

loc_20CFA0:
	jsr	(a2)
	beq.s	locret_20CFA8
	addq.b	#2,obj.routine(a0)

locret_20CFA8:
	rts

; ------------------------------------------------------------------------------

sub_20CFAA:
	moveq	#0,d1
	move.b	#$30,d1
	bra.s	loc_20CFB8

; ------------------------------------------------------------------------------

loc_20CFB2:
	moveq	#0,d1
	move.b	#$50,d1

loc_20CFB8:
	lea	player_object,a1
	move.w	obj.x(a1),d0
	sub.w	obj.var_36(a0),d0
	add.w	d1,d0
	bmi.s	loc_20CFD2
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20CFD2
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20CFD2:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine4:
	tst.b	obj.subtype(a0)
	bne.s	loc_20CFE4
	tst.b	obj.var_3d(a0)
	bne.s	loc_20CFE4
	bsr.s	sub_20D038

loc_20CFE4:
	tst.b	obj.var_3f(a0)
	bne.s	locret_20D01A
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	move.w	word_20D02C(pc,d0.w),d0
	move.l	obj.y(a0),-(sp)
	add.w	d0,obj.y(a0)
	jsr	CheckBlockDown
	move.l	(sp)+,obj.y(a0)
	tst.w	d1
	bmi.s	loc_20D01C
	addi.l	#$8000,obj.y(a0)
	move.w	#$80,obj.y_speed(a0)

locret_20D01A:
	rts

; ------------------------------------------------------------------------------

loc_20D01C:
	clr.w	obj.y_speed(a0)
	clr.w	obj.var_34(a0)
	move.b	#$FF,obj.var_3f(a0)
	rts

; ------------------------------------------------------------------------------

word_20D02C:
	dc.w	8
	dc.w	$20
	dc.w	$38
	dc.w	$50
	dc.w	$68
	dc.w	$80

; ------------------------------------------------------------------------------

sub_20D038:
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20D04E
	neg.w	d0
	cmpi.w	#$80,d0
	bcc.s	locret_20D080

loc_20D04E:
	bsr.w	loc_20CFB2
	beq.s	locret_20D080
	addq.w	#1,obj.var_30(a0)
	cmpi.w	#$12C,obj.var_30(a0)
	bne.s	loc2_20d062
	bra.s	loc_20D082

; ------------------------------------------------------------------------------

loc2_20d062:
	cmpi.w	#$258,obj.var_30(a0)
	bne.s	loc_20D06C
	bra.s	loc_20D082

; ------------------------------------------------------------------------------

loc_20D06C:
	cmpi.w	#$348,obj.var_30(a0)
	bne.s	loc_20D076
	bra.s	loc_20D082

; ------------------------------------------------------------------------------

loc_20D076:
	cmpi.w	#$438,obj.var_30(a0)
	bne.s	locret_20D080
	bra.s	loc_20D082

; ------------------------------------------------------------------------------

locret_20D080:
	rts

; ------------------------------------------------------------------------------

loc_20D082:
	cmpi.b	#5,obj.var_3b(a0)
	bcc.s	locret_20D0BA
	jsr	SpawnObject
	beq.s	loc_20D094
	rts

; ------------------------------------------------------------------------------

loc_20D094:
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

locret_20D0BA:
	rts

; ------------------------------------------------------------------------------

SpikeCrusherObject_0_Routine6:
	rts

; ------------------------------------------------------------------------------

loc_20D0BE:
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#SpikeCrusherSprites,obj.sprite_data(a0)
	move.w	#$4400,obj.sprite_tile(a0)
	move.b	#6,obj.sprite_frame(a0)
	move.w	obj.var_34(a0),d0
	beq.s	loc2_20d10e
	movea.w	d0,a1
	cmpi.b	#$33,0(a1)
	bne.s	loc2_20d10e
	move.w	$12(a1),obj.y_speed(a0)
	move.w	$C(a1),d0
	addi.w	#$C,d0
	move.w	d0,obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	move.b	byte_20D114(pc,d0.w),d0
	move.b	d0,obj.collide_type(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc2_20d10e:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

byte_20D114:
	dc.b	0
	dc.b	$9C
	dc.b	$9C
	dc.b	0
	dc.b	$9B
	dc.b	$9D

SpikeCrusherSprites:
	include	"sprites/r8/spike_crusher.asm"
	even

; ------------------------------------------------------------------------------

SpikesObject:
	cmpi.b	#$F8,obj.subtype(a0)
	beq.w	loc_20D408
	tst.b	obj.subtype(a0)
	bmi.w	loc_20D282
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D1B8(pc,d0.w),d0
	jsr	off_20D1B8(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20D1B8:
	dc.w	SpikesObject_2_Routine0-*
	dc.w	SpikesObject_2_Routine2-off_20D1B8

; ------------------------------------------------------------------------------

SpikesObject_2_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$43F0,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#BlockSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	jsr	SpawnObject
	beq.s	loc_20D1FA
	bra.w	SpikesObject_2_Routine2

; ------------------------------------------------------------------------------

loc_20D1FA:
	addq.b	#2,obj.routine(a0)
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20D22A
	move.b	#$A,0(a1)
	move.w	obj.x(a0),8(a1)
	move.w	obj.y(a0),$C(a1)
	move.b	#$E8,$39(a1)
	move.w	a0,$34(a1)
	move.b	obj.subtype(a0),$28(a1)
	bra.s	SpikesObject_2_Routine2

; ------------------------------------------------------------------------------

loc_20D22A:
	move.b	#$36,obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$E8,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)

SpikesObject_2_Routine2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20D278
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20D264
	neg.w	d0

loc_20D264:
	cmpi.w	#$20,d0
	bcc.s	locret_20D278
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	SolidObject

locret_20D278:
	rts

; ------------------------------------------------------------------------------

BlockSprites:
	include	"sprites/r8/block.asm"
	even

; ------------------------------------------------------------------------------

loc_20D282:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D2D6(pc,d0.w),d0
	jsr	off_20D2D6(pc,d0.w)
	jsr	DrawObject
	moveq	#0,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_20D2C6
	movea.w	d1,a1
	tst.b	0(a1)
	beq.s	loc_20D2D0
	move.w	8(a1),obj.x(a0)
	move.w	$C(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_20D2C6:
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20D2D0:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20D2D6:
	dc.w	SpikesObject_1_Routine0-*
	dc.w	SpikesObject_1_Routine2-off_20D2D6

; ------------------------------------------------------------------------------

SpikesObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$488,obj.sprite_tile(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	btst	#0,obj.subtype(a0)
	bne.s	SpikesObject_1_Routine2
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$12,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.b	#$83,obj.collide_type(a0)

SpikesObject_1_Routine2:
	moveq	#0,d5
	move.b	obj.subtype(a0),d5
	neg.b	d5
	cmpi.b	#5,d5
	bcc.s	loc_20D368
	cmpi.b	#3,d5
	bcc.s	loc_20D346
	bra.s	loc_20D382

; ------------------------------------------------------------------------------

loc_20D346:
	move.w	#$8488,obj.sprite_tile(a0)
	move.b	#$83,obj.collide_type(a0)
	tst.b	stage_layer
	beq.s	loc_20D382
	clr.b	obj.collide_type(a0)

loc_20D35E:
	lea	player_object,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

loc_20D368:
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$83,obj.collide_type(a0)
	tst.b	stage_layer
	bne.s	loc_20D382
	clr.b	obj.collide_type(a0)
	bra.s	loc_20D35E

; ------------------------------------------------------------------------------

loc_20D382:
	tst.b	obj.sprite_frame(a0)
	bne.w	loc_20D3E4
	clr.b	obj.collide_type(a0)
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20D3E2
	btst	#3,obj.flags(a0)
	beq.s	locret_20D3E2
	tst.b	warping
	bne.s	locret_20D3E2
	tst.b	invincible
	bne.s	locret_20D3E2
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	player_object,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20D3E0
	tst.w	obj.var_30(a0)
	bne.s	loc_20D3E0
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	HurtPlayer

loc_20D3E0:
	movea.l	(sp)+,a0

locret_20D3E2:
	rts

; ------------------------------------------------------------------------------

loc_20D3E4:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20D3F6
	lea	player_object,a1
	jsr	SolidObject

locret_20D3F6:
	rts

; ------------------------------------------------------------------------------

SpikesSprites:
	include	"sprites/r8/spikes.asm"
	even

; ------------------------------------------------------------------------------

loc_20D408:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D422(pc,d0.w),d0
	jsr	off_20D422(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D422:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20D422

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$44D8,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#LayerPlatformSprites,obj.sprite_data(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

SpikesObject_0_Routine2:
	tst.b	stage_layer
	bne.s	loc_20D45E
	lea	player_object,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

loc_20D45E:
	lea	player_object,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

LayerPlatformSprites:
	include	"sprites/r8/layer_platform.asm"
	even

; ------------------------------------------------------------------------------
