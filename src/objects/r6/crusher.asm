; ------------------------------------------------------------------------------

CrusherObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D092(pc,d0.w),d0
	jsr	off_20D092(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D092:
	dc.w	CrusherObject_0_Routine0-*
	dc.w	CrusherObject_0_Routine2-off_20D092
	dc.w	CrusherObject_0_Routine4-off_20D092
	dc.w	CrusherObject_0_Routine6-off_20D092
	dc.w	CrusherObject_0_Routine8-off_20D092

; ------------------------------------------------------------------------------

loc_20D09C:
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

CrusherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$44E8,obj.sprite_tile(a0)
	move.l	#CrusherSprites,obj.sprite_data(a0)
	move.b	#$50,obj.height(a0)
	move.b	#$30,obj.width_2(a0)
	move.w	obj.y(a0),obj.var_32(a0)

CrusherObject_0_Routine2:
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	loc_20D0EE
	neg.w	d0

loc_20D0EE:
	cmpi.w	#$C0,d0
	bcc.s	loc_20D110
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bcs.s	loc_20D110
	cmpi.w	#$88,d0
	bcc.s	loc_20D110
	clr.b	obj.var_3c(a0)
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

loc_20D110:
	bra.w	loc_20D09C

; ------------------------------------------------------------------------------

CrusherObject_0_Routine4:
	clr.b	obj.var_3c(a0)
	jsr	sub_20D17A(pc)
	cmpi.b	#2,obj.var_3b(a0)
	bne.s	loc_20D128
	addq.b	#2,obj.routine(a0)

loc_20D128:
	bra.w	loc_20D09C

; ------------------------------------------------------------------------------

CrusherObject_0_Routine6:
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	loc_20D13C
	neg.w	d0

loc_20D13C:
	cmpi.w	#$C0,d0
	bcc.s	loc2_20D15A
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcs.s	loc2_20D15A
	cmpi.w	#$88,d0
	bcs.s	loc2_20D15A
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

loc2_20D15A:
	bra.w	loc_20D09C

; ------------------------------------------------------------------------------

CrusherObject_0_Routine8:
	move.b	#1,obj.var_3c(a0)
	jsr	sub_20D17A(pc)
	cmpi.b	#2,obj.var_3b(a0)
	bne.s	loc_20D176
	move.b	#2,obj.routine(a0)

loc_20D176:
	bra.w	loc_20D09C

; ------------------------------------------------------------------------------

sub_20D17A:
	lea	byte_20D1D0,a2
	tst.b	obj.var_3c(a0)
	beq.s	loc_20D18C
	lea	byte_20D1D8,a2

loc_20D18C:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20D1B0
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	asl.w	#2,d0
	lea	(a2,d0.w),a2
	move.b	(a2)+,obj.var_3a(a0)
	move.b	(a2)+,d0
	ext.w	d0
	move.w	d0,obj.var_3e(a0)
	move.w	(a2)+,obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D1B0:
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_3e(a0),d0
	add.w	d0,obj.y_speed(a0)
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20D1CE
	addq.b	#1,obj.var_3b(a0)

locret_20D1CE:
	rts

; ------------------------------------------------------------------------------

byte_20D1D0:
	dc.b	$40
	dc.b	8
	dc.w	0
	dc.b	$40
	dc.b	$F8
	dc.w	$200

byte_20D1D8:
	dc.b	$40
	dc.b	$F8
	dc.w	0
	dc.b	$40
	dc.b	8
	dc.w	-$200

CrusherSprites:
	include	"src/sprites/r6/crusher.asm"
	even

; ------------------------------------------------------------------------------
