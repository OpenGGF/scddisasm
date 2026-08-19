; ------------------------------------------------------------------------------

EggmanStatueObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20F0B8
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EF1A(pc,d0.w),d0
	jsr	off_20EF1A(pc,d0.w)
	jsr	DrawObject
	cmpi.b	#2,obj.routine(a0)
	bgt.s	locret_20EF18
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

locret_20EF18:
	rts

; ------------------------------------------------------------------------------

off_20EF1A:
	dc.w	EggmanStatueObject_1_Routine0-*
	dc.w	EggmanStatueObject_1_Routine2-off_20EF1A
	dc.w	EggmanStatueObject_1_Routine4-off_20EF1A
	dc.w	EggmanStatueObject_1_Routine6-off_20EF1A
	dc.w	EggmanStatueObject_1_Routine8-off_20EF1A

; ------------------------------------------------------------------------------

EggmanStatueObject_1_Routine0:
	tst.b	good_future
	beq.s	loc_20EF34
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EF34:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$14,obj.width(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#$1C,obj.height(a0)
	move.w	#$44E8,obj.sprite_tile(a0)
	move.l	#EggmanStatueSprites,obj.sprite_data(a0)
	move.b	#$F8,obj.collide_type(a0)
	move.l	#byte_20F086,obj.var_2c(a0)

EggmanStatueObject_1_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	loc_20EF94
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	lea	player_object,a1
	jsr	SolidObject
	beq.s	locret_20EF92
	jsr	GetOffObject

locret_20EF92:
	rts

; ------------------------------------------------------------------------------

loc_20EF94:
	lea	player_object,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

EggmanStatueObject_1_Routine4:
	movea.l	obj.var_2c(a0),a6
	move.b	(a6)+,d0
	bmi.s	loc_20EFF0
	addq.b	#1,obj.var_3f(a0)
	cmp.b	obj.var_3f(a0),d0
	bne.s	locret_20EFEE
	move.b	(a6)+,d5
	move.b	(a6)+,d6
	move.l	a6,obj.var_2c(a0)
	ext.w	d5
	ext.w	d6
	jsr	SpawnObject
	bne.s	locret_20EFEE
	move.b	#$18,obj.id(a1)
	move.b	#1,obj.routine_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	add.w	d5,obj.x(a1)
	add.w	d6,obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20EFEE:
	rts

; ------------------------------------------------------------------------------

loc_20EFF0:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$3C,obj.var_3f(a0)
	rts

; ------------------------------------------------------------------------------

EggmanStatueObject_1_Routine6:
	subq.b	#1,obj.var_3f(a0)
	bne.s	locret_20F00C
	addq.b	#2,obj.routine(a0)

locret_20F00C:
	rts

; ------------------------------------------------------------------------------

EggmanStatueObject_1_Routine8:
	lea	byte_20F0A2(pc),a6
	move.b	obj.id(a0),d1
	moveq	#$FFFFFFFF,d2
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4

loc_20F020:
	move.b	(a6)+,d5
	cmpi.b	#$FF,d5
	beq.s	loc_20F060
	move.b	(a6)+,d6
	ext.w	d5
	ext.w	d6
	jsr	SpawnObject
	bne.s	loc_20F060
	move.b	d1,obj.id(a1)
	move.b	d2,obj.subtype(a1)
	move.w	d3,obj.x(a1)
	move.w	d4,obj.y(a1)
	subi.w	#$A0,obj.y(a1)
	add.w	d5,obj.x(a1)
	add.w	d6,obj.y(a1)
	move.w	d4,obj.var_2e(a1)
	addi.w	#$26,obj.var_2e(a1)
	bra.s	loc_20F020

; ------------------------------------------------------------------------------

loc_20F060:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

EggmanStatueSprites:
	include	"src/sprites/r6/eggman_statue.asm"
	even

byte_20F086:
	dc.b	1, 0, 0
	dc.b	5, $EE, $F6
	dc.b	$A, $F6, $A
	dc.b	$F, 0, $F6
	dc.b	$14, $F6, $F6
	dc.b	$19, $D, $F6
	dc.b	$1E, $F6, $14
	dc.b	$23, $D, $F6
	dc.b	$28, $F6, $A
	dc.b	$FF

byte_20F0A2:
	dc.b	-$18, -$40
	dc.b	-8, $40
	dc.b	8, 0
	dc.b	$18, -$80
	dc.b	$28, -$80
	dc.b	$38, $40
	dc.b	$48, $40
	dc.b	$58, -$80
	dc.b	$68, $40
	dc.b	$78, -$40
	dc.b	-1, 0

; ------------------------------------------------------------------------------

loc_20F0B8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F0CC(pc,d0.w),d0
	jsr	off_20F0CC(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F0CC:
	dc.w	EggmanStatueObject_0_Routine0-*
	dc.w	EggmanStatueObject_0_Routine2-off_20F0CC
	dc.w	EggmanStatueObject_0_Routine4-off_20F0CC

; ------------------------------------------------------------------------------

EggmanStatueObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#6,obj.height(a0)
	move.b	#6,obj.width(a0)
	move.b	#6,obj.width_2(a0)
	move.w	#$4C8,obj.sprite_tile(a0)
	move.l	#StatueBombSprites,obj.sprite_data(a0)
	move.b	#$B7,obj.collide_type(a0)
	move.l	#0,obj.var_2a(a0)

EggmanStatueObject_0_Routine2:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$400,obj.var_2a(a0)
	move.w	obj.y(a0),d0
	cmp.w	obj.var_2e(a0),d0
	blt.s	loc_20F12E
	addq.b	#2,obj.routine(a0)

loc_20F12E:
	lea	StatueBombAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

EggmanStatueObject_0_Routine4:
	move.b	#$18,obj.id(a0)
	move.b	#0,obj.routine(a0)
	move.b	#1,obj.routine_2(a0)
	move.w	#$9E,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

StatueBombAnims:
	include	"src/anims/r6/statue_bomb.asm"
	even

StatueBombSprites:
	include	"src/sprites/r6/statue_bomb.asm"
	even
	
; ------------------------------------------------------------------------------
