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
	lea	Ani_20CDAA(pc),a1
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
	move.l	#Spr_20CDB0,obj.sprite_data(a0)
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
	move.l	#off_20CF1A,obj.sprite_data(a6)
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

Ani_20CDAA:
	dc.w	@Ani_20CDAA_0-*
@Ani_20CDAA_0:
	dc.b	$A
	dc.b	0, 1
	dc.b	$FF
Spr_20CDB0:
	dc.w	@Spr_20CDB0_0-*
	dc.w	@Spr_20CDB0_1-Spr_20CDB0
@Spr_20CDB0_0:
	dc.b	9
	dc.b	$D8, 0, 0, $2D, $FC
	dc.b	$E0, 0, 0, $2D, $FC
	dc.b	$E8, 0, 0, $2D, $FC
	dc.b	$F0, 0, 0, $2D, $FC
	dc.b	$F8, 0, 0, $2D, $FC
	dc.b	0, 0, 0, $2D, $FC
	dc.b	8, 0, 0, $2D, $FC
	dc.b	$18, 0, 0, $2D, $FC
	dc.b	$20, 5, 0, $25, $F8
@Spr_20CDB0_1:
	dc.b	9
	dc.b	$D8, 0, 0, $2D, $FC
	dc.b	$E0, 0, 0, $2D, $FC
	dc.b	$E8, 0, 0, $2D, $FC
	dc.b	$F0, 0, 0, $2D, $FC
	dc.b	$F8, 0, 0, $2D, $FC
	dc.b	0, 0, 0, $2D, $FC
	dc.b	8, 0, 0, $2D, $FC
	dc.b	$18, 0, 0, $2D, $FC
	dc.b	$20, 5, 0, $29, $F8

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
	lea	Ani_20CF10(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

Ani_20CF10:
	dc.w	@Ani_20CF10_0-*
@Ani_20CF10_0:
	dc.b	2
	dc.b	0, 1, 2, 3, 4, 5
	dc.b	$FF
off_20CF1A:
	dc.w	byte_20CF2A-*
	dc.w	byte_20CF35-off_20CF1A
	dc.w	byte_20CF40-off_20CF1A
	dc.w	byte_20CF46-off_20CF1A
	dc.w	byte_20CF4C-off_20CF1A
	dc.w	byte_20CF52-off_20CF1A
	dc.w	byte_20CF5D-off_20CF1A
	dc.w	byte_20CF68-off_20CF1A
byte_20CF2A:
	dc.b	2
	dc.b	$FC, $C, 0, 0, $E0
	dc.b	$FC, $C, 8, 0, 0
byte_20CF35:
	dc.b	2
	dc.b	$FC, 8, 0, 4, $E8
	dc.b	$FC, 8, 0, 7, 0
byte_20CF40:
	dc.b	1
	dc.b	$FC, $C, 0, $A, $F0
byte_20CF46:
	dc.b	1
	dc.b	$FC, 0, 0, $E, $FC
byte_20CF4C:
	dc.b	1
	dc.b	$FC, $C, 8, $A, $F0
byte_20CF52:
	dc.b	2
	dc.b	$FC, 8, 0, 4, $E8
	dc.b	$FC, 8, 0, 7, 0
byte_20CF5D:
	dc.b	2
	dc.b	$FC, 4, 0, $F, $F8
	dc.b	4, $D, 0, $11, $F0
byte_20CF68:
	dc.b	1
	dc.b	$FC, $B, 0, $19, $F4

; ------------------------------------------------------------------------------