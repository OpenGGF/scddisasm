; ------------------------------------------------------------------------------

GetOffObject:
	btst	#3,obj.flags(a0)
	beq.s	locret_207D34
	btst	#3,obj.flags(a1)
	beq.s	locret_207D34
	moveq	#0,d0
	move.b	obj.var_3d(a1),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	cmpa.w	d0,a0
	bne.s	locret_207D34
	tst.b	obj.var_2a(a1)
	beq.s	loc_207CF6
	move.w	#$AB,d0
	jsr	PlayFmSound

loc_207CF6:
	clr.b	obj.var_38(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	bclr	#3,obj.flags(a0)
	btst	#6,obj.var_2c(a1)
	bne.s	loc_207D22
	cmpi.b	#$17,obj.anim_id(a1)
	beq.s	loc_207D22
	bclr	#0,obj.var_2c(a1)

loc_207D22:
	clr.b	obj.var_3d(a1)
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	locret_207D34
	bclr	#1,obj.flags(a1)

locret_207D34:
	rts

; ------------------------------------------------------------------------------

StandOnObject:
	cmpi.b	#4,obj.routine(a1)
	bne.s	loc_207D48
	subq.b	#2,obj.routine(a1)
	move.w	#120,obj.var_30(a1)

loc_207D48:
	clr.b	obj.routine_2(a0)
	clr.b	obj.var_3c(a1)
	bset	#3,obj.flags(a0)
	bne.s	loc_207DA8
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	loc_207D6A
	bclr	#3,obj.flags(a0)
	bra.w	GetOffObject

; ------------------------------------------------------------------------------

loc_207D6A:
	bclr	#4,obj.flags(a1)
	bclr	#2,obj.flags(a1)
	beq.s	loc_207DA8
	tst.b	shrunk_player
	beq.s	loc_207D92
	move.b	#$A,obj.height(a1)
	move.b	#5,obj.width(a1)
	subq.w	#2,obj.y(a1)
	bra.s	loc_207DA2

; ------------------------------------------------------------------------------

loc_207D92:
	move.b	#$13,obj.height(a1)
	move.b	#9,obj.width(a1)
	subq.w	#5,obj.y(a1)

loc_207DA2:
	move.b	#0,obj.anim_id(a1)

loc_207DA8:
	bset	#3,obj.flags(a1)
	beq.s	loc_207DCA
	moveq	#0,d0
	move.b	obj.var_3d(a1),d0
	lsl.w	#6,d0
	addi.l	#object_pool&$FFFFFF,d0
	cmpa.w	d0,a0
	beq.s	locret_207E02
	movea.l	d0,a2
	bclr	#3,obj.flags(a2)

loc_207DCA:
	move.w	a0,d0
	subi.w	#object_pool,d0
	lsr.w	#6,d0
	andi.w	#$7F,d0
	move.b	d0,obj.var_3d(a1)
	move.b	#0,obj.angle(a1)
	move.w	#0,obj.y_speed(a1)
	cmpi.b	#$A,obj.id(a0)
	bne.s	loc_207DF6
	cmpi.b	#2,obj.routine(a0)
	beq.s	loc_207DFC

loc_207DF6:
	move.w	obj.x_speed(a1),obj.ground_speed(a1)

loc_207DFC:
	bclr	#1,obj.flags(a1)

locret_207E02:
	rts

; ------------------------------------------------------------------------------

BottomSolidObject:
	move.b	#2,obj.routine_2(a0)
	bra.s	SolidObject

; ------------------------------------------------------------------------------

TopSolidObject:
	move.b	#1,obj.routine_2(a0)

; ------------------------------------------------------------------------------

SolidObject:
	cmpi.b	#$17,obj.anim_id(a1)
	beq.w	loc_2080C6
	btst	#6,obj.var_2c(a1)
	bne.w	loc_2080C6
	cmpi.b	#6,obj.routine(a1)
	bcc.w	loc_2080C6
	tst.b	obj.id(a1)
	beq.w	loc_2080C6
	tst.b	obj.sprite_flags(a0)
	bpl.w	loc_2080C6
	tst.b	debug_mode
	bne.w	loc_2080C6
	move.b	obj.width_2(a0),d1
	ext.w	d1
	addi.w	#$A,d1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.w	loc_2080C6
	move.w	d1,d2
	add.w	d2,d2
	cmp.w	d2,d0
	bcc.w	loc_2080C6
	cmpi.b	#$2B,obj.anim_id(a1)
	bne.s	loc_207E80
	btst	#3,obj.flags(a0)
	bne.s	loc_207E92
	bra.w	loc_2080C6

; ------------------------------------------------------------------------------

loc_207E80:
	cmpi.b	#1,obj.routine_2(a0)
	bne.s	loc_207E92
	tst.w	obj.y_speed(a1)
	beq.s	loc_207E92
	bmi.w	loc_2080C6

loc_207E92:
	move.b	obj.height(a0),d2
	ext.w	d2
	move.b	obj.height(a1),d3
	ext.w	d3
	add.w	d2,d3
	addq.w	#2,d3
	move.w	obj.y(a1),d2
	sub.w	obj.y(a0),d2
	add.w	d3,d2
	bmi.w	loc_2080C6
	move.w	d3,d4
	add.w	d4,d4
	cmp.w	d4,d2
	bcc.w	loc_2080C6
	move.w	d0,d4
	cmp.w	d0,d1
	bcc.s	loc_207EC8
	add.w	d1,d1
	sub.w	d1,d0
	move.w	d0,d4
	neg.w	d4

loc_207EC8:
	move.w	d2,d5
	cmp.w	d2,d3
	bcc.s	loc_207ED6
	add.w	d3,d3
	sub.w	d3,d2
	move.w	d2,d5
	neg.w	d5

loc_207ED6:
	cmp.w	d4,d5
	bcs.w	loc_207F6A
	cmpi.b	#1,obj.routine_2(a0)
	beq.w	loc_2080C6
	cmpi.b	#$A,obj.id(a0)
	bne.s	loc_207EF8
	btst	#1,obj.flags(a1)
	bne.w	loc_2080C6

loc_207EF8:
	cmpi.b	#4,d5
	bls.w	loc_2080C6
	bsr.w	PushObject
	move.l	d0,-(sp)
	bsr.w	GetOffObject
	clr.b	obj.routine_2(a0)
	move.l	(sp)+,d0
	sub.w	d0,obj.x(a1)
	tst.w	d0
	bmi.s	loc_207F22
	tst.w	obj.x_speed(a1)
	beq.s	loc_207F52
	bpl.s	loc_207F2A
	bra.s	loc_207F52

; ------------------------------------------------------------------------------

loc_207F22:
	tst.w	obj.x_speed(a1)
	beq.s	loc_207F52
	bpl.s	loc_207F52

loc_207F2A:
	bsr.w	CheckWallCrush
	btst	#1,obj.flags(a1)
	bne.s	loc_207F48
	bset	#5,obj.flags(a1)
	bset	#5,obj.flags(a0)
	move.w	#0,obj.ground_speed(a1)

loc_207F48:
	move.w	#0,obj.x_speed(a1)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_207F52:
	bsr.w	StopObjPush
	bsr.w	CheckWallCrush
	bclr	#5,obj.flags(a1)
	bclr	#5,obj.flags(a0)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_207F6A:
	cmpi.b	#$19,obj.id(a0)
	bne.s	loc_207F7C
	btst	#2,obj.flags(a1)
	bne.w	loc_2080C6

loc_207F7C:
	move.b	obj.height(a0),d0
	ext.w	d0
	move.b	obj.height(a1),d1
	ext.w	d1
	add.w	d0,d1
	tst.w	d2
	beq.s	loc_207F92
	bmi.w	loc_208062

loc_207F92:
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.s	loc_207FA4
	tst.w	obj.y_speed(a1)
	beq.s	loc_207FA4
	bmi.w	loc_2080C6

loc_207FA4:
	move.w	obj.y(a0),obj.y(a1)
	sub.w	d1,obj.y(a1)
	moveq	#0,d1
	move.w	obj.x_speed(a0),d1
	ext.l	d1
	asl.l	#8,d1
	move.l	obj.x(a1),d0
	add.l	d1,d0
	move.l	d0,obj.x(a1)
	move.b	#$C0,d0
	tst.w	obj.x_speed(a0)
	beq.s	loc_207FF0
	bpl.s	loc_207FD0
	neg.b	d0

loc_207FD0:
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockFront
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	loc_207FF0
	tst.w	obj.x_speed(a0)
	bpl.s	loc_207FEC
	neg.w	d1

loc_207FEC:
	add.w	d1,obj.x(a1)

loc_207FF0:
	moveq	#0,d1
	move.w	obj.y_speed(a0),d1
	ext.l	d1
	asl.l	#8,d1
	move.l	obj.y(a1),d0
	add.l	d1,d0
	move.l	d0,obj.y(a1)

	cmpi.b	#$A,obj.id(a0)
	beq.s	loc_20805A
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20802E
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockDownWide
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	loc_20802E
	add.w	d1,obj.y(a1)
	bra.w	loc_2080C6

; ------------------------------------------------------------------------------

loc_20802E:
	tst.w	obj.y_speed(a0)
	bpl.s	loc_20805A
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockUp
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	loc_20805A
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,a0-a1
	bra.s	loc_2080C6

; ------------------------------------------------------------------------------

loc_20805A:
	bsr.w	StandOnObject
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_208062:
	cmpi.b	#1,obj.routine_2(a0)
	beq.s	loc_2080C6
	cmpi.b	#9,obj.id(a0)
	beq.s	loc_2080C6
	cmpi.b	#$A,obj.id(a0)
	bne.s	loc_20808C
	cmpi.b	#2,obj.routine_2(a0)
	beq.s	loc_2080AC
	btst	#1,obj.sprite_flags(a0)
	bne.s	loc_2080AC
	bra.s	loc_2080C6

; ------------------------------------------------------------------------------

loc_20808C:
	btst	#1,obj.flags(a1)
	bne.s	loc_2080AC
	tst.w	obj.y_speed(a0)
	beq.s	loc_2080AC
	bmi.s	loc_2080AC
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,a0-a1

loc_2080AC:
	sub.w	d2,obj.y(a1)
	move.w	#0,obj.y_speed(a1)
	bsr.w	StopObjPush
	bsr.w	GetOffObject
	clr.b	obj.routine_2(a0)
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_2080C6:
	bsr.w	StopObjPush
	bsr.w	GetOffObject
	clr.b	obj.routine_2(a0)
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

CheckWallCrush:
	tst.w	obj.x_speed(a0)
	beq.s	locret_208114
	cmpi.b	#$A,obj.id(a0)
	beq.s	locret_208114
	move.b	#$C0,d0
	tst.w	obj.x_speed(a0)
	bpl.s	loc_2080F0
	neg.b	d0

loc_2080F0:
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	PlayerCheckBlockFront
	movem.l	(sp)+,a0-a1
	tst.w	d1
	bpl.s	locret_208114
	movem.l	a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,a0-a1

locret_208114:
	rts

; ------------------------------------------------------------------------------

PushObject:
	cmpi.b	#$A,obj.id(a0)
	bne.s	loc_208126
	move.b	#0,obj.collide_type(a1)
	rts

; ------------------------------------------------------------------------------

loc_208126:
	moveq	#0,d1
	move.b	obj.collide_type(a1),d1
	beq.s	loc_20817A
	lsl.w	#6,d1
	addi.l	#object_pool&$FFFFFF,d1
	cmpa.w	d1,a0
	beq.s	locret_20818A
	movea.l	d1,a2
	tst.w	obj.x_speed(a0)
	bne.s	loc_208148
	tst.w	obj.x_speed(a2)
	beq.s	locret_20818A

loc_208148:
	move.w	obj.x(a1),d1
	cmp.w	obj.x(a0),d1
	bcc.s	loc_20815A
	cmp.w	obj.x(a2),d1
	bcs.s	locret_20818A
	bra.s	loc_208160

; ------------------------------------------------------------------------------

loc_20815A:
	cmp.w	obj.x(a2),d1
	bcc.s	locret_20818A

loc_208160:
	cmpi.b	#$15,obj.id(a0)
	beq.s	locret_20818A
	movem.l	d0/a0-a1,-(sp)
	movea.l	a1,a0
	jsr	KillPlayer
	movem.l	(sp)+,d0/a0-a1
	rts

; ------------------------------------------------------------------------------

loc_20817A:
	move.w	a0,d1
	subi.w	#object_pool,d1
	lsr.w	#6,d1
	andi.w	#$7F,d1
	move.b	d1,obj.collide_type(a1)

locret_20818A:
	rts

; ------------------------------------------------------------------------------

StopObjPush:
	moveq	#0,d1
	move.b	obj.collide_type(a1),d1
	beq.s	locret_2081A6
	lsl.w	#6,d1
	addi.l	#object_pool&$FFFFFF,d1
	cmpa.w	d1,a0
	bne.s	locret_2081A6
	move.b	#0,obj.collide_type(a1)

locret_2081A6:
	rts

; ------------------------------------------------------------------------------
