; ------------------------------------------------------------------------------

RingObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20884A(pc,d0.w),d1
	jmp	off_20884A(pc,d1.w)

; ------------------------------------------------------------------------------

off_20884A:
	dc.w	RingInit-*
	dc.w	RingMain-off_20884A
	dc.w	RingCollect-off_20884A
	dc.w	RingSparkle-off_20884A
	dc.w	RingDelete-off_20884A

; ------------------------------------------------------------------------------

byte_208854:
	dc.b	$10, 0
	dc.b	$18, 0
	dc.b	$20, 0
	dc.b	0, $10
	dc.b	0, $18
	dc.b	0, $20
	dc.b	$10, $10
	dc.b	$18, $18
	dc.b	$20, $20
	dc.b	-$10, $10
	dc.b	-$18, $18
	dc.b	-$20, $20
	dc.b	$10, 8
	dc.b	$18, $10
	dc.b	-$10, 8
	dc.b	-$18, $10

; ------------------------------------------------------------------------------

RingInit:
	lea	(object_states).l,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	bclr	#7,d1
	beq.s	loc_2088AC
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	loc_2088A4
	moveq	#0,d1
	bra.s	loc_2088AC

; ------------------------------------------------------------------------------

loc_2088A4:
	cmpi.w	#3,d1
	bcs.s	loc_2088AC
	moveq	#2,d1

loc_2088AC:
	add.w	d1,d0
	lea	2(a2,d0.w),a2
	move.b	(a2),d4
	move.b	obj.subtype(a0),d1
	moveq	#0,d0
	move.b	d1,d0
	andi.w	#7,d1
	cmpi.w	#7,d1
	bne.s	loc_2088C8
	moveq	#6,d1

loc_2088C8:
	swap	d1
	move.w	#1,d1
	lsr.b	#4,d0
	add.w	d0,d0
	lea	(byte_208854).l,a1
	move.b	(a1,d0.w),d5
	ext.w	d5
	move.b	1(a1,d0.w),d6
	ext.w	d6
	movea.l	a0,a1
	move.w	obj.x(a0),d2
	move.w	obj.y(a0),d3
	lea	1(a2),a3
	moveq	#0,d0
	move.b	(time_zone).l,d0
	bclr	#7,d0
	beq.s	loc_208918
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d0
	bpl.s	loc_208910
	moveq	#0,d0
	bra.s	loc_208918

; ------------------------------------------------------------------------------

loc_208910:
	cmpi.w	#3,d0
	bcs.s	loc_208918
	moveq	#2,d0

loc_208918:
	move.b	-(a3),d4
	lsr.b	d1,d4
	bcs.w	loc_2089E6
	dbf	d0,loc_208918
	bclr	#7,(a2)
	bra.s	loc_20896E

; ------------------------------------------------------------------------------

loc_20892A:
	swap	d1
	lea	1(a2),a3
	moveq	#0,d0
	move.b	(time_zone).l,d0
	bclr	#7,d0
	beq.s	loc_208956
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d0
	bpl.s	loc_20894E
	moveq	#0,d0
	bra.s	loc_208956

; ------------------------------------------------------------------------------

loc_20894E:
	cmpi.w	#3,d0
	bcs.s	loc_208956
	moveq	#2,d0

loc_208956:
	move.b	-(a3),d4
	lsr.b	d1,d4
	bcs.w	loc_2089E6
	dbf	d0,loc_208956
	bclr	#7,(a2)
	bsr.w	SpawnObjectAfter
	bne.w	loc_2089F2

loc_20896E:
	move.b	#$10,obj.id(a1)
	move.b	#2,obj.routine(a1)
	move.w	d2,obj.x(a1)
	move.w	obj.x(a0),obj.var_32(a1)
	move.w	d3,obj.y(a1)
	move.l	#RingSprites,obj.sprite_data(a1)
	move.w	#$A7AE,obj.sprite_tile(a1)
	move.b	#2,obj.sprite_layer(a1)
	cmpi.b	#6,(zone).l
	bne.s	loc_2089C4
	move.b	#0,obj.sprite_layer(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)
	tst.b	obj.subtype_2(a1)
	beq.s	loc_2089C4
	andi.b	#$7F,obj.sprite_tile(a1)
	move.b	#2,obj.sprite_layer(a1)

loc_2089C4:
	move.b	#4,obj.sprite_flags(a1)
	move.b	#$47,obj.collide_type(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	obj.state_id(a0),obj.state_id(a1)
	move.b	d1,obj.var_34(a1)

