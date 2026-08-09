; ------------------------------------------------------------------------------

DoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CD1E(pc,d0.w),d0
	jsr	off_20CD1E(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20CD1E:
	dc.w	DoorObject_0_Routine0-*
	dc.w	DoorObject_0_Routine2-off_20CD1E
	dc.w	DoorObject_0_Routine4-off_20CD1E
	dc.w	DoorObject_0_Routine6-off_20CD1E

; ------------------------------------------------------------------------------

sub_20CD26:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

DoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$4440,obj.sprite_tile(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.l	#DoorSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.b	obj.subtype(a0),d0
	move.b	d0,d1
	andi.b	#$F,d1
	move.b	d1,obj.var_30(a0)
	asr.b	#4,d0
	andi.w	#$F,d0
	move.b	d0,obj.var_31(a0)
	asl.b	#2,d0
	lea	byte_20CD8A(pc,d0.w),a1
	move.b	(a1)+,obj.width_2(a0)
	move.b	(a1)+,obj.height(a0)
	move.b	(a1)+,obj.var_3b(a0)
	move.b	(a1)+,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

byte_20CD8A:
	dc.b	$40, 8, $80, 2
	dc.b	$40, 8, $80, 2
	dc.b	8, $20, $40, 1
	dc.b	8, $40, $80, 0
	dc.b	8, $40, $80, 0

; ------------------------------------------------------------------------------

DoorObject_0_Routine2:
	moveq	#0,d0
	move.b	obj.var_30(a0),d0
	lea	(switch_flags).w,a1
	btst	#7,(a1,d0.w)
	seq	obj.var_3c(a0)
	cmpi.b	#4,obj.var_31(a0)
	beq.s	loc_20CDC4
	tst.b	obj.var_3a(a0)
	beq.s	loc_20CDC4
	clr.b	obj.var_3c(a0)

loc_20CDC4:
	lea	(player_object).w,a1
	move.w	obj.x(a1),obj.var_38(a0)
	move.w	obj.y(a1),obj.var_3e(a0)
	jsr	sub_20CEB6(pc)
	bsr.w	sub_20CD26
	cmpi.b	#4,obj.var_31(a0)
	beq.s	locret_20CDF2
	move.b	obj.var_3a(a0),d0
	cmp.b	obj.var_3b(a0),d0
	bne.s	locret_20CDF2
	addq.b	#2,obj.routine(a0)

locret_20CDF2:
	rts

; ------------------------------------------------------------------------------

DoorObject_0_Routine4:
	moveq	#0,d0
	move.b	obj.var_31(a0),d0
	add.b	d0,d0
	move.w	off_20CE08(pc,d0.w),d0
	jsr	off_20CE08(pc,d0.w)
	bra.w	sub_20CD26

; ------------------------------------------------------------------------------

off_20CE08:
	dc.w	DoorObject_2_Routine0-*
	dc.w	DoorObject_2_Routine0-off_20CE08
	dc.w	DoorObject_2_Routine4-off_20CE08
	dc.w	DoorObject_2_Routine4-off_20CE08
	dc.w	DoorObject_2_Routine4-off_20CE08

; ------------------------------------------------------------------------------

DoorObject_2_Routine0:
	lea	(player_object).w,a1
	move.w	obj.y(a0),d0
	sub.w	obj.var_3e(a0),d0
	bcc.s	loc_20CE3A
	move.b	obj.height(a1),d0
	ext.w	d0
	add.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	locret_20CE56
	neg.w	d0
	cmpi.w	#$10,d0
	bcs.s	locret_20CE56
	bra.s	loc_20CE52

; ------------------------------------------------------------------------------

loc_20CE3A:
	move.b	obj.height(a1),d0
	neg.b	d0
	ext.w	d0
	add.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcs.s	locret_20CE56
	cmpi.b	#8,d0
	bcs.s	locret_20CE56

loc_20CE52:
	addq.b	#2,obj.routine(a0)

locret_20CE56:
	rts

; ------------------------------------------------------------------------------

DoorObject_2_Routine4:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d0
	sub.w	obj.var_38(a0),d0
	bcc.s	loc_20CE80
	move.b	obj.width(a1),d0
	ext.w	d0
	add.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	locret_20CE9C
	neg.w	d0
	cmpi.b	#8,d0
	bcs.s	locret_20CE9C
	bra.s	loc_20CE98

; ------------------------------------------------------------------------------

loc_20CE80:
	move.b	obj.width(a1),d0
	neg.b	d0
	ext.w	d0
	add.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcs.s	locret_20CE9C
	cmpi.b	#8,d0
	bcs.s	locret_20CE9C

loc_20CE98:
	addq.b	#2,obj.routine(a0)

locret_20CE9C:
	rts

; ------------------------------------------------------------------------------

DoorObject_0_Routine6:
	st	obj.var_3c(a0)
	jsr	sub_20CEB6(pc)
	tst.b	obj.var_3a(a0)
	bne.s	loc_20CEB2
	move.b	#2,obj.routine(a0)

loc_20CEB2:
	bra.w	sub_20CD26

; ------------------------------------------------------------------------------

sub_20CEB6:
	moveq	#0,d0
	move.b	obj.var_31(a0),d0
	add.b	d0,d0
	move.w	off_20CEC6(pc,d0.w),d0
	jmp	off_20CEC6(pc,d0.w)

; ------------------------------------------------------------------------------

off_20CEC6:
	dc.w	DoorObject_1_Routine0-*
	dc.w	DoorObject_1_Routine2-off_20CEC6
	dc.w	DoorObject_1_Routine4-off_20CEC6
	dc.w	DoorObject_1_Routine6-off_20CEC6
	dc.w	DoorObject_1_Routine4-off_20CEC6

; ------------------------------------------------------------------------------

DoorObject_1_Routine0:
	jsr	sub_20CF24(pc)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	neg.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

DoorObject_1_Routine2:
	jsr	sub_20CF24(pc)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

DoorObject_1_Routine4:
	jsr	sub_20CF24(pc)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

DoorObject_1_Routine6:
	jsr	sub_20CF24(pc)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20CF24:
	tst.b	obj.var_3c(a0)
	beq.s	loc_20CF36
	subq.b	#8,obj.var_3a(a0)
	bcc.s	locret_20CF4A
	clr.b	obj.var_3a(a0)
	bra.s	locret_20CF4A

; ------------------------------------------------------------------------------

loc_20CF36:
	addq.b	#8,obj.var_3a(a0)
	move.b	obj.var_3a(a0),d0
	cmp.b	obj.var_3b(a0),d0
	bcs.s	locret_20CF4A
	move.b	obj.var_3b(a0),obj.var_3a(a0)

locret_20CF4A:
	rts

; ------------------------------------------------------------------------------

DoorSprites:
	include	"src/sprites/r4/door.asm"
	even

; ------------------------------------------------------------------------------