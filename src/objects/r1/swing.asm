; ------------------------------------------------------------------------------

SwingObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EB74(pc,d0.w),d0
	jsr	off_20EB74(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20EB74:
	dc.w	SwingObject_0_Routine0-*
	dc.w	SwingObject_0_Routine2-off_20EB74

; ------------------------------------------------------------------------------

sub_20EB78:
	lea	player_object,a1
	bsr.s	sub_20EB82
	lea	player_object_2,a1

; ------------------------------------------------------------------------------

sub_20EB82:
	move.b	#8,obj.height(a0)
	jsr	TopSolidObject
	bne.s	loc_20EB9E
	move.b	#$C,obj.height(a0)
	jsr	TopSolidObject
	beq.s	loc_20EBC8

loc_20EB9E:
	move.b	#8,obj.height(a0)
	move.w	obj.y(a0),d0
	cmp.w	obj.y(a1),d0
	bcs.s	loc_20EBC8
	move.w	obj.y(a0),d0
	move.b	obj.height(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.b	obj.height(a1),d1
	ext.w	d1
	sub.w	d1,d0
	addq.w	#2,d0
	move.w	d0,obj.y(a1)

loc_20EBC8:
	move.b	#8,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

word_20EBD0:
	dc.w	$C000, 8, $200, $FE00
	dc.w	$C000, 2, $100, $FF00
	dc.w	$C000, $FFFE, $FF00, $100
	dc.w	$A000, 3, $180, $FE80
	dc.w	$8000, $FFFE, $FF00, $100
	dc.w	$8000, 2, $100, $FF00
	dc.w	$8000, $FFFF, $FF00, 0
	dc.w	$8000, 1, $100, 0

; ------------------------------------------------------------------------------

SwingObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#SwingSprites,obj.sprite_data(a0)
	moveq	#$11,d0
	jsr	SetObjectSpriteTile
	move.b	#$18,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	tst.b	obj.var_3c(a0)
	bne.s	loc_20ECA4
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	moveq	#0,d1
	moveq	#0,d2
	move.b	obj.subtype(a0),d1
	andi.w	#$F,d1
	move.b	d1,obj.var_2f(a0)
	move.b	d1,d2
	subq.b	#1,d2

loc_20EC62:
	jsr	SpawnObject
	bne.s	loc_20EC9E
	move.b	#$29,obj.id(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.w	obj.var_32(a0),obj.var_32(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	obj.var_2f(a0),obj.var_2f(a1)
	move.b	d1,obj.var_3c(a1)
	move.b	#2,obj.sprite_frame(a1)
	cmp.b	obj.var_2f(a0),d1
	bne.s	loc_20EC9E
	move.b	#1,obj.sprite_frame(a1)

loc_20EC9E:
	subq.b	#1,d1
	dbf	d2,loc_20EC62

loc_20ECA4:
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	andi.b	#$F0,d0
	lsr.b	#1,d0
	lea	word_20EBD0(pc),a1
	lea	(a1,d0.w),a1
	move.w	(a1)+,obj.var_3a(a0)
	move.w	(a1)+,obj.var_3e(a0)
	move.w	(a1)+,obj.var_34(a0)
	move.w	(a1)+,obj.var_38(a0)

SwingObject_0_Routine2:
	move.l	obj.x(a0),d0
	move.l	obj.y(a0),d1
	movem.l	d0-d1,-(sp)
	bsr.w	sub_20ED04
	movem.l	(sp)+,d0-d1
	move.b	obj.var_2f(a0),d4
	cmp.b	obj.var_3c(a0),d4
	bne.s	locret_20ED02
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	sub.l	d0,d2
	sub.l	d1,d3
	asr.l	#8,d2
	asr.l	#8,d3
	move.w	d2,obj.x_speed(a0)
	move.w	d3,obj.y_speed(a0)
	bsr.w	sub_20EB78

locret_20ED02:
	rts

; ------------------------------------------------------------------------------

sub_20ED04:
	tst.b	obj.var_3d(a0)
	bne.s	loc_20ED24
	move.w	obj.var_30(a0),d0
	add.w	obj.var_3e(a0),d0
	move.w	d0,obj.var_30(a0)
	add.w	d0,obj.var_3a(a0)
	cmp.w	obj.var_34(a0),d0
	seq	obj.var_3d(a0)
	bra.s	loc_20ED3E

; ------------------------------------------------------------------------------

loc_20ED24:
	move.w	obj.var_30(a0),d0
	sub.w	obj.var_3e(a0),d0
	move.w	d0,obj.var_30(a0)
	add.w	d0,obj.var_3a(a0)
	cmp.w	obj.var_38(a0),d0
	bne.s	loc_20ED3E
	clr.b	obj.var_3d(a0)

loc_20ED3E:
	move.b	obj.var_3a(a0),d0
	jsr	SineCosine
	move.b	obj.var_3c(a0),d2
	ext.w	d2
	asl.w	#4,d2
	mulu.w	d2,d0
	mulu.w	d2,d1
	asr.l	#4,d0
	asr.w	#4,d0
	asr.l	#4,d1
	asr.w	#4,d1
	add.w	obj.var_32(a0),d1
	add.w	obj.var_36(a0),d0
	move.w	d1,obj.y(a0)
	move.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

SwingSprites:
	include	"src/sprites/r1/swing.asm"
	even

; ------------------------------------------------------------------------------
