; ------------------------------------------------------------------------------

SpinDiscObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A700(pc,d0.w),d1
	jmp	off_20A700(pc,d1.w)

; ------------------------------------------------------------------------------

off_20A700:
	dc.w	SpinDiscObject_0_Routine0-off_20A700
	dc.w	SpinDiscObject_0_Routine2-off_20A700

; ------------------------------------------------------------------------------

SpinDiscObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	move.b	#$18,obj.var_34(a0)
	move.b	#$48,obj.var_38(a0)
	move.b	obj.subtype(a0),d1
	andi.b	#$F,d1
	beq.s	loc_20A748
	move.b	#$10,obj.var_34(a0)
	move.b	#$30,obj.var_38(a0)

loc_20A748:
	move.b	obj.subtype(a0),d1
	andi.b	#$F0,d1
	ext.w	d1
	asl.w	#3,d1
	move.w	d1,obj.var_36(a0)
	move.b	obj.flags(a0),d0
	ror.b	#2,d0
	andi.b	#$C0,d0
	move.b	d0,obj.angle(a0)

SpinDiscObject_0_Routine2:
	bsr.w	sub_20A770
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

sub_20A770:
	moveq	#0,d2
	move.b	obj.var_38(a0),d2
	move.w	d2,d3
	add.w	d3,d3
	lea	(player_object).w,a1
	move.w	obj.x(a1),d0
	sub.w	obj.var_32(a0),d0
	add.w	d2,d0
	cmp.w	d3,d0
	bcc.s	loc_20A7A8
	move.w	obj.y(a1),d1
	sub.w	obj.var_30(a0),d1
	add.w	d2,d1
	cmp.w	d3,d1
	bcc.s	loc_20A7A8
	btst	#1,obj.flags(a1)
	beq.s	loc_20A7B8
	clr.b	obj.var_3a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20A7A8:
	tst.b	obj.var_3a(a0)
	beq.s	locret_20A7B6
	clr.b	obj.var_38(a1)
	clr.b	obj.var_3a(a0)

locret_20A7B6:
	rts

; ------------------------------------------------------------------------------

loc_20A7B8:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20A7E2
	move.b	#1,obj.var_3a(a0)
	btst	#2,obj.flags(a1)
	bne.s	loc_20A7D0
	clr.b	obj.anim_id(a1)

loc_20A7D0:
	bclr	#5,obj.flags(a1)
	move.b	#1,obj.prev_anim_id(a1)
	move.b	#1,obj.var_38(a1)

loc_20A7E2:
	move.w	obj.ground_speed(a1),d0
	tst.w	obj.var_36(a0)
	bpl.s	loc_20A808
	cmpi.w	#-$400,d0
	ble.s	loc_20A7FA
	move.w	#-$400,obj.ground_speed(a1)
	rts

; ------------------------------------------------------------------------------

loc_20A7FA:
	cmpi.w	#-$F00,d0
	bge.s	locret_20A806
	move.w	#-$F00,obj.ground_speed(a1)

locret_20A806:
	rts

; ------------------------------------------------------------------------------

loc_20A808:
	cmpi.w	#$400,d0
	bge.s	loc_20A816
	move.w	#$400,obj.ground_speed(a1)
	rts

; ------------------------------------------------------------------------------

loc_20A816:
	cmpi.w	#$F00,d0
	ble.s	locret_20A822
	move.w	#$F00,obj.ground_speed(a1)

locret_20A822:
	rts

; ------------------------------------------------------------------------------

	dc.w	byte_20A826-*
byte_20A826:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8

; ------------------------------------------------------------------------------