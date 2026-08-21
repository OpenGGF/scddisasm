; ------------------------------------------------------------------------------

MoveSpringObjectR8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E808(pc,d0.w),d0
	jsr	off_20E808(pc,d0.w)
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20E808:
	dc.w	MoveSpringInit-*
	dc.w	MoveSpringFall-off_20E808
	dc.w	MoveSpringMain-off_20E808

; ------------------------------------------------------------------------------

MoveSpringInit:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#MoveSpringSpritesR8,obj.sprite_data(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#6,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	#$100,obj.x_speed(a0)
	moveq	#$E,d0
	jsr	SetObjectSpriteTile
	jsr	SpawnObjectAfter
	beq.s	loc_20E854
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20E854:
	move.b	#$A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$10,obj.y(a1)
	move.b	#$F0,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	d0,obj.subtype(a1)
	move.w	#$50,obj.var_3a(a0)
	tst.b	obj.subtype(a0)
	bpl.s	MoveSpringFall
	move.w	#$40,obj.var_3a(a0)

MoveSpringFall:
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20E8AE
	add.w	d1,obj.y(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E8AE:
	addq.w	#1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

MoveSpringMain:
	move.w	#$20,d3
	lea	CheckBlockRight,a1
	tst.w	obj.x_speed(a0)
	bpl.s	loc_20E8CE
	move.w	#-$18,d3
	lea	CheckBlockLeft,a1

loc_20E8CE:
	jsr	(a1)
	cmpi.w	#7,d1
	bmi.s	loc_20E900
	move.w	obj.x(a0),d0
	sub.w	obj.var_36(a0),d0
	bcc.s	loc_20E8E2
	neg.w	d0

loc_20E8E2:
	cmp.w	obj.var_3a(a0),d0
	bcc.s	loc_20E900
	jsr	CheckBlockDown
	cmpi.w	#-7,d1
	blt.s	loc_20E900
	cmpi.w	#7,d1
	bgt.s	loc_20E900
	add.w	d1,obj.y(a0)
	bra.s	loc_20E904

; ------------------------------------------------------------------------------

loc_20E900:
	neg.w	obj.x_speed(a0)

loc_20E904:
	jsr	MoveObject
	lea	MoveSpringAnimsR8(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

MoveSpringAnimsR8:
	include	"anims/move_spring.asm"
	even

MoveSpringSpritesR8:
	include	"sprites/move_spring.asm"
	even

; ------------------------------------------------------------------------------
