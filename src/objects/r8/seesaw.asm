; ------------------------------------------------------------------------------

SeesawObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B51E(pc,d0.w),d0
	jsr	off_20B51E(pc,d0.w)
	jsr	DrawObject
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	loc_20B518
	rts

; ------------------------------------------------------------------------------

loc_20B518:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20B51E:
	dc.w	SeesawObject_0_Routine0-*
	dc.w	SeesawObject_0_Routine2-off_20B51E

; ------------------------------------------------------------------------------

SeesawObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#SeesawSprites,obj.sprite_data(a0)
	move.w	#$3A0,obj.sprite_tile(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$28,obj.width_2(a0)
	move.b	#$38,obj.height(a0)
	move.b	#1,obj.var_30(a0)
	clr.w	obj.var_3e(a0)
	jsr	SpawnObjectAfter
	bne.w	locret_20B62E
	move.b	#2,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	#$43A0,obj.sprite_tile(a1)
	move.b	#6,obj.sprite_layer(a1)
	move.b	#5,obj.sprite_frame(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$10,obj.height(a1)
	move.w	#0,obj.y_speed(a1)
	clr.w	obj.var_3e(a1)
	move.b	(a0),(a1)
	bset	#0,obj.var_3e(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.l	obj.y(a0),obj.y(a1)
	move.w	obj.y(a0),obj.var_36(a1)
	move.l	a0,obj.var_32(a1)
	jsr	SpawnObjectAfter
	bne.w	locret_20B62E
	move.b	#2,obj.routine(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.l	#SeesawSprites,obj.sprite_data(a1)
	move.w	#$3A0,obj.sprite_tile(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#8,obj.sprite_frame(a1)
	move.b	#$28,obj.width_2(a1)
	move.b	#$C,obj.height(a1)
	move.w	#0,obj.y_speed(a1)
	clr.w	obj.var_3e(a1)
	move.b	(a0),(a1)
	bset	#1,obj.var_3e(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.var_36(a1)
	move.l	obj.y(a0),obj.y(a1)
	move.w	obj.y(a1),d1
	addi.w	#-$2C,d1
	move.w	d1,obj.y(a1)
	move.l	a0,obj.var_32(a1)

locret_20B62E:
	rts

; ------------------------------------------------------------------------------

SeesawObject_0_Routine2:
	btst	#4,obj.var_3e(a0)
	bne.w	locret_20B710
	btst	#0,obj.var_3e(a0)
	bne.w	loc_20B716
	btst	#1,obj.var_3e(a0)
	bne.w	loc_20B7B8
	btst	#5,obj.var_3e(a0)
	beq.w	locret_20B710
	tst.w	time_stop
	bne.w	locret_20B710
	move.w	#0,obj.y_speed(a0)
	btst	#7,obj.var_3e(a0)
	bne.s	loc_20B68C
	subq.b	#1,obj.var_30(a0)
	bcc.w	locret_20B710
	move.b	#5,obj.var_31(a0)
	bset	#7,obj.var_3e(a0)
	addq.b	#1,obj.sprite_frame(a0)
	bra.w	locret_20B710

; ------------------------------------------------------------------------------

loc_20B68C:
	btst	#6,obj.var_3e(a0)
	bne.s	loc_20B6C6
	subq.b	#1,obj.var_31(a0)
	bcc.w	locret_20B710
	addq.b	#1,obj.sprite_frame(a0)
	move.b	#5,obj.var_31(a0)
	cmpi.b	#4,obj.sprite_frame(a0)
	blt.w	locret_20B710
	bset	#6,obj.var_3e(a0)
	move.b	#0,obj.var_30(a0)
	move.b	#$A,obj.var_31(a0)
	bra.w	locret_20B710

; ------------------------------------------------------------------------------

loc_20B6C6:
	btst	#2,obj.var_3e(a0)
	bne.w	loc_20B6FE
	subq.b	#1,obj.var_31(a0)
	bcc.s	locret_20B710
	addq.b	#1,obj.var_30(a0)
	move.b	obj.var_30(a0),d1
	ext.w	d1
	cmpi.w	#4,d1
	bne.s	loc_20B6EE
	move.b	#0,obj.var_30(a0)
	moveq	#0,d1

