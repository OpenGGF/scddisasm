; ------------------------------------------------------------------------------

PropellerObject:
	tst.b	obj.subtype(a0)
	beq.s	loc_20CC6C
	bra.w	loc_20CE10

; ------------------------------------------------------------------------------

loc_20CC6C:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CC94(pc,d0.w),d0
	jsr	off_20CC94(pc,d0.w)
	lea	PropellerBaseAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_30(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20CC94:
	dc.w	PropellerObject_0_Routine0-*
	dc.w	PropellerObject_0_Routine2-off_20CC94
	dc.w	PropellerObject_0_Routine4-off_20CC94

; ------------------------------------------------------------------------------

PropellerObject_0_Routine0:
	move.w	obj.x(a0),obj.var_30(a0)
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$36A,obj.sprite_tile(a0)
	move.w	#$80,obj.var_2a(a0)
	move.l	#$10000,obj.var_2c(a0)
	move.l	#PropellerBaseSprites,obj.sprite_data(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$2E,obj.height(a0)
	jsr	SpawnObjectAfter
	beq.s	loc_20CCEC
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20CCEC:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_3e(a1)
	move.b	#1,obj.subtype(a1)
	lea	(a1),a2
	jsr	SpawnObjectAfter
	beq.s	loc_20CD0C
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20CD0C:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_3e(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	#-$2C,obj.var_3c(a1)
	move.w	#$14,obj.var_3c(a2)
	bset	#1,obj.sprite_flags(a2)
	bset	#1,obj.flags(a2)
	lea	(a1),a6
	bsr.s	sub_20CD3A
	lea	(a2),a6

; ------------------------------------------------------------------------------

sub_20CD3A:
	ori.b	#4,obj.sprite_flags(a6)
	move.w	#$36A,obj.sprite_tile(a6)
	move.w	a0,obj.var_3e(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.l	#PropellerBladeSprites,obj.sprite_data(a6)
	move.b	#$20,obj.width(a6)
	move.b	#$20,obj.width_2(a6)
	move.b	#$1C,obj.height(a6)
	rts

; ------------------------------------------------------------------------------

PropellerObject_0_Routine2:
	addq.w	#1,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20CD82
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)

locret_20CD82:
	rts

; ------------------------------------------------------------------------------

PropellerObject_0_Routine4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	jsr	CheckBlockDown
	add.w	d1,obj.y(a0)
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20CDA8
	neg.l	obj.var_2c(a0)
	move.w	#$80,obj.var_2a(a0)

locret_20CDA8:
	rts

; ------------------------------------------------------------------------------

PropellerBaseAnims:
	include	"anims/r8/propeller_base.asm"
	even

PropellerBaseSprites:
	include	"sprites/r8/propeller_base.asm"
	even

; ------------------------------------------------------------------------------

loc_20CE10:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$28,obj.id(a1)
	beq.s	loc_20CE22
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20CE22:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CE4E(pc,d0.w),d0
	jsr	off_20CE4E(pc,d0.w)
	movea.w	obj.var_3e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.w	obj.var_3c(a0),d0
	add.w	d0,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20CE4E:
	dc.w	PropellerObject_1_Routine0-*
	dc.w	PropellerObject_1_Routine2-off_20CE4E
	dc.w	PropellerObject_1_Routine4-off_20CE4E
	dc.w	PropellerObject_1_Routine6-off_20CE4E
	dc.w	PropellerObject_1_Routine8-off_20CE4E
	dc.w	PropellerObject_1_RoutineA-off_20CE4E
	dc.w	PropellerObject_1_RoutineC-off_20CE4E
	dc.w	PropellerObject_1_RoutineE-off_20CE4E
	dc.w	PropellerObject_1_Routine10-off_20CE4E

; ------------------------------------------------------------------------------

PropellerObject_1_Routine0:
	tst.b	obj.subtype(a0)
	bpl.s	loc_20CE6E
	move.b	#$A,obj.routine(a0)
	bra.s	PropellerObject_1_RoutineA

; ------------------------------------------------------------------------------

loc_20CE6E:
	move.b	#2,obj.routine(a0)
	bra.w	*+4

; ------------------------------------------------------------------------------

PropellerObject_1_Routine2:
	move.b	#6,obj.sprite_frame(a0)
	move.w	#5,obj.var_2a(a0)
	move.w	#0,obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)

PropellerObject_1_Routine4:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20CE9C
	addq.b	#2,obj.routine(a0)
	bra.s	PropellerObject_1_Routine6

; ------------------------------------------------------------------------------

locret_20CE9C:
	rts

; ------------------------------------------------------------------------------

PropellerObject_1_Routine6:
	move.b	#7,obj.sprite_frame(a0)
	move.w	#$49,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

PropellerObject_1_Routine8:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20CEBC
	addq.b	#2,obj.routine(a0)
	bra.s	PropellerObject_1_RoutineA

; ------------------------------------------------------------------------------

locret_20CEBC:
	rts

; ------------------------------------------------------------------------------

PropellerObject_1_RoutineA:
	move.b	#6,obj.sprite_frame(a0)
	move.w	#5,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

PropellerObject_1_RoutineC:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20CEDC
	addq.b	#2,obj.routine(a0)
	bra.s	PropellerObject_1_RoutineE

; ------------------------------------------------------------------------------

locret_20CEDC:
	rts

; ------------------------------------------------------------------------------

PropellerObject_1_RoutineE:
	move.w	#$FF,obj.anim_id(a0)
	move.w	#$49,obj.var_2a(a0)
	move.w	#$A800,obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)

PropellerObject_1_Routine10:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20CF06
	addi.b	#-$E,obj.routine(a0)
	bra.w	PropellerObject_1_Routine2

; ------------------------------------------------------------------------------

loc_20CF06:
	lea	PropellerBladeAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

PropellerBladeAnims:
	include	"anims/r8/propeller_blade.asm"
	even

PropellerBladeSprites:
	include	"sprites/r8/propeller_blade.asm"
	even

; ------------------------------------------------------------------------------
