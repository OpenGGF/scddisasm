; ------------------------------------------------------------------------------

sub_20BD22:
	tst.b	(debug_mode).l
	bne.s	loc_20BD3A
	cmpi.b	#6,obj.routine(a1)
	bcc.s	loc_20BD3A
	tst.w	obj.y_speed(a1)
	bmi.s	loc_20BD3A
	bra.s	loc_20BD44

; ------------------------------------------------------------------------------

loc_20BD3A:
	bclr	#3,obj.flags(a0)
	moveq	#0,d1
	rts

; ------------------------------------------------------------------------------

loc_20BD44:
	lea	(unk_20BDD0).l,a2
	andi.w	#7,d0
	asl.w	#2,d0
	lea	(a2,d0.w),a2
	move.w	obj.x(a0),d0
	move.w	obj.x(a1),d1
	move.b	obj.width(a1),d3
	ext.w	d3
	move.b	0(a2),d2
	ext.w	d2
	move.w	d0,d4
	move.w	d1,d5
	add.w	d2,d4
	sub.w	d3,d5
	cmp.w	d4,d5
	bpl.s	loc_20BDC6
	move.b	1(a2),d2
	ext.w	d2
	neg.w	d2
	move.w	d0,d4
	move.w	d1,d5
	sub.w	d2,d4
	add.w	d3,d5
	cmp.w	d5,d4
	bpl.s	loc_20BDC6
	move.w	obj.y(a0),d0
	move.w	obj.y(a1),d1
	move.b	obj.height(a1),d3
	ext.w	d3
	move.b	2(a2),d2
	ext.w	d2
	move.w	d0,d4
	move.w	d1,d5
	add.w	d2,d4
	sub.w	d3,d5
	cmp.w	d4,d5
	bpl.s	loc_20BDC6
	move.b	3(a2),d2
	ext.w	d2
	neg.w	d2
	move.w	d0,d4
	move.w	d1,d5
	sub.w	d2,d4
	add.w	d3,d5
	cmp.w	d5,d4
	bpl.s	loc_20BDC6
	bset	#3,obj.flags(a0)
	moveq	#$FFFFFFFF,d1
	rts

; ------------------------------------------------------------------------------

loc_20BDC6:
	bclr	#3,obj.flags(a0)
	moveq	#0,d1
	rts

; ------------------------------------------------------------------------------

unk_20BDD0:
	dc.b	$10
	dc.b	$F0
	dc.b	$10
	dc.b	$F0
	dc.b	$10
	dc.b	$F0
	dc.b	4
	dc.b	$FC
	dc.b	9
	dc.b	$F7
	dc.b	$38
	dc.b	$10
	dc.b	0
	dc.b	$E8
	dc.b	4
	dc.b	$FC
	dc.b	0
	dc.b	$E8
	dc.b	$C
	dc.b	0
	dc.b	$18
	dc.b	0
	dc.b	4
	dc.b	$FC
	dc.b	$18
	dc.b	0
	dc.b	$C
	dc.b	0
	dc.b	$20
	dc.b	$E0
	dc.b	$20
	dc.b	$E0

; ------------------------------------------------------------------------------

SpringboardObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BE04(pc,d0.w),d0
	jsr	off_20BE04(pc,d0.w)
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

off_20BE04:
	dc.w	SpringboardObject_0_Routine0-*
	dc.w	SpringboardObject_0_Routine2-off_20BE04
	dc.w	SpringboardObject_0_Routine4-off_20BE04
	dc.w	SpringboardObject_0_Routine6-off_20BE04
	dc.w	SpringboardObject_0_Routine8-off_20BE04
	dc.w	SpringboardObject_0_RoutineA-off_20BE04
	dc.w	SpringboardObject_0_RoutineC-off_20BE04

; ------------------------------------------------------------------------------

