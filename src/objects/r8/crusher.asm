; ------------------------------------------------------------------------------

CrusherObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BA78(pc,d0.w),d0
	jsr	off_20BA78(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20BA78:
	dc.w	CrusherObject_0_Routine0-*
	dc.w	CrusherObject_0_Routine2-off_20BA78

; ------------------------------------------------------------------------------

CrusherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#Spr_20BC8A,obj.sprite_data(a0)
	move.w	#$498,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	clr.w	obj.y_speed(a0)
	clr.w	obj.x_speed(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.b	d0,d1
	andi.w	#$30,d1
	lsr.w	#3,d1
	move.w	word_20BB04(pc,d1.w),d2
	move.w	d2,obj.var_32(a0)
	move.b	d0,d1
	andi.w	#$40,d1
	lsr.w	#5,d1
	move.w	word_20BB0C(pc,d1.w),d2
	move.w	d2,obj.var_36(a0)
	move.w	obj.var_32(a0),d2
	move.w	d0,d3
	lsr.w	#2,d2
	move.w	d2,d0
	jsr	SineCosine
	muls.w	obj.var_36(a0),d0
	lsr.l	#8,d0
	add.w	obj.var_30(a0),d0
	move.w	d0,obj.y(a0)
	move.w	d3,d0
	move.w	d0,d1
	andi.w	#3,d1
	lsl.w	#1,d1
	move.w	off_20BAFE(pc,d1.w),d1
	jmp	off_20BAFE(pc,d1.w)

; ------------------------------------------------------------------------------

off_20BAFE:
	dc.w	CrusherObject_1_Routine0-*
	dc.w	CrusherObject_1_Routine2-off_20BAFE
	dc.w	CrusherObject_1_Routine0-off_20BAFE
word_20BB04:
	dc.w	0
	dc.w	$100
	dc.w	$200
	dc.w	$300
word_20BB0C:
	dc.w	$20
	dc.w	$30
word_20BB10:
	dc.w	4
	dc.w	8
	dc.w	$10
	dc.w	$20

; ------------------------------------------------------------------------------

CrusherObject_1_Routine0:
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.b	d0,d1
	andi.w	#$C,d1
	lsr.w	#1,d1
	move.w	word_20BB10(pc,d1.w),d2
	move.w	d2,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

CrusherObject_1_Routine2:
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$60,obj.height(a0)
	move.b	d0,d1
	andi.w	#4,d1
	lsr.w	#1,d1
	move.w	word_20BB10(pc,d1.w),d2
	move.w	d2,obj.var_34(a0)
	move.b	d0,d1
	ext.w	d1
	andi.w	#8,d1
	lsr.w	#2,d1
	move.b	byte_20BB76(pc,d1.w),d2
	move.b	d2,obj.var_38(a0)
	clr.b	obj.var_3e(a0)
	rts

; ------------------------------------------------------------------------------

byte_20BB76:
	dc.b	60
	dc.b	90

; ------------------------------------------------------------------------------

CrusherObject_0_Routine2:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_20BB88
	lea	player_object,a1
	jsr	SolidObject

loc_20BB88:
	move.l	obj.y(a0),-(sp)
	moveq	#0,d0
	moveq	#0,d1
	move.b	obj.subtype(a0),d0
	andi.b	#3,d0
	cmpi.b	#1,d0
	bne.s	loc_20BBDE
	btst	#7,obj.var_3e(a0)
	beq.s	loc_20BBBA
	move.w	obj.y(a0),d0
	subq.b	#1,obj.var_3a(a0)
	bcc.w	loc_20BC02
	bclr	#7,obj.var_3e(a0)
	bra.s	loc_20BBDE

; ------------------------------------------------------------------------------

loc_20BBBA:
	move.w	obj.var_32(a0),d0
	cmpi.w	#$100,d0
	beq.s	loc_20BBCC
	cmpi.w	#$300,d0
	beq.s	loc_20BBCC
	bra.s	loc_20BBDE

; ------------------------------------------------------------------------------

loc_20BBCC:
	bset	#7,obj.var_3e(a0)
	move.b	obj.var_38(a0),obj.var_3a(a0)
	move.w	obj.y(a0),d0
	bra.s	loc_20BC02

; ------------------------------------------------------------------------------

loc_20BBDE:
	move.w	obj.var_32(a0),d1
	add.w	obj.var_34(a0),d1
	andi.w	#$3FF,d1
	move.w	d1,obj.var_32(a0)
	lsr.w	#2,d1
	move.w	d1,d0
	jsr	SineCosine
	muls.w	obj.var_36(a0),d0
	lsr.l	#8,d0
	add.w	obj.var_30(a0),d0

loc_20BC02:
	move.w	d0,obj.y(a0)
	swap	d0
	sub.l	(sp)+,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a0)
	moveq	#0,d1
	move.b	obj.subtype(a0),d1
	andi.b	#3,d1
	cmpi.b	#1,d1
	bne.s	loc_20BC66
	move.w	obj.var_32(a0),d0
	cmpi.w	#$210,d0
	bne.s	loc_20BC66
	lea	player_object,a1
	jsr	SolidObject
	bne.s	loc_20BC38
	rts

; ------------------------------------------------------------------------------

loc_20BC38:
	moveq	#0,d1
	move.b	obj.subtype(a0),d1
	andi.w	#$80,d1
	lsr.w	#6,d1
	move.w	word_20BC78(pc,d1.w),d0
	move.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	move.b	#$10,obj.anim_id(a1)
	bclr	#3,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BC66:
	tst.w	obj.y_speed(a0)
	bmi.s	locret_20BC76
	lea	player_object,a1
	jsr	SolidObject

locret_20BC76:
	rts

; ------------------------------------------------------------------------------

word_20BC78:
	dc.w	-$1000
	dc.w	-$A00

; ------------------------------------------------------------------------------

loc_20BC7C:
	move.l	(a4)+,(a5)+
	move.l	(a4)+,(a5)+
	move.l	(a4)+,(a5)+
	move.l	(a4)+,(a5)+
	dbf	d1,loc_20BC7C
	rts

; ------------------------------------------------------------------------------

Spr_20BC8A:
	dc.w	@Spr_20BC8A_0-*
	dc.w	@Spr_20BC8A_1-Spr_20BC8A
	dc.w	@Spr_20BC8A_2-Spr_20BC8A
	dc.w	@Spr_20BC8A_3-Spr_20BC8A
@Spr_20BC8A_0:
	dc.b	4
	dc.b	$E1, $F, 0, 0, $E0
	dc.b	$E1, $F, 0, $10, 0
	dc.b	1, $F, $10, 0, $E0
	dc.b	1, $F, $10, $10, 0
	dc.b	0
@Spr_20BC8A_1:
	dc.b	$C
	dc.b	$A1, $F, 0, 0, $E0
	dc.b	$A1, $F, 0, $10, 0
	dc.b	$C1, $F, $10, 0, $E0
	dc.b	$C1, $F, $10, $10, 0
	dc.b	$E1, $F, 0, 0, $E0
	dc.b	$E1, $F, 0, $10, 0
	dc.b	1, $F, $10, 0, $E0
	dc.b	1, $F, $10, $10, 0
	dc.b	$21, $F, 0, 0, $E0
	dc.b	$21, $F, 0, $10, 0
	dc.b	$41, $F, $10, 0, $E0
	dc.b	$41, $F, $10, $10, 0
	dc.b	0
@Spr_20BC8A_2:
	dc.b	4
	dc.b	$ED, $F, 0, 0, $E0
	dc.b	$ED, $F, 0, $10, 0
	dc.b	$D, $F, 0, $20, $E0
	dc.b	$D, $F, 0, $30, 0
	dc.b	0
@Spr_20BC8A_3:
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------
