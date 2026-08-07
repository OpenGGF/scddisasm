; ------------------------------------------------------------------------------

ProjectorObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20EFF8
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EE22(pc,d0.w),d0
	jsr	off_20EE22(pc,d0.w)
	jsr	DrawObject
	cmpi.b	#2,obj.routine(a0)
	bgt.s	locret_20EE20
	jsr	CheckObjectDespawn
	tst.b	(a0)
	bne.s	locret_20EE20
	move.w	#4,d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

locret_20EE20:
	rts

; ------------------------------------------------------------------------------

off_20EE22:
	dc.w	ProjectorObject_0_Routine0-*
	dc.w	ProjectorObject_0_Routine2-off_20EE22
	dc.w	ProjectorObject_0_Routine4-off_20EE22
	dc.w	ProjectorObject_0_Routine6-off_20EE22
	dc.w	ProjectorObject_0_Routine8-off_20EE22

; ------------------------------------------------------------------------------

loc_20EE2C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine0:
	tst.b	(projector_destroyed).l
	bne.s	loc_20EE2C
	move.w	#5,d0
	jsr	AddGfxQueue
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$C,obj.width(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$FB,obj.collide_type(a0)
	move.w	#$33E,obj.sprite_tile(a0)
	move.l	#Spr_20F0A8,obj.sprite_data(a0)
	move.l	#byte_20F0EC,obj.var_2c(a0)
	jsr	SpawnObject
	bne.w	loc_20EE2C
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$15,obj.x(a1)
	subq.w	#7,obj.y(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	bne.w	loc_20EE2C
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$58,obj.x(a1)
	subq.w	#4,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	bne.w	loc_20EE2C
	move.b	#$39,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$58,obj.x(a1)
	addi.w	#-$18,obj.y(a1)
	move.b	#$80,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	bne.w	loc_20EE2C
	move.b	#$39,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$62,obj.x(a1)
	addi.w	#0,obj.y(a1)
	move.b	#$81,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)

ProjectorObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20EF54
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)

loc_20EF54:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	st	obj.var_3f(a0)
	move.w	#4,d0
	jsr	AddGfxQueue
	lea	(player_object).w,a1
	jsr	SolidObject
	beq.s	ProjectorObject_0_Routine6
	jsr	GetOffObject

ProjectorObject_0_Routine6:
	movea.l	obj.var_2c(a0),a6
	move.b	(a6)+,d0
	bmi.s	loc_20EFDA
	addq.b	#1,obj.var_2a(a0)
	cmp.b	obj.var_2a(a0),d0
	bne.s	locret_20EFD8
	move.b	(a6)+,d5
	move.b	(a6)+,d6
	move.l	a6,obj.var_2c(a0)
	ext.w	d5
	ext.w	d6
	jsr	SpawnObject
	bne.s	locret_20EFD8
	move.b	#$18,obj.id(a1)
	move.b	#1,obj.routine_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	d5,obj.x(a1)
	add.w	d6,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20EFD8:
	rts

; ------------------------------------------------------------------------------

loc_20EFDA:
	addq.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine8:
	subq.w	#1,obj.var_2a(a0)
	bne.s	locret_20EFF6
	st	(projector_destroyed).l
	bra.w	loc_20EE2C

; ------------------------------------------------------------------------------

locret_20EFF6:
	rts

; ------------------------------------------------------------------------------

loc_20EFF8:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$38,obj.id(a1)
	bne.w	loc_20EE2C
	tst.b	obj.var_3f(a1)
	bne.w	loc_20EE2C
	tst.b	obj.routine(a0)
	bne.s	loc_20F054
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$33E,obj.sprite_tile(a0)
	move.l	#Spr_20F0A8,obj.sprite_data(a0)
	moveq	#8,d0
	moveq	#4,d1
	moveq	#0,d2
	tst.b	obj.subtype(a0)
	bmi.s	loc_20F044
	moveq	#$14,d0
	moveq	#$18,d1
	moveq	#1,d2

loc_20F044:
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)
	move.b	d2,obj.anim_id(a0)

loc_20F054:
	lea	HologramAnims(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

HologramAnims:
	include	"src/anims/hologram.asm"
	even

Spr_20F0A8:
	dc.w	@Spr_20F0A8_0-*
	dc.w	@Spr_20F0A8_1-Spr_20F0A8
	dc.w	@Spr_20F0A8_2-Spr_20F0A8
	dc.w	@Spr_20F0A8_3-Spr_20F0A8
	dc.w	@Spr_20F0A8_4-Spr_20F0A8
	dc.w	@Spr_20F0A8_5-Spr_20F0A8

@Spr_20F0A8_0:
	dc.b	1
	dc.b	$F4, $A, 0, $28, $F4

@Spr_20F0A8_1:
	dc.b	0

@Spr_20F0A8_2:
	dc.b	1
	dc.b	$FC, 4, 0, $31, $F8

@Spr_20F0A8_3:
	dc.b	1
	dc.b	$FC, 4, $10, $31, $F8

@Spr_20F0A8_4:
	dc.b	3
	dc.b	$E8, $A, 8, 0, $FC
	dc.b	$F8, 5, 8, 9, $EC
	dc.b	0, 5, 8, $D, $FC

@Spr_20F0A8_5:
	dc.b	4
	dc.b	$E8, $F, 8, $11, $F4
	dc.b	$E8, 0, 8, $21, $EC
	dc.b	0, 1, 8, $22, $EC
	dc.b	8, $C, 8, $24, $F4

byte_20F0EC:
	dc.b	1, 0, 0
	dc.b	5, $EE, $F6
	dc.b	$A, $F6, $A
	dc.b	$F, 0, $EE
	dc.b	$14, $F6, $12
	dc.b	$16, 8, $17
	dc.b	$19, $D, $F6
	dc.b	$1C, $FD, $E7
	dc.b	$1E, $A, $14
	dc.b	$20, $F6, 2
	dc.b	$23, $D, $F6
	dc.b	$28, $F6, $A
	dc.b	$FF, 0

; ------------------------------------------------------------------------------