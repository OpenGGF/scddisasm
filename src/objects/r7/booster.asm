; ------------------------------------------------------------------------------

BoosterObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C286(pc,d0.w),d0
	jsr	off_20C286(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20C286:
	dc.w	BoosterObject_0_Routine0-*
	dc.w	BoosterObject_0_Routine2-off_20C286
	dc.w	BoosterObject_0_Routine4-off_20C286
	dc.w	BoosterObject_0_Routine6-off_20C286

; ------------------------------------------------------------------------------

BoosterObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$300,obj.sprite_tile(a0)
	move.l	#Spr_20C41E,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#2,obj.sprite_frame(a0)
	tst.b	obj.subtype(a0)
	beq.s	BoosterObject_0_Routine2
	move.b	#0,obj.sprite_frame(a0)
	move.w	#-$800,obj.y_speed(a0)
	move.b	#6,obj.routine(a0)
	bra.s	BoosterObject_0_Routine6

; ------------------------------------------------------------------------------

BoosterObject_0_Routine2:
	bra.w	loc_20C326

; ------------------------------------------------------------------------------

BoosterObject_0_Routine4:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20C2EE
	jsr	MoveObject
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_20C2EC
	neg.w	obj.x_speed(a0)

locret_20C2EC:
	rts

; ------------------------------------------------------------------------------

loc_20C2EE:
	jsr	MoveObject
	move.w	obj.x(a0),d0
	cmp.w	obj.var_2c(a0),d0
	bne.s	locret_20C2EC
	subq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BoosterObject_0_Routine6:
	addi.w	#$40,obj.y_speed(a0)
	jsr	MoveObject
	move.w	(scroll_fg_y).w,d0
	addi.w	#$E8,d0
	cmp.w	obj.y(a0),d0
	bcc.s	locret_20C324
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20C324:
	rts

; ------------------------------------------------------------------------------

loc_20C326:
	tst.b	(debug_mode).l
	bne.s	locret_20C338
	lea	(player_object).w,a2
	bsr.s	sub_20C33A
	bne.w	loc_20C352

locret_20C338:
	rts

; ------------------------------------------------------------------------------

sub_20C33A:
	btst	#1,obj.flags(a2)
	beq.s	loc_20C346
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20C346:
	move.w	#$20,d2
	move.w	#$10,d3
	bra.w	loc_20BFA4

; ------------------------------------------------------------------------------

loc_20C352:
	clr.b	(player_object+obj.var_2c).w
	jsr	SpawnObject
	bne.s	loc_20C396
	move.b	#8,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#1,obj.subtype(a1)
	movea.l	a1,a3
	jsr	SpawnObject
	bne.s	loc_20C396
	move.b	#9,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subq.w	#6,obj.y(a1)

loc_20C396:
	move.w	#$CE,d0
	jsr	PlayFmSound
	addq.b	#2,obj.routine(a0)
	move.w	obj.x(a0),obj.var_2c(a0)
	move.b	#6,obj.var_2a(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcc.s	loc_20C3E6
	move.w	#-$1000,obj.x_speed(a2)
	bset	#0,obj.flags(a1)
	move.w	#$200,obj.x_speed(a3)
	addi.w	#$10,obj.x(a1)
	move.w	obj.x_speed(a2),obj.ground_speed(a2)
	move.w	#$800,obj.x_speed(a0)
	bset	#0,obj.flags(a2)
	rts

; ------------------------------------------------------------------------------

loc_20C3E6:
	move.w	#$1000,obj.x_speed(a2)
	bclr	#0,obj.flags(a1)
	move.w	#-$200,$10(a3)
	subi.w	#$10,obj.x(a1)
	move.w	obj.x_speed(a2),obj.ground_speed(a2)
	move.w	#-$800,obj.x_speed(a0)
	bclr	#0,obj.flags(a2)
	rts

; ------------------------------------------------------------------------------

Ani_20C412:
	dc.w	@Ani_20C412_0-*

@Ani_20C412_0:
	dc.b	5
	dc.b	1, 1, 1, 1, 1, 1, 1, 1
	dc.b	$FF

Spr_20C41E:
	dc.w	@Spr_20C41E_0-*
	dc.w	@Spr_20C41E_1-Spr_20C41E
	dc.w	@Spr_20C41E_2-Spr_20C41E
	dc.w	@Spr_20C41E_3-Spr_20C41E
	dc.w	@Spr_20C41E_4-Spr_20C41E

@Spr_20C41E_0:
	dc.b	1
	dc.b	$FC, 4, 0, 0, $F8

@Spr_20C41E_1:
	dc.b	1
	dc.b	$F8, 5, 0, 2, $F8

@Spr_20C41E_2:
	dc.b	2
	dc.b	$F4, $E, 0, 6, $E0
	dc.b	$F4, $E, 8, 6, 0
	dc.b	0

@Spr_20C41E_3:
	dc.b	2
	dc.b	$E0, $B, 0, $12, $F4
	dc.b	0, $B, $10, $12, $F4
	dc.b	0

@Spr_20C41E_4:
	dc.b	7
	dc.b	$E4, $A, 0, $1E, 4
	dc.b	$EC, 0, 0, $27, $FC
	dc.b	$F4, 5, 0, $28, $F4
	dc.b	$FC, 0, 0, $2C, $EC
	dc.b	$FC, 0, 0, $2D, 4
	dc.b	4, 0, 0, $2E, $FC
	dc.b	4, $A, 0, $2F, $E4

; ------------------------------------------------------------------------------