; ------------------------------------------------------------------------------

PointsPocketObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20B5EA
	bra.w	loc_20B8B8

; ------------------------------------------------------------------------------

loc_20B5EA:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B604(pc,d0.w),d0
	jsr	off_20B604(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B604:
	dc.w	PointsPocketObject_0_Routine0-*
	dc.w	PointsPocketObject_0_Routine2-off_20B604
	dc.w	PointsPocketObject_0_Routine4-off_20B604
	dc.w	PointsPocketObject_0_Routine6-off_20B604
	dc.w	PointsPocketObject_0_Routine8-off_20B604
	dc.w	PointsPocketObject_0_RoutineA-off_20B604
	dc.w	PointsPocketObject_0_RoutineC-off_20B604
	dc.w	PointsPocketObject_0_RoutineE-off_20B604
	dc.w	PointsPocketObject_0_Routine10-off_20B604
	dc.w	PointsPocketObject_0_Routine12-off_20B604
	dc.w	PointsPocketObject_0_Routine14-off_20B604

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine0:
	cmpi.b	#2,(time_zone).l
	bne.w	loc_20B636
	tst.b	(good_future).l
	beq.w	loc_20B636
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20B636:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.w	#$3AF,obj.sprite_tile(a0)
	move.l	#Spr_20B88E,obj.sprite_data(a0)
	move.w	#7,obj.var_30(a0)

PointsPocketObject_0_Routine2:
	tst.w	(debug_mode).l
	bne.w	locret_20B678
	lea	(player_object).w,a6
	lea	obj.var_3e(a0),a5
	bsr.w	sub_20B67A
	tst.b	obj.var_3e(a0)
	bne.w	loc_20B6FE

locret_20B678:
	rts

; ------------------------------------------------------------------------------

sub_20B67A:
	tst.w	obj.y_speed(a6)
	bmi.w	locret_20B6FC
	cmpi.b	#4,obj.routine(a6)
	beq.w	locret_20B6FC
	cmpi.b	#6,obj.routine(a6)
	beq.w	locret_20B6FC
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$18,d0
	subi.w	#$10,d0
	bcc.w	locret_20B6FC
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$18,d0
	subi.w	#$30,d0
	bcc.w	locret_20B6FC
	st	(a5)
	bset	#0,obj.var_2c(a6)
	bset	#2,obj.flags(a6)
	move.b	#$E,obj.height(a6)
	move.b	#7,obj.width(a6)
	move.b	#2,obj.anim_id(a6)
	move.w	#0,obj.x_speed(a6)
	move.w	#-$800,obj.y_speed(a6)
	move.w	obj.x(a0),obj.x(a6)
	move.w	obj.y(a0),d0
	addi.w	#-$10,d0
	move.w	d0,obj.y(a6)

locret_20B6FC:
	rts

; ------------------------------------------------------------------------------

loc_20B6FE:
	addq.b	#2,obj.routine(a0)
	move.w	#8,obj.var_2a(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.w	#$D7,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine4:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B760
	addq.b	#2,obj.routine(a0)
	move.b	#2,obj.sprite_frame(a0)
	move.w	#6,obj.var_2a(a0)
	jsr	SpawnObject
	bne.w	loc_20B762
	move.w	a1,obj.var_2c(a0)
	move.w	a0,obj.var_2e(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	lea	(player_object).w,a6
	bset	#6,obj.var_2c(a6)

locret_20B760:
	rts

; ------------------------------------------------------------------------------

loc_20B762:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine6:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B782
	addq.b	#2,obj.routine(a0)
	move.w	#2,obj.var_2a(a0)
	move.b	#3,obj.sprite_frame(a0)

locret_20B782:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine8:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B79E
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	move.b	#0,obj.sprite_frame(a0)

locret_20B79E:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_RoutineA:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B7CA
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	tst.w	obj.var_30(a0)
	beq.s	locret_20B7CA
	subq.w	#1,obj.var_30(a0)
	moveq	#10,d0
	bsr.w	AddPoints
	moveq	#0,d1
	bra.w	SpawnPoints

; ------------------------------------------------------------------------------

locret_20B7CA:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_RoutineC:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B7F6
	addq.b	#2,obj.routine(a0)
	move.w	#$1E,obj.var_2a(a0)
	tst.w	obj.var_30(a0)
	beq.s	locret_20B7F6
	subq.w	#1,obj.var_30(a0)
	moveq	#10,d0
	bsr.w	AddPoints
	moveq	#0,d1
	bra.w	SpawnPoints

; ------------------------------------------------------------------------------

locret_20B7F6:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_RoutineE:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B812
	addq.b	#2,obj.routine(a0)
	move.w	#4,obj.var_2a(a0)
	move.b	#3,obj.sprite_frame(a0)

locret_20B812:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine10:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B82E
	addq.b	#2,obj.routine(a0)
	move.w	#6,obj.var_2a(a0)
	move.b	#2,obj.sprite_frame(a0)

locret_20B82E:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine12:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B876
	move.w	#$9F,d0
	jsr	PlayFmSound
	addq.b	#2,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.w	#$78,obj.var_2a(a0)
	movea.w	obj.var_2c(a0),a1
	move.b	#4,obj.routine(a1)
	tst.b	obj.var_3e(a0)
	beq.w	locret_20B876
	sf	obj.var_3e(a0)
	bclr	#0,(player_object+obj.var_2c).w
	bclr	#6,(player_object+obj.var_2c).w

locret_20B876:
	rts

; ------------------------------------------------------------------------------

PointsPocketObject_0_Routine14:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	locret_20B88C
	move.b	#2,obj.routine(a0)
	sf	obj.var_3e(a0)

locret_20B88C:
	rts

; ------------------------------------------------------------------------------

Spr_20B88E:
	dc.w	@Spr_20B88E_0-*
	dc.w	@Spr_20B88E_1-Spr_20B88E
	dc.w	@Spr_20B88E_2-Spr_20B88E
	dc.w	@Spr_20B88E_3-Spr_20B88E

@Spr_20B88E_0:
	dc.b	0

@Spr_20B88E_1:
	dc.b	2
	dc.b	$F8, 9, $C0, 0, $E8
	dc.b	$F8, 9, $C8, 0, 0

@Spr_20B88E_2:
	dc.b	2
	dc.b	$E8, 5, 0, 6, $F0
	dc.b	$E8, 5, 8, 6, 0

@Spr_20B88E_3:
	dc.b	2
	dc.b	$F0, 0, 0, $A, $F8
	dc.b	$F0, 0, 8, $A, 0

; ------------------------------------------------------------------------------

loc_20B8B8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B8C6(pc,d0.w),d0
	jmp	off_20B8C6(pc,d0.w)

; ------------------------------------------------------------------------------

off_20B8C6:
	dc.w	PointsPocketObject_1_Routine0-*
	dc.w	PointsPocketObject_1_Routine2-off_20B8C6
	dc.w	PointsPocketObject_1_Routine4-off_20B8C6

; ------------------------------------------------------------------------------

PointsPocketObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$43AF,obj.sprite_tile(a0)
	move.l	#Spr_20B926,obj.sprite_data(a0)

PointsPocketObject_1_Routine2:
	movea.w	obj.var_2e(a0),a1
	cmpi.b	#$2F,0(a1)
	beq.w	loc_20B90A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20B90A:
	lea	PointsPocketAnims(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

PointsPocketObject_1_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PointsPocketAnims:
	include	"src/anims/r3/points_pocket.asm"
	even

Spr_20B926:
	dc.w	@Spr_20B926_0-*
	dc.w	@Spr_20B926_1-Spr_20B926

@Spr_20B926_0:
	dc.b	2
	dc.b	$F8, 9, 0, 0, $E8
	dc.b	$F8, 9, 8, 0, 0

@Spr_20B926_1:
	dc.b	0

; ------------------------------------------------------------------------------