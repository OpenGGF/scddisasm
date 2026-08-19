; ------------------------------------------------------------------------------

SnakeBlocksObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20ECAA
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EC24(pc,d0.w),d0
	jsr	off_20EC24(pc,d0.w)
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20EC24:
	dc.w	SnakeBlocksObject_1_Routine0-*
	dc.w	SnakeBlocksObject_1_Routine2-off_20EC24

; ------------------------------------------------------------------------------

SnakeBlocksObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$3A8,obj.sprite_tile(a0)
	move.l	#SnakeBlocksSprites,obj.sprite_data(a0)
	move.w	a0,obj.var_2a(a0)
	st	obj.var_34(a0)
	move.w	#0,obj.var_32(a0)

SnakeBlocksObject_1_Routine2:
	tst.b	obj.var_34(a0)
	beq.s	locret_20ECA8
	sf	obj.var_34(a0)
	lea	off_20EE86(pc),a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	adda.w	(a1,d0.w),a1
	move.w	obj.var_32(a0),d0
	adda.w	(a1,d0.w),a1
	move.l	a1,obj.var_2c(a0)
	addq.w	#2,obj.var_32(a0)
	cmpi.w	#8,obj.var_32(a0)
	blt.s	loc_20EC9C
	clr.w	obj.var_32(a0)

loc_20EC9C:
	bsr.w	sub_20EE3C
	beq.s	locret_20ECA8
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20ECA8:
	rts

; ------------------------------------------------------------------------------

loc_20ECAA:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2A,obj.id(a1)
	bne.w	loc_20EE36
	move.b	obj.subtype_2(a0),d0
	cmp.b	obj.subtype_2(a1),d0
	bne.w	loc_20EE36
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20ECE2(pc,d0.w),d0
	jsr	off_20ECE2(pc,d0.w)
	lea	player_object,a1
	jsr	SolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20ECE2:
	dc.w	SnakeBlocksObject_0_Routine0-*
	dc.w	SnakeBlocksObject_0_Routine2-off_20ECE2
	dc.w	SnakeBlocksObject_0_Routine4-off_20ECE2
	dc.w	SnakeBlocksObject_0_Routine6-off_20ECE2
	dc.w	SnakeBlocksObject_0_Routine8-off_20ECE2
	dc.w	SnakeBlocksObject_0_RoutineA-off_20ECE2
	dc.w	SnakeBlocksObject_0_RoutineC-off_20ECE2
	dc.w	SnakeBlocksObject_0_RoutineE-off_20ECE2
	dc.w	SnakeBlocksObject_0_Routine10-off_20ECE2
	dc.w	SnakeBlocksObject_0_Routine12-off_20ECE2

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.w	#$3F,obj.var_30(a0)
	move.l	#0,obj.var_38(a0)
	move.l	#0,obj.var_3c(a0)
	movea.l	obj.var_2c(a0),a1
	move.b	-1(a1),d0
	bne.s	loc_20ED22
	move.l	#-$8000,obj.var_3c(a0)

loc_20ED22:
	subq.b	#1,d0
	bne.s	loc_20ED2E
	move.l	#$8000,obj.var_38(a0)

loc_20ED2E:
	subq.b	#1,d0
	bne.s	loc_20ED3A
	move.l	#$8000,obj.var_3c(a0)

loc_20ED3A:
	subq.b	#1,d0
	bne.s	loc_20ED46
	move.l	#-$8000,obj.var_38(a0)

loc_20ED46:
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#2,obj.subtype(a1)
	bne.s	SnakeBlocksObject_0_Routine2
	moveq	#1,d0
	tst.w	obj.var_3c(a0)
	bpl.s	loc_20ED5C
	moveq	#-1,d0

loc_20ED5C:
	move.w	d0,obj.var_34(a0)
	move.w	d0,obj.y_speed(a0)

