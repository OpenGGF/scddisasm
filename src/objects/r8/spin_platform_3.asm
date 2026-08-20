; ------------------------------------------------------------------------------

SpinPlatformObject:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20EE30
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2A,obj.id(a1)
	bne.w	loc_20EF68
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.var_2e(a1),d0
	bne.w	loc_20EF68
	move.w	obj.var_30(a0),d0
	cmp.w	obj.var_30(a1),d0
	bne.w	loc_20EF68

loc_20EE30:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EE56(pc,d0.w),d0
	jsr	off_20EE56(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype_2(a0)
	bmi.s	locret_20EE54
	move.w	obj.var_2e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20EE54:
	rts

; ------------------------------------------------------------------------------

off_20EE56:
	dc.w	SpinPlatformObject_0_Routine0-*
	dc.w	SpinPlatformObject_0_Routine2-off_20EE56
	dc.w	SpinPlatformObject_0_Routine4-off_20EE56
	dc.w	SpinPlatformObject_0_Routine6-off_20EE56

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine0:
	lea	off_20EFE8(pc),a5
	moveq	#0,d0
	move.b	obj.subtype_2(a0),d0
	add.w	d0,d0
	adda.w	(a5,d0.w),a5
	move.w	(a5)+,obj.var_2c(a0)
	lea	(a0),a6
	bsr.s	sub_20EEC0
	move.w	(a5)+,d6
	bra.s	loc_20EEBA

; ------------------------------------------------------------------------------

loc_20EE7A:
	jsr	SpawnObject
	beq.s	loc_20EE88
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EE88:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_2a(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	(a5)+,obj.var_2c(a1)
	move.w	obj.x(a0),d0
	move.w	obj.y(a0),d1
	add.w	(a5)+,d0
	add.w	(a5)+,d1
	move.w	d0,obj.x(a1)
	move.w	d1,obj.y(a1)
	lea	(a1),a6
	bsr.s	sub_20EEC0

loc_20EEBA:
	dbf	d6,loc_20EE7A
	rts

; ------------------------------------------------------------------------------

sub_20EEC0:
	move.b	#2,obj.routine(a6)
	ori.b	#4,obj.sprite_flags(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.b	#$10,obj.width(a6)
	move.b	#$10,obj.width_2(a6)
	move.b	#5,obj.height(a6)
	move.w	#$34C,obj.sprite_tile(a6)
	move.l	#SpinPlatformSprites,obj.sprite_data(a6)
	move.w	obj.x(a0),obj.var_2e(a6)
	move.w	obj.y(a0),obj.var_30(a6)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine2:
	move.b	#5,obj.height(a0)
	move.w	#$78,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)

SpinPlatformObject_0_Routine4:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	player_object,a1
	jsr	TopSolidObject
	sne	obj.var_3e(a0)
	addi.w	#-1,obj.var_2c(a0)
	bne.s	locret_20EF4E
	move.b	#$10,obj.height(a0)
	move.w	#$FF,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)
	tst.b	obj.var_3e(a0)
	beq.s	locret_20EF4E
	lea	player_object,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

locret_20EF4E:
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine6:
	lea	SpinPlatformAnims(pc),a1
	jsr	AnimateObject
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20EF66
	move.b	#2,obj.routine(a0)

locret_20EF66:
	rts

; ------------------------------------------------------------------------------

loc_20EF68:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SpinPlatformAnims:
	include	"src/anims/r8/spin_platform.asm"
	even

SpinPlatformSprites:
	include	"src/sprites/r8/spin_platform.asm"
	even

off_20EFE8:
	dc.w	word_20EFEC-off_20EFE8
	dc.w	word_20EFF0-off_20EFE8

word_20EFEC:
	dc.w	$3C
	dc.w	0

word_20EFF0:
	dc.w	$3C
	dc.w	1
	dc.w	$3C, $20, 0

; ------------------------------------------------------------------------------
