; ------------------------------------------------------------------------------

ProjectorObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20F67E
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F4BC(pc,d0.w),d0
	jsr	off_20F4BC(pc,d0.w)
	jsr	DrawObject
	cmpi.b	#2,obj.routine(a0)
	bgt.s	locret_20F4BA
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_20F4BA:
	rts

; ------------------------------------------------------------------------------

off_20F4BC:
	dc.w	ProjectorObject_0_Routine0-*
	dc.w	ProjectorObject_0_Routine2-off_20F4BC
	dc.w	ProjectorObject_0_Routine4-off_20F4BC
	dc.w	ProjectorObject_0_Routine6-off_20F4BC
	dc.w	ProjectorObject_0_Routine8-off_20F4BC

; ------------------------------------------------------------------------------

loc_20F4C6:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine0:
	tst.b	projector_destroyed
	bne.s	loc_20F4C6
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$C,obj.width(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$FB,obj.collide_type(a0)
	move.w	#$3B0,obj.sprite_tile(a0)
	move.l	#HologramSprites,obj.sprite_data(a0)
	move.l	#byte_20F772,obj.var_2c(a0)
	jsr	SpawnObject
	bne.w	loc_20F4C6
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$15,obj.x(a1)
	subq.w	#7,obj.y(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	bne.w	loc_20F4C6
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$58,obj.x(a1)
	subq.w	#4,obj.y(a1)
	move.b	#1,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	bne.w	loc_20F4C6
	move.b	#$2F,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$4C,obj.x(a1)
	addi.w	#-$1C,obj.y(a1)
	move.b	#$80,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	bne.w	loc_20F4C6
	move.b	#$2F,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$54,obj.x(a1)
	addi.w	#-$11,obj.y(a1)
	move.b	#$81,obj.subtype(a1)
	move.w	a0,obj.var_3e(a1)

ProjectorObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20F5E4
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)

loc_20F5E4:
	lea	player_object,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	st	obj.var_3f(a0)
	lea	player_object,a1
	jsr	SolidObject
	beq.s	ProjectorObject_0_Routine6
	jsr	GetOffObject

ProjectorObject_0_Routine6:
	movea.l	obj.var_2c(a0),a6
	move.b	(a6)+,d0
	bmi.s	loc_20F660
	addq.b	#1,obj.var_2a(a0)
	cmp.b	obj.var_2a(a0),d0
	bne.s	locret_20F65E
	move.b	(a6)+,d5
	move.b	(a6)+,d6
	move.l	a6,obj.var_2c(a0)
	ext.w	d5
	ext.w	d6
	jsr	SpawnObject
	bne.s	locret_20F65E
	move.b	#$18,obj.id(a1)
	move.b	#1,obj.routine_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	d5,obj.x(a1)
	add.w	d6,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20F65E:
	rts

; ------------------------------------------------------------------------------

loc_20F660:
	addq.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

ProjectorObject_0_Routine8:
	subq.w	#1,obj.var_2a(a0)
	bne.s	locret_20F67C
	st	projector_destroyed
	bra.w	loc_20F4C6

; ------------------------------------------------------------------------------

locret_20F67C:
	rts

; ------------------------------------------------------------------------------

loc_20F67E:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$52,0(a1)
	bne.w	loc_20F4C6
	tst.b	$3F(a1)
	bne.w	loc_20F4C6
	tst.b	obj.routine(a0)
	bne.s	loc_20F6DA
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$3B0,obj.sprite_tile(a0)
	move.l	#HologramSprites,obj.sprite_data(a0)
	moveq	#8,d0
	moveq	#4,d1
	moveq	#0,d2
	tst.b	obj.subtype(a0)
	bmi.s	loc_20F6CA
	moveq	#$14,d0
	moveq	#$18,d1
	moveq	#1,d2

loc_20F6CA:
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)
	move.b	d2,obj.anim_id(a0)

loc_20F6DA:
	lea	HologramAnims(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

HologramAnims:
	include	"src/anims/hologram.asm"
	even

HologramSprites:
	include	"src/sprites/hologram.asm"
	even

byte_20F772:
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