SpringboardObject_0_Routine0:
	move.l	#SpringboardSprites,obj.sprite_data(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$18,obj.width(a0)
	move.b	#4,obj.height(a0)
	moveq	#7,d0
	jsr	SetObjectSpriteTile(pc)
	move.b	#3,d0
	move.b	#2,d1
	tst.b	obj.subtype(a0)
	bne.s	loc_20BE54
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20BE68

loc_20BE54:
	move.b	#4,d0
	move.b	#4,d1
	bclr	#0,obj.sprite_flags(a0)
	bclr	#0,obj.flags(a0)

loc_20BE68:
	move.b	d0,obj.anim_id(a0)
	move.b	d1,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BE72:
	lea	SpringboardAnims(pc),a1
	jsr	(AnimateObject).l
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

SpringboardObject_0_Routine4:
	lea	(player_object).w,a1
	moveq	#3,d0
	bsr.w	sub_20BD22
	tst.b	d1
	beq.s	loc_20BEAE
	move.l	obj.y(a0),d0
	moveq	#0,d1
	move.b	obj.height(a1),d1
	swap	d1
	sub.l	d1,d0
	move.l	d0,obj.y(a1)
	move.b	#$C,obj.routine(a0)
	move.b	#4,obj.anim_id(a0)

loc_20BEAE:
	bra.w	loc_20BE72

; ------------------------------------------------------------------------------

SpringboardObject_0_Routine8:
	lea	(player_object).w,a1
	moveq	#3,d0
	bsr.w	sub_20BD22
	tst.b	d1
	bne.w	loc_20BEE6
	move.b	#4,obj.routine(a0)
	btst	#1,obj.flags(a1)
	beq.s	loc_20BED6
	move.b	#$C,obj.routine(a0)

loc_20BED6:
	cmpi.b	#$C,obj.routine(a0)
	beq.s	loc_20BEE0
	bra.s	loc_20BEE6

; ------------------------------------------------------------------------------

loc_20BEE0:
	move.b	#$40,obj.var_2a(a0)

loc_20BEE6:
	bra.w	loc_20BE72

; ------------------------------------------------------------------------------

SpringboardObject_0_RoutineC:
	move.b	#2,obj.anim_id(a0)
	nop
	nop
	nop
	nop
	lea	(player_object).w,a1
	moveq	#4,d0
	bsr.w	sub_20BD22
	tst.b	d1
	beq.s	loc_20BF72
	move.w	obj.y_speed(a1),d0
	addi.w	#$100,d0
	cmpi.w	#$A00,d0
	bmi.s	loc_20BF18
	move.w	#$A00,d0

loc_20BF18:
	neg.w	d0
	move.w	d0,obj.y_speed(a1)
	move.b	#$40,obj.var_2a(a0)
	bset	#1,obj.flags(a1)
	beq.s	loc_20BF30
	clr.b	obj.var_3c(a1)

loc_20BF30:
	bclr	#5,obj.flags(a1)
	clr.b	obj.var_38(a1)
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)
	btst	#2,obj.flags(a1)
	bne.s	loc_20BF6C
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)
	bset	#2,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)
	bra.s	loc_20BF72

; ------------------------------------------------------------------------------

loc_20BF6C:
	bset	#4,obj.flags(a1)

loc_20BF72:
	move.b	obj.var_2a(a0),d0
	subq.b	#1,d0
	move.b	d0,obj.var_2a(a0)
	bne.s	loc_20BF90
	move.b	#$40,obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	move.b	#4,obj.anim_id(a0)

loc_20BF90:
	bra.w	loc_20BE72

; ------------------------------------------------------------------------------

SpringboardObject_0_Routine2:
	lea	(player_object).w,a1
	moveq	#5,d0
	bsr.w	sub_20BD22
	tst.b	d1
	beq.s	loc_20BFC0
	move.l	obj.y(a0),d0
	moveq	#0,d1
	move.b	$16(a1),d1
	swap	d1
	sub.l	d1,d0
	move.l	d0,$C(a1)
	move.b	#$A,obj.routine(a0)
	move.b	#3,obj.anim_id(a0)

loc_20BFC0:
	bra.w	loc_20BE72

; ------------------------------------------------------------------------------

