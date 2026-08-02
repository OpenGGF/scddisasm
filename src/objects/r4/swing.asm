; ------------------------------------------------------------------------------

SwingObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CFC2(pc,d0.w),d0
	jsr	off_20CFC2(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20CFBC
	rts

; ------------------------------------------------------------------------------

loc_20CFBC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20CFC2:
	dc.w	SwingObject_0_Routine0-*
	dc.w	SwingObject_0_Routine2-off_20CFC2

; ------------------------------------------------------------------------------

sub_20CFC6:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	TopSolidObject
	beq.s	locret_20CFF4
	move.w	obj.y(a0),d0
	move.b	obj.height(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.b	obj.height(a1),d1
	ext.w	d1
	sub.w	d1,d0
	addq.w	#2,d0
	move.w	d0,obj.y(a1)

locret_20CFF4:
	rts

; ------------------------------------------------------------------------------

SwingObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#Spr_20D13C,obj.sprite_data(a0)
	move.w	#$340,obj.sprite_tile(a0)
	cmpi.b	#1,obj.sprite_frame(a0)
	bne.s	loc_20D022
	addi.w	#$4000,obj.sprite_tile(a0)

loc_20D022:
	move.b	#$20,obj.width_2(a0)
	move.b	#$A,obj.height(a0)
	move.b	#$C0,obj.var_3a(a0)
	cmpi.b	#6,obj.var_3c(a0)
	bne.s	loc_20D066
	jsr	SpawnObjectAfter
	bne.s	loc_20D066
	move.b	#$27,obj.id(a1)
	move.w	a0,obj.var_34(a1)
	move.b	#$F0,obj.var_39(a1)
	move.b	#$10,obj.var_38(a1)
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	d0,obj.subtype(a1)

loc_20D066:
	tst.b	obj.var_3c(a0)
	bne.s	SwingObject_0_Routine2
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	moveq	#6,d1
	moveq	#5,d2

loc_20D07C:
	jsr	SpawnObject
	bne.s	loc_20D0B2
	move.b	#$29,obj.id(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.var_32(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	d1,obj.var_3c(a1)
	move.b	#2,obj.sprite_frame(a1)
	cmpi.b	#6,d1
	bne.s	loc_20D0B2
	move.b	#1,obj.sprite_frame(a1)

loc_20D0B2:
	subq.b	#1,d1
	dbf	d2,loc_20D07C

SwingObject_0_Routine2:
	move.l	obj.x(a0),d0
	move.l	obj.y(a0),d1
	movem.l	d0-d1,-(sp)
	jsr	sub_20D0F2(pc)
	movem.l	(sp)+,d0-d1
	cmpi.b	#6,obj.var_3c(a0)
	bne.s	locret_20D0F0
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	sub.l	d0,d2
	sub.l	d1,d3
	asr.l	#8,d2
	asr.l	#8,d3
	move.w	d2,obj.x_speed(a0)
	move.w	d3,obj.y_speed(a0)
	bsr.w	sub_20CFC6

locret_20D0F0:
	rts

; ------------------------------------------------------------------------------

sub_20D0F2:
	btst	#4,obj.subtype(a0)
	bne.s	loc_20D102
	subi.w	#$80,obj.var_3a(a0)
	bra.s	loc_20D108

; ------------------------------------------------------------------------------

loc_20D102:
	addi.w	#$100,obj.var_3a(a0)

loc_20D108:
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	moveq	#0,d2
	moveq	#0,d3
	moveq	#0,d4
	move.b	obj.var_3c(a0),d2
	beq.s	loc_20D126

loc_20D11E:
	add.w	d0,d3
	add.w	d1,d4
	subq.b	#1,d2
	bne.s	loc_20D11E

loc_20D126:
	asr.w	#4,d3
	asr.w	#4,d4
	add.w	obj.var_32(a0),d3
	add.w	obj.var_36(a0),d4
	move.w	d3,obj.y(a0)
	move.w	d4,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

Spr_20D13C:
	dc.w	@Spr_20D13C_0-*
	dc.w	@Spr_20D13C_1-Spr_20D13C
	dc.w	@Spr_20D13C_2-Spr_20D13C

@Spr_20D13C_0:
	dc.b	2
	dc.b	$F8, 1, 0, 8, $F8
	dc.b	$F8, 1, 8, 8, 0
	dc.b	0

@Spr_20D13C_1:
	dc.b	2
	dc.b	$F8, $D, 0, 0, $E0
	dc.b	$F8, $D, 8, 0, 0
	dc.b	0

@Spr_20D13C_2:
	dc.b	2
	dc.b	$F8, 1, 0, $A, $F8
	dc.b	$F8, 1, 8, $A, 0
	dc.b	0

; ------------------------------------------------------------------------------