; ------------------------------------------------------------------------------

PlayerGroundCollide:
	btst	#3,obj.flags(a0)
	beq.s	loc_200C56
	moveq	#0,d0
	move.b	d0,collide_angle_1
	move.b	d0,collide_angle_2
	rts

; ------------------------------------------------------------------------------

loc_200C56:
	moveq	#3,d0
	move.b	d0,collide_angle_1
	move.b	d0,collide_angle_2
	move.b	obj.angle(a0),d0
	addi.b	#$20,d0
	bpl.s	loc_200C78
	move.b	obj.angle(a0),d0
	bpl.s	loc_200C72
	subq.b	#1,d0

loc_200C72:
	addi.b	#$20,d0
	bra.s	loc_200C84

; ------------------------------------------------------------------------------

loc_200C78:
	move.b	obj.angle(a0),d0
	bpl.s	loc_200C80
	addq.b	#1,d0

loc_200C80:
	addi.b	#$1F,d0

loc_200C84:
	andi.b	#$C0,d0
	cmpi.b	#$40,d0
	beq.w	loc_200F0E
	cmpi.b	#$80,d0
	beq.w	loc_200E6C
	cmpi.b	#$C0,d0
	beq.w	loc_200DD0
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_1,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	neg.w	d0
	add.w	d0,d3
	lea	collide_angle_2,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	locret_200D12
	bpl.s	loc_200D14
	cmpi.w	#-$E,d1
	blt.s	locret_200D3A
	add.w	d1,obj.y(a0)

locret_200D12:
	rts

; ------------------------------------------------------------------------------

loc_200D14:
	cmpi.w	#$E,d1
	bgt.s	loc_200D20

loc_200D1A:
	add.w	d1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_200D20:
	tst.b	obj.var_38(a0)
	bne.s	loc_200D1A
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

locret_200D3A:
	rts
	move.l	obj.x(a0),d2
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d2
	move.l	d2,obj.x(a0)
	move.w	#$38,d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

locret_200D5E:
	rts
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	subi.w	#$38,d0
	move.w	d0,obj.y_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

	rts
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d2
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d2,obj.x(a0)
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

CheckGroundAngle:
	move.b	collide_angle_2,d2
	cmp.w	d0,d1
	ble.s	loc_200DB2
	move.b	collide_angle_1,d2
	move.w	d0,d1

loc_200DB2:
	btst	#0,d2
	bne.s	loc_200DBE
	move.b	d2,obj.angle(a0)
	rts

; ------------------------------------------------------------------------------

loc_200DBE:
	move.b	obj.angle(a0),d2
	addi.b	#$20,d2
	andi.b	#$C0,d2
	move.b	d2,obj.angle(a0)
	rts

; ------------------------------------------------------------------------------

loc_200DD0:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	neg.w	d0
	add.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_1,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_2,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	locret_200E44
	bpl.s	loc_200E46
	cmpi.w	#-$E,d1
	blt.w	locret_200D5E
	add.w	d1,obj.x(a0)

locret_200E44:
	rts

; ------------------------------------------------------------------------------

loc_200E46:
	cmpi.w	#$E,d1
	bgt.s	loc_200E52

loc_200E4C:
	add.w	d1,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

loc_200E52:
	tst.b	obj.var_38(a0)
	bne.s	loc_200E4C
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_200E6C:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	eori.w	#$F,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	collide_angle_1,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	eori.w	#$F,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	lea	collide_angle_2,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$D,d5
	bsr.w	CheckBlockY
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	locret_200EE6
	bpl.s	loc_200EE8
	cmpi.w	#-$E,d1
	blt.w	locret_200D3A
	sub.w	d1,obj.y(a0)

locret_200EE6:
	rts

; ------------------------------------------------------------------------------

loc_200EE8:
	cmpi.w	#$E,d1
	bgt.s	loc_200EF4

loc_200EEE:
	sub.w	d1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_200EF4:
	tst.b	obj.var_38(a0)
	bne.s	loc_200EEE
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_200F0E:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d3
	eori.w	#$F,d3
	lea	collide_angle_1,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d3
	eori.w	#$F,d3
	lea	collide_angle_2,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$D,d5
	bsr.w	CheckBlockX
	move.w	(sp)+,d0
	bsr.w	CheckGroundAngle
	tst.w	d1
	beq.s	locret_200F88
	bpl.s	loc_200F8A
	cmpi.w	#-$E,d1
	blt.w	locret_200D5E
	sub.w	d1,obj.x(a0)

locret_200F88:
	rts

; ------------------------------------------------------------------------------

loc_200F8A:
	cmpi.w	#$E,d1
	bgt.s	loc_200F96

loc_200F90:
	sub.w	d1,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

loc_200F96:
	tst.b	obj.var_38(a0)
	bne.s	loc_200F90
	bset	#1,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	rts

; ------------------------------------------------------------------------------