loc_20B6EE:
	move.b	byte_20B712(pc,d1.w),d2
	move.b	d2,obj.sprite_frame(a0)
	move.b	#$A,obj.var_31(a0)
	bra.s	locret_20B710

; ------------------------------------------------------------------------------

loc_20B6FE:
	cmpi.b	#4,obj.sprite_frame(a0)
	beq.s	locret_20B710
	addq.b	#1,obj.sprite_frame(a0)
	move.b	#$A,obj.var_31(a0)

locret_20B710:
	rts

; ------------------------------------------------------------------------------

byte_20B712:
	dc.b	3
	dc.b	2
	dc.b	1
	dc.b	2

; ------------------------------------------------------------------------------

loc_20B716:
	tst.w	time_stop
	bne.w	loc_20B7AA
	movea.l	obj.var_32(a0),a1
	btst	#5,obj.var_3e(a1)
	beq.s	loc_20B7AA
	btst	#7,obj.var_3e(a0)
	bne.s	loc_20B742
	move.w	#object_pool,obj.y_speed(a0)
	bset	#7,obj.var_3e(a0)
	bra.s	loc_20B7AA

; ------------------------------------------------------------------------------

loc_20B742:
	addi.w	#$100,obj.y_speed(a0)
	bmi.s	loc_20B784
	move.w	obj.y(a0),d1
	sub.w	obj.var_36(a0),d1
	cmpi.w	#8,d1
	bhi.s	loc_20B784
	move.w	#4,d1
	add.w	obj.var_36(a0),d1
	move.w	d1,obj.y(a0)
	movea.l	obj.var_32(a0),a1
	bset	#4,obj.var_3e(a1)
	bset	#4,obj.var_3e(a0)
	move.b	#4,obj.sprite_frame(a1)
	move.w	#0,obj.y_speed(a0)
	bra.w	loc_20B7AA

; ------------------------------------------------------------------------------

loc_20B784:
	cmpi.w	#0,obj.y_speed(a0)
	bne.s	loc_20B79E
	addq.b	#1,obj.sprite_frame(a0)
	move.b	#$A4,obj.collide_type(a0)
	move.b	#4,obj.sprite_layer(a0)
	bra.s	loc_20B7AA

; ------------------------------------------------------------------------------

loc_20B79E:
	cmpi.w	#-$2000,obj.y_speed(a0)
	bne.s	loc_20B7AA
	addq.b	#1,obj.sprite_frame(a0)

loc_20B7AA:
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	lsl.l	#6,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20B7B8:
	tst.w	time_stop
	bne.w	locret_20B832
	movea.l	obj.var_32(a0),a1
	btst	#5,obj.var_3e(a1)
	bne.s	loc_20B7E2
	lea	player_object,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jsr	SolidObject
	beq.s	loc_20B7EC

loc_20B7E2:
	movea.l	obj.var_32(a0),a1
	bset	#5,obj.var_3e(a1)

loc_20B7EC:
	movea.l	obj.var_32(a0),a1
	move.b	obj.sprite_frame(a1),d1
	ext.w	d1
	asl.w	#1,d1
	move.w	word_20B850(pc,d1.w),d2
	move.w	obj.var_36(a0),d3
	add.w	d2,d3
	move.w	d3,obj.y(a0)
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	bsr.w	sub_20B834
	movea.l	obj.var_32(a0),a1
	bclr	#2,obj.var_3e(a1)
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20B832
	movea.l	obj.var_32(a0),a1
	bset	#2,obj.var_3e(a1)

locret_20B832:
	rts

; ------------------------------------------------------------------------------

sub_20B834:
	movea.l	obj.var_32(a0),a1
	moveq	#0,d1
	move.b	obj.sprite_frame(a1),d1
	move.b	byte_20B84A(pc,d1.w),d1
	lsl.w	#8,d1
	move.w	d1,obj.y_speed(a0)
	rts

; ------------------------------------------------------------------------------

byte_20B84A:
	dc.b	0
	dc.b	8
	dc.b	$10
	dc.b	8
	dc.b	0
	dc.b	0

word_20B850:
	dc.w	-$2C
	dc.w	-$1C
	dc.w	-$C
	dc.w	$C
	dc.w	$1C

SeesawSprites:
	include	"src/sprites/r8/seesaw.asm"
	even

; ------------------------------------------------------------------------------
