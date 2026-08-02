; ------------------------------------------------------------------------------

PlayerCheckBlockFront:
	move.l	obj.x(a0),d3
	move.l	obj.y(a0),d2
	move.w	obj.x_speed(a0),d1
	ext.l	d1
	asl.l	#8,d1
	add.l	d1,d3
	move.w	obj.y_speed(a0),d1
	ext.l	d1
	asl.l	#8,d1
	add.l	d1,d2
	swap	d2
	swap	d3
	move.b	d0,(collide_angle_1).w
	move.b	d0,(collide_angle_2).w
	move.b	d0,d1
	addi.b	#$20,d0
	bpl.s	loc_20650E
	move.b	d1,d0
	bpl.s	loc_206508
	subq.b	#1,d0

loc_206508:
	addi.b	#$20,d0
	bra.s	loc_206518

; ------------------------------------------------------------------------------

loc_20650E:
	move.b	d1,d0
	bpl.s	loc_206514
	addq.b	#1,d0

loc_206514:
	addi.b	#$1F,d0

loc_206518:
	andi.b	#$C0,d0
	beq.w	PlayerCheckBlockDown2
	cmpi.b	#$80,d0
	beq.w	PlayerCheckBlockUp2
	andi.b	#$38,d1
	bne.s	loc_206530
	addq.w	#8,d2

loc_206530:
	cmpi.b	#$40,d0
	beq.w	PlayerCheckBlockLeft2
	bra.w	PlayerCheckBlockRight2

; ------------------------------------------------------------------------------

PlayerCheckBlockAbove:
	move.b	d0,(collide_angle_1).w
	move.b	d0,(collide_angle_2).w
	addi.b	#$20,d0
	andi.b	#$C0,d0
	cmpi.b	#$40,d0
	beq.w	PlayerCheckBlockLeftWide
	cmpi.b	#$80,d0
	beq.w	PlayerCheckBlockUpWide
	cmpi.b	#$C0,d0
	beq.w	PlayerCheckBlockRightWide

PlayerCheckBlockDownWide:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	(collide_angle_1).w,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	jsr	CheckBlockY
	move.w	d1,-(sp)
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	lea	(collide_angle_2).w,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	jsr	CheckBlockY
	move.w	(sp)+,d0
	move.b	#0,d2

loc_2065C8:
	move.b	(collide_angle_2).w,d3
	cmp.w	d0,d1
	ble.s	loc_2065D6
	move.b	(collide_angle_1).w,d3
	exg.l	d0,d1

loc_2065D6:
	btst	#0,d3
	beq.s	locret_2065DE
	move.b	d2,d3

locret_2065DE:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBlockDown:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3


PlayerCheckBlockDown2:
	addi.w	#$A,d2
	lea	(collide_angle_1).w,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$E,d5
	jsr	CheckBlockY
	move.b	#0,d2

CheckBlockAngle:
	move.b	(collide_angle_1).w,d3
	btst	#0,d3
	beq.s	locret_206610
	move.b	d2,d3

locret_206610:
	rts

; ------------------------------------------------------------------------------

CheckBlockDown:
	move.w	obj.x(a0),d3

CheckBlockDown2:
	move.w	obj.y(a0),d2
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2

CheckBlockDown3:
	lea	(collide_angle_1).w,a4
	move.b	#0,(a4)
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$D,d5
	jsr	CheckBlockY
	move.b	(collide_angle_1).w,d3
	btst	#0,d3
	beq.s	locret_20664A
	move.b	#0,d3

locret_20664A:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBlockRightWide:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d3
	lea	(collide_angle_1).w,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$E,d5
	jsr	CheckBlockX
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
	lea	(collide_angle_2).w,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$E,d5
	jsr	CheckBlockX
	move.w	(sp)+,d0
	move.b	#$C0,d2
	bra.w	loc_2065C8

; ------------------------------------------------------------------------------

PlayerCheckBlockRight:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3


PlayerCheckBlockRight2:
	addi.w	#$A,d3
	lea	(collide_angle_1).w,a4
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$E,d5
	jsr	CheckBlockX
	move.b	#$C0,d2
	bra.w	CheckBlockAngle

; ------------------------------------------------------------------------------

CheckBlockRight:
	add.w	obj.x(a0),d3

CheckBlockRight2:
	move.w	obj.y(a0),d2

CheckBlockRight3:
	lea	(collide_angle_1).w,a4
	move.b	#0,(a4)
	movea.w	#$10,a3
	move.w	#0,d6
	moveq	#$E,d5
	jsr	CheckBlockX
	move.b	(collide_angle_1).w,d3
	btst	#0,d3
	beq.s	locret_20670A
	move.b	#$C0,d3

locret_20670A:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBlockUpWide:
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
	lea	(collide_angle_1).w,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$E,d5
	jsr	CheckBlockY
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
	lea	(collide_angle_2).w,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$E,d5
	jsr	CheckBlockY
	move.w	(sp)+,d0
	move.b	#$80,d2
	bra.w	loc_2065C8

; ------------------------------------------------------------------------------

PlayerCheckBlockUp:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3

PlayerCheckBlockUp2:
	subi.w	#$A,d2
	eori.w	#$F,d2
	lea	(collide_angle_1).w,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$E,d5
	jsr	CheckBlockY
	move.b	#$80,d2
	bra.w	CheckBlockAngle

; ------------------------------------------------------------------------------

CheckBlockUp:
	move.w	obj.y(a0),d2

CheckBlockUp2:
	move.w	obj.x(a0),d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	ext.w	d0
	sub.w	d0,d2
	eori.w	#$F,d2

CheckBlockUp3:
	lea	(collide_angle_1).w,a4
	movea.w	#-$10,a3
	move.w	#$1000,d6
	moveq	#$E,d5
	jsr	CheckBlockY
	move.b	(collide_angle_1).w,d3
	btst	#0,d3
	beq.s	locret_2067E0
	move.b	#$80,d3

locret_2067E0:
	rts

; ------------------------------------------------------------------------------

PlayerCheckBlockLeftWide:
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
	lea	(collide_angle_1).w,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$E,d5
	jsr	CheckBlockX
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
	lea	(collide_angle_2).w,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$E,d5
	jsr	CheckBlockX
	move.w	(sp)+,d0
	move.b	#$40,d2
	bra.w	loc_2065C8

; ------------------------------------------------------------------------------

PlayerCheckBlockLeft:
	move.w	obj.y(a0),d2
	move.w	obj.x(a0),d3


PlayerCheckBlockLeft2:
	subi.w	#$A,d3
	eori.w	#$F,d3
	lea	(collide_angle_1).w,a4
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$E,d5
	jsr	CheckBlockX
	move.b	#$40,d2
	bra.w	CheckBlockAngle

; ------------------------------------------------------------------------------

CheckBlockLeft:
	add.w	obj.x(a0),d3

CheckBlockLeft2:
	move.w	obj.y(a0),d2

CheckBlockLeft3:
	lea	(collide_angle_1).w,a4
	move.b	#0,(a4)
	movea.w	#-$10,a3
	move.w	#$800,d6
	moveq	#$E,d5
	jsr	CheckBlockX
	move.b	(collide_angle_1).w,d3
	btst	#0,d3
	beq.s	locret_2068AC
	move.b	#$40,d3

locret_2068AC:
	rts

; ------------------------------------------------------------------------------