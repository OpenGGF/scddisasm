; ------------------------------------------------------------------------------

RobotGeneratorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F7AA(pc,d0.w),d0
	jsr	off_20F7AA(pc,d0.w)
	jsr	DrawObject
	cmpi.b	#2,obj.routine(a0)
	bgt.s	locret_20F7A8
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_20F7A8:
	rts

; ------------------------------------------------------------------------------

off_20F7AA:
	dc.w	RobotGeneratorInit-*
	dc.w	RobotGeneratorMain-off_20F7AA
	dc.w	RobotGeneratorExplode-off_20F7AA
	dc.w	RobotGeneratorDestroyed-off_20F7AA

; ------------------------------------------------------------------------------

RobotGeneratorInit:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$22,obj.width(a0)
	move.b	#$22,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	lea	word_20FBD8(pc),a1
	moveq	#0,d0
	move.b	act,d0
	asl.w	#2,d0
	add.b	time_zone,d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.sprite_tile(a0)
	move.l	#RobotTransportSprites,obj.sprite_data(a0)
	move.l	#byte_20FB98,obj.var_2c(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	move.w	#4,obj.var_2a(a0)
	move.w	#1,obj.var_32(a0)
	moveq	#0,d0
	tst.b	good_future
	bne.s	loc_20F81E
	addq.b	#2,d0

loc_20F81E:
	tst.b	time_zone
	bne.s	loc_20F828
	addq.b	#1,d0

loc_20F828:
	move.b	d0,obj.sprite_frame(a0)
	tst.b	good_future
	bne.s	RobotGeneratorMain
	tst.b	time_zone
	bne.s	RobotGeneratorMain
	move.b	#$FA,obj.collide_type(a0)
	subi.w	#$10,obj.y(a0)

RobotGeneratorMain:
	tst.b	good_future
	bne.s	locret_20F8B0
	tst.b	time_zone
	bne.s	locret_20F8B0
	bsr.w	sub_20F92C
	tst.b	obj.collide_status(a0)
	beq.s	loc_20F89C
	clr.w	obj.collide_type(a0)
	clr.w	obj.var_2a(a0)
	move.b	#7,obj.sprite_frame(a0)
	addq.b	#2,obj.routine(a0)
	move.b	#1,good_future
	move.l	#$96,d0
	jsr	AddPoints
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20F89A
	jsr	GetOffObject

locret_20F89A:
	rts

; ------------------------------------------------------------------------------

loc_20F89C:
	lea	player_object,a1
	jsr	SolidObject
	lea	RobotTransportAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

locret_20F8B0:
	rts

; ------------------------------------------------------------------------------

RobotGeneratorExplode:
	movea.l	obj.var_2c(a0),a6
	move.b	(a6)+,d0
	bmi.s	loc_20F904
	addq.b	#1,obj.var_2a(a0)
	cmp.b	obj.var_2a(a0),d0
	bne.s	locret_20F902
	move.b	(a6)+,d5
	move.b	(a6)+,d6
	move.l	a6,obj.var_2c(a0)
	ext.w	d5
	ext.w	d6
	jsr	SpawnObject
	bne.s	locret_20F902
	move.b	#$18,obj.id(a1)
	move.b	#1,obj.routine_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	d5,obj.x(a1)
	add.w	d6,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20F902:
	rts

; ------------------------------------------------------------------------------

loc_20F904:
	addq.b	#2,obj.routine(a0)
	move.b	#8,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

RobotGeneratorDestroyed:
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_20F92A
	subq.b	#6,obj.routine(a0)
	move.w	obj.var_30(a0),obj.y(a0)
	move.w	#$D9,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

locret_20F92A:
	rts

; ------------------------------------------------------------------------------

sub_20F92C:
	addq.w	#1,obj.var_2a(a0)
	move.w	obj.var_2a(a0),d0
	andi.w	#7,d0
	bne.s	loc_20F942
	move.w	obj.var_32(a0),d0
	add.w	d0,obj.y(a0)

loc_20F942:
	move.w	obj.var_2a(a0),d0
	andi.w	#$1F,d0
	bne.s	locret_20F950
	neg.w	obj.var_32(a0)

locret_20F950:
	rts

; ------------------------------------------------------------------------------

RobotTransportAnims:
	include	"src/anims/robot_transport.asm"
	even

RobotTransportSprites:
	include	"src/sprites/robot_transport.asm"
	even

byte_20FB98:
	dc.b	1, 0, 0
	dc.b	2, $D8, $EC
	dc.b	3, $1C, $A
	dc.b	4, $12, $EE
	dc.b	5, $EE, $F6
	dc.b	6, 8, $F8
	dc.b	8, $EE, $E
	dc.b	$A, $F6, $A
	dc.b	$C, $1E, $F6
	dc.b	$F, 0, $EE
	dc.b	$12, $14, $F6
	dc.b	$14, $F6, $12
	dc.b	$16, 8, $17
	dc.b	$19, $D, $F6
	dc.b	$1A, $17, $EA
	dc.b	$1C, $FD, $E7
	dc.b	$1E, $A, $14
	dc.b	$20, $F6, 2
	dc.b	$22, $1E, $F8
	dc.b	$23, $D, $F6
	dc.b	$28, $F6, $A
	dc.b	$FF

word_20FBD8:
	dc.w	$450, $450, 0, 0
	dc.w	$450, $450, 0, 0
	dc.w	0, 0, 0

; ------------------------------------------------------------------------------
