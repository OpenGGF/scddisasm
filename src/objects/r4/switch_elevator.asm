; ------------------------------------------------------------------------------

SwitchObject2:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E622(pc,d0.w),d0
	jsr	off_20E622(pc,d0.w)
	jsr	sub_20E626
	move.w	obj.var_34(a0),d0
	beq.s	loc_20E612
	movea.w	d0,a1
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	obj.x(a1),d0
	move.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	obj.y(a1),d0
	move.w	d0,obj.y(a0)

loc_20E612:
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20E622:
	dc.w	SwitchObject2_0_Routine0-*
	dc.w	SwitchObject2_0_Routine2-off_20E622

; ------------------------------------------------------------------------------

sub_20E626:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

SwitchObject2_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$50A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#SwitchSprites2,obj.sprite_data(a0)
	tst.w	obj.var_36(a0)
	bne.s	loc_20E662
	move.w	obj.x(a0),obj.var_36(a0)

loc_20E662:
	move.b	#$E,obj.width_2(a0)
	move.b	#5,obj.height(a0)

SwitchObject2_0_Routine2:
	lea	player_object,a1
	jsr	sub_20E69A(pc)
	bne.s	loc_20E680
	bclr	#0,obj.subtype(a0)
	bra.s	loc_20E686

; ------------------------------------------------------------------------------

loc_20E680:
	bset	#0,obj.subtype(a0)

loc_20E686:
	tst.b	obj.subtype(a0)
	beq.s	loc_20E694
	move.b	#1,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E694:
	clr.b	obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

sub_20E69A:
	move.b	obj.width_2(a0),d1
	ext.w	d1
	addq.w	#8,d1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	loc_20E6D6
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20E6D6
	move.w	obj.y(a1),d2
	move.b	obj.height(a1),d1
	ext.w	d1
	add.w	d2,d1
	move.w	obj.y(a0),d0
	subi.w	#$10,d0
	sub.w	d1,d0
	bhi.s	loc_20E6D6
	cmpi.w	#-$10,d0
	bcs.s	loc_20E6D6
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20E6D6:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

SwitchSprites2:
	include	"src/sprites/r4/switch_2.asm"
	even

; ------------------------------------------------------------------------------

SwitchElevatorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E75E(pc,d0.w),d0
	jsr	off_20E75E(pc,d0.w)
	bsr.s	sub_20E762
	tst.b	obj.var_3c(a0)
	beq.s	loc_20E734
	move.w	obj.var_34(a0),d0
	beq.s	loc_20E734
	movea.w	d0,a1
	cmpi.b	#$30,obj.id(a1)
	bne.s	loc_20E758
	move.w	obj.x(a1),d0
	addi.w	#-$20,d0
	move.w	d0,obj.x(a0)
	move.w	obj.y(a1),d0
	addi.w	#$20,d0
	move.w	d0,obj.y(a0)

loc_20E734:
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20E758
	rts

; ------------------------------------------------------------------------------

loc_20E758:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20E75E:
	dc.w	SwitchElevatorObject_0_Routine0-*
	dc.w	SwitchElevatorObject_0_Routine2-off_20E75E

; ------------------------------------------------------------------------------

sub_20E762:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

SwitchElevatorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#SwitchElevatorSprites,obj.sprite_data(a0)
	tst.b	obj.var_3c(a0)
	bne.w	SwitchElevatorObject_0_Routine2
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	addi.w	#$10,obj.x(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	move.b	#1,obj.sprite_frame(a0)
	jsr	SpawnObjectAfter
	beq.s	loc_20E7CC
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E7CC:
	move.b	obj.id(a0),obj.id(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.var_32(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$20,obj.height(a1)
	move.b	#1,obj.var_3c(a1)
	move.w	obj.y(a0),d0
	addi.w	#$20,d0
	move.w	d0,obj.y(a1)
	move.w	obj.x(a0),d0
	addi.w	#-$20,d0
	move.w	d0,obj.x(a1)
	move.w	a0,obj.var_34(a1)
	move.w	a1,obj.var_34(a0)
	move.b	#2,obj.sprite_frame(a1)
	jsr	SpawnObjectAfter
	beq.s	loc_20E824
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E824:
	move.b	#$31,obj.id(a1)
	move.w	a0,obj.var_34(a1)
	move.w	a1,obj.var_30(a0)
	move.b	#$BC,obj.var_39(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.var_32(a1)

SwitchElevatorObject_0_Routine2:
	tst.b	obj.var_3c(a0)
	beq.s	loc_20E84C

locret_20E84A:
	rts

; ------------------------------------------------------------------------------

loc_20E84C:
	move.l	obj.y(a0),-(sp)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20E866
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20E87A
	clr.w	obj.y_speed(a0)
	bra.s	loc_20E87A

; ------------------------------------------------------------------------------

loc_20E866:
	subi.w	#$40,obj.y(a0)
	jsr	CheckBlockUp
	tst.w	d1
	bpl.s	loc_20E87A
	clr.w	obj.y_speed(a0)

loc_20E87A:
	move.l	(sp)+,obj.y(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_34(a0),d0
	beq.s	loc_20E8A0
	movea.w	d0,a1
	cmpi.b	#$30,obj.id(a1)
	bne.s	loc_20E8A0
	move.w	obj.y_speed(a0),obj.y_speed(a1)

loc_20E8A0:
	move.w	obj.var_30(a0),d0
	beq.s	locret_20E84A
	movea.w	d0,a1
	cmpi.b	#$31,obj.id(a1)
	bne.s	locret_20E84A
	move.b	obj.subtype(a1),d0
	andi.b	#3,d0
	bne.s	loc_20E8D0
	addq.w	#8,obj.y_speed(a0)
	bmi.s	locret_20E8CE
	cmpi.w	#$100,obj.y_speed(a0)
	bcs.s	locret_20E8CE
	move.w	#$100,obj.y_speed(a0)

locret_20E8CE:
	rts

; ------------------------------------------------------------------------------

loc_20E8D0:
	subq.w	#8,obj.y_speed(a0)
	bpl.s	locret_20E8E4
	cmpi.w	#-$100,obj.y_speed(a0)
	bcc.s	locret_20E8E4
	move.w	#-$100,obj.y_speed(a0)

locret_20E8E4:
	rts

; ------------------------------------------------------------------------------

SwitchElevatorSprites:
	include	"src/sprites/r4/switch_elevator.asm"
	even

; ------------------------------------------------------------------------------