SnakeBlocksObject_0_Routine2:
	move.l	obj.var_38(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.y(a0)
	subq.w	#1,obj.var_30(a0)
	bpl.s	locret_20ED7E
	addq.b	#2,obj.routine(a0)

locret_20ED7E:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	clr.w	obj.y_speed(a0)
	move.w	#$1E,d0
	cmpi.b	#2,obj.subtype(a1)
	bne.s	loc_20ED98
	move.w	#0,d0

loc_20ED98:
	move.w	d0,obj.var_30(a0)

SnakeBlocksObject_0_Routine6:
	subq.w	#1,obj.var_30(a0)
	bpl.s	locret_20EDB8
	addq.b	#2,obj.routine(a0)
	bsr.w	sub_20EE3C
	beq.s	locret_20EDB8
	addq.b	#2,obj.routine(a0)
	movea.w	obj.var_2a(a0),a1
	st	obj.var_34(a1)

locret_20EDB8:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine8:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_RoutineA:
	addq.b	#2,obj.routine(a0)
	move.w	#$3F,obj.var_30(a0)
	move.w	obj.var_34(a0),obj.y_speed(a0)
	neg.w	obj.y_speed(a0)

SnakeBlocksObject_0_RoutineC:
	move.l	obj.var_38(a0),d0
	sub.l	d0,obj.x(a0)
	move.l	obj.var_3c(a0),d0
	sub.l	d0,obj.y(a0)
	subq.w	#1,obj.var_30(a0)
	bpl.s	locret_20EDEA
	addq.b	#2,obj.routine(a0)

locret_20EDEA:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_RoutineE:
	addq.b	#2,obj.routine(a0)
	clr.w	obj.y_speed(a0)
	move.w	#$1E,d0
	cmpi.b	#2,obj.subtype(a1)
	bne.s	loc_20EE04
	move.w	#0,d0

loc_20EE04:
	move.w	d0,obj.var_30(a0)

SnakeBlocksObject_0_Routine10:
	subq.w	#1,obj.var_30(a0)
	bpl.s	locret_20EE20
	movea.w	obj.var_36(a0),a1
	tst.b	obj.subtype(a1)
	bpl.s	loc_20EE1C
	addq.b	#2,obj.routine(a1)

loc_20EE1C:
	addq.b	#2,obj.routine(a0)

locret_20EE20:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksObject_0_Routine12:
	lea	player_object,a1
	jsr	SolidObject
	beq.s	loc_20EE34
	jsr	GetOffObject

loc_20EE34:
	addq.l	#4,sp

loc_20EE36:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20EE3C:
	movea.l	obj.var_2c(a0),a6
	tst.b	(a6)+
	bmi.s	locret_20EE7C
	jsr	SpawnObject
	bne.s	locret_20EE7C
	movea.l	a0,a2
	movea.l	a1,a3
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.l	(a2)+,(a3)+
	move.b	#$FF,obj.subtype(a1)
	move.w	a0,obj.var_36(a1)
	move.l	a6,obj.var_2c(a1)
	addq.b	#1,obj.sprite_layer(a1)
	clr.b	obj.routine(a1)

locret_20EE7C:
	rts

; ------------------------------------------------------------------------------

SnakeBlocksSprites:
	include	"src/sprites/r6/snake_blocks.asm"
	even

off_20EE86:
	dc.w	off_20EE90-*
	dc.w	off_20EEB0-off_20EE86
	dc.w	off_20EEC8-off_20EE86
	dc.w	word_20EE98-off_20EE86
	dc.w	off_20EED6-off_20EE86

off_20EE90:
	dc.w	unk_20EEA0-*
	dc.w	unk_20EEA4-off_20EE90
	dc.w	unk_20EEA8-off_20EE90
	dc.w	unk_20EEAC-off_20EE90

word_20EE98:
	dc.w	$14
	dc.w	$10
	dc.w	$C
	dc.w	8

unk_20EEA0:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	$FF

unk_20EEA4:
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	$FF

unk_20EEA8:
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	$FF

unk_20EEAC:
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	$FF

off_20EEB0:
	dc.w	unk_20EEB8-*
	dc.w	unk_20EEBC-off_20EEB0
	dc.w	unk_20EEC0-off_20EEB0
	dc.w	unk_20EEC4-off_20EEB0

unk_20EEB8:
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	$FF

unk_20EEBC:
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	$FF

unk_20EEC0:
	dc.b	2
	dc.b	2
	dc.b	1
	dc.b	$FF

unk_20EEC4:
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	$FF

off_20EEC8:
	dc.w	unk_20EED0-*
	dc.w	unk_20EED3-off_20EEC8
	dc.w	unk_20EED0-off_20EEC8
	dc.w	unk_20EED3-off_20EEC8

unk_20EED0:
	dc.b	0
	dc.b	0
	dc.b	$FF

unk_20EED3:
	dc.b	2
	dc.b	2
	dc.b	$FF

off_20EED6:
	dc.w	unk_20EEDE-*
	dc.w	unk_20EEE2-off_20EED6
	dc.w	unk_20EEE6-off_20EED6
	dc.w	unk_20EEEA-off_20EED6

unk_20EEDE:
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	$FF

unk_20EEE2:
	dc.b	2
	dc.b	3
	dc.b	3
	dc.b	$FF

unk_20EEE6:
	dc.b	3
	dc.b	0
	dc.b	3
	dc.b	$FF

unk_20EEEA:
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	$FF

; ------------------------------------------------------------------------------