SpringboardObject_0_Routine6:
	lea	(player_object).w,a1
	moveq	#5,d0
	bsr.w	sub_20BD22
	tst.b	d1
	bne.w	loc_20BFF8
	move.b	#2,obj.routine(a0)
	btst	#1,obj.flags(a1)
	beq.s	loc_20BFE8
	move.b	#$A,obj.routine(a0)

loc_20BFE8:
	cmpi.b	#$A,obj.routine(a0)
	beq.s	loc_20BFF2
	bra.s	loc_20BFF8

; ------------------------------------------------------------------------------

loc_20BFF2:
	move.b	#$40,obj.var_2a(a0)

loc_20BFF8:
	bra.w	loc_20BE72

; ------------------------------------------------------------------------------

SpringboardObject_0_RoutineA:
	move.b	#1,obj.anim_id(a0)
	lea	(player_object).w,a1
	moveq	#6,d0
	bsr.w	sub_20BD22
	tst.b	d1
	beq.s	loc_20C07C
	move.w	obj.y_speed(a1),d0
	addi.w	#$100,d0
	cmpi.w	#$A00,d0
	bmi.s	loc_20C022
	move.w	#$A00,d0

loc_20C022:
	neg.w	d0
	move.w	d0,obj.y_speed(a1)
	move.b	#$40,obj.var_2a(a0)
	bset	#1,obj.flags(a1)
	beq.s	loc_20C03A
	clr.b	obj.var_3c(a1)

loc_20C03A:
	bclr	#5,obj.flags(a1)
	clr.b	obj.var_38(a1)
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)
	btst	#2,obj.flags(a1)
	bne.s	loc_20C076
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)
	bset	#2,obj.flags(a1)
	move.b	#2,obj.anim_id(a1)
	bra.s	loc_20C07C

; ------------------------------------------------------------------------------

loc_20C076:
	bset	#4,obj.flags(a1)

loc_20C07C:
	move.b	obj.var_2a(a0),d0
	subq.b	#1,d0
	move.b	d0,obj.var_2a(a0)
	bne.s	loc_20C09A
	move.b	#2,obj.routine(a0)
	move.b	#3,obj.anim_id(a0)
	move.b	#$40,obj.var_2a(a0)

loc_20C09A:
	bra.w	loc_20BE72

; ------------------------------------------------------------------------------

SpringboardAnims:
	include	"src/anims/r1/springboard.asm"
	even

SpringboardSprites:
	dc.w	@SpringboardSprites_0-*
	dc.w	@SpringboardSprites_1-SpringboardSprites
	dc.w	@SpringboardSprites_2-SpringboardSprites
	dc.w	@SpringboardSprites_3-SpringboardSprites
	dc.w	@SpringboardSprites_4-SpringboardSprites
	dc.w	@SpringboardSprites_5-SpringboardSprites

@SpringboardSprites_0:
	dc.b	2
	dc.b	$FC, 1, 0, 0, $F8
	dc.b	$FC, 8, 0, 2, 0
	dc.b	0

@SpringboardSprites_1:
	dc.b	2
	dc.b	$FC, 5, 0, 5, $F8
	dc.b	0, 5, 0, 9, 8
	dc.b	0

@SpringboardSprites_2:
	dc.b	2
	dc.b	$FC, 5, 0, $D, $F8
	dc.b	$F0, 5, 0, $11, 8
	dc.b	0

@SpringboardSprites_3:
	dc.b	2
	dc.b	$FC, 1, 8, 0, 0
	dc.b	$FC, 8, 8, 2, $E8
	dc.b	0

@SpringboardSprites_4:
	dc.b	2
	dc.b	$FC, 5, 8, 5, $F8
	dc.b	0, 5, 8, 9, $E8
	dc.b	0

@SpringboardSprites_5:
	dc.b	2
	dc.b	$FC, 5, 8, $D, $F8
	dc.b	$F0, 5, 8, $11, $E8
	dc.b	0

; ------------------------------------------------------------------------------