; ------------------------------------------------------------------------------

LampObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D40A(pc,d0.w),d0
	jsr	off_20D40A(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20D40A:
	dc.w	LampObject_0_Routine0-*
	dc.w	LampObject_0_Routine2-off_20D40A
	dc.w	LampObject_0_Routine4-off_20D40A

; ------------------------------------------------------------------------------

LampObject_0_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.w	#$451C,obj.sprite_tile(a0)
	move.l	#Spr_20D56E,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)
	tst.b	obj.subtype(a0)
	bne.s	loc_20D450
	jsr	SpawnObjectAfter
	bne.s	loc_20D450
	move.b	#$36,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	a1,obj.var_2e(a0)
	move.w	a0,obj.var_2e(a1)

loc_20D450:
	tst.b	obj.subtype(a0)
	bne.s	loc_20D46A
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D46A:
	move.b	#1,obj.sprite_frame(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$70,obj.height(a0)
	move.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

LampObject_0_Routine2:
	bsr.w	sub_20D4FA
	move.w	d0,obj.var_30(a0)
	move.w	#$160,obj.var_32(a0)
	move.w	scroll_fg_y,d0
	subi.w	#$160,d0
	ext.l	d0
	divs.w	#3,d0
	sub.w	d0,obj.var_32(a0)
	move.w	obj.var_32(a0),d0
	addi.w	#$C,d0
	move.w	scroll_fg_y,d1
	cmp.w	d0,d1
	bge.s	loc_20D4D4
	move.w	obj.var_30(a0),obj.x(a0)
	move.w	obj.var_32(a0),obj.y(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D4D4:
	move.w	obj.var_30(a0),obj.x(a0)
	move.w	obj.var_32(a0),obj.y(a0)
	addi.w	#$15C,obj.y(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$70,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D4FA:
	moveq	#0,d0
	moveq	#0,d1
	move.w	scroll_fg_x,d0
	divu.w	#$140,d0
	cmpi.w	#$30,d0
	ble.s	loc_20D510
	move.w	#0,d0

loc_20D510:
	move.l	d0,d1
	addq.w	#1,d0
	andi.l	#$FFFF,d0
	mulu.w	#$140,d0
	addi.w	#$100,d0
	swap	d1
	andi.l	#$FFFF,d1
	mulu.w	#$100,d1
	divu.w	#$140,d1
	sub.w	d1,d0
	rts

; ------------------------------------------------------------------------------

LampObject_0_Routine4:
	movea.w	obj.var_2e(a0),a1
	move.w	$30(a1),obj.x(a0)
	move.w	$32(a1),obj.y(a0)
	addi.w	#$7C,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bls.s	locret_20D56C
	rts

; ------------------------------------------------------------------------------

locret_20D56C:
	rts

; ------------------------------------------------------------------------------

Spr_20D56E:
	dc.w	@Spr_20D56E_0-*
	dc.w	@Spr_20D56E_1-Spr_20D56E

@Spr_20D56E_0:
	dc.b	2
	dc.b	$F4, $A, $80, 0, $E8
	dc.b	$F4, $A, $88, 0, 0
	dc.b	0

@Spr_20D56E_1:
	dc.b	7
	dc.b	$90, 7, $80, 9, $F8
	dc.b	$B0, 7, $80, 9, $F8
	dc.b	$D0, 7, $80, 9, $F8
	dc.b	$F0, 7, $80, 9, $F8
	dc.b	$10, 7, $80, 9, $F8
	dc.b	$30, 7, $80, 9, $F8
	dc.b	$50, 7, $80, 9, $F8

; ------------------------------------------------------------------------------