loc_2089E6:
	addq.w	#1,d1
	add.w	d5,d2
	add.w	d6,d3
	swap	d1
	dbf	d1,loc_20892A

loc_2089F2:
	moveq	#0,d0
	move.b	(time_zone).l,d0
	bclr	#7,d0
	beq.s	loc_208A18
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d0
	bpl.s	loc_208A10
	moveq	#0,d0
	bra.s	loc_208A18

; ------------------------------------------------------------------------------

loc_208A10:
	cmpi.w	#3,d0
	bcs.s	loc_208A18
	moveq	#2,d0

loc_208A18:
	lea	1(a2),a3

loc_208A1C:
	btst	#0,-(a3)
	bne.w	DeleteObject
	dbf	d0,loc_208A1C

RingMain:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_208A4C
	move.w	obj.var_32(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	RingDelete

loc_208A4C:
	tst.w	(time_stop).l
	bne.s	loc_208A5C
	move.b	(ring_anim_frame).l,obj.sprite_frame(a0)

loc_208A5C:
	bra.w	DrawObject

; ------------------------------------------------------------------------------

RingCollect:
	addq.b	#2,obj.routine(a0)
	move.b	#0,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	bsr.w	sub_208ACA
	lea	(object_states).l,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	bclr	#7,d1
	beq.s	loc_208AAC
	move.b	(warp_direction).w,d2
	ext.w	d2
	neg.w	d2
	add.w	d2,d1
	bpl.s	loc_208AA4
	moveq	#0,d1
	bra.s	loc_208AAC

; ------------------------------------------------------------------------------

loc_208AA4:
	cmpi.w	#3,d1
	bcs.s	loc_208AAC
	moveq	#2,d1

loc_208AAC:
	add.w	d1,d0
	move.b	obj.var_34(a0),d1
	subq.b	#1,d1
	bset	d1,2(a2,d0.w)

RingSparkle:
	lea	(RingAnims).l,a1
	bsr.w	AnimateObject
	bra.w	DrawObject

; ------------------------------------------------------------------------------

RingDelete:
	bra.w	DeleteObject

; ------------------------------------------------------------------------------

sub_208ACA:
	addq.w	#1,(rings).l
	ori.b	#1,(update_hud_rings).l
	move.w	#$95,d0
	cmpi.w	#100,(rings).l
	bcs.s	loc_208B1A
	bset	#1,(lives_flags).l
	beq.s	loc_208B04
	cmpi.w	#200,(rings).l
	bcs.s	loc_208B1A
	bset	#2,(lives_flags).l
	bne.s	loc_208B1A

loc_208B04:
	addq.b	#1,(lives).l
	addq.b	#1,(update_hud_lives).l
	move.w	#$7A,d0
	jmp	SubCpuCommand

; ------------------------------------------------------------------------------

loc_208B1A:
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

LostRingObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208B2E(pc,d0.w),d1
	jmp	off_208B2E(pc,d1.w)

; ------------------------------------------------------------------------------

off_208B2E:
	dc.w	LostRingInit-*
	dc.w	LostRingMain-off_208B2E
	dc.w	LostRingCollect-off_208B2E
	dc.w	LostRingSparkle-off_208B2E
	dc.w	LostRingDelete-off_208B2E

; ------------------------------------------------------------------------------

LostRingInit:
	movea.l	a0,a1
	moveq	#0,d5
	move.w	(rings).l,d5
	moveq	#$20,d0
	cmp.w	d0,d5
	bcs.s	loc_208B4A
	move.w	d0,d5

loc_208B4A:
	subq.w	#1,d5
	move.w	#$288,d4
	bra.s	loc_208B5A

; ------------------------------------------------------------------------------

loc_208B52:
	bsr.w	SpawnObject
	bne.w	loc_208C10

loc_208B5A:
	move.b	#$11,obj.id(a1)
	addq.b	#2,obj.routine(a1)
	move.b	#8,obj.height(a1)
	move.b	#8,obj.width(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.l	#RingSprites,obj.sprite_data(a1)
	move.b	obj.subtype_2(a0),obj.subtype_2(a1)
	move.w	#$A7AE,obj.sprite_tile(a1)
	move.b	#3,obj.sprite_layer(a1)
	cmpi.b	#6,(zone).l
	bne.s	loc_208BB8
	move.b	#0,obj.sprite_layer(a1)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_208BB8
	move.b	#3,obj.sprite_layer(a1)
	andi.b	#$7F,obj.sprite_tile(a1)

loc_208BB8:
	move.b	#4,obj.sprite_flags(a1)
	move.b	#$47,obj.collide_type(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	#-1,(lost_ring_anim_timer).l
	tst.w	d4
	bmi.s	loc_208C00
	move.w	d4,d0
	jsr	SineCosine
	move.w	d4,d2
	lsr.w	#8,d2
	asl.w	d2,d0
	asl.w	d2,d1
	move.w	d0,d2
	move.w	d1,d3
	addi.b	#$10,d4
	bcc.s	loc_208C00
	subi.w	#$80,d4
	bcc.s	loc_208C00
	move.w	#$288,d4

loc_208C00:
	move.w	d2,obj.x_speed(a1)
	move.w	d3,obj.y_speed(a1)
	neg.w	d2
	neg.w	d4
	dbf	d5,loc_208B52

loc_208C10:
	move.w	#0,(rings).l
	move.b	#$80,(update_hud_rings).l
	move.b	#0,(lives_flags).l
	move.w	#$94,d0
	jsr	PlayFmSound

LostRingMain:
	move.b	(lost_ring_anim_frame).l,obj.sprite_frame(a0)
	bsr.w	MoveObject
	addi.w	#$18,obj.y_speed(a0)
	bmi.s	loc_208C70
	move.b	(stage_vblank_frames+3).l,d0
	add.b	d7,d0
	andi.b	#3,d0
	bne.s	loc_208C70
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_208C70
	add.w	d1,obj.y(a0)
	move.w	obj.y_speed(a0),d0
	asr.w	#2,d0
	sub.w	d0,obj.y_speed(a0)
	neg.w	obj.y_speed(a0)

loc_208C70:
	tst.b	(lost_ring_anim_timer).l
	beq.s	LostRingDelete
	move.w	(bottom_bound).w,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcs.s	LostRingDelete
	bra.w	DrawObject

; ------------------------------------------------------------------------------

LostRingCollect:
	addq.b	#2,obj.routine(a0)
	move.b	#0,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	bsr.w	sub_208ACA

LostRingSparkle:
	lea	(RingAnims).l,a1
	bsr.w	AnimateObject
	bra.w	DrawObject

; ------------------------------------------------------------------------------

LostRingDelete:
	bra.w	DeleteObject

; ------------------------------------------------------------------------------

RingAnims:
	dc.w	@RingAnims_0-*
@RingAnims_0:
	dc.b	5
	dc.b	4, 5, 6, 7
	dc.b	$FC
RingSprites:
	dc.w	@RingSprites_0-*
	dc.w	@RingSprites_1-RingSprites
	dc.w	@RingSprites_2-RingSprites
	dc.w	@RingSprites_3-RingSprites
	dc.w	@RingSprites_4-RingSprites
	dc.w	@RingSprites_5-RingSprites
	dc.w	@RingSprites_6-RingSprites
	dc.w	@RingSprites_7-RingSprites
	dc.w	@RingSprites_8-RingSprites
@RingSprites_0:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8
@RingSprites_1:
	dc.b	1
	dc.b	$F8, 5, 0, 4, $F8
@RingSprites_2:
	dc.b	1
	dc.b	$F8, 1, 0, 8, $FC
@RingSprites_3:
	dc.b	1
	dc.b	$F8, 5, 8, 4, $F8
@RingSprites_4:
	dc.b	1
	dc.b	$F8, 5, 0, $A, $F8
@RingSprites_5:
	dc.b	1
	dc.b	$F8, 5, $18, $A, $F8
@RingSprites_6:
	dc.b	1
	dc.b	$F8, 5, $10, $A, $F8
@RingSprites_7:
	dc.b	1
	dc.b	$F8, 5, 8, $A, $F8
@RingSprites_8:
	dc.b	0
	dc.b	0
S1BigRingSprites:
	dc.w	@S1BigRingSprites_0-*
	dc.w	@S1BigRingSprites_1-S1BigRingSprites
	dc.w	@S1BigRingSprites_2-S1BigRingSprites
	dc.w	@S1BigRingSprites_3-S1BigRingSprites
@S1BigRingSprites_0:
	dc.b	$A
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E0, 8, 0, 3, 0
	dc.b	$E8, $C, 0, 6, $E0
	dc.b	$E8, $C, 0, $A, 0
	dc.b	$F0, 7, 0, $E, $E0
	dc.b	$F0, 7, 0, $16, $10
	dc.b	$10, $C, 0, $1E, $E0
	dc.b	$10, $C, 0, $22, 0
	dc.b	$18, 8, 0, $26, $E8
	dc.b	$18, 8, 0, $29, 0
@S1BigRingSprites_1:
	dc.b	8
	dc.b	$E0, $C, 0, $2C, $F0
	dc.b	$E8, 8, 0, $30, $E8
	dc.b	$E8, 9, 0, $33, 0
	dc.b	$F0, 7, 0, $39, $E8
	dc.b	$F8, 5, 0, $41, 8
	dc.b	8, 9, 0, $45, 0
	dc.b	$10, 8, 0, $4B, $E8
	dc.b	$18, $C, 0, $4E, $F0
@S1BigRingSprites_2:
	dc.b	4
	dc.b	$E0, 7, 0, $52, $F4
	dc.b	$E0, 3, 8, $52, 4
	dc.b	0, 7, 0, $5A, $F4
	dc.b	0, 3, 8, $5A, 4
@S1BigRingSprites_3:
	dc.b	8
	dc.b	$E0, $C, 8, $2C, $F0
	dc.b	$E8, 8, 8, $30, 0
	dc.b	$E8, 9, 8, $33, $E8
	dc.b	$F0, 7, 8, $39, 8
	dc.b	$F8, 5, 8, $41, $E8
	dc.b	8, 9, 8, $45, $E8
	dc.b	$10, 8, 8, $4B, 0
	dc.b	$18, $C, 8, $4E, $F0
S1BigRingFlashSprites:
	dc.w	@S1BigRingFlashSprites_0-*
	dc.w	@S1BigRingFlashSprites_1-S1BigRingFlashSprites
	dc.w	@S1BigRingFlashSprites_2-S1BigRingFlashSprites
	dc.w	@S1BigRingFlashSprites_3-S1BigRingFlashSprites
	dc.w	@S1BigRingFlashSprites_4-S1BigRingFlashSprites
	dc.w	@S1BigRingFlashSprites_5-S1BigRingFlashSprites
	dc.w	@S1BigRingFlashSprites_6-S1BigRingFlashSprites
	dc.w	@S1BigRingFlashSprites_7-S1BigRingFlashSprites
@S1BigRingFlashSprites_0:
	dc.b	2
	dc.b	$E0, $F, 0, 0, 0
	dc.b	0, $F, $10, 0, 0
@S1BigRingFlashSprites_1:
	dc.b	4
	dc.b	$E0, $F, 0, $10, $F0
	dc.b	$E0, 7, 0, $20, $10
	dc.b	0, $F, $10, $10, $F0
	dc.b	0, 7, $10, $20, $10
@S1BigRingFlashSprites_2:
	dc.b	4
	dc.b	$E0, $F, 0, $28, $E8
	dc.b	$E0, $B, 0, $38, 8
	dc.b	0, $F, $10, $28, $E8
	dc.b	0, $B, $10, $38, 8
@S1BigRingFlashSprites_3:
	dc.b	4
	dc.b	$E0, $F, 8, $34, $E0
	dc.b	$E0, $F, 0, $34, 0
	dc.b	0, $F, $18, $34, $E0
	dc.b	0, $F, $10, $34, 0
@S1BigRingFlashSprites_4:
	dc.b	4
	dc.b	$E0, $B, 8, $38, $E0
	dc.b	$E0, $F, 8, $28, $F8
	dc.b	0, $B, $18, $38, $E0
	dc.b	0, $F, $18, $28, $F8
@S1BigRingFlashSprites_5:
	dc.b	4
	dc.b	$E0, 7, 8, $20, $E0
	dc.b	$E0, $F, 8, $10, $F0
	dc.b	0, 7, $18, $20, $E0
	dc.b	0, $F, $18, $10, $F0
@S1BigRingFlashSprites_6:
	dc.b	2
	dc.b	$E0, $F, 8, 0, $E0
	dc.b	0, $F, $18, 0, $E0
@S1BigRingFlashSprites_7:
	dc.b	4
	dc.b	$E0, $F, 0, $44, $E0
	dc.b	$E0, $F, 8, $44, 0
	dc.b	0, $F, $10, $44, $E0
	dc.b	0, $F, $18, $44, 0

; ------------------------------------------------------------------------------